!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'north east south west'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'setUp' stamp: 'id 5/16/2022 11:50:34'!
setUp

	north := #North.
	east := #East.
	south := #South.
	west := #West.! !


!MarsRoverTests methodsFor: 'tests - auxiliary' stamp: 'id 5/16/2022 14:23:03'!
assertMarsRoverIsAt: aCoordinate heading: aCardinalPoint afterExecutingTheCommands: aSequenceOfCommands

	self
		assertMarsRoverStartingAt: 0@0
		heading: south
		afterExecutingTheCommands: aSequenceOfCommands
		IsAt: aCoordinate
		heading: aCardinalPoint.! !

!MarsRoverTests methodsFor: 'tests - auxiliary' stamp: 'id 5/16/2022 14:21:44'!
assertMarsRoverStartingAt: anInitialCoordinate heading: anInitialCardinalPoint afterExecutingTheCommands: aSequenceOfCommands IsAt: aCoordinate heading: aCardinalPoint

	| marsRover |
	
	marsRover := MarsRover initializeAt: anInitialCoordinate heading: anInitialCardinalPoint.
	marsRover process: aSequenceOfCommands.
	
	self assert: (marsRover isAt: aCoordinate heading: aCardinalPoint).! !

!MarsRoverTests methodsFor: 'tests - auxiliary' stamp: 'id 5/16/2022 14:11:29'!
denyMarsRoverIsAt: aCoordinate heading: aCardinalPoint afterExecutingTheCommands: aSequenceOfCommands

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 heading: south.
	marsRover process: aSequenceOfCommands.
	
	self deny: (marsRover isAt: aCoordinate heading: aCardinalPoint).! !


!MarsRoverTests methodsFor: 'tests - creation' stamp: 'id 5/16/2022 11:50:57'!
test01RoverStaysAtOriginWhenReceivesEmptyStringHeadingSouth

	self assertMarsRoverIsAt: 0@0 heading: south afterExecutingTheCommands: ''.! !

!MarsRoverTests methodsFor: 'tests - creation' stamp: 'id 5/16/2022 11:51:39'!
test02RoverStaysAtOriginWhenReceivesEmptyString

	self denyMarsRoverIsAt: 1@1 heading: south afterExecutingTheCommands: ''.! !

!MarsRoverTests methodsFor: 'tests - creation' stamp: 'id 5/16/2022 11:52:18'!
test03RoverStaysHeadingSouthWhenReceivesEmptyString

	self denyMarsRoverIsAt: 0@0 heading: north afterExecutingTheCommands: ''.! !

!MarsRoverTests methodsFor: 'tests - creation' stamp: 'id 5/16/2022 14:23:58'!
test26RoverCanBeCreatedWithCustomCoordinates

	self
		assertMarsRoverStartingAt: 1@2
		heading: south
		afterExecutingTheCommands: ''
		IsAt: 1@2
		heading: south.! !

!MarsRoverTests methodsFor: 'tests - creation' stamp: 'id 5/16/2022 14:24:34'!
test27RoverCanBeCreatedHeadingACustomCardinalPoint

	self
		assertMarsRoverStartingAt: 0@0
		heading: north
		afterExecutingTheCommands: ''
		IsAt: 0@0
		heading: north.! !


!MarsRoverTests methodsFor: 'tests - moving' stamp: 'id 5/16/2022 11:52:38'!
test04RoverMovesOneCoordinateFurtherSouthWhenReceivesForwardCommandHeadingSouth

	self assertMarsRoverIsAt: 0@-1 heading: south afterExecutingTheCommands: 'f'.! !

!MarsRoverTests methodsFor: 'tests - moving' stamp: 'id 5/16/2022 11:53:17'!
test05RoverMovesOneCoordinateBackwardsWhenReceivesBackwardCommandHeadingSouth

	self assertMarsRoverIsAt: 0@1 heading: south afterExecutingTheCommands: 'b'.! !

!MarsRoverTests methodsFor: 'tests - moving' stamp: 'id 5/16/2022 11:53:39'!
test06RoverMovesTwoCoordinatesFurtherSouthWhenReceivesForwardCommandTwiceHeadingSouth

	self assertMarsRoverIsAt: 0@-2 heading: south afterExecutingTheCommands: 'ff'.! !

!MarsRoverTests methodsFor: 'tests - moving' stamp: 'id 5/16/2022 11:54:22'!
test07RoverMovesTwoCoordinatesBackwardsWhenReceivesBackwardCommandTwiceHeadingSouth

	self assertMarsRoverIsAt: 0@2 heading: south afterExecutingTheCommands: 'bb'.! !


!MarsRoverTests methodsFor: 'tests - moving and rotating' stamp: 'id 5/16/2022 12:43:50'!
test18RoverMovesOneCoordinateToWestWhenRotatingRightAndReceivesForward

	self assertMarsRoverIsAt: -1@0 heading: west afterExecutingTheCommands: 'rf'.! !

!MarsRoverTests methodsFor: 'tests - moving and rotating' stamp: 'id 5/16/2022 12:44:10'!
test19RoverMovesOneCoordinateToEastWhenRotatingLeftAndReceivesForward

	self assertMarsRoverIsAt: 1@0 heading: east afterExecutingTheCommands: 'lf'.! !

!MarsRoverTests methodsFor: 'tests - moving and rotating' stamp: 'id 5/16/2022 12:44:30'!
test20RoverMovesOneCoordinateToNorthWhenRotatingRightTwoTimesAndReceivesForward

	self assertMarsRoverIsAt: 0@1 heading: north afterExecutingTheCommands: 'rrf'.! !

!MarsRoverTests methodsFor: 'tests - moving and rotating' stamp: 'id 5/16/2022 12:44:50'!
test21RoverHeadsWestAndMovesOneCoordinateToEastWhenRotatingRightAndReceivesBackwards

	self assertMarsRoverIsAt: 1@0 heading: west afterExecutingTheCommands: 'rb'.! !

!MarsRoverTests methodsFor: 'tests - moving and rotating' stamp: 'id 5/16/2022 12:45:10'!
test22RoverHeadsEastAndMovesOneCoordinateToWestWhenRotatingLeftAndReceivesBackwards

	self assertMarsRoverIsAt: -1@0 heading: east afterExecutingTheCommands: 'lb'.! !

!MarsRoverTests methodsFor: 'tests - moving and rotating' stamp: 'id 5/16/2022 12:45:30'!
test23RoverHeadsNorthAndMovesOneCoordinateToEastWhenRotatingRightTwoTimesAndReceivesBackwards

	self assertMarsRoverIsAt: 0@-1 heading: north afterExecutingTheCommands: 'rrb'.! !

!MarsRoverTests methodsFor: 'tests - moving and rotating' stamp: 'id 5/16/2022 12:45:51'!
test24RoverHeadsNorthAt22AfterMovingForwardAndRotatingInZigZag

	self assertMarsRoverIsAt: 2@2 heading: north afterExecutingTheCommands: 'rrfrflfrfl'.! !

!MarsRoverTests methodsFor: 'tests - moving and rotating' stamp: 'id 5/16/2022 12:46:17'!
test25RoverHeadsSouthAt22AfterMovingBackwardsAndRotatingInZigZag

	self assertMarsRoverIsAt: 2@2 heading: south afterExecutingTheCommands: 'brblbrbl'.! !


!MarsRoverTests methodsFor: 'tests - rotating' stamp: 'id 5/16/2022 11:54:41'!
test08RoverHeadsWestWhenRotatingRightWhenHeadingSouth

	self assertMarsRoverIsAt: 0@0 heading: west afterExecutingTheCommands: 'r'.! !

!MarsRoverTests methodsFor: 'tests - rotating' stamp: 'id 5/16/2022 11:56:19'!
test09RoverHeadsEastWhenRotatingLeftWhenHeadingSouth

	self assertMarsRoverIsAt: 0@0 heading: east afterExecutingTheCommands: 'l'.! !

!MarsRoverTests methodsFor: 'tests - rotating' stamp: 'id 5/16/2022 11:56:39'!
test10RoverHeadsNorthWhenRotatingRightWhenHeadingWest

	self assertMarsRoverIsAt: 0@0 heading: north afterExecutingTheCommands: 'rr'.! !

!MarsRoverTests methodsFor: 'tests - rotating' stamp: 'id 5/16/2022 11:56:58'!
test11RoverHeadsEastWhenRotatingRightWhenHeadingNorth

	self assertMarsRoverIsAt: 0@0 heading: east afterExecutingTheCommands: 'rrr'.! !

!MarsRoverTests methodsFor: 'tests - rotating' stamp: 'id 5/16/2022 11:57:17'!
test12RoverHeadsSouthWhenRotatingRightWhenHeadingEast

	self assertMarsRoverIsAt: 0@0 heading: south afterExecutingTheCommands: 'rrrr'.! !

!MarsRoverTests methodsFor: 'tests - rotating' stamp: 'id 5/16/2022 11:57:39'!
test13RoverHeadsNorthWhenRotatingLeftWhenHeadingWest

	self assertMarsRoverIsAt: 0@0 heading: north afterExecutingTheCommands: 'll'.! !

!MarsRoverTests methodsFor: 'tests - rotating' stamp: 'id 5/16/2022 11:57:58'!
test14RoverHeadsWestWhenRotatingLeftWhenHeadingNorth

	self assertMarsRoverIsAt: 0@0 heading: west afterExecutingTheCommands: 'lll'.! !

!MarsRoverTests methodsFor: 'tests - rotating' stamp: 'id 5/16/2022 11:58:18'!
test15RoverHeadsSouthWhenRotatingLeftWhenHeadingEast

	self assertMarsRoverIsAt: 0@0 heading: south afterExecutingTheCommands: 'llll'.! !

!MarsRoverTests methodsFor: 'tests - rotating' stamp: 'id 5/16/2022 11:58:48'!
test16RoverStaysHeadingSouthWhenRotatingRightAndLeft

	self assertMarsRoverIsAt: 0@0 heading: south afterExecutingTheCommands: 'rl'.! !

!MarsRoverTests methodsFor: 'tests - rotating' stamp: 'id 5/16/2022 11:59:22'!
test17RoverStaysHeadingSouthWhenRotatingLeftAndRight

	self assertMarsRoverIsAt: 0@0 heading: south afterExecutingTheCommands: 'lr'.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'id 5/16/2022 14:04:27'!
initializeAt: aCoordinate heading: aCardinalPoint 

	state := MarsRoverState for: self withCoordinate: aCoordinate heading: aCardinalPoint.! !


!MarsRover methodsFor: 'operations' stamp: 'id 5/16/2022 09:54:36'!
changeState: aState

	state := aState.! !

!MarsRover methodsFor: 'operations' stamp: 'id 5/16/2022 11:40:33'!
moveBackwards

	state moveBackwards.! !

!MarsRover methodsFor: 'operations' stamp: 'id 5/16/2022 11:41:22'!
moveForward
	
	state moveForward.! !

!MarsRover methodsFor: 'operations' stamp: 'id 5/12/2022 21:25:14'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [ :aCommand | self processCommand: aCommand. ].! !

!MarsRover methodsFor: 'operations' stamp: 'id 5/16/2022 11:41:22'!
processCommand: aCommand

	aCommand = $f ifTrue: [ self moveForward. ].
	
	aCommand = $b ifTrue: [ self moveBackwards. ].
	
	aCommand = $r ifTrue: [ self rotateRight. ].
	
	aCommand = $l ifTrue: [ self rotateLeft. ].! !

!MarsRover methodsFor: 'operations' stamp: 'id 5/16/2022 11:40:53'!
rotateLeft
	
	state rotateLeft.! !

!MarsRover methodsFor: 'operations' stamp: 'id 5/16/2022 11:41:01'!
rotateRight
	
	state rotateRight.! !


!MarsRover methodsFor: 'testing' stamp: 'id 5/16/2022 11:41:46'!
isAt: aCoordinate heading: aCardinalPoint 
	
	^state isAt: aCoordinate heading: aCardinalPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'id 5/16/2022 14:01:35'!
initializeAt: aCoordinate heading: aCardinalPoint 

	^self new initializeAt: aCoordinate heading: aCardinalPoint.! !


!classDefinition: #MarsRoverState category: 'MarsRover'!
Object subclass: #MarsRoverState
	instanceVariableNames: 'marsRover coordinate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverState methodsFor: 'initialization' stamp: 'id 5/16/2022 09:56:44'!
initializeFor: aMarsRover withCoordinate: aCoordinate

	marsRover := aMarsRover.
	coordinate := aCoordinate.! !


!MarsRoverState methodsFor: 'operations' stamp: 'id 5/16/2022 09:43:20'!
moveBackwards

	self subclassResponsibility.! !

!MarsRoverState methodsFor: 'operations' stamp: 'id 5/16/2022 09:43:15'!
moveForward

	self subclassResponsibility.! !

!MarsRoverState methodsFor: 'operations' stamp: 'id 5/16/2022 09:43:27'!
rotateLeft

	self subclassResponsibility.! !

!MarsRoverState methodsFor: 'operations' stamp: 'id 5/16/2022 09:43:24'!
rotateRight

	self subclassResponsibility.! !


!MarsRoverState methodsFor: 'operations - auxiliary' stamp: 'id 5/16/2022 12:50:30'!
moveOneCoordinateEast

	coordinate := (coordinate x + 1)@(coordinate y).! !

!MarsRoverState methodsFor: 'operations - auxiliary' stamp: 'id 5/16/2022 12:52:03'!
moveOneCoordinateNorth

	coordinate := (coordinate x)@(coordinate y + 1).! !

!MarsRoverState methodsFor: 'operations - auxiliary' stamp: 'id 5/16/2022 12:52:13'!
moveOneCoordinateSouth

	coordinate := (coordinate x)@(coordinate y - 1).! !

!MarsRoverState methodsFor: 'operations - auxiliary' stamp: 'id 5/16/2022 12:50:05'!
moveOneCoordinateWest

	coordinate := (coordinate x - 1)@(coordinate y).! !

!MarsRoverState methodsFor: 'operations - auxiliary' stamp: 'id 5/16/2022 14:16:53'!
rotateEast

	marsRover changeState: (MarsRoverState for: marsRover withCoordinate: coordinate heading: #East).! !

!MarsRoverState methodsFor: 'operations - auxiliary' stamp: 'id 5/16/2022 14:17:11'!
rotateNorth

	marsRover changeState: (MarsRoverState for: marsRover withCoordinate: coordinate heading: #North).! !

!MarsRoverState methodsFor: 'operations - auxiliary' stamp: 'id 5/16/2022 14:17:24'!
rotateSouth

	marsRover changeState: (MarsRoverState for: marsRover withCoordinate: coordinate heading: #South).! !

!MarsRoverState methodsFor: 'operations - auxiliary' stamp: 'id 5/16/2022 14:17:47'!
rotateWest

	marsRover changeState: (MarsRoverState for: marsRover withCoordinate: coordinate heading: #West).! !


!MarsRoverState methodsFor: 'testing' stamp: 'id 5/16/2022 11:37:20'!
isAt: aCoordinate heading: aCardinalPoint 
	
	self subclassResponsibility.! !


!MarsRoverState methodsFor: 'testing - private' stamp: 'id 5/16/2022 13:25:34'!
checkIsAt: aCoordinate heading: aCardinalPoint whenActuallyHeading: anotherCardinalPoint
	
	^coordinate = aCoordinate and: [aCardinalPoint = anotherCardinalPoint].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverState class' category: 'MarsRover'!
MarsRoverState class
	instanceVariableNames: ''!

!MarsRoverState class methodsFor: 'instance creation' stamp: 'id 5/16/2022 14:12:44'!
for: aMarsRover withCoordinate: aCoordinate heading: aCardinalPoint 

	^(self subclasses
		detect: [ :aMarsRoverStateSubclass | aMarsRoverStateSubclass isFor: aCardinalPoint ]
		ifNone: [ self error: 'Invalid cardinal point'. ]) new initializeFor: aMarsRover withCoordinate: aCoordinate.! !

!MarsRoverState class methodsFor: 'instance creation' stamp: 'id 5/16/2022 14:09:27'!
isFor: aCardinalPoint 
	
	self subclassResponsibility.! !


!classDefinition: #MarsRoverHeadingEast category: 'MarsRover'!
MarsRoverState subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadingEast methodsFor: 'operations' stamp: 'id 5/16/2022 12:50:12'!
moveBackwards

	self moveOneCoordinateWest.! !

!MarsRoverHeadingEast methodsFor: 'operations' stamp: 'id 5/16/2022 12:50:36'!
moveForward

	self moveOneCoordinateEast.! !

!MarsRoverHeadingEast methodsFor: 'operations' stamp: 'id 5/16/2022 12:54:40'!
rotateLeft

	self rotateNorth.! !

!MarsRoverHeadingEast methodsFor: 'operations' stamp: 'id 5/16/2022 12:55:31'!
rotateRight

	self rotateSouth.! !


!MarsRoverHeadingEast methodsFor: 'testing' stamp: 'id 5/16/2022 13:26:14'!
isAt: aCoordinate heading: aCardinalPoint 
	
	^self checkIsAt: aCoordinate heading: aCardinalPoint whenActuallyHeading: #East.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadingEast class' category: 'MarsRover'!
MarsRoverHeadingEast class
	instanceVariableNames: ''!

!MarsRoverHeadingEast class methodsFor: 'instance creation' stamp: 'id 5/16/2022 14:09:02'!
isFor: aCardinalPoint 
	
	^aCardinalPoint = #East.! !


!classDefinition: #MarsRoverHeadingNorth category: 'MarsRover'!
MarsRoverState subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadingNorth methodsFor: 'operations' stamp: 'id 5/16/2022 12:52:22'!
moveBackwards

	self moveOneCoordinateSouth.! !

!MarsRoverHeadingNorth methodsFor: 'operations' stamp: 'id 5/16/2022 12:52:38'!
moveForward

	self moveOneCoordinateNorth.! !

!MarsRoverHeadingNorth methodsFor: 'operations' stamp: 'id 5/16/2022 12:56:34'!
rotateLeft

	self rotateWest.! !

!MarsRoverHeadingNorth methodsFor: 'operations' stamp: 'id 5/16/2022 12:56:54'!
rotateRight

	self rotateEast.! !


!MarsRoverHeadingNorth methodsFor: 'testing' stamp: 'id 5/16/2022 13:26:24'!
isAt: aCoordinate heading: aCardinalPoint 
	
	^self checkIsAt: aCoordinate heading: aCardinalPoint whenActuallyHeading: #North.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadingNorth class' category: 'MarsRover'!
MarsRoverHeadingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadingNorth class methodsFor: 'instance creation' stamp: 'id 5/16/2022 14:09:05'!
isFor: aCardinalPoint 
	
	^aCardinalPoint = #North.! !


!classDefinition: #MarsRoverHeadingSouth category: 'MarsRover'!
MarsRoverState subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadingSouth methodsFor: 'operations' stamp: 'id 5/16/2022 12:53:16'!
moveBackwards

	self moveOneCoordinateNorth.! !

!MarsRoverHeadingSouth methodsFor: 'operations' stamp: 'id 5/16/2022 12:53:03'!
moveForward

	self moveOneCoordinateSouth.! !

!MarsRoverHeadingSouth methodsFor: 'operations' stamp: 'id 5/16/2022 12:57:13'!
rotateLeft

	self rotateEast.! !

!MarsRoverHeadingSouth methodsFor: 'operations' stamp: 'id 5/16/2022 12:57:27'!
rotateRight

	self rotateWest.! !


!MarsRoverHeadingSouth methodsFor: 'testing' stamp: 'id 5/16/2022 13:26:29'!
isAt: aCoordinate heading: aCardinalPoint 
	
	^self checkIsAt: aCoordinate heading: aCardinalPoint whenActuallyHeading: #South.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadingSouth class' category: 'MarsRover'!
MarsRoverHeadingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadingSouth class methodsFor: 'instance creation' stamp: 'id 5/16/2022 14:09:11'!
isFor: aCardinalPoint 
	
	^aCardinalPoint = #South.! !


!classDefinition: #MarsRoverHeadingWest category: 'MarsRover'!
MarsRoverState subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadingWest methodsFor: 'operations' stamp: 'id 5/16/2022 12:51:14'!
moveBackwards

	self moveOneCoordinateEast.! !

!MarsRoverHeadingWest methodsFor: 'operations' stamp: 'id 5/16/2022 12:51:36'!
moveForward

	self moveOneCoordinateWest.! !

!MarsRoverHeadingWest methodsFor: 'operations' stamp: 'id 5/16/2022 12:55:44'!
rotateLeft

	self rotateSouth.! !

!MarsRoverHeadingWest methodsFor: 'operations' stamp: 'id 5/16/2022 12:55:02'!
rotateRight

	self rotateNorth.! !


!MarsRoverHeadingWest methodsFor: 'testing' stamp: 'id 5/16/2022 13:26:35'!
isAt: aCoordinate heading: aCardinalPoint 
	
	^self checkIsAt: aCoordinate heading: aCardinalPoint whenActuallyHeading: #West.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadingWest class' category: 'MarsRover'!
MarsRoverHeadingWest class
	instanceVariableNames: ''!

!MarsRoverHeadingWest class methodsFor: 'instance creation' stamp: 'id 5/16/2022 14:09:16'!
isFor: aCardinalPoint 
	
	^aCardinalPoint = #West.! !
