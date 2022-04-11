!classDefinition: #NaturalNumbersTester category: 'Roman Numbers Tests'!
DenotativeObject subclass: #NaturalNumbersTester
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Roman Numbers Tests'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NaturalNumbersTester class' category: 'Roman Numbers Tests'!
NaturalNumbersTester class
	instanceVariableNames: ''!

!NaturalNumbersTester class methodsFor: 'testing' stamp: 'ARM 9/1/2021 13:38:27'!
test01OnePlusAnAdderEqualsTheNextOfTheAdder

	Assert that: I + II isEqualTo: II next.! !

!NaturalNumbersTester class methodsFor: 'testing' stamp: 'ARM 9/3/2021 15:55:44'!
test02NumbersBiggerThanOneCanBeAdded

	Assert that: II + II isEqualTo: IV
! !

!NaturalNumbersTester class methodsFor: 'testing' stamp: 'ARM 9/1/2021 13:39:18'!
test03ANumberMinusOneEqualsThePreviousOfTheNumber

	Assert that: II - I isEqualTo: II previous.! !

!NaturalNumbersTester class methodsFor: 'testing' stamp: 'ARM 9/3/2021 15:55:37'!
test04NumbersBiggerThanOneCanBeSubstracted

	Assert that: IV - II isEqualTo: II
! !

!NaturalNumbersTester class methodsFor: 'testing' stamp: 'ARM 9/1/2021 13:40:13'!
test05SubstractionDoesNotSupportNegativeNumbers

	Assert should: [ I - II ]
		signal: Error
		withDescription: I negativeNumbersNotSupportedErrorDescription.
! !

!NaturalNumbersTester class methodsFor: 'testing' stamp: 'ARM 9/1/2021 13:40:37'!
test06ANumberMultipliedByOneEqualsANumber

	Assert that: II * I isEqualTo: II.! !

!NaturalNumbersTester class methodsFor: 'testing' stamp: 'ARM 9/3/2021 15:55:29'!
test07NumbersBiggerThanOneCanBeMultiplied

	Assert that: II * II isEqualTo: IV! !

!NaturalNumbersTester class methodsFor: 'testing' stamp: 'ARM 9/1/2021 13:41:49'!
test08OneMultipliedByOneEqualsOne

	Assert that: I * I isEqualTo: I.! !

!NaturalNumbersTester class methodsFor: 'testing' stamp: 'ARM 9/3/2021 15:55:23'!
test09NumbersBiggerThanOneCanBeDivided

	Assert that: IV / II isEqualTo: II
! !

!NaturalNumbersTester class methodsFor: 'testing' stamp: 'ARM 9/1/2021 13:43:07'!
test10ANumberDividedByOneEqualsItself

	Assert that: II / I isEqualTo: II.! !

!NaturalNumbersTester class methodsFor: 'testing' stamp: 'ARM 9/1/2021 13:43:27'!
test11OneDividedByOneEqualsOne

	Assert that: I / I isEqualTo: I.! !

!NaturalNumbersTester class methodsFor: 'testing' stamp: 'ARM 9/3/2021 15:55:54'!
test12CanNotDivideByABiggerNumber

	Assert should: [ III /  IV ]
		signal: Error
		withDescription: II canNotDivideByBiggerNumberErrorDescription.
	
	Assert should: [ I /  II]
		signal: Error
		withDescription: II canNotDivideByBiggerNumberErrorDescription
! !
