!classDefinition: #I category: 'Numeros-Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Numeros-Naturales'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'next' stamp: 'id 4/10/2022 22:23:20'!
next

	^II.! !


!I class methodsFor: 'errors' stamp: 'id 4/10/2022 19:21:10'!
canNotDivideByBiggerNumberErrorDescription

	^ 'A natural number cannot be divided by a greater natural number'.! !

!I class methodsFor: 'errors' stamp: 'id 4/10/2022 19:25:50'!
negativeNumbersNotSupportedErrorDescription

	^ 'A natural number cannot be subtracted from a smaller natural number'.! !


!I class methodsFor: 'operations' stamp: 'id 4/10/2022 22:22:46'!
* aNaturalNumber

	^aNaturalNumber.! !

!I class methodsFor: 'operations' stamp: 'id 4/10/2022 22:22:54'!
+ aNaturalNumber

	^aNaturalNumber next.! !

!I class methodsFor: 'operations' stamp: 'id 4/10/2022 22:23:02'!
- subtrahend

	self error: (self negativeNumbersNotSupportedErrorDescription).! !

!I class methodsFor: 'operations' stamp: 'id 4/10/2022 22:20:50'!
/ divisor

	self = divisor ifTrue:[^self].
	self error: (self canNotDivideByBiggerNumberErrorDescription).! !

!I class methodsFor: 'operations' stamp: 'id 4/10/2022 19:19:02'!
subtractFrom: minuend

	^minuend previous.! !


!classDefinition: #II category: 'Numeros-Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Numeros-Naturales'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'next & previous' stamp: 'id 4/10/2022 22:23:31'!
nameOfNext

	(self name endsWith: 'CMXCIX') ifTrue:[^(self name withoutSuffix: 'CMXCIX'), 'M'].
	(self name endsWith: 'DCCCXCIX') ifTrue:[^(self name withoutSuffix: 'DCCCXCIX'), 'CM'].
	(self name endsWith: 'CDXCIX') ifTrue:[^(self name withoutSuffix: 'CDXCIX'), 'D'].
	(self name endsWith: 'CCCXCIX') ifTrue:[^(self name withoutSuffix: 'CCCXCIX'), 'CD'].
	(self name endsWith: 'XCIX') ifTrue:[^(self name withoutSuffix: 'XCIX'), 'C'].
	(self name endsWith: 'LXXXIX') ifTrue:[^(self name withoutSuffix: 'LXXXIX'), 'XC'].
	(self name endsWith: 'XLIX') ifTrue:[^(self name withoutSuffix: 'XLIX'), 'L'].
	(self name endsWith: 'XXXIX') ifTrue:[^(self name withoutSuffix: 'XXXIX'), 'XL'].
	(self name endsWith: 'IX') ifTrue:[^(self name withoutSuffix: 'IX'), 'X'].
	(self name endsWith: 'VIII') ifTrue:[^(self name withoutSuffix: 'VIII'), 'IX'].
	(self name endsWith: 'IV') ifTrue:[^(self name withoutSuffix: 'IV'), 'V'].
	(self name endsWith: 'III') ifTrue:[^(self name withoutSuffix: 'III'), 'IV'].
	^ self name , 'I'.! !

!II class methodsFor: 'next & previous' stamp: 'id 4/10/2022 22:23:35'!
next
	next ifNotNil:[^next].
	next _ II createChildNamed: self nameOfNext.
	next previous: self.
	^next.! !

!II class methodsFor: 'next & previous' stamp: 'id 4/10/2022 22:23:38'!
previous

	^previous.! !

!II class methodsFor: 'next & previous' stamp: 'id 4/10/2022 22:23:45'!
previous: aNaturalNumber 
	
	previous _ aNaturalNumber.! !


!II class methodsFor: 'errors' stamp: 'id 4/10/2022 19:23:38'!
canNotDivideByBiggerNumberErrorDescription

	^ 'A natural number cannot be divided by a greater natural number'.! !

!II class methodsFor: 'errors' stamp: 'id 4/10/2022 19:25:29'!
negativeNumbersNotSupportedErrorDescription

	^ 'A natural number cannot be subtracted from a smaller natural number'.! !


!II class methodsFor: 'helpers' stamp: 'id 4/4/2022 21:23:59'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil
	]! !


!II class methodsFor: 'operations' stamp: 'id 4/10/2022 22:24:03'!
* aNaturalNumber

	^aNaturalNumber  + (self previous * aNaturalNumber).! !

!II class methodsFor: 'operations' stamp: 'id 4/10/2022 22:24:08'!
+ aNaturalNumber

	^previous + aNaturalNumber next.! !

!II class methodsFor: 'operations' stamp: 'id 4/10/2022 22:24:17'!
- subtrahend

	^subtrahend subtractFrom: self.! !

!II class methodsFor: 'operations' stamp: 'id 4/10/2022 22:24:22'!
/ divisor

	divisor = self ifTrue:[^I].
	divisor = I ifTrue:[^self].
	^I + ((self - divisor) / divisor).! !

!II class methodsFor: 'operations' stamp: 'id 4/10/2022 19:11:52'!
subtractFrom: minuend

	^minuend previous - self previous.! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'id 4/10/2022 22:49:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: 'Numeros-Naturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Numeros-Naturales'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'id 4/10/2022 22:49:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IV.
	previous := II.! !


!classDefinition: #IV category: 'Numeros-Naturales'!
II subclass: #IV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IV class' category: 'Numeros-Naturales'!
IV class
	instanceVariableNames: ''!

!IV class methodsFor: '--** private fileout/in **--' stamp: 'id 4/10/2022 22:49:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := III.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IV initializeAfterFileIn!