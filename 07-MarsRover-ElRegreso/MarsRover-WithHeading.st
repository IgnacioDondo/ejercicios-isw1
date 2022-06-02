!classDefinition: #MarsRoverLoggerTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverLoggerTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:13:46'!
test01LoggerDoesNotLogAnythingWhenMarsRoverHasNotMovedNorRotated

	| marsRover logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverLogger followChangesOn: marsRover.
	
	marsRover process: ''.
	
	self assert: logger readStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:14:30'!
test02LoggerLogsChangesWhenMarsRoverMovesForward

	| marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverLogger followChangesOn: marsRover.
	
	marsRover process: 'f'.
	
	logStream := logger readStream.
	self assert: '1@2' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:14:53'!
test03LoggerLogsChangesWhenMarsRoverMovesBackwards

	| marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverLogger followChangesOn: marsRover.
	
	marsRover process: 'b'.
	
	logStream := logger readStream.
	self assert: '1@0' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:15:54'!
test04LoggerLogsChangesWhenMarsRoverMovesMultipleTimes

	| marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingEast.
	logger := MarsRoverLogger followChangesOn: marsRover.
	
	marsRover process: 'fb'.
	
	logStream := logger readStream.
	self assert: '2@1' equals: logStream nextLine.
	self assert: '1@1' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:15:43'!
test05LoggerLogsChangesWhenMarsRoverRotatesOnce

	| marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverLogger followChangesOn: marsRover.
	
	marsRover process: 'r'.
	
	logStream := logger readStream.
	self assert: 'East' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:16:16'!
test06LoggerLogsChangesWhenMarsRoverRotatesMultipleTimes

	| marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverLogger followChangesOn: marsRover.
	
	marsRover process: 'll'.
	
	logStream := logger readStream.
	self assert: 'West' equals: logStream nextLine.
	self assert: 'South' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:16:58'!
test07LoggerLogsChangesWhenMarsRoverRotatesAndRotatesBackToOriginalHeading

	| marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverLogger followChangesOn: marsRover.
	
	marsRover process: 'lr'.
	
	logStream := logger readStream.
	self assert: 'West' equals: logStream nextLine.
	self assert: 'North' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:17:22'!
test08LoggerLogsChangesWhenMarsRoverMovesAndRotatesMultipleTimes

	| marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverLogger followChangesOn: marsRover.
	
	marsRover process: 'frbl'.
	
	logStream := logger readStream.
	self assert: '1@2' equals: logStream nextLine.
	self assert: 'East' equals: logStream nextLine.
	self assert: '0@2' equals: logStream nextLine.
	self assert: 'North' equals: logStream nextLine.
	self assert: logStream atEnd.
! !


!classDefinition: #MarsRoverStateWindowTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverStateWindowTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:20:08'!
test01StateWindowDoesNotSetHeadChangesWhenMarsRoverDoesNotMoveNorRotate
	
	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followChangesOn: marsRover.
	
	marsRover process: ''.
	
	self assert: logState currentHead equals: ''.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:20:15'!
test02StateWindowSetsHeadChangesWhenMarsRoverRotatesRight
	
	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followChangesOn: marsRover.
	
	marsRover process: 'r'.
	
	self assert: logState currentHead equals: 'East'.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:20:23'!
test03StateWindowSetsHeadChangesWhenMarsRoverRotatesLeft
	
	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followChangesOn: marsRover.
	
	marsRover process: 'l'.
	
	self assert: logState currentHead equals: 'West'.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:20:30'!
test04StateWindowSetsHeadChangesWhenMarsRoverRotatesAndRotatesBackToOriginalHeading
	
	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followChangesOn: marsRover.
	
	marsRover process: 'rl'.
	
	self assert: logState currentHead equals: 'North'.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:20:59'!
test05StateWindowSetsHeadChangesWhenMarsRoverRotatesMultipleTimes
	
	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followChangesOn: marsRover.
	
	marsRover process: 'll'.
	
	self assert: logState currentHead equals: 'South'.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:21:40'!
test06StateWindowDoesNotSetPositionChangesWhenMarsRoverDoesNotMove
	
	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followChangesOn: marsRover.
	
	marsRover process: ''.
	
	self assert: logState currentPosition equals: ''.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:22:08'!
test07StateWindowSetsPositionChangesWhenMarsRoverDoesMoves
	
	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followChangesOn: marsRover.
	
	marsRover process: 'f'.
	
	self assert: logState currentPosition equals: 1@2.
	
	marsRover process: 'b'.
	
	self assert: logState currentPosition equals: 1@1.! !


!classDefinition: #MarsRoverTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:21:23'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:12'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:31'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:17'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:11'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:59'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:51'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:45'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:39'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:31'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:19'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:14'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:05'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:00'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:52'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'id 6/1/2022 21:26:32'!
test17MarsRoverCanHaveTwoFollowersAtTheSameTime

	| marsRover logger logState logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverLogger followChangesOn: marsRover.
	logState := MarsRoverStateWindow followChangesOn: marsRover.
	
	marsRover process: 'f'.
	
	logStream := logger readStream.
	self assert: '1@2' equals: logStream nextLine.
	self assert: logStream atEnd.
	self assert: 1@2 equals: logState currentPosition.! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:31'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:38'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:45'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:54'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 10/7/2021 20:20:47'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !


!classDefinition: #MarsRover category: 'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head followers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'command processing' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'heading' stamp: 'MYB 5/30/2022 21:15:00'!
headEast
	
	self rotateHeadingAndLogNewHeading: MarsRoverHeadingEast! !

!MarsRover methodsFor: 'heading' stamp: 'MYB 5/30/2022 21:15:44'!
headNorth
	
	self rotateHeadingAndLogNewHeading: MarsRoverHeadingNorth
	! !

!MarsRover methodsFor: 'heading' stamp: 'MYB 5/30/2022 21:16:02'!
headSouth
	
	self rotateHeadingAndLogNewHeading: MarsRoverHeadingSouth! !

!MarsRover methodsFor: 'heading' stamp: 'MYB 5/30/2022 21:16:10'!
headWest
	
	self rotateHeadingAndLogNewHeading: MarsRoverHeadingWest! !

!MarsRover methodsFor: 'heading' stamp: 'id 6/1/2022 21:34:32'!
rotateHeadingAndLogNewHeading: aMarsRoverHeading

	head := aMarsRoverHeading for: self.
	followers do: [ :aFollower | aFollower headingChangedTo: head. ].! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	head rotateLeft! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	head rotateRight! !


!MarsRover methodsFor: 'initialization' stamp: 'id 6/1/2022 21:19:52'!
initializeAt: aPosition heading: aHeadingType

	position := aPosition.
	head := aHeadingType for: self.
	followers := OrderedCollection new.! !


!MarsRover methodsFor: 'moving' stamp: 'id 6/1/2022 21:34:19'!
addToPositionAndLogNewPosition: newPosition

	position := position + newPosition.
	followers do: [ :aFollower | aFollower positionChangedTo: position. ].! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	head moveBackward! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 5/30/2022 20:38:44'!
moveEast
	
	self addToPositionAndLogNewPosition: 1@0.
	! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	head moveForward! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 5/30/2022 20:38:44'!
moveNorth
	
	self addToPositionAndLogNewPosition: 0@1.
	! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 5/30/2022 20:38:44'!
moveSouth
	
	self addToPositionAndLogNewPosition: 0@-1.
	! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 5/30/2022 20:38:44'!
moveWest
	
	self addToPositionAndLogNewPosition: -1@0! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:16:32'!
isAt: aPosition heading: aHeadingType

	^position = aPosition and: [ head isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'visitors' stamp: 'id 6/1/2022 21:18:55'!
accept: aVisitor

	followers add: aVisitor.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:10:30'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


!classDefinition: #MarsRoverFollower category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverFollower
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverFollower methodsFor: 'operations' stamp: 'id 6/1/2022 21:27:37'!
headingChangedTo: aMarsRoverHeading
	
	aMarsRoverHeading accept: self.! !

!MarsRoverFollower methodsFor: 'operations' stamp: 'id 6/1/2022 21:28:35'!
positionChangedTo: aPosition

	self subclassResponsibility.! !


!MarsRoverFollower methodsFor: 'visiting' stamp: 'id 6/1/2022 21:27:02'!
followChangesOn: aMarsRover 
	
	aMarsRover accept: self.! !

!MarsRoverFollower methodsFor: 'visiting' stamp: 'id 6/1/2022 21:29:45'!
visitMarsRoverHeadingEast: aMarsRoverHeadingEast 
	
	self subclassResponsibility.! !

!MarsRoverFollower methodsFor: 'visiting' stamp: 'id 6/1/2022 21:29:58'!
visitMarsRoverHeadingNorth: aMarsRoverHeadingNorth 
	
	self subclassResponsibility.! !

!MarsRoverFollower methodsFor: 'visiting' stamp: 'id 6/1/2022 21:30:07'!
visitMarsRoverHeadingSouth: aMarsRoverHeadingSouth
	
	self subclassResponsibility.! !

!MarsRoverFollower methodsFor: 'visiting' stamp: 'id 6/1/2022 21:30:14'!
visitMarsRoverHeadingWest: aMarsRoverHeadingWest
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFollower class' category: 'MarsRover-WithHeading'!
MarsRoverFollower class
	instanceVariableNames: ''!

!MarsRoverFollower class methodsFor: 'instance creation' stamp: 'id 6/1/2022 22:38:18'!
followChangesOn: aMarsRover 
	
	^self new followChangesOn: aMarsRover.! !


!classDefinition: #MarsRoverLogger category: 'MarsRover-WithHeading'!
MarsRoverFollower subclass: #MarsRoverLogger
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLogger methodsFor: 'initialization' stamp: 'HAW 5/30/2022 20:25:00'!
initialize

	log  := WriteStream on: ''! !


!MarsRoverLogger methodsFor: 'operations' stamp: 'MYB 5/30/2022 21:20:50'!
logHeadingChangeTo: newHeading

	log nextPutAll: newHeading; newLine! !

!MarsRoverLogger methodsFor: 'operations' stamp: 'HAW 5/30/2022 20:22:16'!
positionChangedTo: aPosition

	log print: aPosition; newLine! !

!MarsRoverLogger methodsFor: 'operations' stamp: 'HAW 5/30/2022 20:23:26'!
readStream
	
	^ReadStream on: log contents ! !


!MarsRoverLogger methodsFor: 'visiting' stamp: 'MYB 5/30/2022 21:19:06'!
visitMarsRoverHeadingEast: aMarsRoverHeadingEast 
	
	self logHeadingChangeTo: 'East'! !

!MarsRoverLogger methodsFor: 'visiting' stamp: 'MYB 5/30/2022 21:19:34'!
visitMarsRoverHeadingNorth: aMarsRoverHeadingNorth 
	
	self logHeadingChangeTo: 'North'! !

!MarsRoverLogger methodsFor: 'visiting' stamp: 'MYB 5/30/2022 21:19:56'!
visitMarsRoverHeadingSouth: aMarsRoverHeadingSouth
	
	self logHeadingChangeTo: 'South'! !

!MarsRoverLogger methodsFor: 'visiting' stamp: 'MYB 5/30/2022 21:20:07'!
visitMarsRoverHeadingWest: aMarsRoverHeadingWest 
	
	self logHeadingChangeTo: 'West'! !


!classDefinition: #MarsRoverStateWindow category: 'MarsRover-WithHeading'!
MarsRoverFollower subclass: #MarsRoverStateWindow
	instanceVariableNames: 'head position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverStateWindow methodsFor: 'accessing' stamp: 'MYB 6/1/2022 16:09:02'!
currentHead
	
	^head! !

!MarsRoverStateWindow methodsFor: 'accessing' stamp: 'MYB 6/1/2022 16:15:57'!
currentPosition
	
	^position! !


!MarsRoverStateWindow methodsFor: 'initialization' stamp: 'MYB 6/1/2022 16:15:42'!
initialize
	
	head := ''.
	position := ''.! !


!MarsRoverStateWindow methodsFor: 'operations' stamp: 'MYB 6/1/2022 16:15:09'!
positionChangedTo: aPoint 
	
	position := aPoint! !


!MarsRoverStateWindow methodsFor: 'visiting' stamp: 'MYB 6/1/2022 15:58:59'!
visitMarsRoverHeadingEast: aMarsRoverHeadingEast
	
	head := 'East'! !

!MarsRoverStateWindow methodsFor: 'visiting' stamp: 'MYB 6/1/2022 16:05:34'!
visitMarsRoverHeadingNorth: aMarsRoverHeadingNorth 
	
	head := 'North'! !

!MarsRoverStateWindow methodsFor: 'visiting' stamp: 'MYB 6/1/2022 16:06:52'!
visitMarsRoverHeadingSouth: aMarsRoverHeadingSouth 
	
	head := 'South'! !

!MarsRoverStateWindow methodsFor: 'visiting' stamp: 'MYB 6/1/2022 16:06:27'!
visitMarsRoverHeadingWest: aMarsRoverHeadingWest 
	
	head := 'West'! !


!classDefinition: #MarsRoverHeading category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:11:59'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:15:38'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !


!MarsRoverHeading methodsFor: 'visitors' stamp: 'MYB 5/30/2022 21:22:11'!
accept: aVisitor

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: 'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:11:35'!
for: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


!MarsRoverHeadingEast methodsFor: 'visitors' stamp: 'HAW 5/30/2022 20:46:21'!
accept: aVisitor

	^aVisitor visitMarsRoverHeadingEast: self! !


!classDefinition: #MarsRoverHeadingNorth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headEast! !


!MarsRoverHeadingNorth methodsFor: 'visitors' stamp: 'MYB 5/30/2022 21:10:37'!
accept: aVisitor
	
	^aVisitor visitMarsRoverHeadingNorth: self! !


!classDefinition: #MarsRoverHeadingSouth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headWest! !


!MarsRoverHeadingSouth methodsFor: 'visitors' stamp: 'MYB 5/30/2022 21:06:52'!
accept: aVisitor

	^aVisitor visitMarsRoverHeadingSouth: self! !


!classDefinition: #MarsRoverHeadingWest category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headNorth! !


!MarsRoverHeadingWest methodsFor: 'visitors' stamp: 'MYB 5/30/2022 21:04:57'!
accept: aVisitor 
	
	^aVisitor visitMarsRoverHeadingWest: self! !
