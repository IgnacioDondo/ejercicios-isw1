!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'tests' stamp: 'id 5/12/2022 21:26:32'!
test01RoverStaysAtOriginWhenReceivesEmptyStringHeadingSouth

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: ''.
	
	self assert: (marsRover isAt: 0@0 heading: #South).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'id 5/12/2022 21:26:53'!
test02RoverStaysAtOriginWhenReceivesEmptyString

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: ''.
	
	self deny: (marsRover isAt: 1@1 heading: #South).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'id 5/12/2022 21:27:07'!
test03RoverStaysHeadingSouthWhenReceivesEmptyString

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: ''.
	
	self deny: (marsRover isAt: 0@0 heading: #North).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'id 5/12/2022 21:27:26'!
test04RoverMovesOneCoordinateFurtherSouthWhenReceivesForwardCommandHeadingSouth

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 0@-1 heading: #South).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'id 5/12/2022 21:27:41'!
test05RoverMovesOneCoordinateBackwardsWhenReceivesBackwardCommandHeadingSouth

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'b'.
	
	self assert: (marsRover isAt: 0@1 heading: #South).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'id 5/12/2022 21:27:55'!
test06RoverMovesTwoCoordinatesFurtherSouthWhenReceivesForwardCommandTwiceHeadingSouth

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'ff'.
	
	self assert: (marsRover isAt: 0@-2 heading: #South).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'id 5/12/2022 21:28:07'!
test07RoverMovesTwoCoordinatesBackwardsWhenReceivesBackwardCommandTwiceHeadingSouth

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'bb'.
	
	self assert: (marsRover isAt: 0@2 heading: #South).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'MYB 5/15/2022 22:29:40'!
test08RoverHeadsWestWhenRotatingRightWhenHeadingSouth

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'r'.
	
	self assert: (marsRover isAt: 0@0 heading: #West).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'MYB 5/15/2022 22:29:59'!
test09RoverHeadsEastWhenRotatingLeftWhenHeadingSouth

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 0@0 heading: #East).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'id 5/12/2022 21:38:41'!
test10RoverHeadsNorthWhenRotatingRightWhenHeadingEast

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'rr'.
	
	self assert: (marsRover isAt: 0@0 heading: #North).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'MYB 5/15/2022 22:31:20'!
test11RoverHeadsEastWhenRotatingRightWhenHeadingNorth

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'rrr'.
	
	self assert: (marsRover isAt: 0@0 heading: #East).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'id 5/12/2022 21:43:10'!
test12RoverHeadsSouthWhenRotatingRightWhenHeadingWest

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'rrrr'.
	
	self assert: (marsRover isAt: 0@0 heading: #South).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'id 5/12/2022 21:45:28'!
test13RoverHeadsNorthWhenRotatingLeftWhenHeadingWest

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'll'.
	
	self assert: (marsRover isAt: 0@0 heading: #North).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'MYB 5/15/2022 22:32:01'!
test14RoverHeadsWestWhenRotatingLeftWhenHeadingNorth

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'lll'.
	
	self assert: (marsRover isAt: 0@0 heading: #West).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'id 5/12/2022 21:50:08'!
test15RoverHeadsSouthWhenRotatingLeftWhenHeadingEast

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'llll'.
	
	self assert: (marsRover isAt: 0@0 heading: #South).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'MYB 5/15/2022 21:28:39'!
test16RoverStaysHeadingSouthWhenRotatingRightAndLeft

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'rl'.
	
	self assert: (marsRover isAt: 0@0 heading: #South).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'MYB 5/15/2022 21:28:54'!
test17RoverStaysHeadingSouthWhenRotatingLeftAndRight

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'lr'.
	
	self assert: (marsRover isAt: 0@0 heading: #South).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'MYB 5/15/2022 22:35:23'!
test18RoverMovesOneCoordinateToWestWhenRotatingRightAndReceivesForward

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'rf'.
	
	self assert: (marsRover isAt: -1@0 heading: #West).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'MYB 5/15/2022 22:35:50'!
test19RoverMovesOneCoordinateToEastWhenRotatingLeftAndReceivesForward

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'lf'.
	
	self assert: (marsRover isAt: 1@0 heading: #East).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'MYB 5/15/2022 22:38:08'!
test20RoverMovesOneCoordinateToNorthWhenRotatingRightTwoTimesAndReceivesForward

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'rrf'.
	
	self assert: (marsRover isAt: 0@1 heading: #North).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'MYB 5/15/2022 22:42:53'!
test21RoverHeadsWestAndMovesOneCoordinateToEastWhenRotatingRightAndReceivesBackwards

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'rb'.
	
	self assert: (marsRover isAt: 1@0 heading: #West).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'MYB 5/15/2022 22:50:06'!
test22RoverHeadsEastAndMovesOneCoordinateToWestWhenRotatingLeftAndReceivesBackwards

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'lb'.
	
	self assert: (marsRover isAt: -1@0 heading: #East).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'MYB 5/15/2022 22:52:39'!
test23RoverHeadsNorthAndMovesOneCoordinateToEastWhenRotatingRightTwoTimesAndReceivesBackwards

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'rrb'.
	
	self assert: (marsRover isAt: 0@-1 heading: #North).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'MYB 5/15/2022 23:06:29'!
test24RoverHeadsNorthAt22AfterMovingForwardAndRotatingInZigZag

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'rrfrflfrfl'.
	
	self assert: (marsRover isAt: 2@2 heading: #North).! !

!MarsRoverTests methodsFor: 'tests' stamp: 'MYB 5/15/2022 23:10:11'!
test25RoverHeadsSouthAt22AfterMovingBackwardsAndRotatingInZigZag

	| marsRover |
	
	marsRover := MarsRover new.
	marsRover process: 'brblbrbl'.
	
	self assert: (marsRover isAt: 2@2 heading: #South).! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'coordinate cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'id 5/12/2022 20:56:14'!
initialize

	coordinate := 0@0.
	cardinalPoint := #South.! !


!MarsRover methodsFor: 'operations' stamp: 'MYB 5/15/2022 23:09:35'!
moveBackwards

	cardinalPoint = #South ifTrue: [ coordinate := (coordinate x)@(coordinate y + 1). ].
	cardinalPoint = #West ifTrue: [ coordinate := (coordinate x + 1)@(coordinate y). ].
	cardinalPoint = #North ifTrue: [ coordinate := (coordinate x)@(coordinate y - 1). ].
	cardinalPoint = #East ifTrue: [ coordinate := (coordinate x - 1)@(coordinate y). ].! !

!MarsRover methodsFor: 'operations' stamp: 'MYB 5/15/2022 23:05:06'!
moveForwards
	
	cardinalPoint = #South ifTrue: [ coordinate := (coordinate x)@(coordinate y - 1). ].
	cardinalPoint = #West ifTrue: [ coordinate := (coordinate x - 1)@(coordinate y). ].
	cardinalPoint = #North ifTrue: [ coordinate := (coordinate x)@(coordinate y + 1). ].
	cardinalPoint = #East ifTrue: [ coordinate := (coordinate x + 1)@(coordinate y). ].! !

!MarsRover methodsFor: 'operations' stamp: 'id 5/12/2022 21:25:14'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [ :aCommand | self processCommand: aCommand. ].! !

!MarsRover methodsFor: 'operations' stamp: 'id 5/12/2022 21:35:57'!
processCommand: aCommand

	aCommand = $f ifTrue: [ self moveForwards. ].
	
	aCommand = $b ifTrue: [ self moveBackwards. ].
	
	aCommand = $r ifTrue: [ self rotateRight. ].
	
	aCommand = $l ifTrue: [ self rotateLeft. ].! !

!MarsRover methodsFor: 'operations' stamp: 'MYB 5/15/2022 22:28:34'!
rotateLeft
	
	cardinalPoint = #South ifTrue: [ ^cardinalPoint := #East. ].
	
	cardinalPoint = #East ifTrue: [ ^cardinalPoint := #North. ].
	
	cardinalPoint = #North ifTrue: [ ^cardinalPoint := #West. ].
	
	cardinalPoint = #West ifTrue: [ ^cardinalPoint := #South. ].! !

!MarsRover methodsFor: 'operations' stamp: 'MYB 5/15/2022 22:28:48'!
rotateRight
	
	cardinalPoint = #South ifTrue: [ ^cardinalPoint := #West. ].
	
	cardinalPoint = #West ifTrue: [ ^cardinalPoint := #North. ].
	
	cardinalPoint = #North ifTrue: [ ^cardinalPoint := #East. ].
	
	cardinalPoint = #East ifTrue: [ ^cardinalPoint := #South. ].! !


!MarsRover methodsFor: 'testing' stamp: 'id 5/12/2022 20:58:28'!
isAt: aCoordinate heading: aCardinalPoint 
	
	^coordinate = aCoordinate and: [cardinalPoint = aCardinalPoint].! !
