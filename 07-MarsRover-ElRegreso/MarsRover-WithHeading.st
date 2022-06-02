!classDefinition: #MarsRoverLoggerTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverLoggerTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 14:03:21'!
createMarsRoverAt11HeadingNorthFollowChangesWith: aLoggerBlock andProcess: aCommand

	| marsRover logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := aLoggerBlock value: marsRover.
	
	marsRover process: aCommand.
	
	^logger readStream.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 14:04:50'!
createMarsRoverAt11HeadingNorthFollowHeadingLoggerChangesAndProcess: aCommand

	^self 
		createMarsRoverAt11HeadingNorthFollowChangesWith: 
			[ :aMarsRover | MarsRoverLogger followHeadingChangesOn: aMarsRover ]
		andProcess: aCommand.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 14:05:10'!
createMarsRoverAt11HeadingNorthFollowLoggerChangesAndProcess: aCommand

	^self 
		createMarsRoverAt11HeadingNorthFollowChangesWith: 
			[ :aMarsRover | MarsRoverLogger followChangesOn: aMarsRover ]
		andProcess: aCommand.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 14:05:22'!
createMarsRoverAt11HeadingNorthFollowPositionLoggerChangesAndProcess: aCommand

	^self 
		createMarsRoverAt11HeadingNorthFollowChangesWith: 
			[ :aMarsRover | MarsRoverLogger followPositionChangesOn: aMarsRover ]
		andProcess: aCommand.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'id 6/2/2022 01:13:46'!
test01LoggerDoesNotLogAnythingWhenMarsRoverHasNotMovedNorRotated

	| marsRover logger |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logger := MarsRoverLogger followChangesOn: marsRover.
	
	marsRover process: ''.
	
	self assert: logger readStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:55:45'!
test02LoggerLogsChangesWhenMarsRoverMovesForward

	| logStream |
	
	logStream := self createMarsRoverAt11HeadingNorthFollowLoggerChangesAndProcess: 'f'.
	self assert: '1@2' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:55:45'!
test03LoggerLogsChangesWhenMarsRoverMovesBackwards

	| logStream |
	
	logStream := self createMarsRoverAt11HeadingNorthFollowLoggerChangesAndProcess: 'b'.
	self assert: '1@0' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:55:45'!
test04LoggerLogsChangesWhenMarsRoverMovesMultipleTimes

	| logStream |
	
	logStream := self createMarsRoverAt11HeadingNorthFollowLoggerChangesAndProcess: 'fb'.
	self assert: '1@2' equals: logStream nextLine.
	self assert: '1@1' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:55:45'!
test05LoggerLogsChangesWhenMarsRoverRotatesOnce

	| logStream |
	
	logStream := logStream := self createMarsRoverAt11HeadingNorthFollowLoggerChangesAndProcess: 'r'.
	self assert: 'East' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:55:45'!
test06LoggerLogsChangesWhenMarsRoverRotatesMultipleTimes

	| logStream |
	
	logStream := self createMarsRoverAt11HeadingNorthFollowLoggerChangesAndProcess: 'll'.
	self assert: 'West' equals: logStream nextLine.
	self assert: 'South' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:55:45'!
test07LoggerLogsChangesWhenMarsRoverRotatesAndRotatesBackToOriginalHeading

	| logStream |
	
	logStream := self createMarsRoverAt11HeadingNorthFollowLoggerChangesAndProcess: 'lr'.
	self assert: 'West' equals: logStream nextLine.
	self assert: 'North' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:55:45'!
test08LoggerLogsChangesWhenMarsRoverMovesAndRotatesMultipleTimes

	| logStream |
	
	logStream := self createMarsRoverAt11HeadingNorthFollowLoggerChangesAndProcess: 'frbl'.
	self assert: '1@2' equals: logStream nextLine.
	self assert: 'East' equals: logStream nextLine.
	self assert: '0@2' equals: logStream nextLine.
	self assert: 'North' equals: logStream nextLine.
	self assert: logStream atEnd.
! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:59:15'!
test09PositionLoggerDoesNotLogHeadingChanges

	| logStream |
	
	logStream := self createMarsRoverAt11HeadingNorthFollowPositionLoggerChangesAndProcess: 'r'.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:59:31'!
test10PositionLoggerLogsChangesWhenMarsRoverMovesForwards

	| logStream |
	
	logStream := self createMarsRoverAt11HeadingNorthFollowPositionLoggerChangesAndProcess: 'f'.
	self assert: '1@2' equals: logStream nextLine.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:59:44'!
test11PositionLoggerLogsChangesWhenMarsRoverMovesMultipleTimes

	| logStream |

	logStream := self createMarsRoverAt11HeadingNorthFollowPositionLoggerChangesAndProcess: 'ffb'.
	self assert: '1@2' equals: logStream nextLine.
	self assert: '1@3' equals: logStream nextLine.
	self assert: '1@2' equals: logStream nextLine.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 14:00:07'!
test12HeadingLoggerDoesNotLogPositionChanges

	| logStream |
	
	logStream := self createMarsRoverAt11HeadingNorthFollowHeadingLoggerChangesAndProcess: 'f'.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 14:00:22'!
test13HeadingLoggerLogsChangesWhenMarsRoverRotatesRight

	| logStream |

	logStream := self createMarsRoverAt11HeadingNorthFollowHeadingLoggerChangesAndProcess: 'r'.
	self assert: 'East' equals: logStream nextLine.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 14:00:35'!
test14HeadingLoggerLogsChangesWhenMarsRoverRotatesMultipleTimes

	| logStream |

	logStream := self createMarsRoverAt11HeadingNorthFollowHeadingLoggerChangesAndProcess: 'rlll'.
	self assert: 'East' equals: logStream nextLine.
	self assert: 'North' equals: logStream nextLine.
	self assert: 'West' equals: logStream nextLine.
	self assert: 'South' equals: logStream nextLine.
	self assert: logStream atEnd.! !


!classDefinition: #MarsRoverStateWindowTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverStateWindowTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverStateWindowTest methodsFor: 'auxiliary' stamp: 'id 6/2/2022 02:45:35'!
eastWording

	^self pointingToWording: 'Este'.! !

!MarsRoverStateWindowTest methodsFor: 'auxiliary' stamp: 'id 6/2/2022 02:45:28'!
northWording

	^self pointingToWording: 'Norte'.! !

!MarsRoverStateWindowTest methodsFor: 'auxiliary' stamp: 'id 6/2/2022 02:44:56'!
pointingToWording: aHeading

	^'Apuntando al ' , aHeading.! !

!MarsRoverStateWindowTest methodsFor: 'auxiliary' stamp: 'id 6/2/2022 02:45:21'!
southWording

	^self pointingToWording: 'Sur'.! !

!MarsRoverStateWindowTest methodsFor: 'auxiliary' stamp: 'id 6/2/2022 02:44:50'!
westWording

	^self pointingToWording: 'Oeste'.! !


!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:20:23'!
test01StateWindowDoesNotSetHeadChangesWhenMarsRoverDoesNotMoveNorRotate
	
	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followChangesOn: marsRover.
	
	marsRover process: ''.
	
	self assert: logState currentHeading equals: ''.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:20:23'!
test02StateWindowSetsHeadChangesWhenMarsRoverRotatesRight
	
	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followChangesOn: marsRover.
	
	marsRover process: 'r'.
	
	self assert: self eastWording equals: logState currentHeading.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:20:23'!
test03StateWindowSetsHeadChangesWhenMarsRoverRotatesLeft
	
	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followChangesOn: marsRover.
	
	marsRover process: 'l'.
	
	self assert: self westWording equals: logState currentHeading.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:20:23'!
test04StateWindowSetsHeadChangesWhenMarsRoverRotatesAndRotatesBackToOriginalHeading
	
	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followChangesOn: marsRover.
	
	marsRover process: 'rl'.
	
	self assert: self northWording equals: logState currentHeading.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:20:23'!
test05StateWindowSetsHeadChangesWhenMarsRoverRotatesMultipleTimes
	
	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followChangesOn: marsRover.
	
	marsRover process: 'll'.
	
	self assert: self southWording equals: logState currentHeading.! !

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

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:20:23'!
test08PositionStateWindowDoesNotSetPositionChangesNorHeadingChangesWhenMarsRoverRotated

	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followPositionChangesOn: marsRover.
	
	marsRover process: 'r'.
	
	self assert: '' equals: logState currentHeading.
	self assert: '' equals: logState currentPosition.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:20:23'!
test09PositionStateWindowSetsPositionChangesAndDoesNotSetHeadingChangesWhenMarsRoverMoved

	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followPositionChangesOn: marsRover.
	
	marsRover process: 'f'.
	
	self assert: '' equals: logState currentHeading.
	self assert: 1@2 equals: logState currentPosition.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:20:23'!
test10HeadingStateWindowDoesNotSetPositionChangesNorHeadingChangesWhenMarsRoverMoved

	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followHeadingChangesOn: marsRover.
	
	marsRover process: 'f'.
	
	self assert: '' equals: logState currentHeading.
	self assert: '' equals: logState currentPosition.! !

!MarsRoverStateWindowTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 13:20:23'!
test11HeadingStateWindowSetsHeadingChangesAndDoesNotSetPositionChangesWhenMarsRoverRotated

	| marsRover logState |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	logState := MarsRoverStateWindow followHeadingChangesOn: marsRover.

	marsRover process: 'r'.

	self assert: self eastWording equals: logState currentHeading.
	self assert: '' equals: logState currentPosition.! !


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
	instanceVariableNames: 'position head positionFollowers headingFollowers'
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

!MarsRover methodsFor: 'heading' stamp: 'id 6/2/2022 02:22:34'!
rotateHeadingAndLogNewHeading: aMarsRoverHeading

	head := aMarsRoverHeading for: self.
	headingFollowers do: [ :aFollower | aFollower headingChangedTo: head. ].! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	head rotateLeft! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	head rotateRight! !


!MarsRover methodsFor: 'initialization' stamp: 'id 6/2/2022 02:22:57'!
initializeAt: aPosition heading: aHeadingType

	position := aPosition.
	head := aHeadingType for: self.

	positionFollowers := OrderedCollection new.
	headingFollowers := OrderedCollection new.! !


!MarsRover methodsFor: 'moving' stamp: 'id 6/2/2022 02:22:19'!
addToPositionAndLogNewPosition: newPosition

	position := position + newPosition.
	positionFollowers do: [ :aFollower | aFollower positionChangedTo: position. ].! !

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


!MarsRover methodsFor: 'visitors' stamp: 'id 6/2/2022 03:07:46'!
accept: aVisitor

	self acceptPositionFollower: aVisitor.
	self acceptHeadingFollower: aVisitor.! !

!MarsRover methodsFor: 'visitors' stamp: 'id 6/2/2022 01:40:23'!
acceptHeadingFollower: aMarsRoverFollower

	headingFollowers add: aMarsRoverFollower.! !

!MarsRover methodsFor: 'visitors' stamp: 'id 6/2/2022 01:32:10'!
acceptPositionFollower: aMarsRoverFollower 
	
	positionFollowers add: aMarsRoverFollower.! !

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

!MarsRoverFollower methodsFor: 'visiting' stamp: 'id 6/2/2022 02:19:04'!
followHeadingChangesOn: aMarsRover 

	aMarsRover acceptHeadingFollower: self.! !

!MarsRoverFollower methodsFor: 'visiting' stamp: 'id 6/2/2022 02:19:54'!
followPositionChangesOn: aMarsRover 

	aMarsRover acceptPositionFollower: self.! !

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

!MarsRoverFollower class methodsFor: 'instance creation' stamp: 'id 6/2/2022 03:08:57'!
followHeadingChangesOn: aMarsRover 
	
	self subclassResponsibility.! !

!MarsRoverFollower class methodsFor: 'instance creation' stamp: 'id 6/2/2022 03:09:08'!
followPositionChangesOn: aMarsRover
	
	self subclassResponsibility.! !


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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverLogger class' category: 'MarsRover-WithHeading'!
MarsRoverLogger class
	instanceVariableNames: ''!

!MarsRoverLogger class methodsFor: 'instance creation' stamp: 'id 6/2/2022 01:39:16'!
followHeadingChangesOn: aMarsRover 
	
	^self new followHeadingChangesOn: aMarsRover.! !

!MarsRoverLogger class methodsFor: 'instance creation' stamp: 'id 6/2/2022 01:29:34'!
followPositionChangesOn: aMarsRover
	
	^self new followPositionChangesOn: aMarsRover.! !


!classDefinition: #MarsRoverStateWindow category: 'MarsRover-WithHeading'!
MarsRoverFollower subclass: #MarsRoverStateWindow
	instanceVariableNames: 'heading position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverStateWindow methodsFor: 'accessing' stamp: 'MYB 6/2/2022 13:20:23'!
currentHeading
	
	^heading! !

!MarsRoverStateWindow methodsFor: 'accessing' stamp: 'MYB 6/1/2022 16:15:57'!
currentPosition
	
	^position! !


!MarsRoverStateWindow methodsFor: 'initialization' stamp: 'MYB 6/2/2022 13:20:11'!
initialize
	
	heading := ''.
	position := ''.! !


!MarsRoverStateWindow methodsFor: 'operations' stamp: 'MYB 6/1/2022 16:15:09'!
positionChangedTo: aPoint 
	
	position := aPoint! !


!MarsRoverStateWindow methodsFor: 'visiting' stamp: 'MYB 6/2/2022 13:19:47'!
visitMarsRoverHeadingEast: aMarsRoverHeadingEast
	
	self setHeadingChangedTo: 'Este'.! !

!MarsRoverStateWindow methodsFor: 'visiting' stamp: 'MYB 6/2/2022 13:19:47'!
visitMarsRoverHeadingNorth: aMarsRoverHeadingNorth 
	
	self setHeadingChangedTo: 'Norte'.! !

!MarsRoverStateWindow methodsFor: 'visiting' stamp: 'MYB 6/2/2022 13:19:47'!
visitMarsRoverHeadingSouth: aMarsRoverHeadingSouth 
	
	self setHeadingChangedTo: 'Sur'.! !

!MarsRoverStateWindow methodsFor: 'visiting' stamp: 'MYB 6/2/2022 13:19:47'!
visitMarsRoverHeadingWest: aMarsRoverHeadingWest 
	
	self setHeadingChangedTo: 'Oeste'.! !


!MarsRoverStateWindow methodsFor: 'visiting - private' stamp: 'MYB 6/2/2022 13:20:11'!
setHeadingChangedTo: aHeading

	^heading := 'Apuntando al ' , aHeading.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverStateWindow class' category: 'MarsRover-WithHeading'!
MarsRoverStateWindow class
	instanceVariableNames: ''!

!MarsRoverStateWindow class methodsFor: 'instance creation' stamp: 'id 6/2/2022 02:30:58'!
followHeadingChangesOn: aMarsRover 
	
	^self new followHeadingChangesOn: aMarsRover.! !

!MarsRoverStateWindow class methodsFor: 'instance creation' stamp: 'id 6/2/2022 01:47:37'!
followPositionChangesOn: aMarsRover

	^self new followPositionChangesOn: aMarsRover.! !


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
