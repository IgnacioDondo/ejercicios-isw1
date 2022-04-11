!classDefinition: #I category: #'Numeros-Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros-Naturales'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'next' stamp: 'id 4/10/2022 22:23:20'!
next

	^II.! !


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


!I class methodsFor: 'errors' stamp: 'id 4/10/2022 19:21:10'!
canNotDivideByBiggerNumberErrorDescription

	^ 'A natural number cannot be divided by a greater natural number'.! !

!I class methodsFor: 'errors' stamp: 'id 4/10/2022 19:25:50'!
negativeNumbersNotSupportedErrorDescription

	^ 'A natural number cannot be subtracted from a smaller natural number'.! !


!classDefinition: #II category: #'Numeros-Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros-Naturales'!
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


!II class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: #'Numeros-Naturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Numeros-Naturales'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IV.
	previous := II.! !


!classDefinition: #IV category: #'Numeros-Naturales'!
II subclass: #IV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IV class' category: #'Numeros-Naturales'!
IV class
	instanceVariableNames: ''!

!IV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := III.! !


!classDefinition: #IX category: #'Numeros-Naturales'!
II subclass: #IX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IX class' category: #'Numeros-Naturales'!
IX class
	instanceVariableNames: ''!

!IX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := X.
	previous := VIII.! !


!classDefinition: #V category: #'Numeros-Naturales'!
II subclass: #V
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'V class' category: #'Numeros-Naturales'!
V class
	instanceVariableNames: ''!

!V class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VI.
	previous := IV.! !


!classDefinition: #VI category: #'Numeros-Naturales'!
II subclass: #VI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VI class' category: #'Numeros-Naturales'!
VI class
	instanceVariableNames: ''!

!VI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VII.
	previous := V.! !


!classDefinition: #VII category: #'Numeros-Naturales'!
II subclass: #VII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VII class' category: #'Numeros-Naturales'!
VII class
	instanceVariableNames: ''!

!VII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VIII.
	previous := VI.! !


!classDefinition: #VIII category: #'Numeros-Naturales'!
II subclass: #VIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VIII class' category: #'Numeros-Naturales'!
VIII class
	instanceVariableNames: ''!

!VIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IX.
	previous := VII.! !


!classDefinition: #X category: #'Numeros-Naturales'!
II subclass: #X
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'X class' category: #'Numeros-Naturales'!
X class
	instanceVariableNames: ''!

!X class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XI.
	previous := IX.! !


!classDefinition: #XI category: #'Numeros-Naturales'!
II subclass: #XI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XI class' category: #'Numeros-Naturales'!
XI class
	instanceVariableNames: ''!

!XI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XII.
	previous := X.! !


!classDefinition: #XII category: #'Numeros-Naturales'!
II subclass: #XII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XII class' category: #'Numeros-Naturales'!
XII class
	instanceVariableNames: ''!

!XII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XIII.
	previous := XI.! !


!classDefinition: #XIII category: #'Numeros-Naturales'!
II subclass: #XIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIII class' category: #'Numeros-Naturales'!
XIII class
	instanceVariableNames: ''!

!XIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XIV.
	previous := XII.! !


!classDefinition: #XIV category: #'Numeros-Naturales'!
II subclass: #XIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIV class' category: #'Numeros-Naturales'!
XIV class
	instanceVariableNames: ''!

!XIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XV.
	previous := XIII.! !


!classDefinition: #XIX category: #'Numeros-Naturales'!
II subclass: #XIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIX class' category: #'Numeros-Naturales'!
XIX class
	instanceVariableNames: ''!

!XIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XX.
	previous := XVIII.! !


!classDefinition: #XV category: #'Numeros-Naturales'!
II subclass: #XV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XV class' category: #'Numeros-Naturales'!
XV class
	instanceVariableNames: ''!

!XV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XVI.
	previous := XIV.! !


!classDefinition: #XVI category: #'Numeros-Naturales'!
II subclass: #XVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVI class' category: #'Numeros-Naturales'!
XVI class
	instanceVariableNames: ''!

!XVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XVII.
	previous := XV.! !


!classDefinition: #XVII category: #'Numeros-Naturales'!
II subclass: #XVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVII class' category: #'Numeros-Naturales'!
XVII class
	instanceVariableNames: ''!

!XVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XVIII.
	previous := XVI.! !


!classDefinition: #XVIII category: #'Numeros-Naturales'!
II subclass: #XVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVIII class' category: #'Numeros-Naturales'!
XVIII class
	instanceVariableNames: ''!

!XVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XIX.
	previous := XVII.! !


!classDefinition: #XX category: #'Numeros-Naturales'!
II subclass: #XX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XX class' category: #'Numeros-Naturales'!
XX class
	instanceVariableNames: ''!

!XX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 16:02:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := XIX.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IV initializeAfterFileIn!
IX initializeAfterFileIn!
V initializeAfterFileIn!
VI initializeAfterFileIn!
VII initializeAfterFileIn!
VIII initializeAfterFileIn!
X initializeAfterFileIn!
XI initializeAfterFileIn!
XII initializeAfterFileIn!
XIII initializeAfterFileIn!
XIV initializeAfterFileIn!
XIX initializeAfterFileIn!
XV initializeAfterFileIn!
XVI initializeAfterFileIn!
XVII initializeAfterFileIn!
XVIII initializeAfterFileIn!
XX initializeAfterFileIn!