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


!II class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #C category: #'Numeros-Naturales'!
II subclass: #C
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'C class' category: #'Numeros-Naturales'!
C class
	instanceVariableNames: ''!

!C class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CI.
	previous := XCIX.! !


!classDefinition: #CC category: #'Numeros-Naturales'!
II subclass: #CC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CC class' category: #'Numeros-Naturales'!
CC class
	instanceVariableNames: ''!

!CC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCI.
	previous := CXCIX.! !


!classDefinition: #CCC category: #'Numeros-Naturales'!
II subclass: #CCC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCC class' category: #'Numeros-Naturales'!
CCC class
	instanceVariableNames: ''!

!CCC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCI.
	previous := CCXCIX.! !


!classDefinition: #CCCI category: #'Numeros-Naturales'!
II subclass: #CCCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCI class' category: #'Numeros-Naturales'!
CCCI class
	instanceVariableNames: ''!

!CCCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCII.
	previous := CCC.! !


!classDefinition: #CCCII category: #'Numeros-Naturales'!
II subclass: #CCCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCII class' category: #'Numeros-Naturales'!
CCCII class
	instanceVariableNames: ''!

!CCCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCIII.
	previous := CCCI.! !


!classDefinition: #CCCIII category: #'Numeros-Naturales'!
II subclass: #CCCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCIII class' category: #'Numeros-Naturales'!
CCCIII class
	instanceVariableNames: ''!

!CCCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCIV.
	previous := CCCII.! !


!classDefinition: #CCCIV category: #'Numeros-Naturales'!
II subclass: #CCCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCIV class' category: #'Numeros-Naturales'!
CCCIV class
	instanceVariableNames: ''!

!CCCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCV.
	previous := CCCIII.! !


!classDefinition: #CCCIX category: #'Numeros-Naturales'!
II subclass: #CCCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCIX class' category: #'Numeros-Naturales'!
CCCIX class
	instanceVariableNames: ''!

!CCCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCX.
	previous := CCCVIII.! !


!classDefinition: #CCCL category: #'Numeros-Naturales'!
II subclass: #CCCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCL class' category: #'Numeros-Naturales'!
CCCL class
	instanceVariableNames: ''!

!CCCL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLI.
	previous := CCCXLIX.! !


!classDefinition: #CCCLI category: #'Numeros-Naturales'!
II subclass: #CCCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLI class' category: #'Numeros-Naturales'!
CCCLI class
	instanceVariableNames: ''!

!CCCLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLII.
	previous := CCCL.! !


!classDefinition: #CCCLII category: #'Numeros-Naturales'!
II subclass: #CCCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLII class' category: #'Numeros-Naturales'!
CCCLII class
	instanceVariableNames: ''!

!CCCLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLIII.
	previous := CCCLI.! !


!classDefinition: #CCCLIII category: #'Numeros-Naturales'!
II subclass: #CCCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLIII class' category: #'Numeros-Naturales'!
CCCLIII class
	instanceVariableNames: ''!

!CCCLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLIV.
	previous := CCCLII.! !


!classDefinition: #CCCLIV category: #'Numeros-Naturales'!
II subclass: #CCCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLIV class' category: #'Numeros-Naturales'!
CCCLIV class
	instanceVariableNames: ''!

!CCCLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLV.
	previous := CCCLIII.! !


!classDefinition: #CCCLIX category: #'Numeros-Naturales'!
II subclass: #CCCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLIX class' category: #'Numeros-Naturales'!
CCCLIX class
	instanceVariableNames: ''!

!CCCLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLX.
	previous := CCCLVIII.! !


!classDefinition: #CCCLV category: #'Numeros-Naturales'!
II subclass: #CCCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLV class' category: #'Numeros-Naturales'!
CCCLV class
	instanceVariableNames: ''!

!CCCLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLVI.
	previous := CCCLIV.! !


!classDefinition: #CCCLVI category: #'Numeros-Naturales'!
II subclass: #CCCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLVI class' category: #'Numeros-Naturales'!
CCCLVI class
	instanceVariableNames: ''!

!CCCLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLVII.
	previous := CCCLV.! !


!classDefinition: #CCCLVII category: #'Numeros-Naturales'!
II subclass: #CCCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLVII class' category: #'Numeros-Naturales'!
CCCLVII class
	instanceVariableNames: ''!

!CCCLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLVIII.
	previous := CCCLVI.! !


!classDefinition: #CCCLVIII category: #'Numeros-Naturales'!
II subclass: #CCCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLVIII class' category: #'Numeros-Naturales'!
CCCLVIII class
	instanceVariableNames: ''!

!CCCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLIX.
	previous := CCCLVII.! !


!classDefinition: #CCCLX category: #'Numeros-Naturales'!
II subclass: #CCCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLX class' category: #'Numeros-Naturales'!
CCCLX class
	instanceVariableNames: ''!

!CCCLX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXI.
	previous := CCCLIX.! !


!classDefinition: #CCCLXI category: #'Numeros-Naturales'!
II subclass: #CCCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXI class' category: #'Numeros-Naturales'!
CCCLXI class
	instanceVariableNames: ''!

!CCCLXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXII.
	previous := CCCLX.! !


!classDefinition: #CCCLXII category: #'Numeros-Naturales'!
II subclass: #CCCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXII class' category: #'Numeros-Naturales'!
CCCLXII class
	instanceVariableNames: ''!

!CCCLXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXIII.
	previous := CCCLXI.! !


!classDefinition: #CCCLXIII category: #'Numeros-Naturales'!
II subclass: #CCCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXIII class' category: #'Numeros-Naturales'!
CCCLXIII class
	instanceVariableNames: ''!

!CCCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXIV.
	previous := CCCLXII.! !


!classDefinition: #CCCLXIV category: #'Numeros-Naturales'!
II subclass: #CCCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXIV class' category: #'Numeros-Naturales'!
CCCLXIV class
	instanceVariableNames: ''!

!CCCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXV.
	previous := CCCLXIII.! !


!classDefinition: #CCCLXIX category: #'Numeros-Naturales'!
II subclass: #CCCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXIX class' category: #'Numeros-Naturales'!
CCCLXIX class
	instanceVariableNames: ''!

!CCCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXX.
	previous := CCCLXVIII.! !


!classDefinition: #CCCLXV category: #'Numeros-Naturales'!
II subclass: #CCCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXV class' category: #'Numeros-Naturales'!
CCCLXV class
	instanceVariableNames: ''!

!CCCLXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXVI.
	previous := CCCLXIV.! !


!classDefinition: #CCCLXVI category: #'Numeros-Naturales'!
II subclass: #CCCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXVI class' category: #'Numeros-Naturales'!
CCCLXVI class
	instanceVariableNames: ''!

!CCCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXVII.
	previous := CCCLXV.! !


!classDefinition: #CCCLXVII category: #'Numeros-Naturales'!
II subclass: #CCCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXVII class' category: #'Numeros-Naturales'!
CCCLXVII class
	instanceVariableNames: ''!

!CCCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXVIII.
	previous := CCCLXVI.! !


!classDefinition: #CCCLXVIII category: #'Numeros-Naturales'!
II subclass: #CCCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXVIII class' category: #'Numeros-Naturales'!
CCCLXVIII class
	instanceVariableNames: ''!

!CCCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXIX.
	previous := CCCLXVII.! !


!classDefinition: #CCCLXX category: #'Numeros-Naturales'!
II subclass: #CCCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXX class' category: #'Numeros-Naturales'!
CCCLXX class
	instanceVariableNames: ''!

!CCCLXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXI.
	previous := CCCLXIX.! !


!classDefinition: #CCCLXXI category: #'Numeros-Naturales'!
II subclass: #CCCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXI class' category: #'Numeros-Naturales'!
CCCLXXI class
	instanceVariableNames: ''!

!CCCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXII.
	previous := CCCLXX.! !


!classDefinition: #CCCLXXII category: #'Numeros-Naturales'!
II subclass: #CCCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXII class' category: #'Numeros-Naturales'!
CCCLXXII class
	instanceVariableNames: ''!

!CCCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXIII.
	previous := CCCLXXI.! !


!classDefinition: #CCCLXXIII category: #'Numeros-Naturales'!
II subclass: #CCCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXIII class' category: #'Numeros-Naturales'!
CCCLXXIII class
	instanceVariableNames: ''!

!CCCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXIV.
	previous := CCCLXXII.! !


!classDefinition: #CCCLXXIV category: #'Numeros-Naturales'!
II subclass: #CCCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXIV class' category: #'Numeros-Naturales'!
CCCLXXIV class
	instanceVariableNames: ''!

!CCCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXV.
	previous := CCCLXXIII.! !


!classDefinition: #CCCLXXIX category: #'Numeros-Naturales'!
II subclass: #CCCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXIX class' category: #'Numeros-Naturales'!
CCCLXXIX class
	instanceVariableNames: ''!

!CCCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXX.
	previous := CCCLXXVIII.! !


!classDefinition: #CCCLXXV category: #'Numeros-Naturales'!
II subclass: #CCCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXV class' category: #'Numeros-Naturales'!
CCCLXXV class
	instanceVariableNames: ''!

!CCCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXVI.
	previous := CCCLXXIV.! !


!classDefinition: #CCCLXXVI category: #'Numeros-Naturales'!
II subclass: #CCCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXVI class' category: #'Numeros-Naturales'!
CCCLXXVI class
	instanceVariableNames: ''!

!CCCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXVII.
	previous := CCCLXXV.! !


!classDefinition: #CCCLXXVII category: #'Numeros-Naturales'!
II subclass: #CCCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXVII class' category: #'Numeros-Naturales'!
CCCLXXVII class
	instanceVariableNames: ''!

!CCCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXVIII.
	previous := CCCLXXVI.! !


!classDefinition: #CCCLXXVIII category: #'Numeros-Naturales'!
II subclass: #CCCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXVIII class' category: #'Numeros-Naturales'!
CCCLXXVIII class
	instanceVariableNames: ''!

!CCCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXIX.
	previous := CCCLXXVII.! !


!classDefinition: #CCCLXXX category: #'Numeros-Naturales'!
II subclass: #CCCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXX class' category: #'Numeros-Naturales'!
CCCLXXX class
	instanceVariableNames: ''!

!CCCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXI.
	previous := CCCLXXIX.! !


!classDefinition: #CCCLXXXI category: #'Numeros-Naturales'!
II subclass: #CCCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXI class' category: #'Numeros-Naturales'!
CCCLXXXI class
	instanceVariableNames: ''!

!CCCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXII.
	previous := CCCLXXX.! !


!classDefinition: #CCCLXXXII category: #'Numeros-Naturales'!
II subclass: #CCCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXII class' category: #'Numeros-Naturales'!
CCCLXXXII class
	instanceVariableNames: ''!

!CCCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXIII.
	previous := CCCLXXXI.! !


!classDefinition: #CCCLXXXIII category: #'Numeros-Naturales'!
II subclass: #CCCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXIII class' category: #'Numeros-Naturales'!
CCCLXXXIII class
	instanceVariableNames: ''!

!CCCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXIV.
	previous := CCCLXXXII.! !


!classDefinition: #CCCLXXXIV category: #'Numeros-Naturales'!
II subclass: #CCCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXIV class' category: #'Numeros-Naturales'!
CCCLXXXIV class
	instanceVariableNames: ''!

!CCCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXV.
	previous := CCCLXXXIII.! !


!classDefinition: #CCCLXXXIX category: #'Numeros-Naturales'!
II subclass: #CCCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXIX class' category: #'Numeros-Naturales'!
CCCLXXXIX class
	instanceVariableNames: ''!

!CCCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXC.
	previous := CCCLXXXVIII.! !


!classDefinition: #CCCLXXXV category: #'Numeros-Naturales'!
II subclass: #CCCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXV class' category: #'Numeros-Naturales'!
CCCLXXXV class
	instanceVariableNames: ''!

!CCCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXVI.
	previous := CCCLXXXIV.! !


!classDefinition: #CCCLXXXVI category: #'Numeros-Naturales'!
II subclass: #CCCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXVI class' category: #'Numeros-Naturales'!
CCCLXXXVI class
	instanceVariableNames: ''!

!CCCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXVII.
	previous := CCCLXXXV.! !


!classDefinition: #CCCLXXXVII category: #'Numeros-Naturales'!
II subclass: #CCCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXVII class' category: #'Numeros-Naturales'!
CCCLXXXVII class
	instanceVariableNames: ''!

!CCCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXVIII.
	previous := CCCLXXXVI.! !


!classDefinition: #CCCLXXXVIII category: #'Numeros-Naturales'!
II subclass: #CCCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXVIII class' category: #'Numeros-Naturales'!
CCCLXXXVIII class
	instanceVariableNames: ''!

!CCCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXIX.
	previous := CCCLXXXVII.! !


!classDefinition: #CCCV category: #'Numeros-Naturales'!
II subclass: #CCCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCV class' category: #'Numeros-Naturales'!
CCCV class
	instanceVariableNames: ''!

!CCCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCVI.
	previous := CCCIV.! !


!classDefinition: #CCCVI category: #'Numeros-Naturales'!
II subclass: #CCCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCVI class' category: #'Numeros-Naturales'!
CCCVI class
	instanceVariableNames: ''!

!CCCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCVII.
	previous := CCCV.! !


!classDefinition: #CCCVII category: #'Numeros-Naturales'!
II subclass: #CCCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCVII class' category: #'Numeros-Naturales'!
CCCVII class
	instanceVariableNames: ''!

!CCCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCVIII.
	previous := CCCVI.! !


!classDefinition: #CCCVIII category: #'Numeros-Naturales'!
II subclass: #CCCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCVIII class' category: #'Numeros-Naturales'!
CCCVIII class
	instanceVariableNames: ''!

!CCCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCIX.
	previous := CCCVII.! !


!classDefinition: #CCCX category: #'Numeros-Naturales'!
II subclass: #CCCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCX class' category: #'Numeros-Naturales'!
CCCX class
	instanceVariableNames: ''!

!CCCX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXI.
	previous := CCCIX.! !


!classDefinition: #CCCXC category: #'Numeros-Naturales'!
II subclass: #CCCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXC class' category: #'Numeros-Naturales'!
CCCXC class
	instanceVariableNames: ''!

!CCCXC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCI.
	previous := CCCLXXXIX.! !


!classDefinition: #CCCXCI category: #'Numeros-Naturales'!
II subclass: #CCCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCI class' category: #'Numeros-Naturales'!
CCCXCI class
	instanceVariableNames: ''!

!CCCXCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCII.
	previous := CCCXC.! !


!classDefinition: #CCCXCII category: #'Numeros-Naturales'!
II subclass: #CCCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCII class' category: #'Numeros-Naturales'!
CCCXCII class
	instanceVariableNames: ''!

!CCCXCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCIII.
	previous := CCCXCI.! !


!classDefinition: #CCCXCIII category: #'Numeros-Naturales'!
II subclass: #CCCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCIII class' category: #'Numeros-Naturales'!
CCCXCIII class
	instanceVariableNames: ''!

!CCCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCIV.
	previous := CCCXCII.! !


!classDefinition: #CCCXCIV category: #'Numeros-Naturales'!
II subclass: #CCCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCIV class' category: #'Numeros-Naturales'!
CCCXCIV class
	instanceVariableNames: ''!

!CCCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCV.
	previous := CCCXCIII.! !


!classDefinition: #CCCXCIX category: #'Numeros-Naturales'!
II subclass: #CCCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCIX class' category: #'Numeros-Naturales'!
CCCXCIX class
	instanceVariableNames: ''!

!CCCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CD.
	previous := CCCXCVIII.! !


!classDefinition: #CCCXCV category: #'Numeros-Naturales'!
II subclass: #CCCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCV class' category: #'Numeros-Naturales'!
CCCXCV class
	instanceVariableNames: ''!

!CCCXCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCVI.
	previous := CCCXCIV.! !


!classDefinition: #CCCXCVI category: #'Numeros-Naturales'!
II subclass: #CCCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCVI class' category: #'Numeros-Naturales'!
CCCXCVI class
	instanceVariableNames: ''!

!CCCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCVII.
	previous := CCCXCV.! !


!classDefinition: #CCCXCVII category: #'Numeros-Naturales'!
II subclass: #CCCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCVII class' category: #'Numeros-Naturales'!
CCCXCVII class
	instanceVariableNames: ''!

!CCCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCVIII.
	previous := CCCXCVI.! !


!classDefinition: #CCCXCVIII category: #'Numeros-Naturales'!
II subclass: #CCCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCVIII class' category: #'Numeros-Naturales'!
CCCXCVIII class
	instanceVariableNames: ''!

!CCCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCIX.
	previous := CCCXCVII.! !


!classDefinition: #CCCXI category: #'Numeros-Naturales'!
II subclass: #CCCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXI class' category: #'Numeros-Naturales'!
CCCXI class
	instanceVariableNames: ''!

!CCCXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXII.
	previous := CCCX.! !


!classDefinition: #CCCXII category: #'Numeros-Naturales'!
II subclass: #CCCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXII class' category: #'Numeros-Naturales'!
CCCXII class
	instanceVariableNames: ''!

!CCCXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXIII.
	previous := CCCXI.! !


!classDefinition: #CCCXIII category: #'Numeros-Naturales'!
II subclass: #CCCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXIII class' category: #'Numeros-Naturales'!
CCCXIII class
	instanceVariableNames: ''!

!CCCXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXIV.
	previous := CCCXII.! !


!classDefinition: #CCCXIV category: #'Numeros-Naturales'!
II subclass: #CCCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXIV class' category: #'Numeros-Naturales'!
CCCXIV class
	instanceVariableNames: ''!

!CCCXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXV.
	previous := CCCXIII.! !


!classDefinition: #CCCXIX category: #'Numeros-Naturales'!
II subclass: #CCCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXIX class' category: #'Numeros-Naturales'!
CCCXIX class
	instanceVariableNames: ''!

!CCCXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXX.
	previous := CCCXVIII.! !


!classDefinition: #CCCXL category: #'Numeros-Naturales'!
II subclass: #CCCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXL class' category: #'Numeros-Naturales'!
CCCXL class
	instanceVariableNames: ''!

!CCCXL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLI.
	previous := CCCXXXIX.! !


!classDefinition: #CCCXLI category: #'Numeros-Naturales'!
II subclass: #CCCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLI class' category: #'Numeros-Naturales'!
CCCXLI class
	instanceVariableNames: ''!

!CCCXLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLII.
	previous := CCCXL.! !


!classDefinition: #CCCXLII category: #'Numeros-Naturales'!
II subclass: #CCCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLII class' category: #'Numeros-Naturales'!
CCCXLII class
	instanceVariableNames: ''!

!CCCXLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLIII.
	previous := CCCXLI.! !


!classDefinition: #CCCXLIII category: #'Numeros-Naturales'!
II subclass: #CCCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLIII class' category: #'Numeros-Naturales'!
CCCXLIII class
	instanceVariableNames: ''!

!CCCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLIV.
	previous := CCCXLII.! !


!classDefinition: #CCCXLIV category: #'Numeros-Naturales'!
II subclass: #CCCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLIV class' category: #'Numeros-Naturales'!
CCCXLIV class
	instanceVariableNames: ''!

!CCCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLV.
	previous := CCCXLIII.! !


!classDefinition: #CCCXLIX category: #'Numeros-Naturales'!
II subclass: #CCCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLIX class' category: #'Numeros-Naturales'!
CCCXLIX class
	instanceVariableNames: ''!

!CCCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCL.
	previous := CCCXLVIII.! !


!classDefinition: #CCCXLV category: #'Numeros-Naturales'!
II subclass: #CCCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLV class' category: #'Numeros-Naturales'!
CCCXLV class
	instanceVariableNames: ''!

!CCCXLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLVI.
	previous := CCCXLIV.! !


!classDefinition: #CCCXLVI category: #'Numeros-Naturales'!
II subclass: #CCCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLVI class' category: #'Numeros-Naturales'!
CCCXLVI class
	instanceVariableNames: ''!

!CCCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLVII.
	previous := CCCXLV.! !


!classDefinition: #CCCXLVII category: #'Numeros-Naturales'!
II subclass: #CCCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLVII class' category: #'Numeros-Naturales'!
CCCXLVII class
	instanceVariableNames: ''!

!CCCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLVIII.
	previous := CCCXLVI.! !


!classDefinition: #CCCXLVIII category: #'Numeros-Naturales'!
II subclass: #CCCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLVIII class' category: #'Numeros-Naturales'!
CCCXLVIII class
	instanceVariableNames: ''!

!CCCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLIX.
	previous := CCCXLVII.! !


!classDefinition: #CCCXV category: #'Numeros-Naturales'!
II subclass: #CCCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXV class' category: #'Numeros-Naturales'!
CCCXV class
	instanceVariableNames: ''!

!CCCXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXVI.
	previous := CCCXIV.! !


!classDefinition: #CCCXVI category: #'Numeros-Naturales'!
II subclass: #CCCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXVI class' category: #'Numeros-Naturales'!
CCCXVI class
	instanceVariableNames: ''!

!CCCXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXVII.
	previous := CCCXV.! !


!classDefinition: #CCCXVII category: #'Numeros-Naturales'!
II subclass: #CCCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXVII class' category: #'Numeros-Naturales'!
CCCXVII class
	instanceVariableNames: ''!

!CCCXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXVIII.
	previous := CCCXVI.! !


!classDefinition: #CCCXVIII category: #'Numeros-Naturales'!
II subclass: #CCCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXVIII class' category: #'Numeros-Naturales'!
CCCXVIII class
	instanceVariableNames: ''!

!CCCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXIX.
	previous := CCCXVII.! !


!classDefinition: #CCCXX category: #'Numeros-Naturales'!
II subclass: #CCCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXX class' category: #'Numeros-Naturales'!
CCCXX class
	instanceVariableNames: ''!

!CCCXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXI.
	previous := CCCXIX.! !


!classDefinition: #CCCXXI category: #'Numeros-Naturales'!
II subclass: #CCCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXI class' category: #'Numeros-Naturales'!
CCCXXI class
	instanceVariableNames: ''!

!CCCXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXII.
	previous := CCCXX.! !


!classDefinition: #CCCXXII category: #'Numeros-Naturales'!
II subclass: #CCCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXII class' category: #'Numeros-Naturales'!
CCCXXII class
	instanceVariableNames: ''!

!CCCXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXIII.
	previous := CCCXXI.! !


!classDefinition: #CCCXXIII category: #'Numeros-Naturales'!
II subclass: #CCCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXIII class' category: #'Numeros-Naturales'!
CCCXXIII class
	instanceVariableNames: ''!

!CCCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXIV.
	previous := CCCXXII.! !


!classDefinition: #CCCXXIV category: #'Numeros-Naturales'!
II subclass: #CCCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXIV class' category: #'Numeros-Naturales'!
CCCXXIV class
	instanceVariableNames: ''!

!CCCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXV.
	previous := CCCXXIII.! !


!classDefinition: #CCCXXIX category: #'Numeros-Naturales'!
II subclass: #CCCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXIX class' category: #'Numeros-Naturales'!
CCCXXIX class
	instanceVariableNames: ''!

!CCCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXX.
	previous := CCCXXVIII.! !


!classDefinition: #CCCXXV category: #'Numeros-Naturales'!
II subclass: #CCCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXV class' category: #'Numeros-Naturales'!
CCCXXV class
	instanceVariableNames: ''!

!CCCXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXVI.
	previous := CCCXXIV.! !


!classDefinition: #CCCXXVI category: #'Numeros-Naturales'!
II subclass: #CCCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXVI class' category: #'Numeros-Naturales'!
CCCXXVI class
	instanceVariableNames: ''!

!CCCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXVII.
	previous := CCCXXV.! !


!classDefinition: #CCCXXVII category: #'Numeros-Naturales'!
II subclass: #CCCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXVII class' category: #'Numeros-Naturales'!
CCCXXVII class
	instanceVariableNames: ''!

!CCCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXVIII.
	previous := CCCXXVI.! !


!classDefinition: #CCCXXVIII category: #'Numeros-Naturales'!
II subclass: #CCCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXVIII class' category: #'Numeros-Naturales'!
CCCXXVIII class
	instanceVariableNames: ''!

!CCCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXIX.
	previous := CCCXXVII.! !


!classDefinition: #CCCXXX category: #'Numeros-Naturales'!
II subclass: #CCCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXX class' category: #'Numeros-Naturales'!
CCCXXX class
	instanceVariableNames: ''!

!CCCXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXI.
	previous := CCCXXIX.! !


!classDefinition: #CCCXXXI category: #'Numeros-Naturales'!
II subclass: #CCCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXI class' category: #'Numeros-Naturales'!
CCCXXXI class
	instanceVariableNames: ''!

!CCCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXII.
	previous := CCCXXX.! !


!classDefinition: #CCCXXXII category: #'Numeros-Naturales'!
II subclass: #CCCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXII class' category: #'Numeros-Naturales'!
CCCXXXII class
	instanceVariableNames: ''!

!CCCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXIII.
	previous := CCCXXXI.! !


!classDefinition: #CCCXXXIII category: #'Numeros-Naturales'!
II subclass: #CCCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXIII class' category: #'Numeros-Naturales'!
CCCXXXIII class
	instanceVariableNames: ''!

!CCCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXIV.
	previous := CCCXXXII.! !


!classDefinition: #CCCXXXIV category: #'Numeros-Naturales'!
II subclass: #CCCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXIV class' category: #'Numeros-Naturales'!
CCCXXXIV class
	instanceVariableNames: ''!

!CCCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXV.
	previous := CCCXXXIII.! !


!classDefinition: #CCCXXXIX category: #'Numeros-Naturales'!
II subclass: #CCCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXIX class' category: #'Numeros-Naturales'!
CCCXXXIX class
	instanceVariableNames: ''!

!CCCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXL.
	previous := CCCXXXVIII.! !


!classDefinition: #CCCXXXV category: #'Numeros-Naturales'!
II subclass: #CCCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXV class' category: #'Numeros-Naturales'!
CCCXXXV class
	instanceVariableNames: ''!

!CCCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXVI.
	previous := CCCXXXIV.! !


!classDefinition: #CCCXXXVI category: #'Numeros-Naturales'!
II subclass: #CCCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXVI class' category: #'Numeros-Naturales'!
CCCXXXVI class
	instanceVariableNames: ''!

!CCCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXVII.
	previous := CCCXXXV.! !


!classDefinition: #CCCXXXVII category: #'Numeros-Naturales'!
II subclass: #CCCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXVII class' category: #'Numeros-Naturales'!
CCCXXXVII class
	instanceVariableNames: ''!

!CCCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXVIII.
	previous := CCCXXXVI.! !


!classDefinition: #CCCXXXVIII category: #'Numeros-Naturales'!
II subclass: #CCCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXVIII class' category: #'Numeros-Naturales'!
CCCXXXVIII class
	instanceVariableNames: ''!

!CCCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXIX.
	previous := CCCXXXVII.! !


!classDefinition: #CCI category: #'Numeros-Naturales'!
II subclass: #CCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCI class' category: #'Numeros-Naturales'!
CCI class
	instanceVariableNames: ''!

!CCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCII.
	previous := CC.! !


!classDefinition: #CCII category: #'Numeros-Naturales'!
II subclass: #CCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCII class' category: #'Numeros-Naturales'!
CCII class
	instanceVariableNames: ''!

!CCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCIII.
	previous := CCI.! !


!classDefinition: #CCIII category: #'Numeros-Naturales'!
II subclass: #CCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCIII class' category: #'Numeros-Naturales'!
CCIII class
	instanceVariableNames: ''!

!CCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCIV.
	previous := CCII.! !


!classDefinition: #CCIV category: #'Numeros-Naturales'!
II subclass: #CCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCIV class' category: #'Numeros-Naturales'!
CCIV class
	instanceVariableNames: ''!

!CCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCV.
	previous := CCIII.! !


!classDefinition: #CCIX category: #'Numeros-Naturales'!
II subclass: #CCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCIX class' category: #'Numeros-Naturales'!
CCIX class
	instanceVariableNames: ''!

!CCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCX.
	previous := CCVIII.! !


!classDefinition: #CCL category: #'Numeros-Naturales'!
II subclass: #CCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCL class' category: #'Numeros-Naturales'!
CCL class
	instanceVariableNames: ''!

!CCL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLI.
	previous := CCXLIX.! !


!classDefinition: #CCLI category: #'Numeros-Naturales'!
II subclass: #CCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLI class' category: #'Numeros-Naturales'!
CCLI class
	instanceVariableNames: ''!

!CCLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLII.
	previous := CCL.! !


!classDefinition: #CCLII category: #'Numeros-Naturales'!
II subclass: #CCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLII class' category: #'Numeros-Naturales'!
CCLII class
	instanceVariableNames: ''!

!CCLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLIII.
	previous := CCLI.! !


!classDefinition: #CCLIII category: #'Numeros-Naturales'!
II subclass: #CCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLIII class' category: #'Numeros-Naturales'!
CCLIII class
	instanceVariableNames: ''!

!CCLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLIV.
	previous := CCLII.! !


!classDefinition: #CCLIV category: #'Numeros-Naturales'!
II subclass: #CCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLIV class' category: #'Numeros-Naturales'!
CCLIV class
	instanceVariableNames: ''!

!CCLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLV.
	previous := CCLIII.! !


!classDefinition: #CCLIX category: #'Numeros-Naturales'!
II subclass: #CCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLIX class' category: #'Numeros-Naturales'!
CCLIX class
	instanceVariableNames: ''!

!CCLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLX.
	previous := CCLVIII.! !


!classDefinition: #CCLV category: #'Numeros-Naturales'!
II subclass: #CCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLV class' category: #'Numeros-Naturales'!
CCLV class
	instanceVariableNames: ''!

!CCLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLVI.
	previous := CCLIV.! !


!classDefinition: #CCLVI category: #'Numeros-Naturales'!
II subclass: #CCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLVI class' category: #'Numeros-Naturales'!
CCLVI class
	instanceVariableNames: ''!

!CCLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLVII.
	previous := CCLV.! !


!classDefinition: #CCLVII category: #'Numeros-Naturales'!
II subclass: #CCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLVII class' category: #'Numeros-Naturales'!
CCLVII class
	instanceVariableNames: ''!

!CCLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLVIII.
	previous := CCLVI.! !


!classDefinition: #CCLVIII category: #'Numeros-Naturales'!
II subclass: #CCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLVIII class' category: #'Numeros-Naturales'!
CCLVIII class
	instanceVariableNames: ''!

!CCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLIX.
	previous := CCLVII.! !


!classDefinition: #CCLX category: #'Numeros-Naturales'!
II subclass: #CCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLX class' category: #'Numeros-Naturales'!
CCLX class
	instanceVariableNames: ''!

!CCLX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXI.
	previous := CCLIX.! !


!classDefinition: #CCLXI category: #'Numeros-Naturales'!
II subclass: #CCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXI class' category: #'Numeros-Naturales'!
CCLXI class
	instanceVariableNames: ''!

!CCLXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXII.
	previous := CCLX.! !


!classDefinition: #CCLXII category: #'Numeros-Naturales'!
II subclass: #CCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXII class' category: #'Numeros-Naturales'!
CCLXII class
	instanceVariableNames: ''!

!CCLXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXIII.
	previous := CCLXI.! !


!classDefinition: #CCLXIII category: #'Numeros-Naturales'!
II subclass: #CCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXIII class' category: #'Numeros-Naturales'!
CCLXIII class
	instanceVariableNames: ''!

!CCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXIV.
	previous := CCLXII.! !


!classDefinition: #CCLXIV category: #'Numeros-Naturales'!
II subclass: #CCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXIV class' category: #'Numeros-Naturales'!
CCLXIV class
	instanceVariableNames: ''!

!CCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXV.
	previous := CCLXIII.! !


!classDefinition: #CCLXIX category: #'Numeros-Naturales'!
II subclass: #CCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXIX class' category: #'Numeros-Naturales'!
CCLXIX class
	instanceVariableNames: ''!

!CCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXX.
	previous := CCLXVIII.! !


!classDefinition: #CCLXV category: #'Numeros-Naturales'!
II subclass: #CCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXV class' category: #'Numeros-Naturales'!
CCLXV class
	instanceVariableNames: ''!

!CCLXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXVI.
	previous := CCLXIV.! !


!classDefinition: #CCLXVI category: #'Numeros-Naturales'!
II subclass: #CCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXVI class' category: #'Numeros-Naturales'!
CCLXVI class
	instanceVariableNames: ''!

!CCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXVII.
	previous := CCLXV.! !


!classDefinition: #CCLXVII category: #'Numeros-Naturales'!
II subclass: #CCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXVII class' category: #'Numeros-Naturales'!
CCLXVII class
	instanceVariableNames: ''!

!CCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXVIII.
	previous := CCLXVI.! !


!classDefinition: #CCLXVIII category: #'Numeros-Naturales'!
II subclass: #CCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXVIII class' category: #'Numeros-Naturales'!
CCLXVIII class
	instanceVariableNames: ''!

!CCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXIX.
	previous := CCLXVII.! !


!classDefinition: #CCLXX category: #'Numeros-Naturales'!
II subclass: #CCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXX class' category: #'Numeros-Naturales'!
CCLXX class
	instanceVariableNames: ''!

!CCLXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXI.
	previous := CCLXIX.! !


!classDefinition: #CCLXXI category: #'Numeros-Naturales'!
II subclass: #CCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXI class' category: #'Numeros-Naturales'!
CCLXXI class
	instanceVariableNames: ''!

!CCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXII.
	previous := CCLXX.! !


!classDefinition: #CCLXXII category: #'Numeros-Naturales'!
II subclass: #CCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXII class' category: #'Numeros-Naturales'!
CCLXXII class
	instanceVariableNames: ''!

!CCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXIII.
	previous := CCLXXI.! !


!classDefinition: #CCLXXIII category: #'Numeros-Naturales'!
II subclass: #CCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXIII class' category: #'Numeros-Naturales'!
CCLXXIII class
	instanceVariableNames: ''!

!CCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXIV.
	previous := CCLXXII.! !


!classDefinition: #CCLXXIV category: #'Numeros-Naturales'!
II subclass: #CCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXIV class' category: #'Numeros-Naturales'!
CCLXXIV class
	instanceVariableNames: ''!

!CCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXV.
	previous := CCLXXIII.! !


!classDefinition: #CCLXXIX category: #'Numeros-Naturales'!
II subclass: #CCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXIX class' category: #'Numeros-Naturales'!
CCLXXIX class
	instanceVariableNames: ''!

!CCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXX.
	previous := CCLXXVIII.! !


!classDefinition: #CCLXXV category: #'Numeros-Naturales'!
II subclass: #CCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXV class' category: #'Numeros-Naturales'!
CCLXXV class
	instanceVariableNames: ''!

!CCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXVI.
	previous := CCLXXIV.! !


!classDefinition: #CCLXXVI category: #'Numeros-Naturales'!
II subclass: #CCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXVI class' category: #'Numeros-Naturales'!
CCLXXVI class
	instanceVariableNames: ''!

!CCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXVII.
	previous := CCLXXV.! !


!classDefinition: #CCLXXVII category: #'Numeros-Naturales'!
II subclass: #CCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXVII class' category: #'Numeros-Naturales'!
CCLXXVII class
	instanceVariableNames: ''!

!CCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXVIII.
	previous := CCLXXVI.! !


!classDefinition: #CCLXXVIII category: #'Numeros-Naturales'!
II subclass: #CCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXVIII class' category: #'Numeros-Naturales'!
CCLXXVIII class
	instanceVariableNames: ''!

!CCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXIX.
	previous := CCLXXVII.! !


!classDefinition: #CCLXXX category: #'Numeros-Naturales'!
II subclass: #CCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXX class' category: #'Numeros-Naturales'!
CCLXXX class
	instanceVariableNames: ''!

!CCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXI.
	previous := CCLXXIX.! !


!classDefinition: #CCLXXXI category: #'Numeros-Naturales'!
II subclass: #CCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXI class' category: #'Numeros-Naturales'!
CCLXXXI class
	instanceVariableNames: ''!

!CCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXII.
	previous := CCLXXX.! !


!classDefinition: #CCLXXXII category: #'Numeros-Naturales'!
II subclass: #CCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXII class' category: #'Numeros-Naturales'!
CCLXXXII class
	instanceVariableNames: ''!

!CCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXIII.
	previous := CCLXXXI.! !


!classDefinition: #CCLXXXIII category: #'Numeros-Naturales'!
II subclass: #CCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXIII class' category: #'Numeros-Naturales'!
CCLXXXIII class
	instanceVariableNames: ''!

!CCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXIV.
	previous := CCLXXXII.! !


!classDefinition: #CCLXXXIV category: #'Numeros-Naturales'!
II subclass: #CCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXIV class' category: #'Numeros-Naturales'!
CCLXXXIV class
	instanceVariableNames: ''!

!CCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXV.
	previous := CCLXXXIII.! !


!classDefinition: #CCLXXXIX category: #'Numeros-Naturales'!
II subclass: #CCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXIX class' category: #'Numeros-Naturales'!
CCLXXXIX class
	instanceVariableNames: ''!

!CCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXC.
	previous := CCLXXXVIII.! !


!classDefinition: #CCLXXXV category: #'Numeros-Naturales'!
II subclass: #CCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXV class' category: #'Numeros-Naturales'!
CCLXXXV class
	instanceVariableNames: ''!

!CCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXVI.
	previous := CCLXXXIV.! !


!classDefinition: #CCLXXXVI category: #'Numeros-Naturales'!
II subclass: #CCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXVI class' category: #'Numeros-Naturales'!
CCLXXXVI class
	instanceVariableNames: ''!

!CCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXVII.
	previous := CCLXXXV.! !


!classDefinition: #CCLXXXVII category: #'Numeros-Naturales'!
II subclass: #CCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXVII class' category: #'Numeros-Naturales'!
CCLXXXVII class
	instanceVariableNames: ''!

!CCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXVIII.
	previous := CCLXXXVI.! !


!classDefinition: #CCLXXXVIII category: #'Numeros-Naturales'!
II subclass: #CCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXVIII class' category: #'Numeros-Naturales'!
CCLXXXVIII class
	instanceVariableNames: ''!

!CCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXIX.
	previous := CCLXXXVII.! !


!classDefinition: #CCV category: #'Numeros-Naturales'!
II subclass: #CCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCV class' category: #'Numeros-Naturales'!
CCV class
	instanceVariableNames: ''!

!CCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCVI.
	previous := CCIV.! !


!classDefinition: #CCVI category: #'Numeros-Naturales'!
II subclass: #CCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCVI class' category: #'Numeros-Naturales'!
CCVI class
	instanceVariableNames: ''!

!CCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCVII.
	previous := CCV.! !


!classDefinition: #CCVII category: #'Numeros-Naturales'!
II subclass: #CCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCVII class' category: #'Numeros-Naturales'!
CCVII class
	instanceVariableNames: ''!

!CCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCVIII.
	previous := CCVI.! !


!classDefinition: #CCVIII category: #'Numeros-Naturales'!
II subclass: #CCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCVIII class' category: #'Numeros-Naturales'!
CCVIII class
	instanceVariableNames: ''!

!CCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCIX.
	previous := CCVII.! !


!classDefinition: #CCX category: #'Numeros-Naturales'!
II subclass: #CCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCX class' category: #'Numeros-Naturales'!
CCX class
	instanceVariableNames: ''!

!CCX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXI.
	previous := CCIX.! !


!classDefinition: #CCXC category: #'Numeros-Naturales'!
II subclass: #CCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXC class' category: #'Numeros-Naturales'!
CCXC class
	instanceVariableNames: ''!

!CCXC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCI.
	previous := CCLXXXIX.! !


!classDefinition: #CCXCI category: #'Numeros-Naturales'!
II subclass: #CCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCI class' category: #'Numeros-Naturales'!
CCXCI class
	instanceVariableNames: ''!

!CCXCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCII.
	previous := CCXC.! !


!classDefinition: #CCXCII category: #'Numeros-Naturales'!
II subclass: #CCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCII class' category: #'Numeros-Naturales'!
CCXCII class
	instanceVariableNames: ''!

!CCXCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCIII.
	previous := CCXCI.! !


!classDefinition: #CCXCIII category: #'Numeros-Naturales'!
II subclass: #CCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCIII class' category: #'Numeros-Naturales'!
CCXCIII class
	instanceVariableNames: ''!

!CCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCIV.
	previous := CCXCII.! !


!classDefinition: #CCXCIV category: #'Numeros-Naturales'!
II subclass: #CCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCIV class' category: #'Numeros-Naturales'!
CCXCIV class
	instanceVariableNames: ''!

!CCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCV.
	previous := CCXCIII.! !


!classDefinition: #CCXCIX category: #'Numeros-Naturales'!
II subclass: #CCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCIX class' category: #'Numeros-Naturales'!
CCXCIX class
	instanceVariableNames: ''!

!CCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCC.
	previous := CCXCVIII.! !


!classDefinition: #CCXCV category: #'Numeros-Naturales'!
II subclass: #CCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCV class' category: #'Numeros-Naturales'!
CCXCV class
	instanceVariableNames: ''!

!CCXCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCVI.
	previous := CCXCIV.! !


!classDefinition: #CCXCVI category: #'Numeros-Naturales'!
II subclass: #CCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCVI class' category: #'Numeros-Naturales'!
CCXCVI class
	instanceVariableNames: ''!

!CCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCVII.
	previous := CCXCV.! !


!classDefinition: #CCXCVII category: #'Numeros-Naturales'!
II subclass: #CCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCVII class' category: #'Numeros-Naturales'!
CCXCVII class
	instanceVariableNames: ''!

!CCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCVIII.
	previous := CCXCVI.! !


!classDefinition: #CCXCVIII category: #'Numeros-Naturales'!
II subclass: #CCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCVIII class' category: #'Numeros-Naturales'!
CCXCVIII class
	instanceVariableNames: ''!

!CCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCIX.
	previous := CCXCVII.! !


!classDefinition: #CCXI category: #'Numeros-Naturales'!
II subclass: #CCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXI class' category: #'Numeros-Naturales'!
CCXI class
	instanceVariableNames: ''!

!CCXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXII.
	previous := CCX.! !


!classDefinition: #CCXII category: #'Numeros-Naturales'!
II subclass: #CCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXII class' category: #'Numeros-Naturales'!
CCXII class
	instanceVariableNames: ''!

!CCXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXIII.
	previous := CCXI.! !


!classDefinition: #CCXIII category: #'Numeros-Naturales'!
II subclass: #CCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXIII class' category: #'Numeros-Naturales'!
CCXIII class
	instanceVariableNames: ''!

!CCXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXIV.
	previous := CCXII.! !


!classDefinition: #CCXIV category: #'Numeros-Naturales'!
II subclass: #CCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXIV class' category: #'Numeros-Naturales'!
CCXIV class
	instanceVariableNames: ''!

!CCXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXV.
	previous := CCXIII.! !


!classDefinition: #CCXIX category: #'Numeros-Naturales'!
II subclass: #CCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXIX class' category: #'Numeros-Naturales'!
CCXIX class
	instanceVariableNames: ''!

!CCXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXX.
	previous := CCXVIII.! !


!classDefinition: #CCXL category: #'Numeros-Naturales'!
II subclass: #CCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXL class' category: #'Numeros-Naturales'!
CCXL class
	instanceVariableNames: ''!

!CCXL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLI.
	previous := CCXXXIX.! !


!classDefinition: #CCXLI category: #'Numeros-Naturales'!
II subclass: #CCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLI class' category: #'Numeros-Naturales'!
CCXLI class
	instanceVariableNames: ''!

!CCXLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLII.
	previous := CCXL.! !


!classDefinition: #CCXLII category: #'Numeros-Naturales'!
II subclass: #CCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLII class' category: #'Numeros-Naturales'!
CCXLII class
	instanceVariableNames: ''!

!CCXLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLIII.
	previous := CCXLI.! !


!classDefinition: #CCXLIII category: #'Numeros-Naturales'!
II subclass: #CCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLIII class' category: #'Numeros-Naturales'!
CCXLIII class
	instanceVariableNames: ''!

!CCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLIV.
	previous := CCXLII.! !


!classDefinition: #CCXLIV category: #'Numeros-Naturales'!
II subclass: #CCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLIV class' category: #'Numeros-Naturales'!
CCXLIV class
	instanceVariableNames: ''!

!CCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLV.
	previous := CCXLIII.! !


!classDefinition: #CCXLIX category: #'Numeros-Naturales'!
II subclass: #CCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLIX class' category: #'Numeros-Naturales'!
CCXLIX class
	instanceVariableNames: ''!

!CCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCL.
	previous := CCXLVIII.! !


!classDefinition: #CCXLV category: #'Numeros-Naturales'!
II subclass: #CCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLV class' category: #'Numeros-Naturales'!
CCXLV class
	instanceVariableNames: ''!

!CCXLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLVI.
	previous := CCXLIV.! !


!classDefinition: #CCXLVI category: #'Numeros-Naturales'!
II subclass: #CCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLVI class' category: #'Numeros-Naturales'!
CCXLVI class
	instanceVariableNames: ''!

!CCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLVII.
	previous := CCXLV.! !


!classDefinition: #CCXLVII category: #'Numeros-Naturales'!
II subclass: #CCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLVII class' category: #'Numeros-Naturales'!
CCXLVII class
	instanceVariableNames: ''!

!CCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLVIII.
	previous := CCXLVI.! !


!classDefinition: #CCXLVIII category: #'Numeros-Naturales'!
II subclass: #CCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLVIII class' category: #'Numeros-Naturales'!
CCXLVIII class
	instanceVariableNames: ''!

!CCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLIX.
	previous := CCXLVII.! !


!classDefinition: #CCXV category: #'Numeros-Naturales'!
II subclass: #CCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXV class' category: #'Numeros-Naturales'!
CCXV class
	instanceVariableNames: ''!

!CCXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXVI.
	previous := CCXIV.! !


!classDefinition: #CCXVI category: #'Numeros-Naturales'!
II subclass: #CCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXVI class' category: #'Numeros-Naturales'!
CCXVI class
	instanceVariableNames: ''!

!CCXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXVII.
	previous := CCXV.! !


!classDefinition: #CCXVII category: #'Numeros-Naturales'!
II subclass: #CCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXVII class' category: #'Numeros-Naturales'!
CCXVII class
	instanceVariableNames: ''!

!CCXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXVIII.
	previous := CCXVI.! !


!classDefinition: #CCXVIII category: #'Numeros-Naturales'!
II subclass: #CCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXVIII class' category: #'Numeros-Naturales'!
CCXVIII class
	instanceVariableNames: ''!

!CCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXIX.
	previous := CCXVII.! !


!classDefinition: #CCXX category: #'Numeros-Naturales'!
II subclass: #CCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXX class' category: #'Numeros-Naturales'!
CCXX class
	instanceVariableNames: ''!

!CCXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXI.
	previous := CCXIX.! !


!classDefinition: #CCXXI category: #'Numeros-Naturales'!
II subclass: #CCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXI class' category: #'Numeros-Naturales'!
CCXXI class
	instanceVariableNames: ''!

!CCXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXII.
	previous := CCXX.! !


!classDefinition: #CCXXII category: #'Numeros-Naturales'!
II subclass: #CCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXII class' category: #'Numeros-Naturales'!
CCXXII class
	instanceVariableNames: ''!

!CCXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXIII.
	previous := CCXXI.! !


!classDefinition: #CCXXIII category: #'Numeros-Naturales'!
II subclass: #CCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXIII class' category: #'Numeros-Naturales'!
CCXXIII class
	instanceVariableNames: ''!

!CCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXIV.
	previous := CCXXII.! !


!classDefinition: #CCXXIV category: #'Numeros-Naturales'!
II subclass: #CCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXIV class' category: #'Numeros-Naturales'!
CCXXIV class
	instanceVariableNames: ''!

!CCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXV.
	previous := CCXXIII.! !


!classDefinition: #CCXXIX category: #'Numeros-Naturales'!
II subclass: #CCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXIX class' category: #'Numeros-Naturales'!
CCXXIX class
	instanceVariableNames: ''!

!CCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXX.
	previous := CCXXVIII.! !


!classDefinition: #CCXXV category: #'Numeros-Naturales'!
II subclass: #CCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXV class' category: #'Numeros-Naturales'!
CCXXV class
	instanceVariableNames: ''!

!CCXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXVI.
	previous := CCXXIV.! !


!classDefinition: #CCXXVI category: #'Numeros-Naturales'!
II subclass: #CCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXVI class' category: #'Numeros-Naturales'!
CCXXVI class
	instanceVariableNames: ''!

!CCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXVII.
	previous := CCXXV.! !


!classDefinition: #CCXXVII category: #'Numeros-Naturales'!
II subclass: #CCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXVII class' category: #'Numeros-Naturales'!
CCXXVII class
	instanceVariableNames: ''!

!CCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXVIII.
	previous := CCXXVI.! !


!classDefinition: #CCXXVIII category: #'Numeros-Naturales'!
II subclass: #CCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXVIII class' category: #'Numeros-Naturales'!
CCXXVIII class
	instanceVariableNames: ''!

!CCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXIX.
	previous := CCXXVII.! !


!classDefinition: #CCXXX category: #'Numeros-Naturales'!
II subclass: #CCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXX class' category: #'Numeros-Naturales'!
CCXXX class
	instanceVariableNames: ''!

!CCXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXI.
	previous := CCXXIX.! !


!classDefinition: #CCXXXI category: #'Numeros-Naturales'!
II subclass: #CCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXI class' category: #'Numeros-Naturales'!
CCXXXI class
	instanceVariableNames: ''!

!CCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXII.
	previous := CCXXX.! !


!classDefinition: #CCXXXII category: #'Numeros-Naturales'!
II subclass: #CCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXII class' category: #'Numeros-Naturales'!
CCXXXII class
	instanceVariableNames: ''!

!CCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXIII.
	previous := CCXXXI.! !


!classDefinition: #CCXXXIII category: #'Numeros-Naturales'!
II subclass: #CCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXIII class' category: #'Numeros-Naturales'!
CCXXXIII class
	instanceVariableNames: ''!

!CCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXIV.
	previous := CCXXXII.! !


!classDefinition: #CCXXXIV category: #'Numeros-Naturales'!
II subclass: #CCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXIV class' category: #'Numeros-Naturales'!
CCXXXIV class
	instanceVariableNames: ''!

!CCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXV.
	previous := CCXXXIII.! !


!classDefinition: #CCXXXIX category: #'Numeros-Naturales'!
II subclass: #CCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXIX class' category: #'Numeros-Naturales'!
CCXXXIX class
	instanceVariableNames: ''!

!CCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXL.
	previous := CCXXXVIII.! !


!classDefinition: #CCXXXV category: #'Numeros-Naturales'!
II subclass: #CCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXV class' category: #'Numeros-Naturales'!
CCXXXV class
	instanceVariableNames: ''!

!CCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXVI.
	previous := CCXXXIV.! !


!classDefinition: #CCXXXVI category: #'Numeros-Naturales'!
II subclass: #CCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXVI class' category: #'Numeros-Naturales'!
CCXXXVI class
	instanceVariableNames: ''!

!CCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXVII.
	previous := CCXXXV.! !


!classDefinition: #CCXXXVII category: #'Numeros-Naturales'!
II subclass: #CCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXVII class' category: #'Numeros-Naturales'!
CCXXXVII class
	instanceVariableNames: ''!

!CCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXVIII.
	previous := CCXXXVI.! !


!classDefinition: #CCXXXVIII category: #'Numeros-Naturales'!
II subclass: #CCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXVIII class' category: #'Numeros-Naturales'!
CCXXXVIII class
	instanceVariableNames: ''!

!CCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXIX.
	previous := CCXXXVII.! !


!classDefinition: #CD category: #'Numeros-Naturales'!
II subclass: #CD
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CD class' category: #'Numeros-Naturales'!
CD class
	instanceVariableNames: ''!

!CD class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDI.
	previous := CCCXCIX.! !


!classDefinition: #CDI category: #'Numeros-Naturales'!
II subclass: #CDI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDI class' category: #'Numeros-Naturales'!
CDI class
	instanceVariableNames: ''!

!CDI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDII.
	previous := CD.! !


!classDefinition: #CDII category: #'Numeros-Naturales'!
II subclass: #CDII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDII class' category: #'Numeros-Naturales'!
CDII class
	instanceVariableNames: ''!

!CDII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDIII.
	previous := CDI.! !


!classDefinition: #CDIII category: #'Numeros-Naturales'!
II subclass: #CDIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDIII class' category: #'Numeros-Naturales'!
CDIII class
	instanceVariableNames: ''!

!CDIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDIV.
	previous := CDII.! !


!classDefinition: #CDIV category: #'Numeros-Naturales'!
II subclass: #CDIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDIV class' category: #'Numeros-Naturales'!
CDIV class
	instanceVariableNames: ''!

!CDIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDV.
	previous := CDIII.! !


!classDefinition: #CDIX category: #'Numeros-Naturales'!
II subclass: #CDIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDIX class' category: #'Numeros-Naturales'!
CDIX class
	instanceVariableNames: ''!

!CDIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDX.
	previous := CDVIII.! !


!classDefinition: #CDL category: #'Numeros-Naturales'!
II subclass: #CDL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDL class' category: #'Numeros-Naturales'!
CDL class
	instanceVariableNames: ''!

!CDL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLI.
	previous := CDXLIX.! !


!classDefinition: #CDLI category: #'Numeros-Naturales'!
II subclass: #CDLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLI class' category: #'Numeros-Naturales'!
CDLI class
	instanceVariableNames: ''!

!CDLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLII.
	previous := CDL.! !


!classDefinition: #CDLII category: #'Numeros-Naturales'!
II subclass: #CDLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLII class' category: #'Numeros-Naturales'!
CDLII class
	instanceVariableNames: ''!

!CDLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLIII.
	previous := CDLI.! !


!classDefinition: #CDLIII category: #'Numeros-Naturales'!
II subclass: #CDLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLIII class' category: #'Numeros-Naturales'!
CDLIII class
	instanceVariableNames: ''!

!CDLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLIV.
	previous := CDLII.! !


!classDefinition: #CDLIV category: #'Numeros-Naturales'!
II subclass: #CDLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLIV class' category: #'Numeros-Naturales'!
CDLIV class
	instanceVariableNames: ''!

!CDLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLV.
	previous := CDLIII.! !


!classDefinition: #CDLIX category: #'Numeros-Naturales'!
II subclass: #CDLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLIX class' category: #'Numeros-Naturales'!
CDLIX class
	instanceVariableNames: ''!

!CDLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLX.
	previous := CDLVIII.! !


!classDefinition: #CDLV category: #'Numeros-Naturales'!
II subclass: #CDLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLV class' category: #'Numeros-Naturales'!
CDLV class
	instanceVariableNames: ''!

!CDLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLVI.
	previous := CDLIV.! !


!classDefinition: #CDLVI category: #'Numeros-Naturales'!
II subclass: #CDLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLVI class' category: #'Numeros-Naturales'!
CDLVI class
	instanceVariableNames: ''!

!CDLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLVII.
	previous := CDLV.! !


!classDefinition: #CDLVII category: #'Numeros-Naturales'!
II subclass: #CDLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLVII class' category: #'Numeros-Naturales'!
CDLVII class
	instanceVariableNames: ''!

!CDLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLVIII.
	previous := CDLVI.! !


!classDefinition: #CDLVIII category: #'Numeros-Naturales'!
II subclass: #CDLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLVIII class' category: #'Numeros-Naturales'!
CDLVIII class
	instanceVariableNames: ''!

!CDLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLIX.
	previous := CDLVII.! !


!classDefinition: #CDLX category: #'Numeros-Naturales'!
II subclass: #CDLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLX class' category: #'Numeros-Naturales'!
CDLX class
	instanceVariableNames: ''!

!CDLX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXI.
	previous := CDLIX.! !


!classDefinition: #CDLXI category: #'Numeros-Naturales'!
II subclass: #CDLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXI class' category: #'Numeros-Naturales'!
CDLXI class
	instanceVariableNames: ''!

!CDLXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXII.
	previous := CDLX.! !


!classDefinition: #CDLXII category: #'Numeros-Naturales'!
II subclass: #CDLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXII class' category: #'Numeros-Naturales'!
CDLXII class
	instanceVariableNames: ''!

!CDLXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXIII.
	previous := CDLXI.! !


!classDefinition: #CDLXIII category: #'Numeros-Naturales'!
II subclass: #CDLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXIII class' category: #'Numeros-Naturales'!
CDLXIII class
	instanceVariableNames: ''!

!CDLXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXIV.
	previous := CDLXII.! !


!classDefinition: #CDLXIV category: #'Numeros-Naturales'!
II subclass: #CDLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXIV class' category: #'Numeros-Naturales'!
CDLXIV class
	instanceVariableNames: ''!

!CDLXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXV.
	previous := CDLXIII.! !


!classDefinition: #CDLXIX category: #'Numeros-Naturales'!
II subclass: #CDLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXIX class' category: #'Numeros-Naturales'!
CDLXIX class
	instanceVariableNames: ''!

!CDLXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXX.
	previous := CDLXVIII.! !


!classDefinition: #CDLXV category: #'Numeros-Naturales'!
II subclass: #CDLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXV class' category: #'Numeros-Naturales'!
CDLXV class
	instanceVariableNames: ''!

!CDLXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXVI.
	previous := CDLXIV.! !


!classDefinition: #CDLXVI category: #'Numeros-Naturales'!
II subclass: #CDLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXVI class' category: #'Numeros-Naturales'!
CDLXVI class
	instanceVariableNames: ''!

!CDLXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXVII.
	previous := CDLXV.! !


!classDefinition: #CDLXVII category: #'Numeros-Naturales'!
II subclass: #CDLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXVII class' category: #'Numeros-Naturales'!
CDLXVII class
	instanceVariableNames: ''!

!CDLXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXVIII.
	previous := CDLXVI.! !


!classDefinition: #CDLXVIII category: #'Numeros-Naturales'!
II subclass: #CDLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXVIII class' category: #'Numeros-Naturales'!
CDLXVIII class
	instanceVariableNames: ''!

!CDLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXIX.
	previous := CDLXVII.! !


!classDefinition: #CDLXX category: #'Numeros-Naturales'!
II subclass: #CDLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXX class' category: #'Numeros-Naturales'!
CDLXX class
	instanceVariableNames: ''!

!CDLXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXI.
	previous := CDLXIX.! !


!classDefinition: #CDLXXI category: #'Numeros-Naturales'!
II subclass: #CDLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXI class' category: #'Numeros-Naturales'!
CDLXXI class
	instanceVariableNames: ''!

!CDLXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXII.
	previous := CDLXX.! !


!classDefinition: #CDLXXII category: #'Numeros-Naturales'!
II subclass: #CDLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXII class' category: #'Numeros-Naturales'!
CDLXXII class
	instanceVariableNames: ''!

!CDLXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXIII.
	previous := CDLXXI.! !


!classDefinition: #CDLXXIII category: #'Numeros-Naturales'!
II subclass: #CDLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXIII class' category: #'Numeros-Naturales'!
CDLXXIII class
	instanceVariableNames: ''!

!CDLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXIV.
	previous := CDLXXII.! !


!classDefinition: #CDLXXIV category: #'Numeros-Naturales'!
II subclass: #CDLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXIV class' category: #'Numeros-Naturales'!
CDLXXIV class
	instanceVariableNames: ''!

!CDLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXV.
	previous := CDLXXIII.! !


!classDefinition: #CDLXXIX category: #'Numeros-Naturales'!
II subclass: #CDLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXIX class' category: #'Numeros-Naturales'!
CDLXXIX class
	instanceVariableNames: ''!

!CDLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXX.
	previous := CDLXXVIII.! !


!classDefinition: #CDLXXV category: #'Numeros-Naturales'!
II subclass: #CDLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXV class' category: #'Numeros-Naturales'!
CDLXXV class
	instanceVariableNames: ''!

!CDLXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXVI.
	previous := CDLXXIV.! !


!classDefinition: #CDLXXVI category: #'Numeros-Naturales'!
II subclass: #CDLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXVI class' category: #'Numeros-Naturales'!
CDLXXVI class
	instanceVariableNames: ''!

!CDLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXVII.
	previous := CDLXXV.! !


!classDefinition: #CDLXXVII category: #'Numeros-Naturales'!
II subclass: #CDLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXVII class' category: #'Numeros-Naturales'!
CDLXXVII class
	instanceVariableNames: ''!

!CDLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXVIII.
	previous := CDLXXVI.! !


!classDefinition: #CDLXXVIII category: #'Numeros-Naturales'!
II subclass: #CDLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXVIII class' category: #'Numeros-Naturales'!
CDLXXVIII class
	instanceVariableNames: ''!

!CDLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXIX.
	previous := CDLXXVII.! !


!classDefinition: #CDLXXX category: #'Numeros-Naturales'!
II subclass: #CDLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXX class' category: #'Numeros-Naturales'!
CDLXXX class
	instanceVariableNames: ''!

!CDLXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXI.
	previous := CDLXXIX.! !


!classDefinition: #CDLXXXI category: #'Numeros-Naturales'!
II subclass: #CDLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXI class' category: #'Numeros-Naturales'!
CDLXXXI class
	instanceVariableNames: ''!

!CDLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXII.
	previous := CDLXXX.! !


!classDefinition: #CDLXXXII category: #'Numeros-Naturales'!
II subclass: #CDLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXII class' category: #'Numeros-Naturales'!
CDLXXXII class
	instanceVariableNames: ''!

!CDLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXIII.
	previous := CDLXXXI.! !


!classDefinition: #CDLXXXIII category: #'Numeros-Naturales'!
II subclass: #CDLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXIII class' category: #'Numeros-Naturales'!
CDLXXXIII class
	instanceVariableNames: ''!

!CDLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXIV.
	previous := CDLXXXII.! !


!classDefinition: #CDLXXXIV category: #'Numeros-Naturales'!
II subclass: #CDLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXIV class' category: #'Numeros-Naturales'!
CDLXXXIV class
	instanceVariableNames: ''!

!CDLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXV.
	previous := CDLXXXIII.! !


!classDefinition: #CDLXXXIX category: #'Numeros-Naturales'!
II subclass: #CDLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXIX class' category: #'Numeros-Naturales'!
CDLXXXIX class
	instanceVariableNames: ''!

!CDLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXC.
	previous := CDLXXXVIII.! !


!classDefinition: #CDLXXXV category: #'Numeros-Naturales'!
II subclass: #CDLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXV class' category: #'Numeros-Naturales'!
CDLXXXV class
	instanceVariableNames: ''!

!CDLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXVI.
	previous := CDLXXXIV.! !


!classDefinition: #CDLXXXVI category: #'Numeros-Naturales'!
II subclass: #CDLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXVI class' category: #'Numeros-Naturales'!
CDLXXXVI class
	instanceVariableNames: ''!

!CDLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXVII.
	previous := CDLXXXV.! !


!classDefinition: #CDLXXXVII category: #'Numeros-Naturales'!
II subclass: #CDLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXVII class' category: #'Numeros-Naturales'!
CDLXXXVII class
	instanceVariableNames: ''!

!CDLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXVIII.
	previous := CDLXXXVI.! !


!classDefinition: #CDLXXXVIII category: #'Numeros-Naturales'!
II subclass: #CDLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXVIII class' category: #'Numeros-Naturales'!
CDLXXXVIII class
	instanceVariableNames: ''!

!CDLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXIX.
	previous := CDLXXXVII.! !


!classDefinition: #CDV category: #'Numeros-Naturales'!
II subclass: #CDV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDV class' category: #'Numeros-Naturales'!
CDV class
	instanceVariableNames: ''!

!CDV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDVI.
	previous := CDIV.! !


!classDefinition: #CDVI category: #'Numeros-Naturales'!
II subclass: #CDVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDVI class' category: #'Numeros-Naturales'!
CDVI class
	instanceVariableNames: ''!

!CDVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDVII.
	previous := CDV.! !


!classDefinition: #CDVII category: #'Numeros-Naturales'!
II subclass: #CDVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDVII class' category: #'Numeros-Naturales'!
CDVII class
	instanceVariableNames: ''!

!CDVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDVIII.
	previous := CDVI.! !


!classDefinition: #CDVIII category: #'Numeros-Naturales'!
II subclass: #CDVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDVIII class' category: #'Numeros-Naturales'!
CDVIII class
	instanceVariableNames: ''!

!CDVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDIX.
	previous := CDVII.! !


!classDefinition: #CDX category: #'Numeros-Naturales'!
II subclass: #CDX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDX class' category: #'Numeros-Naturales'!
CDX class
	instanceVariableNames: ''!

!CDX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXI.
	previous := CDIX.! !


!classDefinition: #CDXC category: #'Numeros-Naturales'!
II subclass: #CDXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXC class' category: #'Numeros-Naturales'!
CDXC class
	instanceVariableNames: ''!

!CDXC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCI.
	previous := CDLXXXIX.! !


!classDefinition: #CDXCI category: #'Numeros-Naturales'!
II subclass: #CDXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCI class' category: #'Numeros-Naturales'!
CDXCI class
	instanceVariableNames: ''!

!CDXCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCII.
	previous := CDXC.! !


!classDefinition: #CDXCII category: #'Numeros-Naturales'!
II subclass: #CDXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCII class' category: #'Numeros-Naturales'!
CDXCII class
	instanceVariableNames: ''!

!CDXCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCIII.
	previous := CDXCI.! !


!classDefinition: #CDXCIII category: #'Numeros-Naturales'!
II subclass: #CDXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCIII class' category: #'Numeros-Naturales'!
CDXCIII class
	instanceVariableNames: ''!

!CDXCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCIV.
	previous := CDXCII.! !


!classDefinition: #CDXCIV category: #'Numeros-Naturales'!
II subclass: #CDXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCIV class' category: #'Numeros-Naturales'!
CDXCIV class
	instanceVariableNames: ''!

!CDXCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCV.
	previous := CDXCIII.! !


!classDefinition: #CDXCIX category: #'Numeros-Naturales'!
II subclass: #CDXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCIX class' category: #'Numeros-Naturales'!
CDXCIX class
	instanceVariableNames: ''!

!CDXCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := D.
	previous := CDXCVIII.! !


!classDefinition: #CDXCV category: #'Numeros-Naturales'!
II subclass: #CDXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCV class' category: #'Numeros-Naturales'!
CDXCV class
	instanceVariableNames: ''!

!CDXCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCVI.
	previous := CDXCIV.! !


!classDefinition: #CDXCVI category: #'Numeros-Naturales'!
II subclass: #CDXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCVI class' category: #'Numeros-Naturales'!
CDXCVI class
	instanceVariableNames: ''!

!CDXCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCVII.
	previous := CDXCV.! !


!classDefinition: #CDXCVII category: #'Numeros-Naturales'!
II subclass: #CDXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCVII class' category: #'Numeros-Naturales'!
CDXCVII class
	instanceVariableNames: ''!

!CDXCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCVIII.
	previous := CDXCVI.! !


!classDefinition: #CDXCVIII category: #'Numeros-Naturales'!
II subclass: #CDXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCVIII class' category: #'Numeros-Naturales'!
CDXCVIII class
	instanceVariableNames: ''!

!CDXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCIX.
	previous := CDXCVII.! !


!classDefinition: #CDXI category: #'Numeros-Naturales'!
II subclass: #CDXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXI class' category: #'Numeros-Naturales'!
CDXI class
	instanceVariableNames: ''!

!CDXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXII.
	previous := CDX.! !


!classDefinition: #CDXII category: #'Numeros-Naturales'!
II subclass: #CDXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXII class' category: #'Numeros-Naturales'!
CDXII class
	instanceVariableNames: ''!

!CDXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXIII.
	previous := CDXI.! !


!classDefinition: #CDXIII category: #'Numeros-Naturales'!
II subclass: #CDXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXIII class' category: #'Numeros-Naturales'!
CDXIII class
	instanceVariableNames: ''!

!CDXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXIV.
	previous := CDXII.! !


!classDefinition: #CDXIV category: #'Numeros-Naturales'!
II subclass: #CDXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXIV class' category: #'Numeros-Naturales'!
CDXIV class
	instanceVariableNames: ''!

!CDXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXV.
	previous := CDXIII.! !


!classDefinition: #CDXIX category: #'Numeros-Naturales'!
II subclass: #CDXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXIX class' category: #'Numeros-Naturales'!
CDXIX class
	instanceVariableNames: ''!

!CDXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXX.
	previous := CDXVIII.! !


!classDefinition: #CDXL category: #'Numeros-Naturales'!
II subclass: #CDXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXL class' category: #'Numeros-Naturales'!
CDXL class
	instanceVariableNames: ''!

!CDXL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLI.
	previous := CDXXXIX.! !


!classDefinition: #CDXLI category: #'Numeros-Naturales'!
II subclass: #CDXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLI class' category: #'Numeros-Naturales'!
CDXLI class
	instanceVariableNames: ''!

!CDXLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLII.
	previous := CDXL.! !


!classDefinition: #CDXLII category: #'Numeros-Naturales'!
II subclass: #CDXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLII class' category: #'Numeros-Naturales'!
CDXLII class
	instanceVariableNames: ''!

!CDXLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLIII.
	previous := CDXLI.! !


!classDefinition: #CDXLIII category: #'Numeros-Naturales'!
II subclass: #CDXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLIII class' category: #'Numeros-Naturales'!
CDXLIII class
	instanceVariableNames: ''!

!CDXLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLIV.
	previous := CDXLII.! !


!classDefinition: #CDXLIV category: #'Numeros-Naturales'!
II subclass: #CDXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLIV class' category: #'Numeros-Naturales'!
CDXLIV class
	instanceVariableNames: ''!

!CDXLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLV.
	previous := CDXLIII.! !


!classDefinition: #CDXLIX category: #'Numeros-Naturales'!
II subclass: #CDXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLIX class' category: #'Numeros-Naturales'!
CDXLIX class
	instanceVariableNames: ''!

!CDXLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDL.
	previous := CDXLVIII.! !


!classDefinition: #CDXLV category: #'Numeros-Naturales'!
II subclass: #CDXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLV class' category: #'Numeros-Naturales'!
CDXLV class
	instanceVariableNames: ''!

!CDXLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLVI.
	previous := CDXLIV.! !


!classDefinition: #CDXLVI category: #'Numeros-Naturales'!
II subclass: #CDXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLVI class' category: #'Numeros-Naturales'!
CDXLVI class
	instanceVariableNames: ''!

!CDXLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLVII.
	previous := CDXLV.! !


!classDefinition: #CDXLVII category: #'Numeros-Naturales'!
II subclass: #CDXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLVII class' category: #'Numeros-Naturales'!
CDXLVII class
	instanceVariableNames: ''!

!CDXLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLVIII.
	previous := CDXLVI.! !


!classDefinition: #CDXLVIII category: #'Numeros-Naturales'!
II subclass: #CDXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLVIII class' category: #'Numeros-Naturales'!
CDXLVIII class
	instanceVariableNames: ''!

!CDXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLIX.
	previous := CDXLVII.! !


!classDefinition: #CDXV category: #'Numeros-Naturales'!
II subclass: #CDXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXV class' category: #'Numeros-Naturales'!
CDXV class
	instanceVariableNames: ''!

!CDXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXVI.
	previous := CDXIV.! !


!classDefinition: #CDXVI category: #'Numeros-Naturales'!
II subclass: #CDXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXVI class' category: #'Numeros-Naturales'!
CDXVI class
	instanceVariableNames: ''!

!CDXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXVII.
	previous := CDXV.! !


!classDefinition: #CDXVII category: #'Numeros-Naturales'!
II subclass: #CDXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXVII class' category: #'Numeros-Naturales'!
CDXVII class
	instanceVariableNames: ''!

!CDXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXVIII.
	previous := CDXVI.! !


!classDefinition: #CDXVIII category: #'Numeros-Naturales'!
II subclass: #CDXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXVIII class' category: #'Numeros-Naturales'!
CDXVIII class
	instanceVariableNames: ''!

!CDXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXIX.
	previous := CDXVII.! !


!classDefinition: #CDXX category: #'Numeros-Naturales'!
II subclass: #CDXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXX class' category: #'Numeros-Naturales'!
CDXX class
	instanceVariableNames: ''!

!CDXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXI.
	previous := CDXIX.! !


!classDefinition: #CDXXI category: #'Numeros-Naturales'!
II subclass: #CDXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXI class' category: #'Numeros-Naturales'!
CDXXI class
	instanceVariableNames: ''!

!CDXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXII.
	previous := CDXX.! !


!classDefinition: #CDXXII category: #'Numeros-Naturales'!
II subclass: #CDXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXII class' category: #'Numeros-Naturales'!
CDXXII class
	instanceVariableNames: ''!

!CDXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXIII.
	previous := CDXXI.! !


!classDefinition: #CDXXIII category: #'Numeros-Naturales'!
II subclass: #CDXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXIII class' category: #'Numeros-Naturales'!
CDXXIII class
	instanceVariableNames: ''!

!CDXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXIV.
	previous := CDXXII.! !


!classDefinition: #CDXXIV category: #'Numeros-Naturales'!
II subclass: #CDXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXIV class' category: #'Numeros-Naturales'!
CDXXIV class
	instanceVariableNames: ''!

!CDXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXV.
	previous := CDXXIII.! !


!classDefinition: #CDXXIX category: #'Numeros-Naturales'!
II subclass: #CDXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXIX class' category: #'Numeros-Naturales'!
CDXXIX class
	instanceVariableNames: ''!

!CDXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXX.
	previous := CDXXVIII.! !


!classDefinition: #CDXXV category: #'Numeros-Naturales'!
II subclass: #CDXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXV class' category: #'Numeros-Naturales'!
CDXXV class
	instanceVariableNames: ''!

!CDXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXVI.
	previous := CDXXIV.! !


!classDefinition: #CDXXVI category: #'Numeros-Naturales'!
II subclass: #CDXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXVI class' category: #'Numeros-Naturales'!
CDXXVI class
	instanceVariableNames: ''!

!CDXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXVII.
	previous := CDXXV.! !


!classDefinition: #CDXXVII category: #'Numeros-Naturales'!
II subclass: #CDXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXVII class' category: #'Numeros-Naturales'!
CDXXVII class
	instanceVariableNames: ''!

!CDXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXVIII.
	previous := CDXXVI.! !


!classDefinition: #CDXXVIII category: #'Numeros-Naturales'!
II subclass: #CDXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXVIII class' category: #'Numeros-Naturales'!
CDXXVIII class
	instanceVariableNames: ''!

!CDXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXIX.
	previous := CDXXVII.! !


!classDefinition: #CDXXX category: #'Numeros-Naturales'!
II subclass: #CDXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXX class' category: #'Numeros-Naturales'!
CDXXX class
	instanceVariableNames: ''!

!CDXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXI.
	previous := CDXXIX.! !


!classDefinition: #CDXXXI category: #'Numeros-Naturales'!
II subclass: #CDXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXI class' category: #'Numeros-Naturales'!
CDXXXI class
	instanceVariableNames: ''!

!CDXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXII.
	previous := CDXXX.! !


!classDefinition: #CDXXXII category: #'Numeros-Naturales'!
II subclass: #CDXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXII class' category: #'Numeros-Naturales'!
CDXXXII class
	instanceVariableNames: ''!

!CDXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXIII.
	previous := CDXXXI.! !


!classDefinition: #CDXXXIII category: #'Numeros-Naturales'!
II subclass: #CDXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXIII class' category: #'Numeros-Naturales'!
CDXXXIII class
	instanceVariableNames: ''!

!CDXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXIV.
	previous := CDXXXII.! !


!classDefinition: #CDXXXIV category: #'Numeros-Naturales'!
II subclass: #CDXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXIV class' category: #'Numeros-Naturales'!
CDXXXIV class
	instanceVariableNames: ''!

!CDXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXV.
	previous := CDXXXIII.! !


!classDefinition: #CDXXXIX category: #'Numeros-Naturales'!
II subclass: #CDXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXIX class' category: #'Numeros-Naturales'!
CDXXXIX class
	instanceVariableNames: ''!

!CDXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXL.
	previous := CDXXXVIII.! !


!classDefinition: #CDXXXV category: #'Numeros-Naturales'!
II subclass: #CDXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXV class' category: #'Numeros-Naturales'!
CDXXXV class
	instanceVariableNames: ''!

!CDXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXVI.
	previous := CDXXXIV.! !


!classDefinition: #CDXXXVI category: #'Numeros-Naturales'!
II subclass: #CDXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXVI class' category: #'Numeros-Naturales'!
CDXXXVI class
	instanceVariableNames: ''!

!CDXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXVII.
	previous := CDXXXV.! !


!classDefinition: #CDXXXVII category: #'Numeros-Naturales'!
II subclass: #CDXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXVII class' category: #'Numeros-Naturales'!
CDXXXVII class
	instanceVariableNames: ''!

!CDXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXVIII.
	previous := CDXXXVI.! !


!classDefinition: #CDXXXVIII category: #'Numeros-Naturales'!
II subclass: #CDXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXVIII class' category: #'Numeros-Naturales'!
CDXXXVIII class
	instanceVariableNames: ''!

!CDXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXIX.
	previous := CDXXXVII.! !


!classDefinition: #CI category: #'Numeros-Naturales'!
II subclass: #CI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CI class' category: #'Numeros-Naturales'!
CI class
	instanceVariableNames: ''!

!CI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CII.
	previous := C.! !


!classDefinition: #CII category: #'Numeros-Naturales'!
II subclass: #CII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CII class' category: #'Numeros-Naturales'!
CII class
	instanceVariableNames: ''!

!CII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CIII.
	previous := CI.! !


!classDefinition: #CIII category: #'Numeros-Naturales'!
II subclass: #CIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CIII class' category: #'Numeros-Naturales'!
CIII class
	instanceVariableNames: ''!

!CIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CIV.
	previous := CII.! !


!classDefinition: #CIV category: #'Numeros-Naturales'!
II subclass: #CIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CIV class' category: #'Numeros-Naturales'!
CIV class
	instanceVariableNames: ''!

!CIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CV.
	previous := CIII.! !


!classDefinition: #CIX category: #'Numeros-Naturales'!
II subclass: #CIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CIX class' category: #'Numeros-Naturales'!
CIX class
	instanceVariableNames: ''!

!CIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CX.
	previous := CVIII.! !


!classDefinition: #CL category: #'Numeros-Naturales'!
II subclass: #CL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CL class' category: #'Numeros-Naturales'!
CL class
	instanceVariableNames: ''!

!CL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLI.
	previous := CXLIX.! !


!classDefinition: #CLI category: #'Numeros-Naturales'!
II subclass: #CLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLI class' category: #'Numeros-Naturales'!
CLI class
	instanceVariableNames: ''!

!CLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLII.
	previous := CL.! !


!classDefinition: #CLII category: #'Numeros-Naturales'!
II subclass: #CLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLII class' category: #'Numeros-Naturales'!
CLII class
	instanceVariableNames: ''!

!CLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLIII.
	previous := CLI.! !


!classDefinition: #CLIII category: #'Numeros-Naturales'!
II subclass: #CLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLIII class' category: #'Numeros-Naturales'!
CLIII class
	instanceVariableNames: ''!

!CLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLIV.
	previous := CLII.! !


!classDefinition: #CLIV category: #'Numeros-Naturales'!
II subclass: #CLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLIV class' category: #'Numeros-Naturales'!
CLIV class
	instanceVariableNames: ''!

!CLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLV.
	previous := CLIII.! !


!classDefinition: #CLIX category: #'Numeros-Naturales'!
II subclass: #CLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLIX class' category: #'Numeros-Naturales'!
CLIX class
	instanceVariableNames: ''!

!CLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLX.
	previous := CLVIII.! !


!classDefinition: #CLV category: #'Numeros-Naturales'!
II subclass: #CLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLV class' category: #'Numeros-Naturales'!
CLV class
	instanceVariableNames: ''!

!CLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLVI.
	previous := CLIV.! !


!classDefinition: #CLVI category: #'Numeros-Naturales'!
II subclass: #CLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLVI class' category: #'Numeros-Naturales'!
CLVI class
	instanceVariableNames: ''!

!CLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLVII.
	previous := CLV.! !


!classDefinition: #CLVII category: #'Numeros-Naturales'!
II subclass: #CLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLVII class' category: #'Numeros-Naturales'!
CLVII class
	instanceVariableNames: ''!

!CLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLVIII.
	previous := CLVI.! !


!classDefinition: #CLVIII category: #'Numeros-Naturales'!
II subclass: #CLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLVIII class' category: #'Numeros-Naturales'!
CLVIII class
	instanceVariableNames: ''!

!CLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLIX.
	previous := CLVII.! !


!classDefinition: #CLX category: #'Numeros-Naturales'!
II subclass: #CLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLX class' category: #'Numeros-Naturales'!
CLX class
	instanceVariableNames: ''!

!CLX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXI.
	previous := CLIX.! !


!classDefinition: #CLXI category: #'Numeros-Naturales'!
II subclass: #CLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXI class' category: #'Numeros-Naturales'!
CLXI class
	instanceVariableNames: ''!

!CLXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXII.
	previous := CLX.! !


!classDefinition: #CLXII category: #'Numeros-Naturales'!
II subclass: #CLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXII class' category: #'Numeros-Naturales'!
CLXII class
	instanceVariableNames: ''!

!CLXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXIII.
	previous := CLXI.! !


!classDefinition: #CLXIII category: #'Numeros-Naturales'!
II subclass: #CLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXIII class' category: #'Numeros-Naturales'!
CLXIII class
	instanceVariableNames: ''!

!CLXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXIV.
	previous := CLXII.! !


!classDefinition: #CLXIV category: #'Numeros-Naturales'!
II subclass: #CLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXIV class' category: #'Numeros-Naturales'!
CLXIV class
	instanceVariableNames: ''!

!CLXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXV.
	previous := CLXIII.! !


!classDefinition: #CLXIX category: #'Numeros-Naturales'!
II subclass: #CLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXIX class' category: #'Numeros-Naturales'!
CLXIX class
	instanceVariableNames: ''!

!CLXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXX.
	previous := CLXVIII.! !


!classDefinition: #CLXV category: #'Numeros-Naturales'!
II subclass: #CLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXV class' category: #'Numeros-Naturales'!
CLXV class
	instanceVariableNames: ''!

!CLXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXVI.
	previous := CLXIV.! !


!classDefinition: #CLXVI category: #'Numeros-Naturales'!
II subclass: #CLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXVI class' category: #'Numeros-Naturales'!
CLXVI class
	instanceVariableNames: ''!

!CLXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXVII.
	previous := CLXV.! !


!classDefinition: #CLXVII category: #'Numeros-Naturales'!
II subclass: #CLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXVII class' category: #'Numeros-Naturales'!
CLXVII class
	instanceVariableNames: ''!

!CLXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXVIII.
	previous := CLXVI.! !


!classDefinition: #CLXVIII category: #'Numeros-Naturales'!
II subclass: #CLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXVIII class' category: #'Numeros-Naturales'!
CLXVIII class
	instanceVariableNames: ''!

!CLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXIX.
	previous := CLXVII.! !


!classDefinition: #CLXX category: #'Numeros-Naturales'!
II subclass: #CLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXX class' category: #'Numeros-Naturales'!
CLXX class
	instanceVariableNames: ''!

!CLXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXI.
	previous := CLXIX.! !


!classDefinition: #CLXXI category: #'Numeros-Naturales'!
II subclass: #CLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXI class' category: #'Numeros-Naturales'!
CLXXI class
	instanceVariableNames: ''!

!CLXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXII.
	previous := CLXX.! !


!classDefinition: #CLXXII category: #'Numeros-Naturales'!
II subclass: #CLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXII class' category: #'Numeros-Naturales'!
CLXXII class
	instanceVariableNames: ''!

!CLXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXIII.
	previous := CLXXI.! !


!classDefinition: #CLXXIII category: #'Numeros-Naturales'!
II subclass: #CLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXIII class' category: #'Numeros-Naturales'!
CLXXIII class
	instanceVariableNames: ''!

!CLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXIV.
	previous := CLXXII.! !


!classDefinition: #CLXXIV category: #'Numeros-Naturales'!
II subclass: #CLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXIV class' category: #'Numeros-Naturales'!
CLXXIV class
	instanceVariableNames: ''!

!CLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXV.
	previous := CLXXIII.! !


!classDefinition: #CLXXIX category: #'Numeros-Naturales'!
II subclass: #CLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXIX class' category: #'Numeros-Naturales'!
CLXXIX class
	instanceVariableNames: ''!

!CLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXX.
	previous := CLXXVIII.! !


!classDefinition: #CLXXV category: #'Numeros-Naturales'!
II subclass: #CLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXV class' category: #'Numeros-Naturales'!
CLXXV class
	instanceVariableNames: ''!

!CLXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXVI.
	previous := CLXXIV.! !


!classDefinition: #CLXXVI category: #'Numeros-Naturales'!
II subclass: #CLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXVI class' category: #'Numeros-Naturales'!
CLXXVI class
	instanceVariableNames: ''!

!CLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXVII.
	previous := CLXXV.! !


!classDefinition: #CLXXVII category: #'Numeros-Naturales'!
II subclass: #CLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXVII class' category: #'Numeros-Naturales'!
CLXXVII class
	instanceVariableNames: ''!

!CLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXVIII.
	previous := CLXXVI.! !


!classDefinition: #CLXXVIII category: #'Numeros-Naturales'!
II subclass: #CLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXVIII class' category: #'Numeros-Naturales'!
CLXXVIII class
	instanceVariableNames: ''!

!CLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXIX.
	previous := CLXXVII.! !


!classDefinition: #CLXXX category: #'Numeros-Naturales'!
II subclass: #CLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXX class' category: #'Numeros-Naturales'!
CLXXX class
	instanceVariableNames: ''!

!CLXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXI.
	previous := CLXXIX.! !


!classDefinition: #CLXXXI category: #'Numeros-Naturales'!
II subclass: #CLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXI class' category: #'Numeros-Naturales'!
CLXXXI class
	instanceVariableNames: ''!

!CLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXII.
	previous := CLXXX.! !


!classDefinition: #CLXXXII category: #'Numeros-Naturales'!
II subclass: #CLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXII class' category: #'Numeros-Naturales'!
CLXXXII class
	instanceVariableNames: ''!

!CLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXIII.
	previous := CLXXXI.! !


!classDefinition: #CLXXXIII category: #'Numeros-Naturales'!
II subclass: #CLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXIII class' category: #'Numeros-Naturales'!
CLXXXIII class
	instanceVariableNames: ''!

!CLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXIV.
	previous := CLXXXII.! !


!classDefinition: #CLXXXIV category: #'Numeros-Naturales'!
II subclass: #CLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXIV class' category: #'Numeros-Naturales'!
CLXXXIV class
	instanceVariableNames: ''!

!CLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXV.
	previous := CLXXXIII.! !


!classDefinition: #CLXXXIX category: #'Numeros-Naturales'!
II subclass: #CLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXIX class' category: #'Numeros-Naturales'!
CLXXXIX class
	instanceVariableNames: ''!

!CLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXC.
	previous := CLXXXVIII.! !


!classDefinition: #CLXXXV category: #'Numeros-Naturales'!
II subclass: #CLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXV class' category: #'Numeros-Naturales'!
CLXXXV class
	instanceVariableNames: ''!

!CLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXVI.
	previous := CLXXXIV.! !


!classDefinition: #CLXXXVI category: #'Numeros-Naturales'!
II subclass: #CLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXVI class' category: #'Numeros-Naturales'!
CLXXXVI class
	instanceVariableNames: ''!

!CLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXVII.
	previous := CLXXXV.! !


!classDefinition: #CLXXXVII category: #'Numeros-Naturales'!
II subclass: #CLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXVII class' category: #'Numeros-Naturales'!
CLXXXVII class
	instanceVariableNames: ''!

!CLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXVIII.
	previous := CLXXXVI.! !


!classDefinition: #CLXXXVIII category: #'Numeros-Naturales'!
II subclass: #CLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXVIII class' category: #'Numeros-Naturales'!
CLXXXVIII class
	instanceVariableNames: ''!

!CLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXIX.
	previous := CLXXXVII.! !


!classDefinition: #CM category: #'Numeros-Naturales'!
II subclass: #CM
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CM class' category: #'Numeros-Naturales'!
CM class
	instanceVariableNames: ''!

!CM class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMI.
	previous := DCCCXCIX.! !


!classDefinition: #CMI category: #'Numeros-Naturales'!
II subclass: #CMI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMI class' category: #'Numeros-Naturales'!
CMI class
	instanceVariableNames: ''!

!CMI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMII.
	previous := CM.! !


!classDefinition: #CMII category: #'Numeros-Naturales'!
II subclass: #CMII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMII class' category: #'Numeros-Naturales'!
CMII class
	instanceVariableNames: ''!

!CMII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMIII.
	previous := CMI.! !


!classDefinition: #CMIII category: #'Numeros-Naturales'!
II subclass: #CMIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMIII class' category: #'Numeros-Naturales'!
CMIII class
	instanceVariableNames: ''!

!CMIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMIV.
	previous := CMII.! !


!classDefinition: #CMIV category: #'Numeros-Naturales'!
II subclass: #CMIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMIV class' category: #'Numeros-Naturales'!
CMIV class
	instanceVariableNames: ''!

!CMIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMV.
	previous := CMIII.! !


!classDefinition: #CMIX category: #'Numeros-Naturales'!
II subclass: #CMIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMIX class' category: #'Numeros-Naturales'!
CMIX class
	instanceVariableNames: ''!

!CMIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMX.
	previous := CMVIII.! !


!classDefinition: #CML category: #'Numeros-Naturales'!
II subclass: #CML
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CML class' category: #'Numeros-Naturales'!
CML class
	instanceVariableNames: ''!

!CML class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLI.
	previous := CMXLIX.! !


!classDefinition: #CMLI category: #'Numeros-Naturales'!
II subclass: #CMLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLI class' category: #'Numeros-Naturales'!
CMLI class
	instanceVariableNames: ''!

!CMLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLII.
	previous := CML.! !


!classDefinition: #CMLII category: #'Numeros-Naturales'!
II subclass: #CMLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLII class' category: #'Numeros-Naturales'!
CMLII class
	instanceVariableNames: ''!

!CMLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLIII.
	previous := CMLI.! !


!classDefinition: #CMLIII category: #'Numeros-Naturales'!
II subclass: #CMLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLIII class' category: #'Numeros-Naturales'!
CMLIII class
	instanceVariableNames: ''!

!CMLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLIV.
	previous := CMLII.! !


!classDefinition: #CMLIV category: #'Numeros-Naturales'!
II subclass: #CMLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLIV class' category: #'Numeros-Naturales'!
CMLIV class
	instanceVariableNames: ''!

!CMLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLV.
	previous := CMLIII.! !


!classDefinition: #CMLIX category: #'Numeros-Naturales'!
II subclass: #CMLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLIX class' category: #'Numeros-Naturales'!
CMLIX class
	instanceVariableNames: ''!

!CMLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLX.
	previous := CMLVIII.! !


!classDefinition: #CMLV category: #'Numeros-Naturales'!
II subclass: #CMLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLV class' category: #'Numeros-Naturales'!
CMLV class
	instanceVariableNames: ''!

!CMLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLVI.
	previous := CMLIV.! !


!classDefinition: #CMLVI category: #'Numeros-Naturales'!
II subclass: #CMLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLVI class' category: #'Numeros-Naturales'!
CMLVI class
	instanceVariableNames: ''!

!CMLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLVII.
	previous := CMLV.! !


!classDefinition: #CMLVII category: #'Numeros-Naturales'!
II subclass: #CMLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLVII class' category: #'Numeros-Naturales'!
CMLVII class
	instanceVariableNames: ''!

!CMLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLVIII.
	previous := CMLVI.! !


!classDefinition: #CMLVIII category: #'Numeros-Naturales'!
II subclass: #CMLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLVIII class' category: #'Numeros-Naturales'!
CMLVIII class
	instanceVariableNames: ''!

!CMLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLIX.
	previous := CMLVII.! !


!classDefinition: #CMLX category: #'Numeros-Naturales'!
II subclass: #CMLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLX class' category: #'Numeros-Naturales'!
CMLX class
	instanceVariableNames: ''!

!CMLX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXI.
	previous := CMLIX.! !


!classDefinition: #CMLXI category: #'Numeros-Naturales'!
II subclass: #CMLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXI class' category: #'Numeros-Naturales'!
CMLXI class
	instanceVariableNames: ''!

!CMLXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXII.
	previous := CMLX.! !


!classDefinition: #CMLXII category: #'Numeros-Naturales'!
II subclass: #CMLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXII class' category: #'Numeros-Naturales'!
CMLXII class
	instanceVariableNames: ''!

!CMLXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXIII.
	previous := CMLXI.! !


!classDefinition: #CMLXIII category: #'Numeros-Naturales'!
II subclass: #CMLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXIII class' category: #'Numeros-Naturales'!
CMLXIII class
	instanceVariableNames: ''!

!CMLXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXIV.
	previous := CMLXII.! !


!classDefinition: #CMLXIV category: #'Numeros-Naturales'!
II subclass: #CMLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXIV class' category: #'Numeros-Naturales'!
CMLXIV class
	instanceVariableNames: ''!

!CMLXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXV.
	previous := CMLXIII.! !


!classDefinition: #CMLXIX category: #'Numeros-Naturales'!
II subclass: #CMLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXIX class' category: #'Numeros-Naturales'!
CMLXIX class
	instanceVariableNames: ''!

!CMLXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXX.
	previous := CMLXVIII.! !


!classDefinition: #CMLXV category: #'Numeros-Naturales'!
II subclass: #CMLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXV class' category: #'Numeros-Naturales'!
CMLXV class
	instanceVariableNames: ''!

!CMLXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXVI.
	previous := CMLXIV.! !


!classDefinition: #CMLXVI category: #'Numeros-Naturales'!
II subclass: #CMLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXVI class' category: #'Numeros-Naturales'!
CMLXVI class
	instanceVariableNames: ''!

!CMLXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXVII.
	previous := CMLXV.! !


!classDefinition: #CMLXVII category: #'Numeros-Naturales'!
II subclass: #CMLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXVII class' category: #'Numeros-Naturales'!
CMLXVII class
	instanceVariableNames: ''!

!CMLXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXVIII.
	previous := CMLXVI.! !


!classDefinition: #CMLXVIII category: #'Numeros-Naturales'!
II subclass: #CMLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXVIII class' category: #'Numeros-Naturales'!
CMLXVIII class
	instanceVariableNames: ''!

!CMLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXIX.
	previous := CMLXVII.! !


!classDefinition: #CMLXX category: #'Numeros-Naturales'!
II subclass: #CMLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXX class' category: #'Numeros-Naturales'!
CMLXX class
	instanceVariableNames: ''!

!CMLXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXI.
	previous := CMLXIX.! !


!classDefinition: #CMLXXI category: #'Numeros-Naturales'!
II subclass: #CMLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXI class' category: #'Numeros-Naturales'!
CMLXXI class
	instanceVariableNames: ''!

!CMLXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXII.
	previous := CMLXX.! !


!classDefinition: #CMLXXII category: #'Numeros-Naturales'!
II subclass: #CMLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXII class' category: #'Numeros-Naturales'!
CMLXXII class
	instanceVariableNames: ''!

!CMLXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXIII.
	previous := CMLXXI.! !


!classDefinition: #CMLXXIII category: #'Numeros-Naturales'!
II subclass: #CMLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXIII class' category: #'Numeros-Naturales'!
CMLXXIII class
	instanceVariableNames: ''!

!CMLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXIV.
	previous := CMLXXII.! !


!classDefinition: #CMLXXIV category: #'Numeros-Naturales'!
II subclass: #CMLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXIV class' category: #'Numeros-Naturales'!
CMLXXIV class
	instanceVariableNames: ''!

!CMLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXV.
	previous := CMLXXIII.! !


!classDefinition: #CMLXXIX category: #'Numeros-Naturales'!
II subclass: #CMLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXIX class' category: #'Numeros-Naturales'!
CMLXXIX class
	instanceVariableNames: ''!

!CMLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXX.
	previous := CMLXXVIII.! !


!classDefinition: #CMLXXV category: #'Numeros-Naturales'!
II subclass: #CMLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXV class' category: #'Numeros-Naturales'!
CMLXXV class
	instanceVariableNames: ''!

!CMLXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXVI.
	previous := CMLXXIV.! !


!classDefinition: #CMLXXVI category: #'Numeros-Naturales'!
II subclass: #CMLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXVI class' category: #'Numeros-Naturales'!
CMLXXVI class
	instanceVariableNames: ''!

!CMLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXVII.
	previous := CMLXXV.! !


!classDefinition: #CMLXXVII category: #'Numeros-Naturales'!
II subclass: #CMLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXVII class' category: #'Numeros-Naturales'!
CMLXXVII class
	instanceVariableNames: ''!

!CMLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXVIII.
	previous := CMLXXVI.! !


!classDefinition: #CMLXXVIII category: #'Numeros-Naturales'!
II subclass: #CMLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXVIII class' category: #'Numeros-Naturales'!
CMLXXVIII class
	instanceVariableNames: ''!

!CMLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXIX.
	previous := CMLXXVII.! !


!classDefinition: #CMLXXX category: #'Numeros-Naturales'!
II subclass: #CMLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXX class' category: #'Numeros-Naturales'!
CMLXXX class
	instanceVariableNames: ''!

!CMLXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXI.
	previous := CMLXXIX.! !


!classDefinition: #CMLXXXI category: #'Numeros-Naturales'!
II subclass: #CMLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXI class' category: #'Numeros-Naturales'!
CMLXXXI class
	instanceVariableNames: ''!

!CMLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXII.
	previous := CMLXXX.! !


!classDefinition: #CMLXXXII category: #'Numeros-Naturales'!
II subclass: #CMLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXII class' category: #'Numeros-Naturales'!
CMLXXXII class
	instanceVariableNames: ''!

!CMLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXIII.
	previous := CMLXXXI.! !


!classDefinition: #CMLXXXIII category: #'Numeros-Naturales'!
II subclass: #CMLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXIII class' category: #'Numeros-Naturales'!
CMLXXXIII class
	instanceVariableNames: ''!

!CMLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXIV.
	previous := CMLXXXII.! !


!classDefinition: #CMLXXXIV category: #'Numeros-Naturales'!
II subclass: #CMLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXIV class' category: #'Numeros-Naturales'!
CMLXXXIV class
	instanceVariableNames: ''!

!CMLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXV.
	previous := CMLXXXIII.! !


!classDefinition: #CMLXXXIX category: #'Numeros-Naturales'!
II subclass: #CMLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXIX class' category: #'Numeros-Naturales'!
CMLXXXIX class
	instanceVariableNames: ''!

!CMLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXC.
	previous := CMLXXXVIII.! !


!classDefinition: #CMLXXXV category: #'Numeros-Naturales'!
II subclass: #CMLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXV class' category: #'Numeros-Naturales'!
CMLXXXV class
	instanceVariableNames: ''!

!CMLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXVI.
	previous := CMLXXXIV.! !


!classDefinition: #CMLXXXVI category: #'Numeros-Naturales'!
II subclass: #CMLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXVI class' category: #'Numeros-Naturales'!
CMLXXXVI class
	instanceVariableNames: ''!

!CMLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXVII.
	previous := CMLXXXV.! !


!classDefinition: #CMLXXXVII category: #'Numeros-Naturales'!
II subclass: #CMLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXVII class' category: #'Numeros-Naturales'!
CMLXXXVII class
	instanceVariableNames: ''!

!CMLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXVIII.
	previous := CMLXXXVI.! !


!classDefinition: #CMLXXXVIII category: #'Numeros-Naturales'!
II subclass: #CMLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXVIII class' category: #'Numeros-Naturales'!
CMLXXXVIII class
	instanceVariableNames: ''!

!CMLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXIX.
	previous := CMLXXXVII.! !


!classDefinition: #CMV category: #'Numeros-Naturales'!
II subclass: #CMV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMV class' category: #'Numeros-Naturales'!
CMV class
	instanceVariableNames: ''!

!CMV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMVI.
	previous := CMIV.! !


!classDefinition: #CMVI category: #'Numeros-Naturales'!
II subclass: #CMVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMVI class' category: #'Numeros-Naturales'!
CMVI class
	instanceVariableNames: ''!

!CMVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMVII.
	previous := CMV.! !


!classDefinition: #CMVII category: #'Numeros-Naturales'!
II subclass: #CMVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMVII class' category: #'Numeros-Naturales'!
CMVII class
	instanceVariableNames: ''!

!CMVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMVIII.
	previous := CMVI.! !


!classDefinition: #CMVIII category: #'Numeros-Naturales'!
II subclass: #CMVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMVIII class' category: #'Numeros-Naturales'!
CMVIII class
	instanceVariableNames: ''!

!CMVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMIX.
	previous := CMVII.! !


!classDefinition: #CMX category: #'Numeros-Naturales'!
II subclass: #CMX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMX class' category: #'Numeros-Naturales'!
CMX class
	instanceVariableNames: ''!

!CMX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXI.
	previous := CMIX.! !


!classDefinition: #CMXC category: #'Numeros-Naturales'!
II subclass: #CMXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXC class' category: #'Numeros-Naturales'!
CMXC class
	instanceVariableNames: ''!

!CMXC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCI.
	previous := CMLXXXIX.! !


!classDefinition: #CMXCI category: #'Numeros-Naturales'!
II subclass: #CMXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCI class' category: #'Numeros-Naturales'!
CMXCI class
	instanceVariableNames: ''!

!CMXCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCII.
	previous := CMXC.! !


!classDefinition: #CMXCII category: #'Numeros-Naturales'!
II subclass: #CMXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCII class' category: #'Numeros-Naturales'!
CMXCII class
	instanceVariableNames: ''!

!CMXCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCIII.
	previous := CMXCI.! !


!classDefinition: #CMXCIII category: #'Numeros-Naturales'!
II subclass: #CMXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCIII class' category: #'Numeros-Naturales'!
CMXCIII class
	instanceVariableNames: ''!

!CMXCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCIV.
	previous := CMXCII.! !


!classDefinition: #CMXCIV category: #'Numeros-Naturales'!
II subclass: #CMXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCIV class' category: #'Numeros-Naturales'!
CMXCIV class
	instanceVariableNames: ''!

!CMXCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCV.
	previous := CMXCIII.! !


!classDefinition: #CMXCIX category: #'Numeros-Naturales'!
II subclass: #CMXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCIX class' category: #'Numeros-Naturales'!
CMXCIX class
	instanceVariableNames: ''!

!CMXCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := M.
	previous := CMXCVIII.! !


!classDefinition: #CMXCV category: #'Numeros-Naturales'!
II subclass: #CMXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCV class' category: #'Numeros-Naturales'!
CMXCV class
	instanceVariableNames: ''!

!CMXCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCVI.
	previous := CMXCIV.! !


!classDefinition: #CMXCVI category: #'Numeros-Naturales'!
II subclass: #CMXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCVI class' category: #'Numeros-Naturales'!
CMXCVI class
	instanceVariableNames: ''!

!CMXCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCVII.
	previous := CMXCV.! !


!classDefinition: #CMXCVII category: #'Numeros-Naturales'!
II subclass: #CMXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCVII class' category: #'Numeros-Naturales'!
CMXCVII class
	instanceVariableNames: ''!

!CMXCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCVIII.
	previous := CMXCVI.! !


!classDefinition: #CMXCVIII category: #'Numeros-Naturales'!
II subclass: #CMXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCVIII class' category: #'Numeros-Naturales'!
CMXCVIII class
	instanceVariableNames: ''!

!CMXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCIX.
	previous := CMXCVII.! !


!classDefinition: #CMXI category: #'Numeros-Naturales'!
II subclass: #CMXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXI class' category: #'Numeros-Naturales'!
CMXI class
	instanceVariableNames: ''!

!CMXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXII.
	previous := CMX.! !


!classDefinition: #CMXII category: #'Numeros-Naturales'!
II subclass: #CMXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXII class' category: #'Numeros-Naturales'!
CMXII class
	instanceVariableNames: ''!

!CMXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXIII.
	previous := CMXI.! !


!classDefinition: #CMXIII category: #'Numeros-Naturales'!
II subclass: #CMXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXIII class' category: #'Numeros-Naturales'!
CMXIII class
	instanceVariableNames: ''!

!CMXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXIV.
	previous := CMXII.! !


!classDefinition: #CMXIV category: #'Numeros-Naturales'!
II subclass: #CMXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXIV class' category: #'Numeros-Naturales'!
CMXIV class
	instanceVariableNames: ''!

!CMXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXV.
	previous := CMXIII.! !


!classDefinition: #CMXIX category: #'Numeros-Naturales'!
II subclass: #CMXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXIX class' category: #'Numeros-Naturales'!
CMXIX class
	instanceVariableNames: ''!

!CMXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXX.
	previous := CMXVIII.! !


!classDefinition: #CMXL category: #'Numeros-Naturales'!
II subclass: #CMXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXL class' category: #'Numeros-Naturales'!
CMXL class
	instanceVariableNames: ''!

!CMXL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLI.
	previous := CMXXXIX.! !


!classDefinition: #CMXLI category: #'Numeros-Naturales'!
II subclass: #CMXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLI class' category: #'Numeros-Naturales'!
CMXLI class
	instanceVariableNames: ''!

!CMXLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLII.
	previous := CMXL.! !


!classDefinition: #CMXLII category: #'Numeros-Naturales'!
II subclass: #CMXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLII class' category: #'Numeros-Naturales'!
CMXLII class
	instanceVariableNames: ''!

!CMXLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLIII.
	previous := CMXLI.! !


!classDefinition: #CMXLIII category: #'Numeros-Naturales'!
II subclass: #CMXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLIII class' category: #'Numeros-Naturales'!
CMXLIII class
	instanceVariableNames: ''!

!CMXLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLIV.
	previous := CMXLII.! !


!classDefinition: #CMXLIV category: #'Numeros-Naturales'!
II subclass: #CMXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLIV class' category: #'Numeros-Naturales'!
CMXLIV class
	instanceVariableNames: ''!

!CMXLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLV.
	previous := CMXLIII.! !


!classDefinition: #CMXLIX category: #'Numeros-Naturales'!
II subclass: #CMXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLIX class' category: #'Numeros-Naturales'!
CMXLIX class
	instanceVariableNames: ''!

!CMXLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CML.
	previous := CMXLVIII.! !


!classDefinition: #CMXLV category: #'Numeros-Naturales'!
II subclass: #CMXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLV class' category: #'Numeros-Naturales'!
CMXLV class
	instanceVariableNames: ''!

!CMXLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLVI.
	previous := CMXLIV.! !


!classDefinition: #CMXLVI category: #'Numeros-Naturales'!
II subclass: #CMXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLVI class' category: #'Numeros-Naturales'!
CMXLVI class
	instanceVariableNames: ''!

!CMXLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLVII.
	previous := CMXLV.! !


!classDefinition: #CMXLVII category: #'Numeros-Naturales'!
II subclass: #CMXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLVII class' category: #'Numeros-Naturales'!
CMXLVII class
	instanceVariableNames: ''!

!CMXLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLVIII.
	previous := CMXLVI.! !


!classDefinition: #CMXLVIII category: #'Numeros-Naturales'!
II subclass: #CMXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLVIII class' category: #'Numeros-Naturales'!
CMXLVIII class
	instanceVariableNames: ''!

!CMXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLIX.
	previous := CMXLVII.! !


!classDefinition: #CMXV category: #'Numeros-Naturales'!
II subclass: #CMXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXV class' category: #'Numeros-Naturales'!
CMXV class
	instanceVariableNames: ''!

!CMXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXVI.
	previous := CMXIV.! !


!classDefinition: #CMXVI category: #'Numeros-Naturales'!
II subclass: #CMXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXVI class' category: #'Numeros-Naturales'!
CMXVI class
	instanceVariableNames: ''!

!CMXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXVII.
	previous := CMXV.! !


!classDefinition: #CMXVII category: #'Numeros-Naturales'!
II subclass: #CMXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXVII class' category: #'Numeros-Naturales'!
CMXVII class
	instanceVariableNames: ''!

!CMXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXVIII.
	previous := CMXVI.! !


!classDefinition: #CMXVIII category: #'Numeros-Naturales'!
II subclass: #CMXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXVIII class' category: #'Numeros-Naturales'!
CMXVIII class
	instanceVariableNames: ''!

!CMXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXIX.
	previous := CMXVII.! !


!classDefinition: #CMXX category: #'Numeros-Naturales'!
II subclass: #CMXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXX class' category: #'Numeros-Naturales'!
CMXX class
	instanceVariableNames: ''!

!CMXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXI.
	previous := CMXIX.! !


!classDefinition: #CMXXI category: #'Numeros-Naturales'!
II subclass: #CMXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXI class' category: #'Numeros-Naturales'!
CMXXI class
	instanceVariableNames: ''!

!CMXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXII.
	previous := CMXX.! !


!classDefinition: #CMXXII category: #'Numeros-Naturales'!
II subclass: #CMXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXII class' category: #'Numeros-Naturales'!
CMXXII class
	instanceVariableNames: ''!

!CMXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXIII.
	previous := CMXXI.! !


!classDefinition: #CMXXIII category: #'Numeros-Naturales'!
II subclass: #CMXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXIII class' category: #'Numeros-Naturales'!
CMXXIII class
	instanceVariableNames: ''!

!CMXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXIV.
	previous := CMXXII.! !


!classDefinition: #CMXXIV category: #'Numeros-Naturales'!
II subclass: #CMXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXIV class' category: #'Numeros-Naturales'!
CMXXIV class
	instanceVariableNames: ''!

!CMXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXV.
	previous := CMXXIII.! !


!classDefinition: #CMXXIX category: #'Numeros-Naturales'!
II subclass: #CMXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXIX class' category: #'Numeros-Naturales'!
CMXXIX class
	instanceVariableNames: ''!

!CMXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXX.
	previous := CMXXVIII.! !


!classDefinition: #CMXXV category: #'Numeros-Naturales'!
II subclass: #CMXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXV class' category: #'Numeros-Naturales'!
CMXXV class
	instanceVariableNames: ''!

!CMXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXVI.
	previous := CMXXIV.! !


!classDefinition: #CMXXVI category: #'Numeros-Naturales'!
II subclass: #CMXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXVI class' category: #'Numeros-Naturales'!
CMXXVI class
	instanceVariableNames: ''!

!CMXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXVII.
	previous := CMXXV.! !


!classDefinition: #CMXXVII category: #'Numeros-Naturales'!
II subclass: #CMXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXVII class' category: #'Numeros-Naturales'!
CMXXVII class
	instanceVariableNames: ''!

!CMXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXVIII.
	previous := CMXXVI.! !


!classDefinition: #CMXXVIII category: #'Numeros-Naturales'!
II subclass: #CMXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXVIII class' category: #'Numeros-Naturales'!
CMXXVIII class
	instanceVariableNames: ''!

!CMXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXIX.
	previous := CMXXVII.! !


!classDefinition: #CMXXX category: #'Numeros-Naturales'!
II subclass: #CMXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXX class' category: #'Numeros-Naturales'!
CMXXX class
	instanceVariableNames: ''!

!CMXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXI.
	previous := CMXXIX.! !


!classDefinition: #CMXXXI category: #'Numeros-Naturales'!
II subclass: #CMXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXI class' category: #'Numeros-Naturales'!
CMXXXI class
	instanceVariableNames: ''!

!CMXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXII.
	previous := CMXXX.! !


!classDefinition: #CMXXXII category: #'Numeros-Naturales'!
II subclass: #CMXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXII class' category: #'Numeros-Naturales'!
CMXXXII class
	instanceVariableNames: ''!

!CMXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXIII.
	previous := CMXXXI.! !


!classDefinition: #CMXXXIII category: #'Numeros-Naturales'!
II subclass: #CMXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXIII class' category: #'Numeros-Naturales'!
CMXXXIII class
	instanceVariableNames: ''!

!CMXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXIV.
	previous := CMXXXII.! !


!classDefinition: #CMXXXIV category: #'Numeros-Naturales'!
II subclass: #CMXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXIV class' category: #'Numeros-Naturales'!
CMXXXIV class
	instanceVariableNames: ''!

!CMXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXV.
	previous := CMXXXIII.! !


!classDefinition: #CMXXXIX category: #'Numeros-Naturales'!
II subclass: #CMXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXIX class' category: #'Numeros-Naturales'!
CMXXXIX class
	instanceVariableNames: ''!

!CMXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXL.
	previous := CMXXXVIII.! !


!classDefinition: #CMXXXV category: #'Numeros-Naturales'!
II subclass: #CMXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXV class' category: #'Numeros-Naturales'!
CMXXXV class
	instanceVariableNames: ''!

!CMXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXVI.
	previous := CMXXXIV.! !


!classDefinition: #CMXXXVI category: #'Numeros-Naturales'!
II subclass: #CMXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXVI class' category: #'Numeros-Naturales'!
CMXXXVI class
	instanceVariableNames: ''!

!CMXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXVII.
	previous := CMXXXV.! !


!classDefinition: #CMXXXVII category: #'Numeros-Naturales'!
II subclass: #CMXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXVII class' category: #'Numeros-Naturales'!
CMXXXVII class
	instanceVariableNames: ''!

!CMXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXVIII.
	previous := CMXXXVI.! !


!classDefinition: #CMXXXVIII category: #'Numeros-Naturales'!
II subclass: #CMXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXVIII class' category: #'Numeros-Naturales'!
CMXXXVIII class
	instanceVariableNames: ''!

!CMXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXIX.
	previous := CMXXXVII.! !


!classDefinition: #CV category: #'Numeros-Naturales'!
II subclass: #CV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CV class' category: #'Numeros-Naturales'!
CV class
	instanceVariableNames: ''!

!CV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CVI.
	previous := CIV.! !


!classDefinition: #CVI category: #'Numeros-Naturales'!
II subclass: #CVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CVI class' category: #'Numeros-Naturales'!
CVI class
	instanceVariableNames: ''!

!CVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CVII.
	previous := CV.! !


!classDefinition: #CVII category: #'Numeros-Naturales'!
II subclass: #CVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CVII class' category: #'Numeros-Naturales'!
CVII class
	instanceVariableNames: ''!

!CVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CVIII.
	previous := CVI.! !


!classDefinition: #CVIII category: #'Numeros-Naturales'!
II subclass: #CVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CVIII class' category: #'Numeros-Naturales'!
CVIII class
	instanceVariableNames: ''!

!CVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CIX.
	previous := CVII.! !


!classDefinition: #CX category: #'Numeros-Naturales'!
II subclass: #CX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CX class' category: #'Numeros-Naturales'!
CX class
	instanceVariableNames: ''!

!CX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXI.
	previous := CIX.! !


!classDefinition: #CXC category: #'Numeros-Naturales'!
II subclass: #CXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXC class' category: #'Numeros-Naturales'!
CXC class
	instanceVariableNames: ''!

!CXC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCI.
	previous := CLXXXIX.! !


!classDefinition: #CXCI category: #'Numeros-Naturales'!
II subclass: #CXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCI class' category: #'Numeros-Naturales'!
CXCI class
	instanceVariableNames: ''!

!CXCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCII.
	previous := CXC.! !


!classDefinition: #CXCII category: #'Numeros-Naturales'!
II subclass: #CXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCII class' category: #'Numeros-Naturales'!
CXCII class
	instanceVariableNames: ''!

!CXCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCIII.
	previous := CXCI.! !


!classDefinition: #CXCIII category: #'Numeros-Naturales'!
II subclass: #CXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCIII class' category: #'Numeros-Naturales'!
CXCIII class
	instanceVariableNames: ''!

!CXCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCIV.
	previous := CXCII.! !


!classDefinition: #CXCIV category: #'Numeros-Naturales'!
II subclass: #CXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCIV class' category: #'Numeros-Naturales'!
CXCIV class
	instanceVariableNames: ''!

!CXCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCV.
	previous := CXCIII.! !


!classDefinition: #CXCIX category: #'Numeros-Naturales'!
II subclass: #CXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCIX class' category: #'Numeros-Naturales'!
CXCIX class
	instanceVariableNames: ''!

!CXCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CC.
	previous := CXCVIII.! !


!classDefinition: #CXCV category: #'Numeros-Naturales'!
II subclass: #CXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCV class' category: #'Numeros-Naturales'!
CXCV class
	instanceVariableNames: ''!

!CXCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCVI.
	previous := CXCIV.! !


!classDefinition: #CXCVI category: #'Numeros-Naturales'!
II subclass: #CXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCVI class' category: #'Numeros-Naturales'!
CXCVI class
	instanceVariableNames: ''!

!CXCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCVII.
	previous := CXCV.! !


!classDefinition: #CXCVII category: #'Numeros-Naturales'!
II subclass: #CXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCVII class' category: #'Numeros-Naturales'!
CXCVII class
	instanceVariableNames: ''!

!CXCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCVIII.
	previous := CXCVI.! !


!classDefinition: #CXCVIII category: #'Numeros-Naturales'!
II subclass: #CXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCVIII class' category: #'Numeros-Naturales'!
CXCVIII class
	instanceVariableNames: ''!

!CXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCIX.
	previous := CXCVII.! !


!classDefinition: #CXI category: #'Numeros-Naturales'!
II subclass: #CXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXI class' category: #'Numeros-Naturales'!
CXI class
	instanceVariableNames: ''!

!CXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXII.
	previous := CX.! !


!classDefinition: #CXII category: #'Numeros-Naturales'!
II subclass: #CXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXII class' category: #'Numeros-Naturales'!
CXII class
	instanceVariableNames: ''!

!CXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXIII.
	previous := CXI.! !


!classDefinition: #CXIII category: #'Numeros-Naturales'!
II subclass: #CXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXIII class' category: #'Numeros-Naturales'!
CXIII class
	instanceVariableNames: ''!

!CXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXIV.
	previous := CXII.! !


!classDefinition: #CXIV category: #'Numeros-Naturales'!
II subclass: #CXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXIV class' category: #'Numeros-Naturales'!
CXIV class
	instanceVariableNames: ''!

!CXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXV.
	previous := CXIII.! !


!classDefinition: #CXIX category: #'Numeros-Naturales'!
II subclass: #CXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXIX class' category: #'Numeros-Naturales'!
CXIX class
	instanceVariableNames: ''!

!CXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXX.
	previous := CXVIII.! !


!classDefinition: #CXL category: #'Numeros-Naturales'!
II subclass: #CXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXL class' category: #'Numeros-Naturales'!
CXL class
	instanceVariableNames: ''!

!CXL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLI.
	previous := CXXXIX.! !


!classDefinition: #CXLI category: #'Numeros-Naturales'!
II subclass: #CXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLI class' category: #'Numeros-Naturales'!
CXLI class
	instanceVariableNames: ''!

!CXLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLII.
	previous := CXL.! !


!classDefinition: #CXLII category: #'Numeros-Naturales'!
II subclass: #CXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLII class' category: #'Numeros-Naturales'!
CXLII class
	instanceVariableNames: ''!

!CXLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLIII.
	previous := CXLI.! !


!classDefinition: #CXLIII category: #'Numeros-Naturales'!
II subclass: #CXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLIII class' category: #'Numeros-Naturales'!
CXLIII class
	instanceVariableNames: ''!

!CXLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLIV.
	previous := CXLII.! !


!classDefinition: #CXLIV category: #'Numeros-Naturales'!
II subclass: #CXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLIV class' category: #'Numeros-Naturales'!
CXLIV class
	instanceVariableNames: ''!

!CXLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLV.
	previous := CXLIII.! !


!classDefinition: #CXLIX category: #'Numeros-Naturales'!
II subclass: #CXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLIX class' category: #'Numeros-Naturales'!
CXLIX class
	instanceVariableNames: ''!

!CXLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CL.
	previous := CXLVIII.! !


!classDefinition: #CXLV category: #'Numeros-Naturales'!
II subclass: #CXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLV class' category: #'Numeros-Naturales'!
CXLV class
	instanceVariableNames: ''!

!CXLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLVI.
	previous := CXLIV.! !


!classDefinition: #CXLVI category: #'Numeros-Naturales'!
II subclass: #CXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLVI class' category: #'Numeros-Naturales'!
CXLVI class
	instanceVariableNames: ''!

!CXLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLVII.
	previous := CXLV.! !


!classDefinition: #CXLVII category: #'Numeros-Naturales'!
II subclass: #CXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLVII class' category: #'Numeros-Naturales'!
CXLVII class
	instanceVariableNames: ''!

!CXLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLVIII.
	previous := CXLVI.! !


!classDefinition: #CXLVIII category: #'Numeros-Naturales'!
II subclass: #CXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLVIII class' category: #'Numeros-Naturales'!
CXLVIII class
	instanceVariableNames: ''!

!CXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLIX.
	previous := CXLVII.! !


!classDefinition: #CXV category: #'Numeros-Naturales'!
II subclass: #CXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXV class' category: #'Numeros-Naturales'!
CXV class
	instanceVariableNames: ''!

!CXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXVI.
	previous := CXIV.! !


!classDefinition: #CXVI category: #'Numeros-Naturales'!
II subclass: #CXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXVI class' category: #'Numeros-Naturales'!
CXVI class
	instanceVariableNames: ''!

!CXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXVII.
	previous := CXV.! !


!classDefinition: #CXVII category: #'Numeros-Naturales'!
II subclass: #CXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXVII class' category: #'Numeros-Naturales'!
CXVII class
	instanceVariableNames: ''!

!CXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXVIII.
	previous := CXVI.! !


!classDefinition: #CXVIII category: #'Numeros-Naturales'!
II subclass: #CXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXVIII class' category: #'Numeros-Naturales'!
CXVIII class
	instanceVariableNames: ''!

!CXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXIX.
	previous := CXVII.! !


!classDefinition: #CXX category: #'Numeros-Naturales'!
II subclass: #CXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXX class' category: #'Numeros-Naturales'!
CXX class
	instanceVariableNames: ''!

!CXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXI.
	previous := CXIX.! !


!classDefinition: #CXXI category: #'Numeros-Naturales'!
II subclass: #CXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXI class' category: #'Numeros-Naturales'!
CXXI class
	instanceVariableNames: ''!

!CXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXII.
	previous := CXX.! !


!classDefinition: #CXXII category: #'Numeros-Naturales'!
II subclass: #CXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXII class' category: #'Numeros-Naturales'!
CXXII class
	instanceVariableNames: ''!

!CXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXIII.
	previous := CXXI.! !


!classDefinition: #CXXIII category: #'Numeros-Naturales'!
II subclass: #CXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXIII class' category: #'Numeros-Naturales'!
CXXIII class
	instanceVariableNames: ''!

!CXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXIV.
	previous := CXXII.! !


!classDefinition: #CXXIV category: #'Numeros-Naturales'!
II subclass: #CXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXIV class' category: #'Numeros-Naturales'!
CXXIV class
	instanceVariableNames: ''!

!CXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXV.
	previous := CXXIII.! !


!classDefinition: #CXXIX category: #'Numeros-Naturales'!
II subclass: #CXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXIX class' category: #'Numeros-Naturales'!
CXXIX class
	instanceVariableNames: ''!

!CXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXX.
	previous := CXXVIII.! !


!classDefinition: #CXXV category: #'Numeros-Naturales'!
II subclass: #CXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXV class' category: #'Numeros-Naturales'!
CXXV class
	instanceVariableNames: ''!

!CXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXVI.
	previous := CXXIV.! !


!classDefinition: #CXXVI category: #'Numeros-Naturales'!
II subclass: #CXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXVI class' category: #'Numeros-Naturales'!
CXXVI class
	instanceVariableNames: ''!

!CXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXVII.
	previous := CXXV.! !


!classDefinition: #CXXVII category: #'Numeros-Naturales'!
II subclass: #CXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXVII class' category: #'Numeros-Naturales'!
CXXVII class
	instanceVariableNames: ''!

!CXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXVIII.
	previous := CXXVI.! !


!classDefinition: #CXXVIII category: #'Numeros-Naturales'!
II subclass: #CXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXVIII class' category: #'Numeros-Naturales'!
CXXVIII class
	instanceVariableNames: ''!

!CXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXIX.
	previous := CXXVII.! !


!classDefinition: #CXXX category: #'Numeros-Naturales'!
II subclass: #CXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXX class' category: #'Numeros-Naturales'!
CXXX class
	instanceVariableNames: ''!

!CXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXI.
	previous := CXXIX.! !


!classDefinition: #CXXXI category: #'Numeros-Naturales'!
II subclass: #CXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXI class' category: #'Numeros-Naturales'!
CXXXI class
	instanceVariableNames: ''!

!CXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXII.
	previous := CXXX.! !


!classDefinition: #CXXXII category: #'Numeros-Naturales'!
II subclass: #CXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXII class' category: #'Numeros-Naturales'!
CXXXII class
	instanceVariableNames: ''!

!CXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXIII.
	previous := CXXXI.! !


!classDefinition: #CXXXIII category: #'Numeros-Naturales'!
II subclass: #CXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXIII class' category: #'Numeros-Naturales'!
CXXXIII class
	instanceVariableNames: ''!

!CXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXIV.
	previous := CXXXII.! !


!classDefinition: #CXXXIV category: #'Numeros-Naturales'!
II subclass: #CXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXIV class' category: #'Numeros-Naturales'!
CXXXIV class
	instanceVariableNames: ''!

!CXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXV.
	previous := CXXXIII.! !


!classDefinition: #CXXXIX category: #'Numeros-Naturales'!
II subclass: #CXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXIX class' category: #'Numeros-Naturales'!
CXXXIX class
	instanceVariableNames: ''!

!CXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXL.
	previous := CXXXVIII.! !


!classDefinition: #CXXXV category: #'Numeros-Naturales'!
II subclass: #CXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXV class' category: #'Numeros-Naturales'!
CXXXV class
	instanceVariableNames: ''!

!CXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXVI.
	previous := CXXXIV.! !


!classDefinition: #CXXXVI category: #'Numeros-Naturales'!
II subclass: #CXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXVI class' category: #'Numeros-Naturales'!
CXXXVI class
	instanceVariableNames: ''!

!CXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXVII.
	previous := CXXXV.! !


!classDefinition: #CXXXVII category: #'Numeros-Naturales'!
II subclass: #CXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXVII class' category: #'Numeros-Naturales'!
CXXXVII class
	instanceVariableNames: ''!

!CXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXVIII.
	previous := CXXXVI.! !


!classDefinition: #CXXXVIII category: #'Numeros-Naturales'!
II subclass: #CXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXVIII class' category: #'Numeros-Naturales'!
CXXXVIII class
	instanceVariableNames: ''!

!CXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXIX.
	previous := CXXXVII.! !


!classDefinition: #D category: #'Numeros-Naturales'!
II subclass: #D
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'D class' category: #'Numeros-Naturales'!
D class
	instanceVariableNames: ''!

!D class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DI.
	previous := CDXCIX.! !


!classDefinition: #DC category: #'Numeros-Naturales'!
II subclass: #DC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DC class' category: #'Numeros-Naturales'!
DC class
	instanceVariableNames: ''!

!DC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCI.
	previous := DXCIX.! !


!classDefinition: #DCC category: #'Numeros-Naturales'!
II subclass: #DCC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCC class' category: #'Numeros-Naturales'!
DCC class
	instanceVariableNames: ''!

!DCC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCI.
	previous := DCXCIX.! !


!classDefinition: #DCCC category: #'Numeros-Naturales'!
II subclass: #DCCC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCC class' category: #'Numeros-Naturales'!
DCCC class
	instanceVariableNames: ''!

!DCCC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCI.
	previous := DCCXCIX.! !


!classDefinition: #DCCCI category: #'Numeros-Naturales'!
II subclass: #DCCCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCI class' category: #'Numeros-Naturales'!
DCCCI class
	instanceVariableNames: ''!

!DCCCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCII.
	previous := DCCC.! !


!classDefinition: #DCCCII category: #'Numeros-Naturales'!
II subclass: #DCCCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCII class' category: #'Numeros-Naturales'!
DCCCII class
	instanceVariableNames: ''!

!DCCCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCIII.
	previous := DCCCI.! !


!classDefinition: #DCCCIII category: #'Numeros-Naturales'!
II subclass: #DCCCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCIII class' category: #'Numeros-Naturales'!
DCCCIII class
	instanceVariableNames: ''!

!DCCCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCIV.
	previous := DCCCII.! !


!classDefinition: #DCCCIV category: #'Numeros-Naturales'!
II subclass: #DCCCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCIV class' category: #'Numeros-Naturales'!
DCCCIV class
	instanceVariableNames: ''!

!DCCCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCV.
	previous := DCCCIII.! !


!classDefinition: #DCCCIX category: #'Numeros-Naturales'!
II subclass: #DCCCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCIX class' category: #'Numeros-Naturales'!
DCCCIX class
	instanceVariableNames: ''!

!DCCCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCX.
	previous := DCCCVIII.! !


!classDefinition: #DCCCL category: #'Numeros-Naturales'!
II subclass: #DCCCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCL class' category: #'Numeros-Naturales'!
DCCCL class
	instanceVariableNames: ''!

!DCCCL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLI.
	previous := DCCCXLIX.! !


!classDefinition: #DCCCLI category: #'Numeros-Naturales'!
II subclass: #DCCCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLI class' category: #'Numeros-Naturales'!
DCCCLI class
	instanceVariableNames: ''!

!DCCCLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLII.
	previous := DCCCL.! !


!classDefinition: #DCCCLII category: #'Numeros-Naturales'!
II subclass: #DCCCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLII class' category: #'Numeros-Naturales'!
DCCCLII class
	instanceVariableNames: ''!

!DCCCLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLIII.
	previous := DCCCLI.! !


!classDefinition: #DCCCLIII category: #'Numeros-Naturales'!
II subclass: #DCCCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLIII class' category: #'Numeros-Naturales'!
DCCCLIII class
	instanceVariableNames: ''!

!DCCCLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLIV.
	previous := DCCCLII.! !


!classDefinition: #DCCCLIV category: #'Numeros-Naturales'!
II subclass: #DCCCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLIV class' category: #'Numeros-Naturales'!
DCCCLIV class
	instanceVariableNames: ''!

!DCCCLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLV.
	previous := DCCCLIII.! !


!classDefinition: #DCCCLIX category: #'Numeros-Naturales'!
II subclass: #DCCCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLIX class' category: #'Numeros-Naturales'!
DCCCLIX class
	instanceVariableNames: ''!

!DCCCLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLX.
	previous := DCCCLVIII.! !


!classDefinition: #DCCCLV category: #'Numeros-Naturales'!
II subclass: #DCCCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLV class' category: #'Numeros-Naturales'!
DCCCLV class
	instanceVariableNames: ''!

!DCCCLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLVI.
	previous := DCCCLIV.! !


!classDefinition: #DCCCLVI category: #'Numeros-Naturales'!
II subclass: #DCCCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLVI class' category: #'Numeros-Naturales'!
DCCCLVI class
	instanceVariableNames: ''!

!DCCCLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLVII.
	previous := DCCCLV.! !


!classDefinition: #DCCCLVII category: #'Numeros-Naturales'!
II subclass: #DCCCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLVII class' category: #'Numeros-Naturales'!
DCCCLVII class
	instanceVariableNames: ''!

!DCCCLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLVIII.
	previous := DCCCLVI.! !


!classDefinition: #DCCCLVIII category: #'Numeros-Naturales'!
II subclass: #DCCCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLVIII class' category: #'Numeros-Naturales'!
DCCCLVIII class
	instanceVariableNames: ''!

!DCCCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLIX.
	previous := DCCCLVII.! !


!classDefinition: #DCCCLX category: #'Numeros-Naturales'!
II subclass: #DCCCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLX class' category: #'Numeros-Naturales'!
DCCCLX class
	instanceVariableNames: ''!

!DCCCLX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXI.
	previous := DCCCLIX.! !


!classDefinition: #DCCCLXI category: #'Numeros-Naturales'!
II subclass: #DCCCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXI class' category: #'Numeros-Naturales'!
DCCCLXI class
	instanceVariableNames: ''!

!DCCCLXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXII.
	previous := DCCCLX.! !


!classDefinition: #DCCCLXII category: #'Numeros-Naturales'!
II subclass: #DCCCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXII class' category: #'Numeros-Naturales'!
DCCCLXII class
	instanceVariableNames: ''!

!DCCCLXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXIII.
	previous := DCCCLXI.! !


!classDefinition: #DCCCLXIII category: #'Numeros-Naturales'!
II subclass: #DCCCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXIII class' category: #'Numeros-Naturales'!
DCCCLXIII class
	instanceVariableNames: ''!

!DCCCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXIV.
	previous := DCCCLXII.! !


!classDefinition: #DCCCLXIV category: #'Numeros-Naturales'!
II subclass: #DCCCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXIV class' category: #'Numeros-Naturales'!
DCCCLXIV class
	instanceVariableNames: ''!

!DCCCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXV.
	previous := DCCCLXIII.! !


!classDefinition: #DCCCLXIX category: #'Numeros-Naturales'!
II subclass: #DCCCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXIX class' category: #'Numeros-Naturales'!
DCCCLXIX class
	instanceVariableNames: ''!

!DCCCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXX.
	previous := DCCCLXVIII.! !


!classDefinition: #DCCCLXV category: #'Numeros-Naturales'!
II subclass: #DCCCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXV class' category: #'Numeros-Naturales'!
DCCCLXV class
	instanceVariableNames: ''!

!DCCCLXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXVI.
	previous := DCCCLXIV.! !


!classDefinition: #DCCCLXVI category: #'Numeros-Naturales'!
II subclass: #DCCCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXVI class' category: #'Numeros-Naturales'!
DCCCLXVI class
	instanceVariableNames: ''!

!DCCCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXVII.
	previous := DCCCLXV.! !


!classDefinition: #DCCCLXVII category: #'Numeros-Naturales'!
II subclass: #DCCCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXVII class' category: #'Numeros-Naturales'!
DCCCLXVII class
	instanceVariableNames: ''!

!DCCCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXVIII.
	previous := DCCCLXVI.! !


!classDefinition: #DCCCLXVIII category: #'Numeros-Naturales'!
II subclass: #DCCCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXVIII class' category: #'Numeros-Naturales'!
DCCCLXVIII class
	instanceVariableNames: ''!

!DCCCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXIX.
	previous := DCCCLXVII.! !


!classDefinition: #DCCCLXX category: #'Numeros-Naturales'!
II subclass: #DCCCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXX class' category: #'Numeros-Naturales'!
DCCCLXX class
	instanceVariableNames: ''!

!DCCCLXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXI.
	previous := DCCCLXIX.! !


!classDefinition: #DCCCLXXI category: #'Numeros-Naturales'!
II subclass: #DCCCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXI class' category: #'Numeros-Naturales'!
DCCCLXXI class
	instanceVariableNames: ''!

!DCCCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXII.
	previous := DCCCLXX.! !


!classDefinition: #DCCCLXXII category: #'Numeros-Naturales'!
II subclass: #DCCCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXII class' category: #'Numeros-Naturales'!
DCCCLXXII class
	instanceVariableNames: ''!

!DCCCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXIII.
	previous := DCCCLXXI.! !


!classDefinition: #DCCCLXXIII category: #'Numeros-Naturales'!
II subclass: #DCCCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXIII class' category: #'Numeros-Naturales'!
DCCCLXXIII class
	instanceVariableNames: ''!

!DCCCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXIV.
	previous := DCCCLXXII.! !


!classDefinition: #DCCCLXXIV category: #'Numeros-Naturales'!
II subclass: #DCCCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXIV class' category: #'Numeros-Naturales'!
DCCCLXXIV class
	instanceVariableNames: ''!

!DCCCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXV.
	previous := DCCCLXXIII.! !


!classDefinition: #DCCCLXXIX category: #'Numeros-Naturales'!
II subclass: #DCCCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXIX class' category: #'Numeros-Naturales'!
DCCCLXXIX class
	instanceVariableNames: ''!

!DCCCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXX.
	previous := DCCCLXXVIII.! !


!classDefinition: #DCCCLXXV category: #'Numeros-Naturales'!
II subclass: #DCCCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXV class' category: #'Numeros-Naturales'!
DCCCLXXV class
	instanceVariableNames: ''!

!DCCCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXVI.
	previous := DCCCLXXIV.! !


!classDefinition: #DCCCLXXVI category: #'Numeros-Naturales'!
II subclass: #DCCCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXVI class' category: #'Numeros-Naturales'!
DCCCLXXVI class
	instanceVariableNames: ''!

!DCCCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXVII.
	previous := DCCCLXXV.! !


!classDefinition: #DCCCLXXVII category: #'Numeros-Naturales'!
II subclass: #DCCCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXVII class' category: #'Numeros-Naturales'!
DCCCLXXVII class
	instanceVariableNames: ''!

!DCCCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXVIII.
	previous := DCCCLXXVI.! !


!classDefinition: #DCCCLXXVIII category: #'Numeros-Naturales'!
II subclass: #DCCCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXVIII class' category: #'Numeros-Naturales'!
DCCCLXXVIII class
	instanceVariableNames: ''!

!DCCCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXIX.
	previous := DCCCLXXVII.! !


!classDefinition: #DCCCLXXX category: #'Numeros-Naturales'!
II subclass: #DCCCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXX class' category: #'Numeros-Naturales'!
DCCCLXXX class
	instanceVariableNames: ''!

!DCCCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXI.
	previous := DCCCLXXIX.! !


!classDefinition: #DCCCLXXXI category: #'Numeros-Naturales'!
II subclass: #DCCCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXI class' category: #'Numeros-Naturales'!
DCCCLXXXI class
	instanceVariableNames: ''!

!DCCCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXII.
	previous := DCCCLXXX.! !


!classDefinition: #DCCCLXXXII category: #'Numeros-Naturales'!
II subclass: #DCCCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXII class' category: #'Numeros-Naturales'!
DCCCLXXXII class
	instanceVariableNames: ''!

!DCCCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXIII.
	previous := DCCCLXXXI.! !


!classDefinition: #DCCCLXXXIII category: #'Numeros-Naturales'!
II subclass: #DCCCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXIII class' category: #'Numeros-Naturales'!
DCCCLXXXIII class
	instanceVariableNames: ''!

!DCCCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXIV.
	previous := DCCCLXXXII.! !


!classDefinition: #DCCCLXXXIV category: #'Numeros-Naturales'!
II subclass: #DCCCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXIV class' category: #'Numeros-Naturales'!
DCCCLXXXIV class
	instanceVariableNames: ''!

!DCCCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXV.
	previous := DCCCLXXXIII.! !


!classDefinition: #DCCCLXXXIX category: #'Numeros-Naturales'!
II subclass: #DCCCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXIX class' category: #'Numeros-Naturales'!
DCCCLXXXIX class
	instanceVariableNames: ''!

!DCCCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXC.
	previous := DCCCLXXXVIII.! !


!classDefinition: #DCCCLXXXV category: #'Numeros-Naturales'!
II subclass: #DCCCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXV class' category: #'Numeros-Naturales'!
DCCCLXXXV class
	instanceVariableNames: ''!

!DCCCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXVI.
	previous := DCCCLXXXIV.! !


!classDefinition: #DCCCLXXXVI category: #'Numeros-Naturales'!
II subclass: #DCCCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXVI class' category: #'Numeros-Naturales'!
DCCCLXXXVI class
	instanceVariableNames: ''!

!DCCCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXVII.
	previous := DCCCLXXXV.! !


!classDefinition: #DCCCLXXXVII category: #'Numeros-Naturales'!
II subclass: #DCCCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXVII class' category: #'Numeros-Naturales'!
DCCCLXXXVII class
	instanceVariableNames: ''!

!DCCCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXVIII.
	previous := DCCCLXXXVI.! !


!classDefinition: #DCCCLXXXVIII category: #'Numeros-Naturales'!
II subclass: #DCCCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXVIII class' category: #'Numeros-Naturales'!
DCCCLXXXVIII class
	instanceVariableNames: ''!

!DCCCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXIX.
	previous := DCCCLXXXVII.! !


!classDefinition: #DCCCV category: #'Numeros-Naturales'!
II subclass: #DCCCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCV class' category: #'Numeros-Naturales'!
DCCCV class
	instanceVariableNames: ''!

!DCCCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCVI.
	previous := DCCCIV.! !


!classDefinition: #DCCCVI category: #'Numeros-Naturales'!
II subclass: #DCCCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCVI class' category: #'Numeros-Naturales'!
DCCCVI class
	instanceVariableNames: ''!

!DCCCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCVII.
	previous := DCCCV.! !


!classDefinition: #DCCCVII category: #'Numeros-Naturales'!
II subclass: #DCCCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCVII class' category: #'Numeros-Naturales'!
DCCCVII class
	instanceVariableNames: ''!

!DCCCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCVIII.
	previous := DCCCVI.! !


!classDefinition: #DCCCVIII category: #'Numeros-Naturales'!
II subclass: #DCCCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCVIII class' category: #'Numeros-Naturales'!
DCCCVIII class
	instanceVariableNames: ''!

!DCCCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCIX.
	previous := DCCCVII.! !


!classDefinition: #DCCCX category: #'Numeros-Naturales'!
II subclass: #DCCCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCX class' category: #'Numeros-Naturales'!
DCCCX class
	instanceVariableNames: ''!

!DCCCX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXI.
	previous := DCCCIX.! !


!classDefinition: #DCCCXC category: #'Numeros-Naturales'!
II subclass: #DCCCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXC class' category: #'Numeros-Naturales'!
DCCCXC class
	instanceVariableNames: ''!

!DCCCXC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCI.
	previous := DCCCLXXXIX.! !


!classDefinition: #DCCCXCI category: #'Numeros-Naturales'!
II subclass: #DCCCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCI class' category: #'Numeros-Naturales'!
DCCCXCI class
	instanceVariableNames: ''!

!DCCCXCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCII.
	previous := DCCCXC.! !


!classDefinition: #DCCCXCII category: #'Numeros-Naturales'!
II subclass: #DCCCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCII class' category: #'Numeros-Naturales'!
DCCCXCII class
	instanceVariableNames: ''!

!DCCCXCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCIII.
	previous := DCCCXCI.! !


!classDefinition: #DCCCXCIII category: #'Numeros-Naturales'!
II subclass: #DCCCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCIII class' category: #'Numeros-Naturales'!
DCCCXCIII class
	instanceVariableNames: ''!

!DCCCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCIV.
	previous := DCCCXCII.! !


!classDefinition: #DCCCXCIV category: #'Numeros-Naturales'!
II subclass: #DCCCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCIV class' category: #'Numeros-Naturales'!
DCCCXCIV class
	instanceVariableNames: ''!

!DCCCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCV.
	previous := DCCCXCIII.! !


!classDefinition: #DCCCXCIX category: #'Numeros-Naturales'!
II subclass: #DCCCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCIX class' category: #'Numeros-Naturales'!
DCCCXCIX class
	instanceVariableNames: ''!

!DCCCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CM.
	previous := DCCCXCVIII.! !


!classDefinition: #DCCCXCV category: #'Numeros-Naturales'!
II subclass: #DCCCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCV class' category: #'Numeros-Naturales'!
DCCCXCV class
	instanceVariableNames: ''!

!DCCCXCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCVI.
	previous := DCCCXCIV.! !


!classDefinition: #DCCCXCVI category: #'Numeros-Naturales'!
II subclass: #DCCCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCVI class' category: #'Numeros-Naturales'!
DCCCXCVI class
	instanceVariableNames: ''!

!DCCCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCVII.
	previous := DCCCXCV.! !


!classDefinition: #DCCCXCVII category: #'Numeros-Naturales'!
II subclass: #DCCCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCVII class' category: #'Numeros-Naturales'!
DCCCXCVII class
	instanceVariableNames: ''!

!DCCCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCVIII.
	previous := DCCCXCVI.! !


!classDefinition: #DCCCXCVIII category: #'Numeros-Naturales'!
II subclass: #DCCCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCVIII class' category: #'Numeros-Naturales'!
DCCCXCVIII class
	instanceVariableNames: ''!

!DCCCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCIX.
	previous := DCCCXCVII.! !


!classDefinition: #DCCCXI category: #'Numeros-Naturales'!
II subclass: #DCCCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXI class' category: #'Numeros-Naturales'!
DCCCXI class
	instanceVariableNames: ''!

!DCCCXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXII.
	previous := DCCCX.! !


!classDefinition: #DCCCXII category: #'Numeros-Naturales'!
II subclass: #DCCCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXII class' category: #'Numeros-Naturales'!
DCCCXII class
	instanceVariableNames: ''!

!DCCCXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXIII.
	previous := DCCCXI.! !


!classDefinition: #DCCCXIII category: #'Numeros-Naturales'!
II subclass: #DCCCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXIII class' category: #'Numeros-Naturales'!
DCCCXIII class
	instanceVariableNames: ''!

!DCCCXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXIV.
	previous := DCCCXII.! !


!classDefinition: #DCCCXIV category: #'Numeros-Naturales'!
II subclass: #DCCCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXIV class' category: #'Numeros-Naturales'!
DCCCXIV class
	instanceVariableNames: ''!

!DCCCXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXV.
	previous := DCCCXIII.! !


!classDefinition: #DCCCXIX category: #'Numeros-Naturales'!
II subclass: #DCCCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXIX class' category: #'Numeros-Naturales'!
DCCCXIX class
	instanceVariableNames: ''!

!DCCCXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXX.
	previous := DCCCXVIII.! !


!classDefinition: #DCCCXL category: #'Numeros-Naturales'!
II subclass: #DCCCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXL class' category: #'Numeros-Naturales'!
DCCCXL class
	instanceVariableNames: ''!

!DCCCXL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLI.
	previous := DCCCXXXIX.! !


!classDefinition: #DCCCXLI category: #'Numeros-Naturales'!
II subclass: #DCCCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLI class' category: #'Numeros-Naturales'!
DCCCXLI class
	instanceVariableNames: ''!

!DCCCXLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLII.
	previous := DCCCXL.! !


!classDefinition: #DCCCXLII category: #'Numeros-Naturales'!
II subclass: #DCCCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLII class' category: #'Numeros-Naturales'!
DCCCXLII class
	instanceVariableNames: ''!

!DCCCXLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLIII.
	previous := DCCCXLI.! !


!classDefinition: #DCCCXLIII category: #'Numeros-Naturales'!
II subclass: #DCCCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLIII class' category: #'Numeros-Naturales'!
DCCCXLIII class
	instanceVariableNames: ''!

!DCCCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLIV.
	previous := DCCCXLII.! !


!classDefinition: #DCCCXLIV category: #'Numeros-Naturales'!
II subclass: #DCCCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLIV class' category: #'Numeros-Naturales'!
DCCCXLIV class
	instanceVariableNames: ''!

!DCCCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLV.
	previous := DCCCXLIII.! !


!classDefinition: #DCCCXLIX category: #'Numeros-Naturales'!
II subclass: #DCCCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLIX class' category: #'Numeros-Naturales'!
DCCCXLIX class
	instanceVariableNames: ''!

!DCCCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCL.
	previous := DCCCXLVIII.! !


!classDefinition: #DCCCXLV category: #'Numeros-Naturales'!
II subclass: #DCCCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLV class' category: #'Numeros-Naturales'!
DCCCXLV class
	instanceVariableNames: ''!

!DCCCXLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLVI.
	previous := DCCCXLIV.! !


!classDefinition: #DCCCXLVI category: #'Numeros-Naturales'!
II subclass: #DCCCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLVI class' category: #'Numeros-Naturales'!
DCCCXLVI class
	instanceVariableNames: ''!

!DCCCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLVII.
	previous := DCCCXLV.! !


!classDefinition: #DCCCXLVII category: #'Numeros-Naturales'!
II subclass: #DCCCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLVII class' category: #'Numeros-Naturales'!
DCCCXLVII class
	instanceVariableNames: ''!

!DCCCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLVIII.
	previous := DCCCXLVI.! !


!classDefinition: #DCCCXLVIII category: #'Numeros-Naturales'!
II subclass: #DCCCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLVIII class' category: #'Numeros-Naturales'!
DCCCXLVIII class
	instanceVariableNames: ''!

!DCCCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLIX.
	previous := DCCCXLVII.! !


!classDefinition: #DCCCXV category: #'Numeros-Naturales'!
II subclass: #DCCCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXV class' category: #'Numeros-Naturales'!
DCCCXV class
	instanceVariableNames: ''!

!DCCCXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXVI.
	previous := DCCCXIV.! !


!classDefinition: #DCCCXVI category: #'Numeros-Naturales'!
II subclass: #DCCCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXVI class' category: #'Numeros-Naturales'!
DCCCXVI class
	instanceVariableNames: ''!

!DCCCXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXVII.
	previous := DCCCXV.! !


!classDefinition: #DCCCXVII category: #'Numeros-Naturales'!
II subclass: #DCCCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXVII class' category: #'Numeros-Naturales'!
DCCCXVII class
	instanceVariableNames: ''!

!DCCCXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXVIII.
	previous := DCCCXVI.! !


!classDefinition: #DCCCXVIII category: #'Numeros-Naturales'!
II subclass: #DCCCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXVIII class' category: #'Numeros-Naturales'!
DCCCXVIII class
	instanceVariableNames: ''!

!DCCCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXIX.
	previous := DCCCXVII.! !


!classDefinition: #DCCCXX category: #'Numeros-Naturales'!
II subclass: #DCCCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXX class' category: #'Numeros-Naturales'!
DCCCXX class
	instanceVariableNames: ''!

!DCCCXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXI.
	previous := DCCCXIX.! !


!classDefinition: #DCCCXXI category: #'Numeros-Naturales'!
II subclass: #DCCCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXI class' category: #'Numeros-Naturales'!
DCCCXXI class
	instanceVariableNames: ''!

!DCCCXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXII.
	previous := DCCCXX.! !


!classDefinition: #DCCCXXII category: #'Numeros-Naturales'!
II subclass: #DCCCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXII class' category: #'Numeros-Naturales'!
DCCCXXII class
	instanceVariableNames: ''!

!DCCCXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXIII.
	previous := DCCCXXI.! !


!classDefinition: #DCCCXXIII category: #'Numeros-Naturales'!
II subclass: #DCCCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXIII class' category: #'Numeros-Naturales'!
DCCCXXIII class
	instanceVariableNames: ''!

!DCCCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXIV.
	previous := DCCCXXII.! !


!classDefinition: #DCCCXXIV category: #'Numeros-Naturales'!
II subclass: #DCCCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXIV class' category: #'Numeros-Naturales'!
DCCCXXIV class
	instanceVariableNames: ''!

!DCCCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXV.
	previous := DCCCXXIII.! !


!classDefinition: #DCCCXXIX category: #'Numeros-Naturales'!
II subclass: #DCCCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXIX class' category: #'Numeros-Naturales'!
DCCCXXIX class
	instanceVariableNames: ''!

!DCCCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXX.
	previous := DCCCXXVIII.! !


!classDefinition: #DCCCXXV category: #'Numeros-Naturales'!
II subclass: #DCCCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXV class' category: #'Numeros-Naturales'!
DCCCXXV class
	instanceVariableNames: ''!

!DCCCXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXVI.
	previous := DCCCXXIV.! !


!classDefinition: #DCCCXXVI category: #'Numeros-Naturales'!
II subclass: #DCCCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXVI class' category: #'Numeros-Naturales'!
DCCCXXVI class
	instanceVariableNames: ''!

!DCCCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXVII.
	previous := DCCCXXV.! !


!classDefinition: #DCCCXXVII category: #'Numeros-Naturales'!
II subclass: #DCCCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXVII class' category: #'Numeros-Naturales'!
DCCCXXVII class
	instanceVariableNames: ''!

!DCCCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXVIII.
	previous := DCCCXXVI.! !


!classDefinition: #DCCCXXVIII category: #'Numeros-Naturales'!
II subclass: #DCCCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXVIII class' category: #'Numeros-Naturales'!
DCCCXXVIII class
	instanceVariableNames: ''!

!DCCCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXIX.
	previous := DCCCXXVII.! !


!classDefinition: #DCCCXXX category: #'Numeros-Naturales'!
II subclass: #DCCCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXX class' category: #'Numeros-Naturales'!
DCCCXXX class
	instanceVariableNames: ''!

!DCCCXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXI.
	previous := DCCCXXIX.! !


!classDefinition: #DCCCXXXI category: #'Numeros-Naturales'!
II subclass: #DCCCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXI class' category: #'Numeros-Naturales'!
DCCCXXXI class
	instanceVariableNames: ''!

!DCCCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXII.
	previous := DCCCXXX.! !


!classDefinition: #DCCCXXXII category: #'Numeros-Naturales'!
II subclass: #DCCCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXII class' category: #'Numeros-Naturales'!
DCCCXXXII class
	instanceVariableNames: ''!

!DCCCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXIII.
	previous := DCCCXXXI.! !


!classDefinition: #DCCCXXXIII category: #'Numeros-Naturales'!
II subclass: #DCCCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXIII class' category: #'Numeros-Naturales'!
DCCCXXXIII class
	instanceVariableNames: ''!

!DCCCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXIV.
	previous := DCCCXXXII.! !


!classDefinition: #DCCCXXXIV category: #'Numeros-Naturales'!
II subclass: #DCCCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXIV class' category: #'Numeros-Naturales'!
DCCCXXXIV class
	instanceVariableNames: ''!

!DCCCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXV.
	previous := DCCCXXXIII.! !


!classDefinition: #DCCCXXXIX category: #'Numeros-Naturales'!
II subclass: #DCCCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXIX class' category: #'Numeros-Naturales'!
DCCCXXXIX class
	instanceVariableNames: ''!

!DCCCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXL.
	previous := DCCCXXXVIII.! !


!classDefinition: #DCCCXXXV category: #'Numeros-Naturales'!
II subclass: #DCCCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXV class' category: #'Numeros-Naturales'!
DCCCXXXV class
	instanceVariableNames: ''!

!DCCCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXVI.
	previous := DCCCXXXIV.! !


!classDefinition: #DCCCXXXVI category: #'Numeros-Naturales'!
II subclass: #DCCCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXVI class' category: #'Numeros-Naturales'!
DCCCXXXVI class
	instanceVariableNames: ''!

!DCCCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXVII.
	previous := DCCCXXXV.! !


!classDefinition: #DCCCXXXVII category: #'Numeros-Naturales'!
II subclass: #DCCCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXVII class' category: #'Numeros-Naturales'!
DCCCXXXVII class
	instanceVariableNames: ''!

!DCCCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXVIII.
	previous := DCCCXXXVI.! !


!classDefinition: #DCCCXXXVIII category: #'Numeros-Naturales'!
II subclass: #DCCCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXVIII class' category: #'Numeros-Naturales'!
DCCCXXXVIII class
	instanceVariableNames: ''!

!DCCCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXIX.
	previous := DCCCXXXVII.! !


!classDefinition: #DCCI category: #'Numeros-Naturales'!
II subclass: #DCCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCI class' category: #'Numeros-Naturales'!
DCCI class
	instanceVariableNames: ''!

!DCCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCII.
	previous := DCC.! !


!classDefinition: #DCCII category: #'Numeros-Naturales'!
II subclass: #DCCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCII class' category: #'Numeros-Naturales'!
DCCII class
	instanceVariableNames: ''!

!DCCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCIII.
	previous := DCCI.! !


!classDefinition: #DCCIII category: #'Numeros-Naturales'!
II subclass: #DCCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCIII class' category: #'Numeros-Naturales'!
DCCIII class
	instanceVariableNames: ''!

!DCCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCIV.
	previous := DCCII.! !


!classDefinition: #DCCIV category: #'Numeros-Naturales'!
II subclass: #DCCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCIV class' category: #'Numeros-Naturales'!
DCCIV class
	instanceVariableNames: ''!

!DCCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCV.
	previous := DCCIII.! !


!classDefinition: #DCCIX category: #'Numeros-Naturales'!
II subclass: #DCCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCIX class' category: #'Numeros-Naturales'!
DCCIX class
	instanceVariableNames: ''!

!DCCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCX.
	previous := DCCVIII.! !


!classDefinition: #DCCL category: #'Numeros-Naturales'!
II subclass: #DCCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCL class' category: #'Numeros-Naturales'!
DCCL class
	instanceVariableNames: ''!

!DCCL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLI.
	previous := DCCXLIX.! !


!classDefinition: #DCCLI category: #'Numeros-Naturales'!
II subclass: #DCCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLI class' category: #'Numeros-Naturales'!
DCCLI class
	instanceVariableNames: ''!

!DCCLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLII.
	previous := DCCL.! !


!classDefinition: #DCCLII category: #'Numeros-Naturales'!
II subclass: #DCCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLII class' category: #'Numeros-Naturales'!
DCCLII class
	instanceVariableNames: ''!

!DCCLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLIII.
	previous := DCCLI.! !


!classDefinition: #DCCLIII category: #'Numeros-Naturales'!
II subclass: #DCCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLIII class' category: #'Numeros-Naturales'!
DCCLIII class
	instanceVariableNames: ''!

!DCCLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLIV.
	previous := DCCLII.! !


!classDefinition: #DCCLIV category: #'Numeros-Naturales'!
II subclass: #DCCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLIV class' category: #'Numeros-Naturales'!
DCCLIV class
	instanceVariableNames: ''!

!DCCLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLV.
	previous := DCCLIII.! !


!classDefinition: #DCCLIX category: #'Numeros-Naturales'!
II subclass: #DCCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLIX class' category: #'Numeros-Naturales'!
DCCLIX class
	instanceVariableNames: ''!

!DCCLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLX.
	previous := DCCLVIII.! !


!classDefinition: #DCCLV category: #'Numeros-Naturales'!
II subclass: #DCCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLV class' category: #'Numeros-Naturales'!
DCCLV class
	instanceVariableNames: ''!

!DCCLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLVI.
	previous := DCCLIV.! !


!classDefinition: #DCCLVI category: #'Numeros-Naturales'!
II subclass: #DCCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLVI class' category: #'Numeros-Naturales'!
DCCLVI class
	instanceVariableNames: ''!

!DCCLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLVII.
	previous := DCCLV.! !


!classDefinition: #DCCLVII category: #'Numeros-Naturales'!
II subclass: #DCCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLVII class' category: #'Numeros-Naturales'!
DCCLVII class
	instanceVariableNames: ''!

!DCCLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLVIII.
	previous := DCCLVI.! !


!classDefinition: #DCCLVIII category: #'Numeros-Naturales'!
II subclass: #DCCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLVIII class' category: #'Numeros-Naturales'!
DCCLVIII class
	instanceVariableNames: ''!

!DCCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLIX.
	previous := DCCLVII.! !


!classDefinition: #DCCLX category: #'Numeros-Naturales'!
II subclass: #DCCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLX class' category: #'Numeros-Naturales'!
DCCLX class
	instanceVariableNames: ''!

!DCCLX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXI.
	previous := DCCLIX.! !


!classDefinition: #DCCLXI category: #'Numeros-Naturales'!
II subclass: #DCCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXI class' category: #'Numeros-Naturales'!
DCCLXI class
	instanceVariableNames: ''!

!DCCLXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXII.
	previous := DCCLX.! !


!classDefinition: #DCCLXII category: #'Numeros-Naturales'!
II subclass: #DCCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXII class' category: #'Numeros-Naturales'!
DCCLXII class
	instanceVariableNames: ''!

!DCCLXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXIII.
	previous := DCCLXI.! !


!classDefinition: #DCCLXIII category: #'Numeros-Naturales'!
II subclass: #DCCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXIII class' category: #'Numeros-Naturales'!
DCCLXIII class
	instanceVariableNames: ''!

!DCCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXIV.
	previous := DCCLXII.! !


!classDefinition: #DCCLXIV category: #'Numeros-Naturales'!
II subclass: #DCCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXIV class' category: #'Numeros-Naturales'!
DCCLXIV class
	instanceVariableNames: ''!

!DCCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXV.
	previous := DCCLXIII.! !


!classDefinition: #DCCLXIX category: #'Numeros-Naturales'!
II subclass: #DCCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXIX class' category: #'Numeros-Naturales'!
DCCLXIX class
	instanceVariableNames: ''!

!DCCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXX.
	previous := DCCLXVIII.! !


!classDefinition: #DCCLXV category: #'Numeros-Naturales'!
II subclass: #DCCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXV class' category: #'Numeros-Naturales'!
DCCLXV class
	instanceVariableNames: ''!

!DCCLXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXVI.
	previous := DCCLXIV.! !


!classDefinition: #DCCLXVI category: #'Numeros-Naturales'!
II subclass: #DCCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXVI class' category: #'Numeros-Naturales'!
DCCLXVI class
	instanceVariableNames: ''!

!DCCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXVII.
	previous := DCCLXV.! !


!classDefinition: #DCCLXVII category: #'Numeros-Naturales'!
II subclass: #DCCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXVII class' category: #'Numeros-Naturales'!
DCCLXVII class
	instanceVariableNames: ''!

!DCCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXVIII.
	previous := DCCLXVI.! !


!classDefinition: #DCCLXVIII category: #'Numeros-Naturales'!
II subclass: #DCCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXVIII class' category: #'Numeros-Naturales'!
DCCLXVIII class
	instanceVariableNames: ''!

!DCCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXIX.
	previous := DCCLXVII.! !


!classDefinition: #DCCLXX category: #'Numeros-Naturales'!
II subclass: #DCCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXX class' category: #'Numeros-Naturales'!
DCCLXX class
	instanceVariableNames: ''!

!DCCLXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXI.
	previous := DCCLXIX.! !


!classDefinition: #DCCLXXI category: #'Numeros-Naturales'!
II subclass: #DCCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXI class' category: #'Numeros-Naturales'!
DCCLXXI class
	instanceVariableNames: ''!

!DCCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXII.
	previous := DCCLXX.! !


!classDefinition: #DCCLXXII category: #'Numeros-Naturales'!
II subclass: #DCCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXII class' category: #'Numeros-Naturales'!
DCCLXXII class
	instanceVariableNames: ''!

!DCCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXIII.
	previous := DCCLXXI.! !


!classDefinition: #DCCLXXIII category: #'Numeros-Naturales'!
II subclass: #DCCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXIII class' category: #'Numeros-Naturales'!
DCCLXXIII class
	instanceVariableNames: ''!

!DCCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXIV.
	previous := DCCLXXII.! !


!classDefinition: #DCCLXXIV category: #'Numeros-Naturales'!
II subclass: #DCCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXIV class' category: #'Numeros-Naturales'!
DCCLXXIV class
	instanceVariableNames: ''!

!DCCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXV.
	previous := DCCLXXIII.! !


!classDefinition: #DCCLXXIX category: #'Numeros-Naturales'!
II subclass: #DCCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXIX class' category: #'Numeros-Naturales'!
DCCLXXIX class
	instanceVariableNames: ''!

!DCCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXX.
	previous := DCCLXXVIII.! !


!classDefinition: #DCCLXXV category: #'Numeros-Naturales'!
II subclass: #DCCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXV class' category: #'Numeros-Naturales'!
DCCLXXV class
	instanceVariableNames: ''!

!DCCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXVI.
	previous := DCCLXXIV.! !


!classDefinition: #DCCLXXVI category: #'Numeros-Naturales'!
II subclass: #DCCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXVI class' category: #'Numeros-Naturales'!
DCCLXXVI class
	instanceVariableNames: ''!

!DCCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXVII.
	previous := DCCLXXV.! !


!classDefinition: #DCCLXXVII category: #'Numeros-Naturales'!
II subclass: #DCCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXVII class' category: #'Numeros-Naturales'!
DCCLXXVII class
	instanceVariableNames: ''!

!DCCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXVIII.
	previous := DCCLXXVI.! !


!classDefinition: #DCCLXXVIII category: #'Numeros-Naturales'!
II subclass: #DCCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXVIII class' category: #'Numeros-Naturales'!
DCCLXXVIII class
	instanceVariableNames: ''!

!DCCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXIX.
	previous := DCCLXXVII.! !


!classDefinition: #DCCLXXX category: #'Numeros-Naturales'!
II subclass: #DCCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXX class' category: #'Numeros-Naturales'!
DCCLXXX class
	instanceVariableNames: ''!

!DCCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXI.
	previous := DCCLXXIX.! !


!classDefinition: #DCCLXXXI category: #'Numeros-Naturales'!
II subclass: #DCCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXI class' category: #'Numeros-Naturales'!
DCCLXXXI class
	instanceVariableNames: ''!

!DCCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXII.
	previous := DCCLXXX.! !


!classDefinition: #DCCLXXXII category: #'Numeros-Naturales'!
II subclass: #DCCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXII class' category: #'Numeros-Naturales'!
DCCLXXXII class
	instanceVariableNames: ''!

!DCCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXIII.
	previous := DCCLXXXI.! !


!classDefinition: #DCCLXXXIII category: #'Numeros-Naturales'!
II subclass: #DCCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXIII class' category: #'Numeros-Naturales'!
DCCLXXXIII class
	instanceVariableNames: ''!

!DCCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXIV.
	previous := DCCLXXXII.! !


!classDefinition: #DCCLXXXIV category: #'Numeros-Naturales'!
II subclass: #DCCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXIV class' category: #'Numeros-Naturales'!
DCCLXXXIV class
	instanceVariableNames: ''!

!DCCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXV.
	previous := DCCLXXXIII.! !


!classDefinition: #DCCLXXXIX category: #'Numeros-Naturales'!
II subclass: #DCCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXIX class' category: #'Numeros-Naturales'!
DCCLXXXIX class
	instanceVariableNames: ''!

!DCCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXC.
	previous := DCCLXXXVIII.! !


!classDefinition: #DCCLXXXV category: #'Numeros-Naturales'!
II subclass: #DCCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXV class' category: #'Numeros-Naturales'!
DCCLXXXV class
	instanceVariableNames: ''!

!DCCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXVI.
	previous := DCCLXXXIV.! !


!classDefinition: #DCCLXXXVI category: #'Numeros-Naturales'!
II subclass: #DCCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXVI class' category: #'Numeros-Naturales'!
DCCLXXXVI class
	instanceVariableNames: ''!

!DCCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXVII.
	previous := DCCLXXXV.! !


!classDefinition: #DCCLXXXVII category: #'Numeros-Naturales'!
II subclass: #DCCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXVII class' category: #'Numeros-Naturales'!
DCCLXXXVII class
	instanceVariableNames: ''!

!DCCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXVIII.
	previous := DCCLXXXVI.! !


!classDefinition: #DCCLXXXVIII category: #'Numeros-Naturales'!
II subclass: #DCCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXVIII class' category: #'Numeros-Naturales'!
DCCLXXXVIII class
	instanceVariableNames: ''!

!DCCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXIX.
	previous := DCCLXXXVII.! !


!classDefinition: #DCCV category: #'Numeros-Naturales'!
II subclass: #DCCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCV class' category: #'Numeros-Naturales'!
DCCV class
	instanceVariableNames: ''!

!DCCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCVI.
	previous := DCCIV.! !


!classDefinition: #DCCVI category: #'Numeros-Naturales'!
II subclass: #DCCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCVI class' category: #'Numeros-Naturales'!
DCCVI class
	instanceVariableNames: ''!

!DCCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCVII.
	previous := DCCV.! !


!classDefinition: #DCCVII category: #'Numeros-Naturales'!
II subclass: #DCCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCVII class' category: #'Numeros-Naturales'!
DCCVII class
	instanceVariableNames: ''!

!DCCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCVIII.
	previous := DCCVI.! !


!classDefinition: #DCCVIII category: #'Numeros-Naturales'!
II subclass: #DCCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCVIII class' category: #'Numeros-Naturales'!
DCCVIII class
	instanceVariableNames: ''!

!DCCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCIX.
	previous := DCCVII.! !


!classDefinition: #DCCX category: #'Numeros-Naturales'!
II subclass: #DCCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCX class' category: #'Numeros-Naturales'!
DCCX class
	instanceVariableNames: ''!

!DCCX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXI.
	previous := DCCIX.! !


!classDefinition: #DCCXC category: #'Numeros-Naturales'!
II subclass: #DCCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXC class' category: #'Numeros-Naturales'!
DCCXC class
	instanceVariableNames: ''!

!DCCXC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCI.
	previous := DCCLXXXIX.! !


!classDefinition: #DCCXCI category: #'Numeros-Naturales'!
II subclass: #DCCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCI class' category: #'Numeros-Naturales'!
DCCXCI class
	instanceVariableNames: ''!

!DCCXCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCII.
	previous := DCCXC.! !


!classDefinition: #DCCXCII category: #'Numeros-Naturales'!
II subclass: #DCCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCII class' category: #'Numeros-Naturales'!
DCCXCII class
	instanceVariableNames: ''!

!DCCXCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCIII.
	previous := DCCXCI.! !


!classDefinition: #DCCXCIII category: #'Numeros-Naturales'!
II subclass: #DCCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCIII class' category: #'Numeros-Naturales'!
DCCXCIII class
	instanceVariableNames: ''!

!DCCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCIV.
	previous := DCCXCII.! !


!classDefinition: #DCCXCIV category: #'Numeros-Naturales'!
II subclass: #DCCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCIV class' category: #'Numeros-Naturales'!
DCCXCIV class
	instanceVariableNames: ''!

!DCCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCV.
	previous := DCCXCIII.! !


!classDefinition: #DCCXCIX category: #'Numeros-Naturales'!
II subclass: #DCCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCIX class' category: #'Numeros-Naturales'!
DCCXCIX class
	instanceVariableNames: ''!

!DCCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCC.
	previous := DCCXCVIII.! !


!classDefinition: #DCCXCV category: #'Numeros-Naturales'!
II subclass: #DCCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCV class' category: #'Numeros-Naturales'!
DCCXCV class
	instanceVariableNames: ''!

!DCCXCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCVI.
	previous := DCCXCIV.! !


!classDefinition: #DCCXCVI category: #'Numeros-Naturales'!
II subclass: #DCCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCVI class' category: #'Numeros-Naturales'!
DCCXCVI class
	instanceVariableNames: ''!

!DCCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCVII.
	previous := DCCXCV.! !


!classDefinition: #DCCXCVII category: #'Numeros-Naturales'!
II subclass: #DCCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCVII class' category: #'Numeros-Naturales'!
DCCXCVII class
	instanceVariableNames: ''!

!DCCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCVIII.
	previous := DCCXCVI.! !


!classDefinition: #DCCXCVIII category: #'Numeros-Naturales'!
II subclass: #DCCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCVIII class' category: #'Numeros-Naturales'!
DCCXCVIII class
	instanceVariableNames: ''!

!DCCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCIX.
	previous := DCCXCVII.! !


!classDefinition: #DCCXI category: #'Numeros-Naturales'!
II subclass: #DCCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXI class' category: #'Numeros-Naturales'!
DCCXI class
	instanceVariableNames: ''!

!DCCXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXII.
	previous := DCCX.! !


!classDefinition: #DCCXII category: #'Numeros-Naturales'!
II subclass: #DCCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXII class' category: #'Numeros-Naturales'!
DCCXII class
	instanceVariableNames: ''!

!DCCXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXIII.
	previous := DCCXI.! !


!classDefinition: #DCCXIII category: #'Numeros-Naturales'!
II subclass: #DCCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXIII class' category: #'Numeros-Naturales'!
DCCXIII class
	instanceVariableNames: ''!

!DCCXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXIV.
	previous := DCCXII.! !


!classDefinition: #DCCXIV category: #'Numeros-Naturales'!
II subclass: #DCCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXIV class' category: #'Numeros-Naturales'!
DCCXIV class
	instanceVariableNames: ''!

!DCCXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXV.
	previous := DCCXIII.! !


!classDefinition: #DCCXIX category: #'Numeros-Naturales'!
II subclass: #DCCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXIX class' category: #'Numeros-Naturales'!
DCCXIX class
	instanceVariableNames: ''!

!DCCXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXX.
	previous := DCCXVIII.! !


!classDefinition: #DCCXL category: #'Numeros-Naturales'!
II subclass: #DCCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXL class' category: #'Numeros-Naturales'!
DCCXL class
	instanceVariableNames: ''!

!DCCXL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLI.
	previous := DCCXXXIX.! !


!classDefinition: #DCCXLI category: #'Numeros-Naturales'!
II subclass: #DCCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLI class' category: #'Numeros-Naturales'!
DCCXLI class
	instanceVariableNames: ''!

!DCCXLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLII.
	previous := DCCXL.! !


!classDefinition: #DCCXLII category: #'Numeros-Naturales'!
II subclass: #DCCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLII class' category: #'Numeros-Naturales'!
DCCXLII class
	instanceVariableNames: ''!

!DCCXLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLIII.
	previous := DCCXLI.! !


!classDefinition: #DCCXLIII category: #'Numeros-Naturales'!
II subclass: #DCCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLIII class' category: #'Numeros-Naturales'!
DCCXLIII class
	instanceVariableNames: ''!

!DCCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLIV.
	previous := DCCXLII.! !


!classDefinition: #DCCXLIV category: #'Numeros-Naturales'!
II subclass: #DCCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLIV class' category: #'Numeros-Naturales'!
DCCXLIV class
	instanceVariableNames: ''!

!DCCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLV.
	previous := DCCXLIII.! !


!classDefinition: #DCCXLIX category: #'Numeros-Naturales'!
II subclass: #DCCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLIX class' category: #'Numeros-Naturales'!
DCCXLIX class
	instanceVariableNames: ''!

!DCCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCL.
	previous := DCCXLVIII.! !


!classDefinition: #DCCXLV category: #'Numeros-Naturales'!
II subclass: #DCCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLV class' category: #'Numeros-Naturales'!
DCCXLV class
	instanceVariableNames: ''!

!DCCXLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLVI.
	previous := DCCXLIV.! !


!classDefinition: #DCCXLVI category: #'Numeros-Naturales'!
II subclass: #DCCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLVI class' category: #'Numeros-Naturales'!
DCCXLVI class
	instanceVariableNames: ''!

!DCCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLVII.
	previous := DCCXLV.! !


!classDefinition: #DCCXLVII category: #'Numeros-Naturales'!
II subclass: #DCCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLVII class' category: #'Numeros-Naturales'!
DCCXLVII class
	instanceVariableNames: ''!

!DCCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLVIII.
	previous := DCCXLVI.! !


!classDefinition: #DCCXLVIII category: #'Numeros-Naturales'!
II subclass: #DCCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLVIII class' category: #'Numeros-Naturales'!
DCCXLVIII class
	instanceVariableNames: ''!

!DCCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLIX.
	previous := DCCXLVII.! !


!classDefinition: #DCCXV category: #'Numeros-Naturales'!
II subclass: #DCCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXV class' category: #'Numeros-Naturales'!
DCCXV class
	instanceVariableNames: ''!

!DCCXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXVI.
	previous := DCCXIV.! !


!classDefinition: #DCCXVI category: #'Numeros-Naturales'!
II subclass: #DCCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXVI class' category: #'Numeros-Naturales'!
DCCXVI class
	instanceVariableNames: ''!

!DCCXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXVII.
	previous := DCCXV.! !


!classDefinition: #DCCXVII category: #'Numeros-Naturales'!
II subclass: #DCCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXVII class' category: #'Numeros-Naturales'!
DCCXVII class
	instanceVariableNames: ''!

!DCCXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXVIII.
	previous := DCCXVI.! !


!classDefinition: #DCCXVIII category: #'Numeros-Naturales'!
II subclass: #DCCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXVIII class' category: #'Numeros-Naturales'!
DCCXVIII class
	instanceVariableNames: ''!

!DCCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXIX.
	previous := DCCXVII.! !


!classDefinition: #DCCXX category: #'Numeros-Naturales'!
II subclass: #DCCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXX class' category: #'Numeros-Naturales'!
DCCXX class
	instanceVariableNames: ''!

!DCCXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXI.
	previous := DCCXIX.! !


!classDefinition: #DCCXXI category: #'Numeros-Naturales'!
II subclass: #DCCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXI class' category: #'Numeros-Naturales'!
DCCXXI class
	instanceVariableNames: ''!

!DCCXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXII.
	previous := DCCXX.! !


!classDefinition: #DCCXXII category: #'Numeros-Naturales'!
II subclass: #DCCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXII class' category: #'Numeros-Naturales'!
DCCXXII class
	instanceVariableNames: ''!

!DCCXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXIII.
	previous := DCCXXI.! !


!classDefinition: #DCCXXIII category: #'Numeros-Naturales'!
II subclass: #DCCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXIII class' category: #'Numeros-Naturales'!
DCCXXIII class
	instanceVariableNames: ''!

!DCCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXIV.
	previous := DCCXXII.! !


!classDefinition: #DCCXXIV category: #'Numeros-Naturales'!
II subclass: #DCCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXIV class' category: #'Numeros-Naturales'!
DCCXXIV class
	instanceVariableNames: ''!

!DCCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXV.
	previous := DCCXXIII.! !


!classDefinition: #DCCXXIX category: #'Numeros-Naturales'!
II subclass: #DCCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXIX class' category: #'Numeros-Naturales'!
DCCXXIX class
	instanceVariableNames: ''!

!DCCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXX.
	previous := DCCXXVIII.! !


!classDefinition: #DCCXXV category: #'Numeros-Naturales'!
II subclass: #DCCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXV class' category: #'Numeros-Naturales'!
DCCXXV class
	instanceVariableNames: ''!

!DCCXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXVI.
	previous := DCCXXIV.! !


!classDefinition: #DCCXXVI category: #'Numeros-Naturales'!
II subclass: #DCCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXVI class' category: #'Numeros-Naturales'!
DCCXXVI class
	instanceVariableNames: ''!

!DCCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXVII.
	previous := DCCXXV.! !


!classDefinition: #DCCXXVII category: #'Numeros-Naturales'!
II subclass: #DCCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXVII class' category: #'Numeros-Naturales'!
DCCXXVII class
	instanceVariableNames: ''!

!DCCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXVIII.
	previous := DCCXXVI.! !


!classDefinition: #DCCXXVIII category: #'Numeros-Naturales'!
II subclass: #DCCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXVIII class' category: #'Numeros-Naturales'!
DCCXXVIII class
	instanceVariableNames: ''!

!DCCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXIX.
	previous := DCCXXVII.! !


!classDefinition: #DCCXXX category: #'Numeros-Naturales'!
II subclass: #DCCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXX class' category: #'Numeros-Naturales'!
DCCXXX class
	instanceVariableNames: ''!

!DCCXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXI.
	previous := DCCXXIX.! !


!classDefinition: #DCCXXXI category: #'Numeros-Naturales'!
II subclass: #DCCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXI class' category: #'Numeros-Naturales'!
DCCXXXI class
	instanceVariableNames: ''!

!DCCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXII.
	previous := DCCXXX.! !


!classDefinition: #DCCXXXII category: #'Numeros-Naturales'!
II subclass: #DCCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXII class' category: #'Numeros-Naturales'!
DCCXXXII class
	instanceVariableNames: ''!

!DCCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXIII.
	previous := DCCXXXI.! !


!classDefinition: #DCCXXXIII category: #'Numeros-Naturales'!
II subclass: #DCCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXIII class' category: #'Numeros-Naturales'!
DCCXXXIII class
	instanceVariableNames: ''!

!DCCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXIV.
	previous := DCCXXXII.! !


!classDefinition: #DCCXXXIV category: #'Numeros-Naturales'!
II subclass: #DCCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXIV class' category: #'Numeros-Naturales'!
DCCXXXIV class
	instanceVariableNames: ''!

!DCCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXV.
	previous := DCCXXXIII.! !


!classDefinition: #DCCXXXIX category: #'Numeros-Naturales'!
II subclass: #DCCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXIX class' category: #'Numeros-Naturales'!
DCCXXXIX class
	instanceVariableNames: ''!

!DCCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXL.
	previous := DCCXXXVIII.! !


!classDefinition: #DCCXXXV category: #'Numeros-Naturales'!
II subclass: #DCCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXV class' category: #'Numeros-Naturales'!
DCCXXXV class
	instanceVariableNames: ''!

!DCCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXVI.
	previous := DCCXXXIV.! !


!classDefinition: #DCCXXXVI category: #'Numeros-Naturales'!
II subclass: #DCCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXVI class' category: #'Numeros-Naturales'!
DCCXXXVI class
	instanceVariableNames: ''!

!DCCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXVII.
	previous := DCCXXXV.! !


!classDefinition: #DCCXXXVII category: #'Numeros-Naturales'!
II subclass: #DCCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXVII class' category: #'Numeros-Naturales'!
DCCXXXVII class
	instanceVariableNames: ''!

!DCCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXVIII.
	previous := DCCXXXVI.! !


!classDefinition: #DCCXXXVIII category: #'Numeros-Naturales'!
II subclass: #DCCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXVIII class' category: #'Numeros-Naturales'!
DCCXXXVIII class
	instanceVariableNames: ''!

!DCCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXIX.
	previous := DCCXXXVII.! !


!classDefinition: #DCI category: #'Numeros-Naturales'!
II subclass: #DCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCI class' category: #'Numeros-Naturales'!
DCI class
	instanceVariableNames: ''!

!DCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCII.
	previous := DC.! !


!classDefinition: #DCII category: #'Numeros-Naturales'!
II subclass: #DCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCII class' category: #'Numeros-Naturales'!
DCII class
	instanceVariableNames: ''!

!DCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCIII.
	previous := DCI.! !


!classDefinition: #DCIII category: #'Numeros-Naturales'!
II subclass: #DCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCIII class' category: #'Numeros-Naturales'!
DCIII class
	instanceVariableNames: ''!

!DCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCIV.
	previous := DCII.! !


!classDefinition: #DCIV category: #'Numeros-Naturales'!
II subclass: #DCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCIV class' category: #'Numeros-Naturales'!
DCIV class
	instanceVariableNames: ''!

!DCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCV.
	previous := DCIII.! !


!classDefinition: #DCIX category: #'Numeros-Naturales'!
II subclass: #DCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCIX class' category: #'Numeros-Naturales'!
DCIX class
	instanceVariableNames: ''!

!DCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCX.
	previous := DCVIII.! !


!classDefinition: #DCL category: #'Numeros-Naturales'!
II subclass: #DCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCL class' category: #'Numeros-Naturales'!
DCL class
	instanceVariableNames: ''!

!DCL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLI.
	previous := DCXLIX.! !


!classDefinition: #DCLI category: #'Numeros-Naturales'!
II subclass: #DCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLI class' category: #'Numeros-Naturales'!
DCLI class
	instanceVariableNames: ''!

!DCLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLII.
	previous := DCL.! !


!classDefinition: #DCLII category: #'Numeros-Naturales'!
II subclass: #DCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLII class' category: #'Numeros-Naturales'!
DCLII class
	instanceVariableNames: ''!

!DCLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLIII.
	previous := DCLI.! !


!classDefinition: #DCLIII category: #'Numeros-Naturales'!
II subclass: #DCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLIII class' category: #'Numeros-Naturales'!
DCLIII class
	instanceVariableNames: ''!

!DCLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLIV.
	previous := DCLII.! !


!classDefinition: #DCLIV category: #'Numeros-Naturales'!
II subclass: #DCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLIV class' category: #'Numeros-Naturales'!
DCLIV class
	instanceVariableNames: ''!

!DCLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLV.
	previous := DCLIII.! !


!classDefinition: #DCLIX category: #'Numeros-Naturales'!
II subclass: #DCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLIX class' category: #'Numeros-Naturales'!
DCLIX class
	instanceVariableNames: ''!

!DCLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLX.
	previous := DCLVIII.! !


!classDefinition: #DCLV category: #'Numeros-Naturales'!
II subclass: #DCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLV class' category: #'Numeros-Naturales'!
DCLV class
	instanceVariableNames: ''!

!DCLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLVI.
	previous := DCLIV.! !


!classDefinition: #DCLVI category: #'Numeros-Naturales'!
II subclass: #DCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLVI class' category: #'Numeros-Naturales'!
DCLVI class
	instanceVariableNames: ''!

!DCLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLVII.
	previous := DCLV.! !


!classDefinition: #DCLVII category: #'Numeros-Naturales'!
II subclass: #DCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLVII class' category: #'Numeros-Naturales'!
DCLVII class
	instanceVariableNames: ''!

!DCLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLVIII.
	previous := DCLVI.! !


!classDefinition: #DCLVIII category: #'Numeros-Naturales'!
II subclass: #DCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLVIII class' category: #'Numeros-Naturales'!
DCLVIII class
	instanceVariableNames: ''!

!DCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLIX.
	previous := DCLVII.! !


!classDefinition: #DCLX category: #'Numeros-Naturales'!
II subclass: #DCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLX class' category: #'Numeros-Naturales'!
DCLX class
	instanceVariableNames: ''!

!DCLX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXI.
	previous := DCLIX.! !


!classDefinition: #DCLXI category: #'Numeros-Naturales'!
II subclass: #DCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXI class' category: #'Numeros-Naturales'!
DCLXI class
	instanceVariableNames: ''!

!DCLXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXII.
	previous := DCLX.! !


!classDefinition: #DCLXII category: #'Numeros-Naturales'!
II subclass: #DCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXII class' category: #'Numeros-Naturales'!
DCLXII class
	instanceVariableNames: ''!

!DCLXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXIII.
	previous := DCLXI.! !


!classDefinition: #DCLXIII category: #'Numeros-Naturales'!
II subclass: #DCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXIII class' category: #'Numeros-Naturales'!
DCLXIII class
	instanceVariableNames: ''!

!DCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXIV.
	previous := DCLXII.! !


!classDefinition: #DCLXIV category: #'Numeros-Naturales'!
II subclass: #DCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXIV class' category: #'Numeros-Naturales'!
DCLXIV class
	instanceVariableNames: ''!

!DCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXV.
	previous := DCLXIII.! !


!classDefinition: #DCLXIX category: #'Numeros-Naturales'!
II subclass: #DCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXIX class' category: #'Numeros-Naturales'!
DCLXIX class
	instanceVariableNames: ''!

!DCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXX.
	previous := DCLXVIII.! !


!classDefinition: #DCLXV category: #'Numeros-Naturales'!
II subclass: #DCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXV class' category: #'Numeros-Naturales'!
DCLXV class
	instanceVariableNames: ''!

!DCLXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXVI.
	previous := DCLXIV.! !


!classDefinition: #DCLXVI category: #'Numeros-Naturales'!
II subclass: #DCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXVI class' category: #'Numeros-Naturales'!
DCLXVI class
	instanceVariableNames: ''!

!DCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXVII.
	previous := DCLXV.! !


!classDefinition: #DCLXVII category: #'Numeros-Naturales'!
II subclass: #DCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXVII class' category: #'Numeros-Naturales'!
DCLXVII class
	instanceVariableNames: ''!

!DCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXVIII.
	previous := DCLXVI.! !


!classDefinition: #DCLXVIII category: #'Numeros-Naturales'!
II subclass: #DCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXVIII class' category: #'Numeros-Naturales'!
DCLXVIII class
	instanceVariableNames: ''!

!DCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXIX.
	previous := DCLXVII.! !


!classDefinition: #DCLXX category: #'Numeros-Naturales'!
II subclass: #DCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXX class' category: #'Numeros-Naturales'!
DCLXX class
	instanceVariableNames: ''!

!DCLXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXI.
	previous := DCLXIX.! !


!classDefinition: #DCLXXI category: #'Numeros-Naturales'!
II subclass: #DCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXI class' category: #'Numeros-Naturales'!
DCLXXI class
	instanceVariableNames: ''!

!DCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXII.
	previous := DCLXX.! !


!classDefinition: #DCLXXII category: #'Numeros-Naturales'!
II subclass: #DCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXII class' category: #'Numeros-Naturales'!
DCLXXII class
	instanceVariableNames: ''!

!DCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXIII.
	previous := DCLXXI.! !


!classDefinition: #DCLXXIII category: #'Numeros-Naturales'!
II subclass: #DCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXIII class' category: #'Numeros-Naturales'!
DCLXXIII class
	instanceVariableNames: ''!

!DCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXIV.
	previous := DCLXXII.! !


!classDefinition: #DCLXXIV category: #'Numeros-Naturales'!
II subclass: #DCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXIV class' category: #'Numeros-Naturales'!
DCLXXIV class
	instanceVariableNames: ''!

!DCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXV.
	previous := DCLXXIII.! !


!classDefinition: #DCLXXIX category: #'Numeros-Naturales'!
II subclass: #DCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXIX class' category: #'Numeros-Naturales'!
DCLXXIX class
	instanceVariableNames: ''!

!DCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXX.
	previous := DCLXXVIII.! !


!classDefinition: #DCLXXV category: #'Numeros-Naturales'!
II subclass: #DCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXV class' category: #'Numeros-Naturales'!
DCLXXV class
	instanceVariableNames: ''!

!DCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXVI.
	previous := DCLXXIV.! !


!classDefinition: #DCLXXVI category: #'Numeros-Naturales'!
II subclass: #DCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXVI class' category: #'Numeros-Naturales'!
DCLXXVI class
	instanceVariableNames: ''!

!DCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXVII.
	previous := DCLXXV.! !


!classDefinition: #DCLXXVII category: #'Numeros-Naturales'!
II subclass: #DCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXVII class' category: #'Numeros-Naturales'!
DCLXXVII class
	instanceVariableNames: ''!

!DCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXVIII.
	previous := DCLXXVI.! !


!classDefinition: #DCLXXVIII category: #'Numeros-Naturales'!
II subclass: #DCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXVIII class' category: #'Numeros-Naturales'!
DCLXXVIII class
	instanceVariableNames: ''!

!DCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXIX.
	previous := DCLXXVII.! !


!classDefinition: #DCLXXX category: #'Numeros-Naturales'!
II subclass: #DCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXX class' category: #'Numeros-Naturales'!
DCLXXX class
	instanceVariableNames: ''!

!DCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXI.
	previous := DCLXXIX.! !


!classDefinition: #DCLXXXI category: #'Numeros-Naturales'!
II subclass: #DCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXI class' category: #'Numeros-Naturales'!
DCLXXXI class
	instanceVariableNames: ''!

!DCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXII.
	previous := DCLXXX.! !


!classDefinition: #DCLXXXII category: #'Numeros-Naturales'!
II subclass: #DCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXII class' category: #'Numeros-Naturales'!
DCLXXXII class
	instanceVariableNames: ''!

!DCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXIII.
	previous := DCLXXXI.! !


!classDefinition: #DCLXXXIII category: #'Numeros-Naturales'!
II subclass: #DCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXIII class' category: #'Numeros-Naturales'!
DCLXXXIII class
	instanceVariableNames: ''!

!DCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXIV.
	previous := DCLXXXII.! !


!classDefinition: #DCLXXXIV category: #'Numeros-Naturales'!
II subclass: #DCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXIV class' category: #'Numeros-Naturales'!
DCLXXXIV class
	instanceVariableNames: ''!

!DCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXV.
	previous := DCLXXXIII.! !


!classDefinition: #DCLXXXIX category: #'Numeros-Naturales'!
II subclass: #DCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXIX class' category: #'Numeros-Naturales'!
DCLXXXIX class
	instanceVariableNames: ''!

!DCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXC.
	previous := DCLXXXVIII.! !


!classDefinition: #DCLXXXV category: #'Numeros-Naturales'!
II subclass: #DCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXV class' category: #'Numeros-Naturales'!
DCLXXXV class
	instanceVariableNames: ''!

!DCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXVI.
	previous := DCLXXXIV.! !


!classDefinition: #DCLXXXVI category: #'Numeros-Naturales'!
II subclass: #DCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXVI class' category: #'Numeros-Naturales'!
DCLXXXVI class
	instanceVariableNames: ''!

!DCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXVII.
	previous := DCLXXXV.! !


!classDefinition: #DCLXXXVII category: #'Numeros-Naturales'!
II subclass: #DCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXVII class' category: #'Numeros-Naturales'!
DCLXXXVII class
	instanceVariableNames: ''!

!DCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXVIII.
	previous := DCLXXXVI.! !


!classDefinition: #DCLXXXVIII category: #'Numeros-Naturales'!
II subclass: #DCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXVIII class' category: #'Numeros-Naturales'!
DCLXXXVIII class
	instanceVariableNames: ''!

!DCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXIX.
	previous := DCLXXXVII.! !


!classDefinition: #DCV category: #'Numeros-Naturales'!
II subclass: #DCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCV class' category: #'Numeros-Naturales'!
DCV class
	instanceVariableNames: ''!

!DCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCVI.
	previous := DCIV.! !


!classDefinition: #DCVI category: #'Numeros-Naturales'!
II subclass: #DCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCVI class' category: #'Numeros-Naturales'!
DCVI class
	instanceVariableNames: ''!

!DCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCVII.
	previous := DCV.! !


!classDefinition: #DCVII category: #'Numeros-Naturales'!
II subclass: #DCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCVII class' category: #'Numeros-Naturales'!
DCVII class
	instanceVariableNames: ''!

!DCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCVIII.
	previous := DCVI.! !


!classDefinition: #DCVIII category: #'Numeros-Naturales'!
II subclass: #DCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCVIII class' category: #'Numeros-Naturales'!
DCVIII class
	instanceVariableNames: ''!

!DCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCIX.
	previous := DCVII.! !


!classDefinition: #DCX category: #'Numeros-Naturales'!
II subclass: #DCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCX class' category: #'Numeros-Naturales'!
DCX class
	instanceVariableNames: ''!

!DCX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXI.
	previous := DCIX.! !


!classDefinition: #DCXC category: #'Numeros-Naturales'!
II subclass: #DCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXC class' category: #'Numeros-Naturales'!
DCXC class
	instanceVariableNames: ''!

!DCXC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCI.
	previous := DCLXXXIX.! !


!classDefinition: #DCXCI category: #'Numeros-Naturales'!
II subclass: #DCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCI class' category: #'Numeros-Naturales'!
DCXCI class
	instanceVariableNames: ''!

!DCXCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCII.
	previous := DCXC.! !


!classDefinition: #DCXCII category: #'Numeros-Naturales'!
II subclass: #DCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCII class' category: #'Numeros-Naturales'!
DCXCII class
	instanceVariableNames: ''!

!DCXCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCIII.
	previous := DCXCI.! !


!classDefinition: #DCXCIII category: #'Numeros-Naturales'!
II subclass: #DCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCIII class' category: #'Numeros-Naturales'!
DCXCIII class
	instanceVariableNames: ''!

!DCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCIV.
	previous := DCXCII.! !


!classDefinition: #DCXCIV category: #'Numeros-Naturales'!
II subclass: #DCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCIV class' category: #'Numeros-Naturales'!
DCXCIV class
	instanceVariableNames: ''!

!DCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCV.
	previous := DCXCIII.! !


!classDefinition: #DCXCIX category: #'Numeros-Naturales'!
II subclass: #DCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCIX class' category: #'Numeros-Naturales'!
DCXCIX class
	instanceVariableNames: ''!

!DCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCC.
	previous := DCXCVIII.! !


!classDefinition: #DCXCV category: #'Numeros-Naturales'!
II subclass: #DCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCV class' category: #'Numeros-Naturales'!
DCXCV class
	instanceVariableNames: ''!

!DCXCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCVI.
	previous := DCXCIV.! !


!classDefinition: #DCXCVI category: #'Numeros-Naturales'!
II subclass: #DCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCVI class' category: #'Numeros-Naturales'!
DCXCVI class
	instanceVariableNames: ''!

!DCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCVII.
	previous := DCXCV.! !


!classDefinition: #DCXCVII category: #'Numeros-Naturales'!
II subclass: #DCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCVII class' category: #'Numeros-Naturales'!
DCXCVII class
	instanceVariableNames: ''!

!DCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCVIII.
	previous := DCXCVI.! !


!classDefinition: #DCXCVIII category: #'Numeros-Naturales'!
II subclass: #DCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCVIII class' category: #'Numeros-Naturales'!
DCXCVIII class
	instanceVariableNames: ''!

!DCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCIX.
	previous := DCXCVII.! !


!classDefinition: #DCXI category: #'Numeros-Naturales'!
II subclass: #DCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXI class' category: #'Numeros-Naturales'!
DCXI class
	instanceVariableNames: ''!

!DCXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXII.
	previous := DCX.! !


!classDefinition: #DCXII category: #'Numeros-Naturales'!
II subclass: #DCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXII class' category: #'Numeros-Naturales'!
DCXII class
	instanceVariableNames: ''!

!DCXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXIII.
	previous := DCXI.! !


!classDefinition: #DCXIII category: #'Numeros-Naturales'!
II subclass: #DCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXIII class' category: #'Numeros-Naturales'!
DCXIII class
	instanceVariableNames: ''!

!DCXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXIV.
	previous := DCXII.! !


!classDefinition: #DCXIV category: #'Numeros-Naturales'!
II subclass: #DCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXIV class' category: #'Numeros-Naturales'!
DCXIV class
	instanceVariableNames: ''!

!DCXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXV.
	previous := DCXIII.! !


!classDefinition: #DCXIX category: #'Numeros-Naturales'!
II subclass: #DCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXIX class' category: #'Numeros-Naturales'!
DCXIX class
	instanceVariableNames: ''!

!DCXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXX.
	previous := DCXVIII.! !


!classDefinition: #DCXL category: #'Numeros-Naturales'!
II subclass: #DCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXL class' category: #'Numeros-Naturales'!
DCXL class
	instanceVariableNames: ''!

!DCXL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLI.
	previous := DCXXXIX.! !


!classDefinition: #DCXLI category: #'Numeros-Naturales'!
II subclass: #DCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLI class' category: #'Numeros-Naturales'!
DCXLI class
	instanceVariableNames: ''!

!DCXLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLII.
	previous := DCXL.! !


!classDefinition: #DCXLII category: #'Numeros-Naturales'!
II subclass: #DCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLII class' category: #'Numeros-Naturales'!
DCXLII class
	instanceVariableNames: ''!

!DCXLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLIII.
	previous := DCXLI.! !


!classDefinition: #DCXLIII category: #'Numeros-Naturales'!
II subclass: #DCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLIII class' category: #'Numeros-Naturales'!
DCXLIII class
	instanceVariableNames: ''!

!DCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLIV.
	previous := DCXLII.! !


!classDefinition: #DCXLIV category: #'Numeros-Naturales'!
II subclass: #DCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLIV class' category: #'Numeros-Naturales'!
DCXLIV class
	instanceVariableNames: ''!

!DCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLV.
	previous := DCXLIII.! !


!classDefinition: #DCXLIX category: #'Numeros-Naturales'!
II subclass: #DCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLIX class' category: #'Numeros-Naturales'!
DCXLIX class
	instanceVariableNames: ''!

!DCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCL.
	previous := DCXLVIII.! !


!classDefinition: #DCXLV category: #'Numeros-Naturales'!
II subclass: #DCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLV class' category: #'Numeros-Naturales'!
DCXLV class
	instanceVariableNames: ''!

!DCXLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLVI.
	previous := DCXLIV.! !


!classDefinition: #DCXLVI category: #'Numeros-Naturales'!
II subclass: #DCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLVI class' category: #'Numeros-Naturales'!
DCXLVI class
	instanceVariableNames: ''!

!DCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLVII.
	previous := DCXLV.! !


!classDefinition: #DCXLVII category: #'Numeros-Naturales'!
II subclass: #DCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLVII class' category: #'Numeros-Naturales'!
DCXLVII class
	instanceVariableNames: ''!

!DCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLVIII.
	previous := DCXLVI.! !


!classDefinition: #DCXLVIII category: #'Numeros-Naturales'!
II subclass: #DCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLVIII class' category: #'Numeros-Naturales'!
DCXLVIII class
	instanceVariableNames: ''!

!DCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLIX.
	previous := DCXLVII.! !


!classDefinition: #DCXV category: #'Numeros-Naturales'!
II subclass: #DCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXV class' category: #'Numeros-Naturales'!
DCXV class
	instanceVariableNames: ''!

!DCXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXVI.
	previous := DCXIV.! !


!classDefinition: #DCXVI category: #'Numeros-Naturales'!
II subclass: #DCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXVI class' category: #'Numeros-Naturales'!
DCXVI class
	instanceVariableNames: ''!

!DCXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXVII.
	previous := DCXV.! !


!classDefinition: #DCXVII category: #'Numeros-Naturales'!
II subclass: #DCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXVII class' category: #'Numeros-Naturales'!
DCXVII class
	instanceVariableNames: ''!

!DCXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXVIII.
	previous := DCXVI.! !


!classDefinition: #DCXVIII category: #'Numeros-Naturales'!
II subclass: #DCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXVIII class' category: #'Numeros-Naturales'!
DCXVIII class
	instanceVariableNames: ''!

!DCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXIX.
	previous := DCXVII.! !


!classDefinition: #DCXX category: #'Numeros-Naturales'!
II subclass: #DCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXX class' category: #'Numeros-Naturales'!
DCXX class
	instanceVariableNames: ''!

!DCXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXI.
	previous := DCXIX.! !


!classDefinition: #DCXXI category: #'Numeros-Naturales'!
II subclass: #DCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXI class' category: #'Numeros-Naturales'!
DCXXI class
	instanceVariableNames: ''!

!DCXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXII.
	previous := DCXX.! !


!classDefinition: #DCXXII category: #'Numeros-Naturales'!
II subclass: #DCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXII class' category: #'Numeros-Naturales'!
DCXXII class
	instanceVariableNames: ''!

!DCXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXIII.
	previous := DCXXI.! !


!classDefinition: #DCXXIII category: #'Numeros-Naturales'!
II subclass: #DCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXIII class' category: #'Numeros-Naturales'!
DCXXIII class
	instanceVariableNames: ''!

!DCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXIV.
	previous := DCXXII.! !


!classDefinition: #DCXXIV category: #'Numeros-Naturales'!
II subclass: #DCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXIV class' category: #'Numeros-Naturales'!
DCXXIV class
	instanceVariableNames: ''!

!DCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXV.
	previous := DCXXIII.! !


!classDefinition: #DCXXIX category: #'Numeros-Naturales'!
II subclass: #DCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXIX class' category: #'Numeros-Naturales'!
DCXXIX class
	instanceVariableNames: ''!

!DCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXX.
	previous := DCXXVIII.! !


!classDefinition: #DCXXV category: #'Numeros-Naturales'!
II subclass: #DCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXV class' category: #'Numeros-Naturales'!
DCXXV class
	instanceVariableNames: ''!

!DCXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXVI.
	previous := DCXXIV.! !


!classDefinition: #DCXXVI category: #'Numeros-Naturales'!
II subclass: #DCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXVI class' category: #'Numeros-Naturales'!
DCXXVI class
	instanceVariableNames: ''!

!DCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXVII.
	previous := DCXXV.! !


!classDefinition: #DCXXVII category: #'Numeros-Naturales'!
II subclass: #DCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXVII class' category: #'Numeros-Naturales'!
DCXXVII class
	instanceVariableNames: ''!

!DCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXVIII.
	previous := DCXXVI.! !


!classDefinition: #DCXXVIII category: #'Numeros-Naturales'!
II subclass: #DCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXVIII class' category: #'Numeros-Naturales'!
DCXXVIII class
	instanceVariableNames: ''!

!DCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXIX.
	previous := DCXXVII.! !


!classDefinition: #DCXXX category: #'Numeros-Naturales'!
II subclass: #DCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXX class' category: #'Numeros-Naturales'!
DCXXX class
	instanceVariableNames: ''!

!DCXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXI.
	previous := DCXXIX.! !


!classDefinition: #DCXXXI category: #'Numeros-Naturales'!
II subclass: #DCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXI class' category: #'Numeros-Naturales'!
DCXXXI class
	instanceVariableNames: ''!

!DCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXII.
	previous := DCXXX.! !


!classDefinition: #DCXXXII category: #'Numeros-Naturales'!
II subclass: #DCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXII class' category: #'Numeros-Naturales'!
DCXXXII class
	instanceVariableNames: ''!

!DCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXIII.
	previous := DCXXXI.! !


!classDefinition: #DCXXXIII category: #'Numeros-Naturales'!
II subclass: #DCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXIII class' category: #'Numeros-Naturales'!
DCXXXIII class
	instanceVariableNames: ''!

!DCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXIV.
	previous := DCXXXII.! !


!classDefinition: #DCXXXIV category: #'Numeros-Naturales'!
II subclass: #DCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXIV class' category: #'Numeros-Naturales'!
DCXXXIV class
	instanceVariableNames: ''!

!DCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXV.
	previous := DCXXXIII.! !


!classDefinition: #DCXXXIX category: #'Numeros-Naturales'!
II subclass: #DCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXIX class' category: #'Numeros-Naturales'!
DCXXXIX class
	instanceVariableNames: ''!

!DCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXL.
	previous := DCXXXVIII.! !


!classDefinition: #DCXXXV category: #'Numeros-Naturales'!
II subclass: #DCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXV class' category: #'Numeros-Naturales'!
DCXXXV class
	instanceVariableNames: ''!

!DCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXVI.
	previous := DCXXXIV.! !


!classDefinition: #DCXXXVI category: #'Numeros-Naturales'!
II subclass: #DCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXVI class' category: #'Numeros-Naturales'!
DCXXXVI class
	instanceVariableNames: ''!

!DCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXVII.
	previous := DCXXXV.! !


!classDefinition: #DCXXXVII category: #'Numeros-Naturales'!
II subclass: #DCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXVII class' category: #'Numeros-Naturales'!
DCXXXVII class
	instanceVariableNames: ''!

!DCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXVIII.
	previous := DCXXXVI.! !


!classDefinition: #DCXXXVIII category: #'Numeros-Naturales'!
II subclass: #DCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXVIII class' category: #'Numeros-Naturales'!
DCXXXVIII class
	instanceVariableNames: ''!

!DCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXIX.
	previous := DCXXXVII.! !


!classDefinition: #DI category: #'Numeros-Naturales'!
II subclass: #DI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DI class' category: #'Numeros-Naturales'!
DI class
	instanceVariableNames: ''!

!DI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DII.
	previous := D.! !


!classDefinition: #DII category: #'Numeros-Naturales'!
II subclass: #DII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DII class' category: #'Numeros-Naturales'!
DII class
	instanceVariableNames: ''!

!DII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DIII.
	previous := DI.! !


!classDefinition: #DIII category: #'Numeros-Naturales'!
II subclass: #DIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DIII class' category: #'Numeros-Naturales'!
DIII class
	instanceVariableNames: ''!

!DIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DIV.
	previous := DII.! !


!classDefinition: #DIV category: #'Numeros-Naturales'!
II subclass: #DIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DIV class' category: #'Numeros-Naturales'!
DIV class
	instanceVariableNames: ''!

!DIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DV.
	previous := DIII.! !


!classDefinition: #DIX category: #'Numeros-Naturales'!
II subclass: #DIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DIX class' category: #'Numeros-Naturales'!
DIX class
	instanceVariableNames: ''!

!DIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DX.
	previous := DVIII.! !


!classDefinition: #DL category: #'Numeros-Naturales'!
II subclass: #DL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DL class' category: #'Numeros-Naturales'!
DL class
	instanceVariableNames: ''!

!DL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLI.
	previous := DXLIX.! !


!classDefinition: #DLI category: #'Numeros-Naturales'!
II subclass: #DLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLI class' category: #'Numeros-Naturales'!
DLI class
	instanceVariableNames: ''!

!DLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLII.
	previous := DL.! !


!classDefinition: #DLII category: #'Numeros-Naturales'!
II subclass: #DLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLII class' category: #'Numeros-Naturales'!
DLII class
	instanceVariableNames: ''!

!DLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLIII.
	previous := DLI.! !


!classDefinition: #DLIII category: #'Numeros-Naturales'!
II subclass: #DLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLIII class' category: #'Numeros-Naturales'!
DLIII class
	instanceVariableNames: ''!

!DLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLIV.
	previous := DLII.! !


!classDefinition: #DLIV category: #'Numeros-Naturales'!
II subclass: #DLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLIV class' category: #'Numeros-Naturales'!
DLIV class
	instanceVariableNames: ''!

!DLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLV.
	previous := DLIII.! !


!classDefinition: #DLIX category: #'Numeros-Naturales'!
II subclass: #DLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLIX class' category: #'Numeros-Naturales'!
DLIX class
	instanceVariableNames: ''!

!DLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLX.
	previous := DLVIII.! !


!classDefinition: #DLV category: #'Numeros-Naturales'!
II subclass: #DLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLV class' category: #'Numeros-Naturales'!
DLV class
	instanceVariableNames: ''!

!DLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLVI.
	previous := DLIV.! !


!classDefinition: #DLVI category: #'Numeros-Naturales'!
II subclass: #DLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLVI class' category: #'Numeros-Naturales'!
DLVI class
	instanceVariableNames: ''!

!DLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLVII.
	previous := DLV.! !


!classDefinition: #DLVII category: #'Numeros-Naturales'!
II subclass: #DLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLVII class' category: #'Numeros-Naturales'!
DLVII class
	instanceVariableNames: ''!

!DLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLVIII.
	previous := DLVI.! !


!classDefinition: #DLVIII category: #'Numeros-Naturales'!
II subclass: #DLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLVIII class' category: #'Numeros-Naturales'!
DLVIII class
	instanceVariableNames: ''!

!DLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLIX.
	previous := DLVII.! !


!classDefinition: #DLX category: #'Numeros-Naturales'!
II subclass: #DLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLX class' category: #'Numeros-Naturales'!
DLX class
	instanceVariableNames: ''!

!DLX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXI.
	previous := DLIX.! !


!classDefinition: #DLXI category: #'Numeros-Naturales'!
II subclass: #DLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXI class' category: #'Numeros-Naturales'!
DLXI class
	instanceVariableNames: ''!

!DLXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXII.
	previous := DLX.! !


!classDefinition: #DLXII category: #'Numeros-Naturales'!
II subclass: #DLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXII class' category: #'Numeros-Naturales'!
DLXII class
	instanceVariableNames: ''!

!DLXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXIII.
	previous := DLXI.! !


!classDefinition: #DLXIII category: #'Numeros-Naturales'!
II subclass: #DLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXIII class' category: #'Numeros-Naturales'!
DLXIII class
	instanceVariableNames: ''!

!DLXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXIV.
	previous := DLXII.! !


!classDefinition: #DLXIV category: #'Numeros-Naturales'!
II subclass: #DLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXIV class' category: #'Numeros-Naturales'!
DLXIV class
	instanceVariableNames: ''!

!DLXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXV.
	previous := DLXIII.! !


!classDefinition: #DLXIX category: #'Numeros-Naturales'!
II subclass: #DLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXIX class' category: #'Numeros-Naturales'!
DLXIX class
	instanceVariableNames: ''!

!DLXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXX.
	previous := DLXVIII.! !


!classDefinition: #DLXV category: #'Numeros-Naturales'!
II subclass: #DLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXV class' category: #'Numeros-Naturales'!
DLXV class
	instanceVariableNames: ''!

!DLXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXVI.
	previous := DLXIV.! !


!classDefinition: #DLXVI category: #'Numeros-Naturales'!
II subclass: #DLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXVI class' category: #'Numeros-Naturales'!
DLXVI class
	instanceVariableNames: ''!

!DLXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXVII.
	previous := DLXV.! !


!classDefinition: #DLXVII category: #'Numeros-Naturales'!
II subclass: #DLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXVII class' category: #'Numeros-Naturales'!
DLXVII class
	instanceVariableNames: ''!

!DLXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXVIII.
	previous := DLXVI.! !


!classDefinition: #DLXVIII category: #'Numeros-Naturales'!
II subclass: #DLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXVIII class' category: #'Numeros-Naturales'!
DLXVIII class
	instanceVariableNames: ''!

!DLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXIX.
	previous := DLXVII.! !


!classDefinition: #DLXX category: #'Numeros-Naturales'!
II subclass: #DLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXX class' category: #'Numeros-Naturales'!
DLXX class
	instanceVariableNames: ''!

!DLXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXI.
	previous := DLXIX.! !


!classDefinition: #DLXXI category: #'Numeros-Naturales'!
II subclass: #DLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXI class' category: #'Numeros-Naturales'!
DLXXI class
	instanceVariableNames: ''!

!DLXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXII.
	previous := DLXX.! !


!classDefinition: #DLXXII category: #'Numeros-Naturales'!
II subclass: #DLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXII class' category: #'Numeros-Naturales'!
DLXXII class
	instanceVariableNames: ''!

!DLXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXIII.
	previous := DLXXI.! !


!classDefinition: #DLXXIII category: #'Numeros-Naturales'!
II subclass: #DLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXIII class' category: #'Numeros-Naturales'!
DLXXIII class
	instanceVariableNames: ''!

!DLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXIV.
	previous := DLXXII.! !


!classDefinition: #DLXXIV category: #'Numeros-Naturales'!
II subclass: #DLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXIV class' category: #'Numeros-Naturales'!
DLXXIV class
	instanceVariableNames: ''!

!DLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXV.
	previous := DLXXIII.! !


!classDefinition: #DLXXIX category: #'Numeros-Naturales'!
II subclass: #DLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXIX class' category: #'Numeros-Naturales'!
DLXXIX class
	instanceVariableNames: ''!

!DLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXX.
	previous := DLXXVIII.! !


!classDefinition: #DLXXV category: #'Numeros-Naturales'!
II subclass: #DLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXV class' category: #'Numeros-Naturales'!
DLXXV class
	instanceVariableNames: ''!

!DLXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXVI.
	previous := DLXXIV.! !


!classDefinition: #DLXXVI category: #'Numeros-Naturales'!
II subclass: #DLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXVI class' category: #'Numeros-Naturales'!
DLXXVI class
	instanceVariableNames: ''!

!DLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXVII.
	previous := DLXXV.! !


!classDefinition: #DLXXVII category: #'Numeros-Naturales'!
II subclass: #DLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXVII class' category: #'Numeros-Naturales'!
DLXXVII class
	instanceVariableNames: ''!

!DLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXVIII.
	previous := DLXXVI.! !


!classDefinition: #DLXXVIII category: #'Numeros-Naturales'!
II subclass: #DLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXVIII class' category: #'Numeros-Naturales'!
DLXXVIII class
	instanceVariableNames: ''!

!DLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXIX.
	previous := DLXXVII.! !


!classDefinition: #DLXXX category: #'Numeros-Naturales'!
II subclass: #DLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXX class' category: #'Numeros-Naturales'!
DLXXX class
	instanceVariableNames: ''!

!DLXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXI.
	previous := DLXXIX.! !


!classDefinition: #DLXXXI category: #'Numeros-Naturales'!
II subclass: #DLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXI class' category: #'Numeros-Naturales'!
DLXXXI class
	instanceVariableNames: ''!

!DLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXII.
	previous := DLXXX.! !


!classDefinition: #DLXXXII category: #'Numeros-Naturales'!
II subclass: #DLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXII class' category: #'Numeros-Naturales'!
DLXXXII class
	instanceVariableNames: ''!

!DLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXIII.
	previous := DLXXXI.! !


!classDefinition: #DLXXXIII category: #'Numeros-Naturales'!
II subclass: #DLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXIII class' category: #'Numeros-Naturales'!
DLXXXIII class
	instanceVariableNames: ''!

!DLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXIV.
	previous := DLXXXII.! !


!classDefinition: #DLXXXIV category: #'Numeros-Naturales'!
II subclass: #DLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXIV class' category: #'Numeros-Naturales'!
DLXXXIV class
	instanceVariableNames: ''!

!DLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXV.
	previous := DLXXXIII.! !


!classDefinition: #DLXXXIX category: #'Numeros-Naturales'!
II subclass: #DLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXIX class' category: #'Numeros-Naturales'!
DLXXXIX class
	instanceVariableNames: ''!

!DLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXC.
	previous := DLXXXVIII.! !


!classDefinition: #DLXXXV category: #'Numeros-Naturales'!
II subclass: #DLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXV class' category: #'Numeros-Naturales'!
DLXXXV class
	instanceVariableNames: ''!

!DLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXVI.
	previous := DLXXXIV.! !


!classDefinition: #DLXXXVI category: #'Numeros-Naturales'!
II subclass: #DLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXVI class' category: #'Numeros-Naturales'!
DLXXXVI class
	instanceVariableNames: ''!

!DLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXVII.
	previous := DLXXXV.! !


!classDefinition: #DLXXXVII category: #'Numeros-Naturales'!
II subclass: #DLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXVII class' category: #'Numeros-Naturales'!
DLXXXVII class
	instanceVariableNames: ''!

!DLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXVIII.
	previous := DLXXXVI.! !


!classDefinition: #DLXXXVIII category: #'Numeros-Naturales'!
II subclass: #DLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXVIII class' category: #'Numeros-Naturales'!
DLXXXVIII class
	instanceVariableNames: ''!

!DLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXIX.
	previous := DLXXXVII.! !


!classDefinition: #DV category: #'Numeros-Naturales'!
II subclass: #DV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DV class' category: #'Numeros-Naturales'!
DV class
	instanceVariableNames: ''!

!DV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DVI.
	previous := DIV.! !


!classDefinition: #DVI category: #'Numeros-Naturales'!
II subclass: #DVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DVI class' category: #'Numeros-Naturales'!
DVI class
	instanceVariableNames: ''!

!DVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DVII.
	previous := DV.! !


!classDefinition: #DVII category: #'Numeros-Naturales'!
II subclass: #DVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DVII class' category: #'Numeros-Naturales'!
DVII class
	instanceVariableNames: ''!

!DVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DVIII.
	previous := DVI.! !


!classDefinition: #DVIII category: #'Numeros-Naturales'!
II subclass: #DVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DVIII class' category: #'Numeros-Naturales'!
DVIII class
	instanceVariableNames: ''!

!DVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DIX.
	previous := DVII.! !


!classDefinition: #DX category: #'Numeros-Naturales'!
II subclass: #DX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DX class' category: #'Numeros-Naturales'!
DX class
	instanceVariableNames: ''!

!DX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXI.
	previous := DIX.! !


!classDefinition: #DXC category: #'Numeros-Naturales'!
II subclass: #DXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXC class' category: #'Numeros-Naturales'!
DXC class
	instanceVariableNames: ''!

!DXC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCI.
	previous := DLXXXIX.! !


!classDefinition: #DXCI category: #'Numeros-Naturales'!
II subclass: #DXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCI class' category: #'Numeros-Naturales'!
DXCI class
	instanceVariableNames: ''!

!DXCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCII.
	previous := DXC.! !


!classDefinition: #DXCII category: #'Numeros-Naturales'!
II subclass: #DXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCII class' category: #'Numeros-Naturales'!
DXCII class
	instanceVariableNames: ''!

!DXCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCIII.
	previous := DXCI.! !


!classDefinition: #DXCIII category: #'Numeros-Naturales'!
II subclass: #DXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCIII class' category: #'Numeros-Naturales'!
DXCIII class
	instanceVariableNames: ''!

!DXCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCIV.
	previous := DXCII.! !


!classDefinition: #DXCIV category: #'Numeros-Naturales'!
II subclass: #DXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCIV class' category: #'Numeros-Naturales'!
DXCIV class
	instanceVariableNames: ''!

!DXCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCV.
	previous := DXCIII.! !


!classDefinition: #DXCIX category: #'Numeros-Naturales'!
II subclass: #DXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCIX class' category: #'Numeros-Naturales'!
DXCIX class
	instanceVariableNames: ''!

!DXCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DC.
	previous := DXCVIII.! !


!classDefinition: #DXCV category: #'Numeros-Naturales'!
II subclass: #DXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCV class' category: #'Numeros-Naturales'!
DXCV class
	instanceVariableNames: ''!

!DXCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCVI.
	previous := DXCIV.! !


!classDefinition: #DXCVI category: #'Numeros-Naturales'!
II subclass: #DXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCVI class' category: #'Numeros-Naturales'!
DXCVI class
	instanceVariableNames: ''!

!DXCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCVII.
	previous := DXCV.! !


!classDefinition: #DXCVII category: #'Numeros-Naturales'!
II subclass: #DXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCVII class' category: #'Numeros-Naturales'!
DXCVII class
	instanceVariableNames: ''!

!DXCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCVIII.
	previous := DXCVI.! !


!classDefinition: #DXCVIII category: #'Numeros-Naturales'!
II subclass: #DXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCVIII class' category: #'Numeros-Naturales'!
DXCVIII class
	instanceVariableNames: ''!

!DXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCIX.
	previous := DXCVII.! !


!classDefinition: #DXI category: #'Numeros-Naturales'!
II subclass: #DXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXI class' category: #'Numeros-Naturales'!
DXI class
	instanceVariableNames: ''!

!DXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXII.
	previous := DX.! !


!classDefinition: #DXII category: #'Numeros-Naturales'!
II subclass: #DXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXII class' category: #'Numeros-Naturales'!
DXII class
	instanceVariableNames: ''!

!DXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXIII.
	previous := DXI.! !


!classDefinition: #DXIII category: #'Numeros-Naturales'!
II subclass: #DXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXIII class' category: #'Numeros-Naturales'!
DXIII class
	instanceVariableNames: ''!

!DXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXIV.
	previous := DXII.! !


!classDefinition: #DXIV category: #'Numeros-Naturales'!
II subclass: #DXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXIV class' category: #'Numeros-Naturales'!
DXIV class
	instanceVariableNames: ''!

!DXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXV.
	previous := DXIII.! !


!classDefinition: #DXIX category: #'Numeros-Naturales'!
II subclass: #DXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXIX class' category: #'Numeros-Naturales'!
DXIX class
	instanceVariableNames: ''!

!DXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXX.
	previous := DXVIII.! !


!classDefinition: #DXL category: #'Numeros-Naturales'!
II subclass: #DXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXL class' category: #'Numeros-Naturales'!
DXL class
	instanceVariableNames: ''!

!DXL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLI.
	previous := DXXXIX.! !


!classDefinition: #DXLI category: #'Numeros-Naturales'!
II subclass: #DXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLI class' category: #'Numeros-Naturales'!
DXLI class
	instanceVariableNames: ''!

!DXLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLII.
	previous := DXL.! !


!classDefinition: #DXLII category: #'Numeros-Naturales'!
II subclass: #DXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLII class' category: #'Numeros-Naturales'!
DXLII class
	instanceVariableNames: ''!

!DXLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLIII.
	previous := DXLI.! !


!classDefinition: #DXLIII category: #'Numeros-Naturales'!
II subclass: #DXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLIII class' category: #'Numeros-Naturales'!
DXLIII class
	instanceVariableNames: ''!

!DXLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLIV.
	previous := DXLII.! !


!classDefinition: #DXLIV category: #'Numeros-Naturales'!
II subclass: #DXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLIV class' category: #'Numeros-Naturales'!
DXLIV class
	instanceVariableNames: ''!

!DXLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLV.
	previous := DXLIII.! !


!classDefinition: #DXLIX category: #'Numeros-Naturales'!
II subclass: #DXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLIX class' category: #'Numeros-Naturales'!
DXLIX class
	instanceVariableNames: ''!

!DXLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DL.
	previous := DXLVIII.! !


!classDefinition: #DXLV category: #'Numeros-Naturales'!
II subclass: #DXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLV class' category: #'Numeros-Naturales'!
DXLV class
	instanceVariableNames: ''!

!DXLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLVI.
	previous := DXLIV.! !


!classDefinition: #DXLVI category: #'Numeros-Naturales'!
II subclass: #DXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLVI class' category: #'Numeros-Naturales'!
DXLVI class
	instanceVariableNames: ''!

!DXLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLVII.
	previous := DXLV.! !


!classDefinition: #DXLVII category: #'Numeros-Naturales'!
II subclass: #DXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLVII class' category: #'Numeros-Naturales'!
DXLVII class
	instanceVariableNames: ''!

!DXLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLVIII.
	previous := DXLVI.! !


!classDefinition: #DXLVIII category: #'Numeros-Naturales'!
II subclass: #DXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLVIII class' category: #'Numeros-Naturales'!
DXLVIII class
	instanceVariableNames: ''!

!DXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLIX.
	previous := DXLVII.! !


!classDefinition: #DXV category: #'Numeros-Naturales'!
II subclass: #DXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXV class' category: #'Numeros-Naturales'!
DXV class
	instanceVariableNames: ''!

!DXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXVI.
	previous := DXIV.! !


!classDefinition: #DXVI category: #'Numeros-Naturales'!
II subclass: #DXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXVI class' category: #'Numeros-Naturales'!
DXVI class
	instanceVariableNames: ''!

!DXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXVII.
	previous := DXV.! !


!classDefinition: #DXVII category: #'Numeros-Naturales'!
II subclass: #DXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXVII class' category: #'Numeros-Naturales'!
DXVII class
	instanceVariableNames: ''!

!DXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXVIII.
	previous := DXVI.! !


!classDefinition: #DXVIII category: #'Numeros-Naturales'!
II subclass: #DXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXVIII class' category: #'Numeros-Naturales'!
DXVIII class
	instanceVariableNames: ''!

!DXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXIX.
	previous := DXVII.! !


!classDefinition: #DXX category: #'Numeros-Naturales'!
II subclass: #DXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXX class' category: #'Numeros-Naturales'!
DXX class
	instanceVariableNames: ''!

!DXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXI.
	previous := DXIX.! !


!classDefinition: #DXXI category: #'Numeros-Naturales'!
II subclass: #DXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXI class' category: #'Numeros-Naturales'!
DXXI class
	instanceVariableNames: ''!

!DXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXII.
	previous := DXX.! !


!classDefinition: #DXXII category: #'Numeros-Naturales'!
II subclass: #DXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXII class' category: #'Numeros-Naturales'!
DXXII class
	instanceVariableNames: ''!

!DXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXIII.
	previous := DXXI.! !


!classDefinition: #DXXIII category: #'Numeros-Naturales'!
II subclass: #DXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXIII class' category: #'Numeros-Naturales'!
DXXIII class
	instanceVariableNames: ''!

!DXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXIV.
	previous := DXXII.! !


!classDefinition: #DXXIV category: #'Numeros-Naturales'!
II subclass: #DXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXIV class' category: #'Numeros-Naturales'!
DXXIV class
	instanceVariableNames: ''!

!DXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXV.
	previous := DXXIII.! !


!classDefinition: #DXXIX category: #'Numeros-Naturales'!
II subclass: #DXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXIX class' category: #'Numeros-Naturales'!
DXXIX class
	instanceVariableNames: ''!

!DXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXX.
	previous := DXXVIII.! !


!classDefinition: #DXXV category: #'Numeros-Naturales'!
II subclass: #DXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXV class' category: #'Numeros-Naturales'!
DXXV class
	instanceVariableNames: ''!

!DXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXVI.
	previous := DXXIV.! !


!classDefinition: #DXXVI category: #'Numeros-Naturales'!
II subclass: #DXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXVI class' category: #'Numeros-Naturales'!
DXXVI class
	instanceVariableNames: ''!

!DXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXVII.
	previous := DXXV.! !


!classDefinition: #DXXVII category: #'Numeros-Naturales'!
II subclass: #DXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXVII class' category: #'Numeros-Naturales'!
DXXVII class
	instanceVariableNames: ''!

!DXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXVIII.
	previous := DXXVI.! !


!classDefinition: #DXXVIII category: #'Numeros-Naturales'!
II subclass: #DXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXVIII class' category: #'Numeros-Naturales'!
DXXVIII class
	instanceVariableNames: ''!

!DXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXIX.
	previous := DXXVII.! !


!classDefinition: #DXXX category: #'Numeros-Naturales'!
II subclass: #DXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXX class' category: #'Numeros-Naturales'!
DXXX class
	instanceVariableNames: ''!

!DXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXI.
	previous := DXXIX.! !


!classDefinition: #DXXXI category: #'Numeros-Naturales'!
II subclass: #DXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXI class' category: #'Numeros-Naturales'!
DXXXI class
	instanceVariableNames: ''!

!DXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXII.
	previous := DXXX.! !


!classDefinition: #DXXXII category: #'Numeros-Naturales'!
II subclass: #DXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXII class' category: #'Numeros-Naturales'!
DXXXII class
	instanceVariableNames: ''!

!DXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXIII.
	previous := DXXXI.! !


!classDefinition: #DXXXIII category: #'Numeros-Naturales'!
II subclass: #DXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXIII class' category: #'Numeros-Naturales'!
DXXXIII class
	instanceVariableNames: ''!

!DXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXIV.
	previous := DXXXII.! !


!classDefinition: #DXXXIV category: #'Numeros-Naturales'!
II subclass: #DXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXIV class' category: #'Numeros-Naturales'!
DXXXIV class
	instanceVariableNames: ''!

!DXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXV.
	previous := DXXXIII.! !


!classDefinition: #DXXXIX category: #'Numeros-Naturales'!
II subclass: #DXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXIX class' category: #'Numeros-Naturales'!
DXXXIX class
	instanceVariableNames: ''!

!DXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXL.
	previous := DXXXVIII.! !


!classDefinition: #DXXXV category: #'Numeros-Naturales'!
II subclass: #DXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXV class' category: #'Numeros-Naturales'!
DXXXV class
	instanceVariableNames: ''!

!DXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXVI.
	previous := DXXXIV.! !


!classDefinition: #DXXXVI category: #'Numeros-Naturales'!
II subclass: #DXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXVI class' category: #'Numeros-Naturales'!
DXXXVI class
	instanceVariableNames: ''!

!DXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXVII.
	previous := DXXXV.! !


!classDefinition: #DXXXVII category: #'Numeros-Naturales'!
II subclass: #DXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXVII class' category: #'Numeros-Naturales'!
DXXXVII class
	instanceVariableNames: ''!

!DXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXVIII.
	previous := DXXXVI.! !


!classDefinition: #DXXXVIII category: #'Numeros-Naturales'!
II subclass: #DXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXVIII class' category: #'Numeros-Naturales'!
DXXXVIII class
	instanceVariableNames: ''!

!DXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXIX.
	previous := DXXXVII.! !


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

!III class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
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

!IV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
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

!IX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := X.
	previous := VIII.! !


!classDefinition: #L category: #'Numeros-Naturales'!
II subclass: #L
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'L class' category: #'Numeros-Naturales'!
L class
	instanceVariableNames: ''!

!L class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LI.
	previous := XLIX.! !


!classDefinition: #LI category: #'Numeros-Naturales'!
II subclass: #LI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LI class' category: #'Numeros-Naturales'!
LI class
	instanceVariableNames: ''!

!LI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LII.
	previous := L.! !


!classDefinition: #LII category: #'Numeros-Naturales'!
II subclass: #LII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LII class' category: #'Numeros-Naturales'!
LII class
	instanceVariableNames: ''!

!LII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LIII.
	previous := LI.! !


!classDefinition: #LIII category: #'Numeros-Naturales'!
II subclass: #LIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIII class' category: #'Numeros-Naturales'!
LIII class
	instanceVariableNames: ''!

!LIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LIV.
	previous := LII.! !


!classDefinition: #LIV category: #'Numeros-Naturales'!
II subclass: #LIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIV class' category: #'Numeros-Naturales'!
LIV class
	instanceVariableNames: ''!

!LIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LV.
	previous := LIII.! !


!classDefinition: #LIX category: #'Numeros-Naturales'!
II subclass: #LIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIX class' category: #'Numeros-Naturales'!
LIX class
	instanceVariableNames: ''!

!LIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LX.
	previous := LVIII.! !


!classDefinition: #LV category: #'Numeros-Naturales'!
II subclass: #LV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LV class' category: #'Numeros-Naturales'!
LV class
	instanceVariableNames: ''!

!LV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LVI.
	previous := LIV.! !


!classDefinition: #LVI category: #'Numeros-Naturales'!
II subclass: #LVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVI class' category: #'Numeros-Naturales'!
LVI class
	instanceVariableNames: ''!

!LVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LVII.
	previous := LV.! !


!classDefinition: #LVII category: #'Numeros-Naturales'!
II subclass: #LVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVII class' category: #'Numeros-Naturales'!
LVII class
	instanceVariableNames: ''!

!LVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LVIII.
	previous := LVI.! !


!classDefinition: #LVIII category: #'Numeros-Naturales'!
II subclass: #LVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVIII class' category: #'Numeros-Naturales'!
LVIII class
	instanceVariableNames: ''!

!LVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LIX.
	previous := LVII.! !


!classDefinition: #LX category: #'Numeros-Naturales'!
II subclass: #LX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LX class' category: #'Numeros-Naturales'!
LX class
	instanceVariableNames: ''!

!LX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXI.
	previous := LIX.! !


!classDefinition: #LXI category: #'Numeros-Naturales'!
II subclass: #LXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXI class' category: #'Numeros-Naturales'!
LXI class
	instanceVariableNames: ''!

!LXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXII.
	previous := LX.! !


!classDefinition: #LXII category: #'Numeros-Naturales'!
II subclass: #LXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXII class' category: #'Numeros-Naturales'!
LXII class
	instanceVariableNames: ''!

!LXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXIII.
	previous := LXI.! !


!classDefinition: #LXIII category: #'Numeros-Naturales'!
II subclass: #LXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIII class' category: #'Numeros-Naturales'!
LXIII class
	instanceVariableNames: ''!

!LXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXIV.
	previous := LXII.! !


!classDefinition: #LXIV category: #'Numeros-Naturales'!
II subclass: #LXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIV class' category: #'Numeros-Naturales'!
LXIV class
	instanceVariableNames: ''!

!LXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXV.
	previous := LXIII.! !


!classDefinition: #LXIX category: #'Numeros-Naturales'!
II subclass: #LXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIX class' category: #'Numeros-Naturales'!
LXIX class
	instanceVariableNames: ''!

!LXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXX.
	previous := LXVIII.! !


!classDefinition: #LXV category: #'Numeros-Naturales'!
II subclass: #LXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXV class' category: #'Numeros-Naturales'!
LXV class
	instanceVariableNames: ''!

!LXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXVI.
	previous := LXIV.! !


!classDefinition: #LXVI category: #'Numeros-Naturales'!
II subclass: #LXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVI class' category: #'Numeros-Naturales'!
LXVI class
	instanceVariableNames: ''!

!LXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXVII.
	previous := LXV.! !


!classDefinition: #LXVII category: #'Numeros-Naturales'!
II subclass: #LXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVII class' category: #'Numeros-Naturales'!
LXVII class
	instanceVariableNames: ''!

!LXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXVIII.
	previous := LXVI.! !


!classDefinition: #LXVIII category: #'Numeros-Naturales'!
II subclass: #LXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVIII class' category: #'Numeros-Naturales'!
LXVIII class
	instanceVariableNames: ''!

!LXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXIX.
	previous := LXVII.! !


!classDefinition: #LXX category: #'Numeros-Naturales'!
II subclass: #LXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXX class' category: #'Numeros-Naturales'!
LXX class
	instanceVariableNames: ''!

!LXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXI.
	previous := LXIX.! !


!classDefinition: #LXXI category: #'Numeros-Naturales'!
II subclass: #LXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXI class' category: #'Numeros-Naturales'!
LXXI class
	instanceVariableNames: ''!

!LXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXII.
	previous := LXX.! !


!classDefinition: #LXXII category: #'Numeros-Naturales'!
II subclass: #LXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXII class' category: #'Numeros-Naturales'!
LXXII class
	instanceVariableNames: ''!

!LXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXIII.
	previous := LXXI.! !


!classDefinition: #LXXIII category: #'Numeros-Naturales'!
II subclass: #LXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIII class' category: #'Numeros-Naturales'!
LXXIII class
	instanceVariableNames: ''!

!LXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXIV.
	previous := LXXII.! !


!classDefinition: #LXXIV category: #'Numeros-Naturales'!
II subclass: #LXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIV class' category: #'Numeros-Naturales'!
LXXIV class
	instanceVariableNames: ''!

!LXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXV.
	previous := LXXIII.! !


!classDefinition: #LXXIX category: #'Numeros-Naturales'!
II subclass: #LXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIX class' category: #'Numeros-Naturales'!
LXXIX class
	instanceVariableNames: ''!

!LXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXX.
	previous := LXXVIII.! !


!classDefinition: #LXXV category: #'Numeros-Naturales'!
II subclass: #LXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXV class' category: #'Numeros-Naturales'!
LXXV class
	instanceVariableNames: ''!

!LXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXVI.
	previous := LXXIV.! !


!classDefinition: #LXXVI category: #'Numeros-Naturales'!
II subclass: #LXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVI class' category: #'Numeros-Naturales'!
LXXVI class
	instanceVariableNames: ''!

!LXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXVII.
	previous := LXXV.! !


!classDefinition: #LXXVII category: #'Numeros-Naturales'!
II subclass: #LXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVII class' category: #'Numeros-Naturales'!
LXXVII class
	instanceVariableNames: ''!

!LXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXVIII.
	previous := LXXVI.! !


!classDefinition: #LXXVIII category: #'Numeros-Naturales'!
II subclass: #LXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVIII class' category: #'Numeros-Naturales'!
LXXVIII class
	instanceVariableNames: ''!

!LXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXIX.
	previous := LXXVII.! !


!classDefinition: #LXXX category: #'Numeros-Naturales'!
II subclass: #LXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXX class' category: #'Numeros-Naturales'!
LXXX class
	instanceVariableNames: ''!

!LXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXI.
	previous := LXXIX.! !


!classDefinition: #LXXXI category: #'Numeros-Naturales'!
II subclass: #LXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXI class' category: #'Numeros-Naturales'!
LXXXI class
	instanceVariableNames: ''!

!LXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXII.
	previous := LXXX.! !


!classDefinition: #LXXXII category: #'Numeros-Naturales'!
II subclass: #LXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXII class' category: #'Numeros-Naturales'!
LXXXII class
	instanceVariableNames: ''!

!LXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXIII.
	previous := LXXXI.! !


!classDefinition: #LXXXIII category: #'Numeros-Naturales'!
II subclass: #LXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIII class' category: #'Numeros-Naturales'!
LXXXIII class
	instanceVariableNames: ''!

!LXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXIV.
	previous := LXXXII.! !


!classDefinition: #LXXXIV category: #'Numeros-Naturales'!
II subclass: #LXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIV class' category: #'Numeros-Naturales'!
LXXXIV class
	instanceVariableNames: ''!

!LXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXV.
	previous := LXXXIII.! !


!classDefinition: #LXXXIX category: #'Numeros-Naturales'!
II subclass: #LXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIX class' category: #'Numeros-Naturales'!
LXXXIX class
	instanceVariableNames: ''!

!LXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XC.
	previous := LXXXVIII.! !


!classDefinition: #LXXXV category: #'Numeros-Naturales'!
II subclass: #LXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXV class' category: #'Numeros-Naturales'!
LXXXV class
	instanceVariableNames: ''!

!LXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXVI.
	previous := LXXXIV.! !


!classDefinition: #LXXXVI category: #'Numeros-Naturales'!
II subclass: #LXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVI class' category: #'Numeros-Naturales'!
LXXXVI class
	instanceVariableNames: ''!

!LXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXVII.
	previous := LXXXV.! !


!classDefinition: #LXXXVII category: #'Numeros-Naturales'!
II subclass: #LXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVII class' category: #'Numeros-Naturales'!
LXXXVII class
	instanceVariableNames: ''!

!LXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXVIII.
	previous := LXXXVI.! !


!classDefinition: #LXXXVIII category: #'Numeros-Naturales'!
II subclass: #LXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVIII class' category: #'Numeros-Naturales'!
LXXXVIII class
	instanceVariableNames: ''!

!LXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXIX.
	previous := LXXXVII.! !


!classDefinition: #M category: #'Numeros-Naturales'!
II subclass: #M
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'M class' category: #'Numeros-Naturales'!
M class
	instanceVariableNames: ''!

!M class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MI.
	previous := CMXCIX.! !


!classDefinition: #MC category: #'Numeros-Naturales'!
II subclass: #MC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MC class' category: #'Numeros-Naturales'!
MC class
	instanceVariableNames: ''!

!MC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCI.
	previous := MXCIX.! !


!classDefinition: #MCC category: #'Numeros-Naturales'!
II subclass: #MCC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCC class' category: #'Numeros-Naturales'!
MCC class
	instanceVariableNames: ''!

!MCC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCI.
	previous := MCXCIX.! !


!classDefinition: #MCCI category: #'Numeros-Naturales'!
II subclass: #MCCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCI class' category: #'Numeros-Naturales'!
MCCI class
	instanceVariableNames: ''!

!MCCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCII.
	previous := MCC.! !


!classDefinition: #MCCII category: #'Numeros-Naturales'!
II subclass: #MCCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCII class' category: #'Numeros-Naturales'!
MCCII class
	instanceVariableNames: ''!

!MCCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCIII.
	previous := MCCI.! !


!classDefinition: #MCCIII category: #'Numeros-Naturales'!
II subclass: #MCCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCIII class' category: #'Numeros-Naturales'!
MCCIII class
	instanceVariableNames: ''!

!MCCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCIV.
	previous := MCCII.! !


!classDefinition: #MCCIV category: #'Numeros-Naturales'!
II subclass: #MCCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCIV class' category: #'Numeros-Naturales'!
MCCIV class
	instanceVariableNames: ''!

!MCCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCV.
	previous := MCCIII.! !


!classDefinition: #MCCIX category: #'Numeros-Naturales'!
II subclass: #MCCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCIX class' category: #'Numeros-Naturales'!
MCCIX class
	instanceVariableNames: ''!

!MCCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCX.
	previous := MCCVIII.! !


!classDefinition: #MCCL category: #'Numeros-Naturales'!
II subclass: #MCCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCL class' category: #'Numeros-Naturales'!
MCCL class
	instanceVariableNames: ''!

!MCCL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLI.
	previous := MCCXLIX.! !


!classDefinition: #MCCLI category: #'Numeros-Naturales'!
II subclass: #MCCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLI class' category: #'Numeros-Naturales'!
MCCLI class
	instanceVariableNames: ''!

!MCCLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLII.
	previous := MCCL.! !


!classDefinition: #MCCLII category: #'Numeros-Naturales'!
II subclass: #MCCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLII class' category: #'Numeros-Naturales'!
MCCLII class
	instanceVariableNames: ''!

!MCCLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLIII.
	previous := MCCLI.! !


!classDefinition: #MCCLIII category: #'Numeros-Naturales'!
II subclass: #MCCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLIII class' category: #'Numeros-Naturales'!
MCCLIII class
	instanceVariableNames: ''!

!MCCLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLIV.
	previous := MCCLII.! !


!classDefinition: #MCCLIV category: #'Numeros-Naturales'!
II subclass: #MCCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLIV class' category: #'Numeros-Naturales'!
MCCLIV class
	instanceVariableNames: ''!

!MCCLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLV.
	previous := MCCLIII.! !


!classDefinition: #MCCLIX category: #'Numeros-Naturales'!
II subclass: #MCCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLIX class' category: #'Numeros-Naturales'!
MCCLIX class
	instanceVariableNames: ''!

!MCCLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLX.
	previous := MCCLVIII.! !


!classDefinition: #MCCLV category: #'Numeros-Naturales'!
II subclass: #MCCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLV class' category: #'Numeros-Naturales'!
MCCLV class
	instanceVariableNames: ''!

!MCCLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLVI.
	previous := MCCLIV.! !


!classDefinition: #MCCLVI category: #'Numeros-Naturales'!
II subclass: #MCCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLVI class' category: #'Numeros-Naturales'!
MCCLVI class
	instanceVariableNames: ''!

!MCCLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLVII.
	previous := MCCLV.! !


!classDefinition: #MCCLVII category: #'Numeros-Naturales'!
II subclass: #MCCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLVII class' category: #'Numeros-Naturales'!
MCCLVII class
	instanceVariableNames: ''!

!MCCLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLVIII.
	previous := MCCLVI.! !


!classDefinition: #MCCLVIII category: #'Numeros-Naturales'!
II subclass: #MCCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLVIII class' category: #'Numeros-Naturales'!
MCCLVIII class
	instanceVariableNames: ''!

!MCCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLIX.
	previous := MCCLVII.! !


!classDefinition: #MCCLX category: #'Numeros-Naturales'!
II subclass: #MCCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLX class' category: #'Numeros-Naturales'!
MCCLX class
	instanceVariableNames: ''!

!MCCLX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXI.
	previous := MCCLIX.! !


!classDefinition: #MCCLXI category: #'Numeros-Naturales'!
II subclass: #MCCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXI class' category: #'Numeros-Naturales'!
MCCLXI class
	instanceVariableNames: ''!

!MCCLXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXII.
	previous := MCCLX.! !


!classDefinition: #MCCLXII category: #'Numeros-Naturales'!
II subclass: #MCCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXII class' category: #'Numeros-Naturales'!
MCCLXII class
	instanceVariableNames: ''!

!MCCLXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXIII.
	previous := MCCLXI.! !


!classDefinition: #MCCLXIII category: #'Numeros-Naturales'!
II subclass: #MCCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXIII class' category: #'Numeros-Naturales'!
MCCLXIII class
	instanceVariableNames: ''!

!MCCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXIV.
	previous := MCCLXII.! !


!classDefinition: #MCCLXIV category: #'Numeros-Naturales'!
II subclass: #MCCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXIV class' category: #'Numeros-Naturales'!
MCCLXIV class
	instanceVariableNames: ''!

!MCCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXV.
	previous := MCCLXIII.! !


!classDefinition: #MCCLXIX category: #'Numeros-Naturales'!
II subclass: #MCCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXIX class' category: #'Numeros-Naturales'!
MCCLXIX class
	instanceVariableNames: ''!

!MCCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXX.
	previous := MCCLXVIII.! !


!classDefinition: #MCCLXV category: #'Numeros-Naturales'!
II subclass: #MCCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXV class' category: #'Numeros-Naturales'!
MCCLXV class
	instanceVariableNames: ''!

!MCCLXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXVI.
	previous := MCCLXIV.! !


!classDefinition: #MCCLXVI category: #'Numeros-Naturales'!
II subclass: #MCCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXVI class' category: #'Numeros-Naturales'!
MCCLXVI class
	instanceVariableNames: ''!

!MCCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXVII.
	previous := MCCLXV.! !


!classDefinition: #MCCLXVII category: #'Numeros-Naturales'!
II subclass: #MCCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXVII class' category: #'Numeros-Naturales'!
MCCLXVII class
	instanceVariableNames: ''!

!MCCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXVIII.
	previous := MCCLXVI.! !


!classDefinition: #MCCLXVIII category: #'Numeros-Naturales'!
II subclass: #MCCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXVIII class' category: #'Numeros-Naturales'!
MCCLXVIII class
	instanceVariableNames: ''!

!MCCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXIX.
	previous := MCCLXVII.! !


!classDefinition: #MCCLXX category: #'Numeros-Naturales'!
II subclass: #MCCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXX class' category: #'Numeros-Naturales'!
MCCLXX class
	instanceVariableNames: ''!

!MCCLXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXXI.
	previous := MCCLXIX.! !


!classDefinition: #MCCLXXI category: #'Numeros-Naturales'!
II subclass: #MCCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXXI class' category: #'Numeros-Naturales'!
MCCLXXI class
	instanceVariableNames: ''!

!MCCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXXII.
	previous := MCCLXX.! !


!classDefinition: #MCCLXXII category: #'Numeros-Naturales'!
II subclass: #MCCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXXII class' category: #'Numeros-Naturales'!
MCCLXXII class
	instanceVariableNames: ''!

!MCCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXXIII.
	previous := MCCLXXI.! !


!classDefinition: #MCCLXXIII category: #'Numeros-Naturales'!
II subclass: #MCCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXXIII class' category: #'Numeros-Naturales'!
MCCLXXIII class
	instanceVariableNames: ''!

!MCCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXXIV.
	previous := MCCLXXII.! !


!classDefinition: #MCCLXXIV category: #'Numeros-Naturales'!
II subclass: #MCCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXXIV class' category: #'Numeros-Naturales'!
MCCLXXIV class
	instanceVariableNames: ''!

!MCCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXXV.
	previous := MCCLXXIII.! !


!classDefinition: #MCCLXXIX category: #'Numeros-Naturales'!
II subclass: #MCCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXXIX class' category: #'Numeros-Naturales'!
MCCLXXIX class
	instanceVariableNames: ''!

!MCCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXXX.
	previous := MCCLXXVIII.! !


!classDefinition: #MCCLXXV category: #'Numeros-Naturales'!
II subclass: #MCCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXXV class' category: #'Numeros-Naturales'!
MCCLXXV class
	instanceVariableNames: ''!

!MCCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXXVI.
	previous := MCCLXXIV.! !


!classDefinition: #MCCLXXVI category: #'Numeros-Naturales'!
II subclass: #MCCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXXVI class' category: #'Numeros-Naturales'!
MCCLXXVI class
	instanceVariableNames: ''!

!MCCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXXVII.
	previous := MCCLXXV.! !


!classDefinition: #MCCLXXVII category: #'Numeros-Naturales'!
II subclass: #MCCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXXVII class' category: #'Numeros-Naturales'!
MCCLXXVII class
	instanceVariableNames: ''!

!MCCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXXVIII.
	previous := MCCLXXVI.! !


!classDefinition: #MCCLXXVIII category: #'Numeros-Naturales'!
II subclass: #MCCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXXVIII class' category: #'Numeros-Naturales'!
MCCLXXVIII class
	instanceVariableNames: ''!

!MCCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCLXXIX.
	previous := MCCLXXVII.! !


!classDefinition: #MCCLXXX category: #'Numeros-Naturales'!
II subclass: #MCCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCLXXX class' category: #'Numeros-Naturales'!
MCCLXXX class
	instanceVariableNames: ''!

!MCCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := MCCLXXIX.! !


!classDefinition: #MCCV category: #'Numeros-Naturales'!
II subclass: #MCCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCV class' category: #'Numeros-Naturales'!
MCCV class
	instanceVariableNames: ''!

!MCCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCVI.
	previous := MCCIV.! !


!classDefinition: #MCCVI category: #'Numeros-Naturales'!
II subclass: #MCCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCVI class' category: #'Numeros-Naturales'!
MCCVI class
	instanceVariableNames: ''!

!MCCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCVII.
	previous := MCCV.! !


!classDefinition: #MCCVII category: #'Numeros-Naturales'!
II subclass: #MCCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCVII class' category: #'Numeros-Naturales'!
MCCVII class
	instanceVariableNames: ''!

!MCCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCVIII.
	previous := MCCVI.! !


!classDefinition: #MCCVIII category: #'Numeros-Naturales'!
II subclass: #MCCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCVIII class' category: #'Numeros-Naturales'!
MCCVIII class
	instanceVariableNames: ''!

!MCCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCIX.
	previous := MCCVII.! !


!classDefinition: #MCCX category: #'Numeros-Naturales'!
II subclass: #MCCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCX class' category: #'Numeros-Naturales'!
MCCX class
	instanceVariableNames: ''!

!MCCX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXI.
	previous := MCCIX.! !


!classDefinition: #MCCXI category: #'Numeros-Naturales'!
II subclass: #MCCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXI class' category: #'Numeros-Naturales'!
MCCXI class
	instanceVariableNames: ''!

!MCCXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXII.
	previous := MCCX.! !


!classDefinition: #MCCXII category: #'Numeros-Naturales'!
II subclass: #MCCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXII class' category: #'Numeros-Naturales'!
MCCXII class
	instanceVariableNames: ''!

!MCCXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXIII.
	previous := MCCXI.! !


!classDefinition: #MCCXIII category: #'Numeros-Naturales'!
II subclass: #MCCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXIII class' category: #'Numeros-Naturales'!
MCCXIII class
	instanceVariableNames: ''!

!MCCXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXIV.
	previous := MCCXII.! !


!classDefinition: #MCCXIV category: #'Numeros-Naturales'!
II subclass: #MCCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXIV class' category: #'Numeros-Naturales'!
MCCXIV class
	instanceVariableNames: ''!

!MCCXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXV.
	previous := MCCXIII.! !


!classDefinition: #MCCXIX category: #'Numeros-Naturales'!
II subclass: #MCCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXIX class' category: #'Numeros-Naturales'!
MCCXIX class
	instanceVariableNames: ''!

!MCCXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXX.
	previous := MCCXVIII.! !


!classDefinition: #MCCXL category: #'Numeros-Naturales'!
II subclass: #MCCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXL class' category: #'Numeros-Naturales'!
MCCXL class
	instanceVariableNames: ''!

!MCCXL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXLI.
	previous := MCCXXXIX.! !


!classDefinition: #MCCXLI category: #'Numeros-Naturales'!
II subclass: #MCCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXLI class' category: #'Numeros-Naturales'!
MCCXLI class
	instanceVariableNames: ''!

!MCCXLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXLII.
	previous := MCCXL.! !


!classDefinition: #MCCXLII category: #'Numeros-Naturales'!
II subclass: #MCCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXLII class' category: #'Numeros-Naturales'!
MCCXLII class
	instanceVariableNames: ''!

!MCCXLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXLIII.
	previous := MCCXLI.! !


!classDefinition: #MCCXLIII category: #'Numeros-Naturales'!
II subclass: #MCCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXLIII class' category: #'Numeros-Naturales'!
MCCXLIII class
	instanceVariableNames: ''!

!MCCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXLIV.
	previous := MCCXLII.! !


!classDefinition: #MCCXLIV category: #'Numeros-Naturales'!
II subclass: #MCCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXLIV class' category: #'Numeros-Naturales'!
MCCXLIV class
	instanceVariableNames: ''!

!MCCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXLV.
	previous := MCCXLIII.! !


!classDefinition: #MCCXLIX category: #'Numeros-Naturales'!
II subclass: #MCCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXLIX class' category: #'Numeros-Naturales'!
MCCXLIX class
	instanceVariableNames: ''!

!MCCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCL.
	previous := MCCXLVIII.! !


!classDefinition: #MCCXLV category: #'Numeros-Naturales'!
II subclass: #MCCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXLV class' category: #'Numeros-Naturales'!
MCCXLV class
	instanceVariableNames: ''!

!MCCXLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXLVI.
	previous := MCCXLIV.! !


!classDefinition: #MCCXLVI category: #'Numeros-Naturales'!
II subclass: #MCCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXLVI class' category: #'Numeros-Naturales'!
MCCXLVI class
	instanceVariableNames: ''!

!MCCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXLVII.
	previous := MCCXLV.! !


!classDefinition: #MCCXLVII category: #'Numeros-Naturales'!
II subclass: #MCCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXLVII class' category: #'Numeros-Naturales'!
MCCXLVII class
	instanceVariableNames: ''!

!MCCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXLVIII.
	previous := MCCXLVI.! !


!classDefinition: #MCCXLVIII category: #'Numeros-Naturales'!
II subclass: #MCCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXLVIII class' category: #'Numeros-Naturales'!
MCCXLVIII class
	instanceVariableNames: ''!

!MCCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXLIX.
	previous := MCCXLVII.! !


!classDefinition: #MCCXV category: #'Numeros-Naturales'!
II subclass: #MCCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXV class' category: #'Numeros-Naturales'!
MCCXV class
	instanceVariableNames: ''!

!MCCXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXVI.
	previous := MCCXIV.! !


!classDefinition: #MCCXVI category: #'Numeros-Naturales'!
II subclass: #MCCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXVI class' category: #'Numeros-Naturales'!
MCCXVI class
	instanceVariableNames: ''!

!MCCXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXVII.
	previous := MCCXV.! !


!classDefinition: #MCCXVII category: #'Numeros-Naturales'!
II subclass: #MCCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXVII class' category: #'Numeros-Naturales'!
MCCXVII class
	instanceVariableNames: ''!

!MCCXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXVIII.
	previous := MCCXVI.! !


!classDefinition: #MCCXVIII category: #'Numeros-Naturales'!
II subclass: #MCCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXVIII class' category: #'Numeros-Naturales'!
MCCXVIII class
	instanceVariableNames: ''!

!MCCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXIX.
	previous := MCCXVII.! !


!classDefinition: #MCCXX category: #'Numeros-Naturales'!
II subclass: #MCCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXX class' category: #'Numeros-Naturales'!
MCCXX class
	instanceVariableNames: ''!

!MCCXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXI.
	previous := MCCXIX.! !


!classDefinition: #MCCXXI category: #'Numeros-Naturales'!
II subclass: #MCCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXI class' category: #'Numeros-Naturales'!
MCCXXI class
	instanceVariableNames: ''!

!MCCXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXII.
	previous := MCCXX.! !


!classDefinition: #MCCXXII category: #'Numeros-Naturales'!
II subclass: #MCCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXII class' category: #'Numeros-Naturales'!
MCCXXII class
	instanceVariableNames: ''!

!MCCXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXIII.
	previous := MCCXXI.! !


!classDefinition: #MCCXXIII category: #'Numeros-Naturales'!
II subclass: #MCCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXIII class' category: #'Numeros-Naturales'!
MCCXXIII class
	instanceVariableNames: ''!

!MCCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXIV.
	previous := MCCXXII.! !


!classDefinition: #MCCXXIV category: #'Numeros-Naturales'!
II subclass: #MCCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXIV class' category: #'Numeros-Naturales'!
MCCXXIV class
	instanceVariableNames: ''!

!MCCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXV.
	previous := MCCXXIII.! !


!classDefinition: #MCCXXIX category: #'Numeros-Naturales'!
II subclass: #MCCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXIX class' category: #'Numeros-Naturales'!
MCCXXIX class
	instanceVariableNames: ''!

!MCCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXX.
	previous := MCCXXVIII.! !


!classDefinition: #MCCXXV category: #'Numeros-Naturales'!
II subclass: #MCCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXV class' category: #'Numeros-Naturales'!
MCCXXV class
	instanceVariableNames: ''!

!MCCXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXVI.
	previous := MCCXXIV.! !


!classDefinition: #MCCXXVI category: #'Numeros-Naturales'!
II subclass: #MCCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXVI class' category: #'Numeros-Naturales'!
MCCXXVI class
	instanceVariableNames: ''!

!MCCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXVII.
	previous := MCCXXV.! !


!classDefinition: #MCCXXVII category: #'Numeros-Naturales'!
II subclass: #MCCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXVII class' category: #'Numeros-Naturales'!
MCCXXVII class
	instanceVariableNames: ''!

!MCCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXVIII.
	previous := MCCXXVI.! !


!classDefinition: #MCCXXVIII category: #'Numeros-Naturales'!
II subclass: #MCCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXVIII class' category: #'Numeros-Naturales'!
MCCXXVIII class
	instanceVariableNames: ''!

!MCCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXIX.
	previous := MCCXXVII.! !


!classDefinition: #MCCXXX category: #'Numeros-Naturales'!
II subclass: #MCCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXX class' category: #'Numeros-Naturales'!
MCCXXX class
	instanceVariableNames: ''!

!MCCXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXXI.
	previous := MCCXXIX.! !


!classDefinition: #MCCXXXI category: #'Numeros-Naturales'!
II subclass: #MCCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXXI class' category: #'Numeros-Naturales'!
MCCXXXI class
	instanceVariableNames: ''!

!MCCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXXII.
	previous := MCCXXX.! !


!classDefinition: #MCCXXXII category: #'Numeros-Naturales'!
II subclass: #MCCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXXII class' category: #'Numeros-Naturales'!
MCCXXXII class
	instanceVariableNames: ''!

!MCCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXXIII.
	previous := MCCXXXI.! !


!classDefinition: #MCCXXXIII category: #'Numeros-Naturales'!
II subclass: #MCCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXXIII class' category: #'Numeros-Naturales'!
MCCXXXIII class
	instanceVariableNames: ''!

!MCCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXXIV.
	previous := MCCXXXII.! !


!classDefinition: #MCCXXXIV category: #'Numeros-Naturales'!
II subclass: #MCCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXXIV class' category: #'Numeros-Naturales'!
MCCXXXIV class
	instanceVariableNames: ''!

!MCCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXXV.
	previous := MCCXXXIII.! !


!classDefinition: #MCCXXXIX category: #'Numeros-Naturales'!
II subclass: #MCCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXXIX class' category: #'Numeros-Naturales'!
MCCXXXIX class
	instanceVariableNames: ''!

!MCCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXL.
	previous := MCCXXXVIII.! !


!classDefinition: #MCCXXXV category: #'Numeros-Naturales'!
II subclass: #MCCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXXV class' category: #'Numeros-Naturales'!
MCCXXXV class
	instanceVariableNames: ''!

!MCCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXXVI.
	previous := MCCXXXIV.! !


!classDefinition: #MCCXXXVI category: #'Numeros-Naturales'!
II subclass: #MCCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXXVI class' category: #'Numeros-Naturales'!
MCCXXXVI class
	instanceVariableNames: ''!

!MCCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXXVII.
	previous := MCCXXXV.! !


!classDefinition: #MCCXXXVII category: #'Numeros-Naturales'!
II subclass: #MCCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXXVII class' category: #'Numeros-Naturales'!
MCCXXXVII class
	instanceVariableNames: ''!

!MCCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXXVIII.
	previous := MCCXXXVI.! !


!classDefinition: #MCCXXXVIII category: #'Numeros-Naturales'!
II subclass: #MCCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCCXXXVIII class' category: #'Numeros-Naturales'!
MCCXXXVIII class
	instanceVariableNames: ''!

!MCCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCCXXXIX.
	previous := MCCXXXVII.! !


!classDefinition: #MCI category: #'Numeros-Naturales'!
II subclass: #MCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCI class' category: #'Numeros-Naturales'!
MCI class
	instanceVariableNames: ''!

!MCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCII.
	previous := MC.! !


!classDefinition: #MCII category: #'Numeros-Naturales'!
II subclass: #MCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCII class' category: #'Numeros-Naturales'!
MCII class
	instanceVariableNames: ''!

!MCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCIII.
	previous := MCI.! !


!classDefinition: #MCIII category: #'Numeros-Naturales'!
II subclass: #MCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCIII class' category: #'Numeros-Naturales'!
MCIII class
	instanceVariableNames: ''!

!MCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCIV.
	previous := MCII.! !


!classDefinition: #MCIV category: #'Numeros-Naturales'!
II subclass: #MCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCIV class' category: #'Numeros-Naturales'!
MCIV class
	instanceVariableNames: ''!

!MCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCV.
	previous := MCIII.! !


!classDefinition: #MCIX category: #'Numeros-Naturales'!
II subclass: #MCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCIX class' category: #'Numeros-Naturales'!
MCIX class
	instanceVariableNames: ''!

!MCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCX.
	previous := MCVIII.! !


!classDefinition: #MCL category: #'Numeros-Naturales'!
II subclass: #MCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCL class' category: #'Numeros-Naturales'!
MCL class
	instanceVariableNames: ''!

!MCL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLI.
	previous := MCXLIX.! !


!classDefinition: #MCLI category: #'Numeros-Naturales'!
II subclass: #MCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLI class' category: #'Numeros-Naturales'!
MCLI class
	instanceVariableNames: ''!

!MCLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLII.
	previous := MCL.! !


!classDefinition: #MCLII category: #'Numeros-Naturales'!
II subclass: #MCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLII class' category: #'Numeros-Naturales'!
MCLII class
	instanceVariableNames: ''!

!MCLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLIII.
	previous := MCLI.! !


!classDefinition: #MCLIII category: #'Numeros-Naturales'!
II subclass: #MCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLIII class' category: #'Numeros-Naturales'!
MCLIII class
	instanceVariableNames: ''!

!MCLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLIV.
	previous := MCLII.! !


!classDefinition: #MCLIV category: #'Numeros-Naturales'!
II subclass: #MCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLIV class' category: #'Numeros-Naturales'!
MCLIV class
	instanceVariableNames: ''!

!MCLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLV.
	previous := MCLIII.! !


!classDefinition: #MCLIX category: #'Numeros-Naturales'!
II subclass: #MCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLIX class' category: #'Numeros-Naturales'!
MCLIX class
	instanceVariableNames: ''!

!MCLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLX.
	previous := MCLVIII.! !


!classDefinition: #MCLV category: #'Numeros-Naturales'!
II subclass: #MCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLV class' category: #'Numeros-Naturales'!
MCLV class
	instanceVariableNames: ''!

!MCLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLVI.
	previous := MCLIV.! !


!classDefinition: #MCLVI category: #'Numeros-Naturales'!
II subclass: #MCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLVI class' category: #'Numeros-Naturales'!
MCLVI class
	instanceVariableNames: ''!

!MCLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLVII.
	previous := MCLV.! !


!classDefinition: #MCLVII category: #'Numeros-Naturales'!
II subclass: #MCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLVII class' category: #'Numeros-Naturales'!
MCLVII class
	instanceVariableNames: ''!

!MCLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLVIII.
	previous := MCLVI.! !


!classDefinition: #MCLVIII category: #'Numeros-Naturales'!
II subclass: #MCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLVIII class' category: #'Numeros-Naturales'!
MCLVIII class
	instanceVariableNames: ''!

!MCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLIX.
	previous := MCLVII.! !


!classDefinition: #MCLX category: #'Numeros-Naturales'!
II subclass: #MCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLX class' category: #'Numeros-Naturales'!
MCLX class
	instanceVariableNames: ''!

!MCLX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXI.
	previous := MCLIX.! !


!classDefinition: #MCLXI category: #'Numeros-Naturales'!
II subclass: #MCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXI class' category: #'Numeros-Naturales'!
MCLXI class
	instanceVariableNames: ''!

!MCLXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXII.
	previous := MCLX.! !


!classDefinition: #MCLXII category: #'Numeros-Naturales'!
II subclass: #MCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXII class' category: #'Numeros-Naturales'!
MCLXII class
	instanceVariableNames: ''!

!MCLXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXIII.
	previous := MCLXI.! !


!classDefinition: #MCLXIII category: #'Numeros-Naturales'!
II subclass: #MCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXIII class' category: #'Numeros-Naturales'!
MCLXIII class
	instanceVariableNames: ''!

!MCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXIV.
	previous := MCLXII.! !


!classDefinition: #MCLXIV category: #'Numeros-Naturales'!
II subclass: #MCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXIV class' category: #'Numeros-Naturales'!
MCLXIV class
	instanceVariableNames: ''!

!MCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXV.
	previous := MCLXIII.! !


!classDefinition: #MCLXIX category: #'Numeros-Naturales'!
II subclass: #MCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXIX class' category: #'Numeros-Naturales'!
MCLXIX class
	instanceVariableNames: ''!

!MCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXX.
	previous := MCLXVIII.! !


!classDefinition: #MCLXV category: #'Numeros-Naturales'!
II subclass: #MCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXV class' category: #'Numeros-Naturales'!
MCLXV class
	instanceVariableNames: ''!

!MCLXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXVI.
	previous := MCLXIV.! !


!classDefinition: #MCLXVI category: #'Numeros-Naturales'!
II subclass: #MCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXVI class' category: #'Numeros-Naturales'!
MCLXVI class
	instanceVariableNames: ''!

!MCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXVII.
	previous := MCLXV.! !


!classDefinition: #MCLXVII category: #'Numeros-Naturales'!
II subclass: #MCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXVII class' category: #'Numeros-Naturales'!
MCLXVII class
	instanceVariableNames: ''!

!MCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXVIII.
	previous := MCLXVI.! !


!classDefinition: #MCLXVIII category: #'Numeros-Naturales'!
II subclass: #MCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXVIII class' category: #'Numeros-Naturales'!
MCLXVIII class
	instanceVariableNames: ''!

!MCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXIX.
	previous := MCLXVII.! !


!classDefinition: #MCLXX category: #'Numeros-Naturales'!
II subclass: #MCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXX class' category: #'Numeros-Naturales'!
MCLXX class
	instanceVariableNames: ''!

!MCLXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXI.
	previous := MCLXIX.! !


!classDefinition: #MCLXXI category: #'Numeros-Naturales'!
II subclass: #MCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXI class' category: #'Numeros-Naturales'!
MCLXXI class
	instanceVariableNames: ''!

!MCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXII.
	previous := MCLXX.! !


!classDefinition: #MCLXXII category: #'Numeros-Naturales'!
II subclass: #MCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXII class' category: #'Numeros-Naturales'!
MCLXXII class
	instanceVariableNames: ''!

!MCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXIII.
	previous := MCLXXI.! !


!classDefinition: #MCLXXIII category: #'Numeros-Naturales'!
II subclass: #MCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXIII class' category: #'Numeros-Naturales'!
MCLXXIII class
	instanceVariableNames: ''!

!MCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXIV.
	previous := MCLXXII.! !


!classDefinition: #MCLXXIV category: #'Numeros-Naturales'!
II subclass: #MCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXIV class' category: #'Numeros-Naturales'!
MCLXXIV class
	instanceVariableNames: ''!

!MCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXV.
	previous := MCLXXIII.! !


!classDefinition: #MCLXXIX category: #'Numeros-Naturales'!
II subclass: #MCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXIX class' category: #'Numeros-Naturales'!
MCLXXIX class
	instanceVariableNames: ''!

!MCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXX.
	previous := MCLXXVIII.! !


!classDefinition: #MCLXXV category: #'Numeros-Naturales'!
II subclass: #MCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXV class' category: #'Numeros-Naturales'!
MCLXXV class
	instanceVariableNames: ''!

!MCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXVI.
	previous := MCLXXIV.! !


!classDefinition: #MCLXXVI category: #'Numeros-Naturales'!
II subclass: #MCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXVI class' category: #'Numeros-Naturales'!
MCLXXVI class
	instanceVariableNames: ''!

!MCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXVII.
	previous := MCLXXV.! !


!classDefinition: #MCLXXVII category: #'Numeros-Naturales'!
II subclass: #MCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXVII class' category: #'Numeros-Naturales'!
MCLXXVII class
	instanceVariableNames: ''!

!MCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXVIII.
	previous := MCLXXVI.! !


!classDefinition: #MCLXXVIII category: #'Numeros-Naturales'!
II subclass: #MCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXVIII class' category: #'Numeros-Naturales'!
MCLXXVIII class
	instanceVariableNames: ''!

!MCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXIX.
	previous := MCLXXVII.! !


!classDefinition: #MCLXXX category: #'Numeros-Naturales'!
II subclass: #MCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXX class' category: #'Numeros-Naturales'!
MCLXXX class
	instanceVariableNames: ''!

!MCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXXI.
	previous := MCLXXIX.! !


!classDefinition: #MCLXXXI category: #'Numeros-Naturales'!
II subclass: #MCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXXI class' category: #'Numeros-Naturales'!
MCLXXXI class
	instanceVariableNames: ''!

!MCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXXII.
	previous := MCLXXX.! !


!classDefinition: #MCLXXXII category: #'Numeros-Naturales'!
II subclass: #MCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXXII class' category: #'Numeros-Naturales'!
MCLXXXII class
	instanceVariableNames: ''!

!MCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXXIII.
	previous := MCLXXXI.! !


!classDefinition: #MCLXXXIII category: #'Numeros-Naturales'!
II subclass: #MCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXXIII class' category: #'Numeros-Naturales'!
MCLXXXIII class
	instanceVariableNames: ''!

!MCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXXIV.
	previous := MCLXXXII.! !


!classDefinition: #MCLXXXIV category: #'Numeros-Naturales'!
II subclass: #MCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXXIV class' category: #'Numeros-Naturales'!
MCLXXXIV class
	instanceVariableNames: ''!

!MCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXXV.
	previous := MCLXXXIII.! !


!classDefinition: #MCLXXXIX category: #'Numeros-Naturales'!
II subclass: #MCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXXIX class' category: #'Numeros-Naturales'!
MCLXXXIX class
	instanceVariableNames: ''!

!MCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXC.
	previous := MCLXXXVIII.! !


!classDefinition: #MCLXXXV category: #'Numeros-Naturales'!
II subclass: #MCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXXV class' category: #'Numeros-Naturales'!
MCLXXXV class
	instanceVariableNames: ''!

!MCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXXVI.
	previous := MCLXXXIV.! !


!classDefinition: #MCLXXXVI category: #'Numeros-Naturales'!
II subclass: #MCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXXVI class' category: #'Numeros-Naturales'!
MCLXXXVI class
	instanceVariableNames: ''!

!MCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXXVII.
	previous := MCLXXXV.! !


!classDefinition: #MCLXXXVII category: #'Numeros-Naturales'!
II subclass: #MCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXXVII class' category: #'Numeros-Naturales'!
MCLXXXVII class
	instanceVariableNames: ''!

!MCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXXVIII.
	previous := MCLXXXVI.! !


!classDefinition: #MCLXXXVIII category: #'Numeros-Naturales'!
II subclass: #MCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCLXXXVIII class' category: #'Numeros-Naturales'!
MCLXXXVIII class
	instanceVariableNames: ''!

!MCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCLXXXIX.
	previous := MCLXXXVII.! !


!classDefinition: #MCV category: #'Numeros-Naturales'!
II subclass: #MCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCV class' category: #'Numeros-Naturales'!
MCV class
	instanceVariableNames: ''!

!MCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCVI.
	previous := MCIV.! !


!classDefinition: #MCVI category: #'Numeros-Naturales'!
II subclass: #MCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCVI class' category: #'Numeros-Naturales'!
MCVI class
	instanceVariableNames: ''!

!MCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCVII.
	previous := MCV.! !


!classDefinition: #MCVII category: #'Numeros-Naturales'!
II subclass: #MCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCVII class' category: #'Numeros-Naturales'!
MCVII class
	instanceVariableNames: ''!

!MCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCVIII.
	previous := MCVI.! !


!classDefinition: #MCVIII category: #'Numeros-Naturales'!
II subclass: #MCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCVIII class' category: #'Numeros-Naturales'!
MCVIII class
	instanceVariableNames: ''!

!MCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCIX.
	previous := MCVII.! !


!classDefinition: #MCX category: #'Numeros-Naturales'!
II subclass: #MCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCX class' category: #'Numeros-Naturales'!
MCX class
	instanceVariableNames: ''!

!MCX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXI.
	previous := MCIX.! !


!classDefinition: #MCXC category: #'Numeros-Naturales'!
II subclass: #MCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXC class' category: #'Numeros-Naturales'!
MCXC class
	instanceVariableNames: ''!

!MCXC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXCI.
	previous := MCLXXXIX.! !


!classDefinition: #MCXCI category: #'Numeros-Naturales'!
II subclass: #MCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXCI class' category: #'Numeros-Naturales'!
MCXCI class
	instanceVariableNames: ''!

!MCXCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXCII.
	previous := MCXC.! !


!classDefinition: #MCXCII category: #'Numeros-Naturales'!
II subclass: #MCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXCII class' category: #'Numeros-Naturales'!
MCXCII class
	instanceVariableNames: ''!

!MCXCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXCIII.
	previous := MCXCI.! !


!classDefinition: #MCXCIII category: #'Numeros-Naturales'!
II subclass: #MCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXCIII class' category: #'Numeros-Naturales'!
MCXCIII class
	instanceVariableNames: ''!

!MCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXCIV.
	previous := MCXCII.! !


!classDefinition: #MCXCIV category: #'Numeros-Naturales'!
II subclass: #MCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXCIV class' category: #'Numeros-Naturales'!
MCXCIV class
	instanceVariableNames: ''!

!MCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXCV.
	previous := MCXCIII.! !


!classDefinition: #MCXCIX category: #'Numeros-Naturales'!
II subclass: #MCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXCIX class' category: #'Numeros-Naturales'!
MCXCIX class
	instanceVariableNames: ''!

!MCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCC.
	previous := MCXCVIII.! !


!classDefinition: #MCXCV category: #'Numeros-Naturales'!
II subclass: #MCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXCV class' category: #'Numeros-Naturales'!
MCXCV class
	instanceVariableNames: ''!

!MCXCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXCVI.
	previous := MCXCIV.! !


!classDefinition: #MCXCVI category: #'Numeros-Naturales'!
II subclass: #MCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXCVI class' category: #'Numeros-Naturales'!
MCXCVI class
	instanceVariableNames: ''!

!MCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXCVII.
	previous := MCXCV.! !


!classDefinition: #MCXCVII category: #'Numeros-Naturales'!
II subclass: #MCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXCVII class' category: #'Numeros-Naturales'!
MCXCVII class
	instanceVariableNames: ''!

!MCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXCVIII.
	previous := MCXCVI.! !


!classDefinition: #MCXCVIII category: #'Numeros-Naturales'!
II subclass: #MCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXCVIII class' category: #'Numeros-Naturales'!
MCXCVIII class
	instanceVariableNames: ''!

!MCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXCIX.
	previous := MCXCVII.! !


!classDefinition: #MCXI category: #'Numeros-Naturales'!
II subclass: #MCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXI class' category: #'Numeros-Naturales'!
MCXI class
	instanceVariableNames: ''!

!MCXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXII.
	previous := MCX.! !


!classDefinition: #MCXII category: #'Numeros-Naturales'!
II subclass: #MCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXII class' category: #'Numeros-Naturales'!
MCXII class
	instanceVariableNames: ''!

!MCXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXIII.
	previous := MCXI.! !


!classDefinition: #MCXIII category: #'Numeros-Naturales'!
II subclass: #MCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXIII class' category: #'Numeros-Naturales'!
MCXIII class
	instanceVariableNames: ''!

!MCXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXIV.
	previous := MCXII.! !


!classDefinition: #MCXIV category: #'Numeros-Naturales'!
II subclass: #MCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXIV class' category: #'Numeros-Naturales'!
MCXIV class
	instanceVariableNames: ''!

!MCXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXV.
	previous := MCXIII.! !


!classDefinition: #MCXIX category: #'Numeros-Naturales'!
II subclass: #MCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXIX class' category: #'Numeros-Naturales'!
MCXIX class
	instanceVariableNames: ''!

!MCXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXX.
	previous := MCXVIII.! !


!classDefinition: #MCXL category: #'Numeros-Naturales'!
II subclass: #MCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXL class' category: #'Numeros-Naturales'!
MCXL class
	instanceVariableNames: ''!

!MCXL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXLI.
	previous := MCXXXIX.! !


!classDefinition: #MCXLI category: #'Numeros-Naturales'!
II subclass: #MCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXLI class' category: #'Numeros-Naturales'!
MCXLI class
	instanceVariableNames: ''!

!MCXLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXLII.
	previous := MCXL.! !


!classDefinition: #MCXLII category: #'Numeros-Naturales'!
II subclass: #MCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXLII class' category: #'Numeros-Naturales'!
MCXLII class
	instanceVariableNames: ''!

!MCXLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXLIII.
	previous := MCXLI.! !


!classDefinition: #MCXLIII category: #'Numeros-Naturales'!
II subclass: #MCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXLIII class' category: #'Numeros-Naturales'!
MCXLIII class
	instanceVariableNames: ''!

!MCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXLIV.
	previous := MCXLII.! !


!classDefinition: #MCXLIV category: #'Numeros-Naturales'!
II subclass: #MCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXLIV class' category: #'Numeros-Naturales'!
MCXLIV class
	instanceVariableNames: ''!

!MCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXLV.
	previous := MCXLIII.! !


!classDefinition: #MCXLIX category: #'Numeros-Naturales'!
II subclass: #MCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXLIX class' category: #'Numeros-Naturales'!
MCXLIX class
	instanceVariableNames: ''!

!MCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCL.
	previous := MCXLVIII.! !


!classDefinition: #MCXLV category: #'Numeros-Naturales'!
II subclass: #MCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXLV class' category: #'Numeros-Naturales'!
MCXLV class
	instanceVariableNames: ''!

!MCXLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXLVI.
	previous := MCXLIV.! !


!classDefinition: #MCXLVI category: #'Numeros-Naturales'!
II subclass: #MCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXLVI class' category: #'Numeros-Naturales'!
MCXLVI class
	instanceVariableNames: ''!

!MCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXLVII.
	previous := MCXLV.! !


!classDefinition: #MCXLVII category: #'Numeros-Naturales'!
II subclass: #MCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXLVII class' category: #'Numeros-Naturales'!
MCXLVII class
	instanceVariableNames: ''!

!MCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXLVIII.
	previous := MCXLVI.! !


!classDefinition: #MCXLVIII category: #'Numeros-Naturales'!
II subclass: #MCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXLVIII class' category: #'Numeros-Naturales'!
MCXLVIII class
	instanceVariableNames: ''!

!MCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXLIX.
	previous := MCXLVII.! !


!classDefinition: #MCXV category: #'Numeros-Naturales'!
II subclass: #MCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXV class' category: #'Numeros-Naturales'!
MCXV class
	instanceVariableNames: ''!

!MCXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXVI.
	previous := MCXIV.! !


!classDefinition: #MCXVI category: #'Numeros-Naturales'!
II subclass: #MCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXVI class' category: #'Numeros-Naturales'!
MCXVI class
	instanceVariableNames: ''!

!MCXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXVII.
	previous := MCXV.! !


!classDefinition: #MCXVII category: #'Numeros-Naturales'!
II subclass: #MCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXVII class' category: #'Numeros-Naturales'!
MCXVII class
	instanceVariableNames: ''!

!MCXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXVIII.
	previous := MCXVI.! !


!classDefinition: #MCXVIII category: #'Numeros-Naturales'!
II subclass: #MCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXVIII class' category: #'Numeros-Naturales'!
MCXVIII class
	instanceVariableNames: ''!

!MCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXIX.
	previous := MCXVII.! !


!classDefinition: #MCXX category: #'Numeros-Naturales'!
II subclass: #MCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXX class' category: #'Numeros-Naturales'!
MCXX class
	instanceVariableNames: ''!

!MCXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXI.
	previous := MCXIX.! !


!classDefinition: #MCXXI category: #'Numeros-Naturales'!
II subclass: #MCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXI class' category: #'Numeros-Naturales'!
MCXXI class
	instanceVariableNames: ''!

!MCXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXII.
	previous := MCXX.! !


!classDefinition: #MCXXII category: #'Numeros-Naturales'!
II subclass: #MCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXII class' category: #'Numeros-Naturales'!
MCXXII class
	instanceVariableNames: ''!

!MCXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXIII.
	previous := MCXXI.! !


!classDefinition: #MCXXIII category: #'Numeros-Naturales'!
II subclass: #MCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXIII class' category: #'Numeros-Naturales'!
MCXXIII class
	instanceVariableNames: ''!

!MCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXIV.
	previous := MCXXII.! !


!classDefinition: #MCXXIV category: #'Numeros-Naturales'!
II subclass: #MCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXIV class' category: #'Numeros-Naturales'!
MCXXIV class
	instanceVariableNames: ''!

!MCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXV.
	previous := MCXXIII.! !


!classDefinition: #MCXXIX category: #'Numeros-Naturales'!
II subclass: #MCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXIX class' category: #'Numeros-Naturales'!
MCXXIX class
	instanceVariableNames: ''!

!MCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXX.
	previous := MCXXVIII.! !


!classDefinition: #MCXXV category: #'Numeros-Naturales'!
II subclass: #MCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXV class' category: #'Numeros-Naturales'!
MCXXV class
	instanceVariableNames: ''!

!MCXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXVI.
	previous := MCXXIV.! !


!classDefinition: #MCXXVI category: #'Numeros-Naturales'!
II subclass: #MCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXVI class' category: #'Numeros-Naturales'!
MCXXVI class
	instanceVariableNames: ''!

!MCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXVII.
	previous := MCXXV.! !


!classDefinition: #MCXXVII category: #'Numeros-Naturales'!
II subclass: #MCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXVII class' category: #'Numeros-Naturales'!
MCXXVII class
	instanceVariableNames: ''!

!MCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXVIII.
	previous := MCXXVI.! !


!classDefinition: #MCXXVIII category: #'Numeros-Naturales'!
II subclass: #MCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXVIII class' category: #'Numeros-Naturales'!
MCXXVIII class
	instanceVariableNames: ''!

!MCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXIX.
	previous := MCXXVII.! !


!classDefinition: #MCXXX category: #'Numeros-Naturales'!
II subclass: #MCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXX class' category: #'Numeros-Naturales'!
MCXXX class
	instanceVariableNames: ''!

!MCXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXXI.
	previous := MCXXIX.! !


!classDefinition: #MCXXXI category: #'Numeros-Naturales'!
II subclass: #MCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXXI class' category: #'Numeros-Naturales'!
MCXXXI class
	instanceVariableNames: ''!

!MCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXXII.
	previous := MCXXX.! !


!classDefinition: #MCXXXII category: #'Numeros-Naturales'!
II subclass: #MCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXXII class' category: #'Numeros-Naturales'!
MCXXXII class
	instanceVariableNames: ''!

!MCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXXIII.
	previous := MCXXXI.! !


!classDefinition: #MCXXXIII category: #'Numeros-Naturales'!
II subclass: #MCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXXIII class' category: #'Numeros-Naturales'!
MCXXXIII class
	instanceVariableNames: ''!

!MCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXXIV.
	previous := MCXXXII.! !


!classDefinition: #MCXXXIV category: #'Numeros-Naturales'!
II subclass: #MCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXXIV class' category: #'Numeros-Naturales'!
MCXXXIV class
	instanceVariableNames: ''!

!MCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXXV.
	previous := MCXXXIII.! !


!classDefinition: #MCXXXIX category: #'Numeros-Naturales'!
II subclass: #MCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXXIX class' category: #'Numeros-Naturales'!
MCXXXIX class
	instanceVariableNames: ''!

!MCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXL.
	previous := MCXXXVIII.! !


!classDefinition: #MCXXXV category: #'Numeros-Naturales'!
II subclass: #MCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXXV class' category: #'Numeros-Naturales'!
MCXXXV class
	instanceVariableNames: ''!

!MCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXXVI.
	previous := MCXXXIV.! !


!classDefinition: #MCXXXVI category: #'Numeros-Naturales'!
II subclass: #MCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXXVI class' category: #'Numeros-Naturales'!
MCXXXVI class
	instanceVariableNames: ''!

!MCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXXVII.
	previous := MCXXXV.! !


!classDefinition: #MCXXXVII category: #'Numeros-Naturales'!
II subclass: #MCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXXVII class' category: #'Numeros-Naturales'!
MCXXXVII class
	instanceVariableNames: ''!

!MCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXXVIII.
	previous := MCXXXVI.! !


!classDefinition: #MCXXXVIII category: #'Numeros-Naturales'!
II subclass: #MCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MCXXXVIII class' category: #'Numeros-Naturales'!
MCXXXVIII class
	instanceVariableNames: ''!

!MCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MCXXXIX.
	previous := MCXXXVII.! !


!classDefinition: #MI category: #'Numeros-Naturales'!
II subclass: #MI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MI class' category: #'Numeros-Naturales'!
MI class
	instanceVariableNames: ''!

!MI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MII.
	previous := M.! !


!classDefinition: #MII category: #'Numeros-Naturales'!
II subclass: #MII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MII class' category: #'Numeros-Naturales'!
MII class
	instanceVariableNames: ''!

!MII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MIII.
	previous := MI.! !


!classDefinition: #MIII category: #'Numeros-Naturales'!
II subclass: #MIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MIII class' category: #'Numeros-Naturales'!
MIII class
	instanceVariableNames: ''!

!MIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MIV.
	previous := MII.! !


!classDefinition: #MIV category: #'Numeros-Naturales'!
II subclass: #MIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MIV class' category: #'Numeros-Naturales'!
MIV class
	instanceVariableNames: ''!

!MIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MV.
	previous := MIII.! !


!classDefinition: #MIX category: #'Numeros-Naturales'!
II subclass: #MIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MIX class' category: #'Numeros-Naturales'!
MIX class
	instanceVariableNames: ''!

!MIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MX.
	previous := MVIII.! !


!classDefinition: #ML category: #'Numeros-Naturales'!
II subclass: #ML
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ML class' category: #'Numeros-Naturales'!
ML class
	instanceVariableNames: ''!

!ML class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLI.
	previous := MXLIX.! !


!classDefinition: #MLI category: #'Numeros-Naturales'!
II subclass: #MLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLI class' category: #'Numeros-Naturales'!
MLI class
	instanceVariableNames: ''!

!MLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLII.
	previous := ML.! !


!classDefinition: #MLII category: #'Numeros-Naturales'!
II subclass: #MLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLII class' category: #'Numeros-Naturales'!
MLII class
	instanceVariableNames: ''!

!MLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLIII.
	previous := MLI.! !


!classDefinition: #MLIII category: #'Numeros-Naturales'!
II subclass: #MLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLIII class' category: #'Numeros-Naturales'!
MLIII class
	instanceVariableNames: ''!

!MLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLIV.
	previous := MLII.! !


!classDefinition: #MLIV category: #'Numeros-Naturales'!
II subclass: #MLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLIV class' category: #'Numeros-Naturales'!
MLIV class
	instanceVariableNames: ''!

!MLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLV.
	previous := MLIII.! !


!classDefinition: #MLIX category: #'Numeros-Naturales'!
II subclass: #MLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLIX class' category: #'Numeros-Naturales'!
MLIX class
	instanceVariableNames: ''!

!MLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLX.
	previous := MLVIII.! !


!classDefinition: #MLV category: #'Numeros-Naturales'!
II subclass: #MLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLV class' category: #'Numeros-Naturales'!
MLV class
	instanceVariableNames: ''!

!MLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLVI.
	previous := MLIV.! !


!classDefinition: #MLVI category: #'Numeros-Naturales'!
II subclass: #MLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLVI class' category: #'Numeros-Naturales'!
MLVI class
	instanceVariableNames: ''!

!MLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLVII.
	previous := MLV.! !


!classDefinition: #MLVII category: #'Numeros-Naturales'!
II subclass: #MLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLVII class' category: #'Numeros-Naturales'!
MLVII class
	instanceVariableNames: ''!

!MLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLVIII.
	previous := MLVI.! !


!classDefinition: #MLVIII category: #'Numeros-Naturales'!
II subclass: #MLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLVIII class' category: #'Numeros-Naturales'!
MLVIII class
	instanceVariableNames: ''!

!MLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLIX.
	previous := MLVII.! !


!classDefinition: #MLX category: #'Numeros-Naturales'!
II subclass: #MLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLX class' category: #'Numeros-Naturales'!
MLX class
	instanceVariableNames: ''!

!MLX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXI.
	previous := MLIX.! !


!classDefinition: #MLXI category: #'Numeros-Naturales'!
II subclass: #MLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXI class' category: #'Numeros-Naturales'!
MLXI class
	instanceVariableNames: ''!

!MLXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXII.
	previous := MLX.! !


!classDefinition: #MLXII category: #'Numeros-Naturales'!
II subclass: #MLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXII class' category: #'Numeros-Naturales'!
MLXII class
	instanceVariableNames: ''!

!MLXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXIII.
	previous := MLXI.! !


!classDefinition: #MLXIII category: #'Numeros-Naturales'!
II subclass: #MLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXIII class' category: #'Numeros-Naturales'!
MLXIII class
	instanceVariableNames: ''!

!MLXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXIV.
	previous := MLXII.! !


!classDefinition: #MLXIV category: #'Numeros-Naturales'!
II subclass: #MLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXIV class' category: #'Numeros-Naturales'!
MLXIV class
	instanceVariableNames: ''!

!MLXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXV.
	previous := MLXIII.! !


!classDefinition: #MLXIX category: #'Numeros-Naturales'!
II subclass: #MLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXIX class' category: #'Numeros-Naturales'!
MLXIX class
	instanceVariableNames: ''!

!MLXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXX.
	previous := MLXVIII.! !


!classDefinition: #MLXV category: #'Numeros-Naturales'!
II subclass: #MLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXV class' category: #'Numeros-Naturales'!
MLXV class
	instanceVariableNames: ''!

!MLXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXVI.
	previous := MLXIV.! !


!classDefinition: #MLXVI category: #'Numeros-Naturales'!
II subclass: #MLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXVI class' category: #'Numeros-Naturales'!
MLXVI class
	instanceVariableNames: ''!

!MLXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXVII.
	previous := MLXV.! !


!classDefinition: #MLXVII category: #'Numeros-Naturales'!
II subclass: #MLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXVII class' category: #'Numeros-Naturales'!
MLXVII class
	instanceVariableNames: ''!

!MLXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXVIII.
	previous := MLXVI.! !


!classDefinition: #MLXVIII category: #'Numeros-Naturales'!
II subclass: #MLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXVIII class' category: #'Numeros-Naturales'!
MLXVIII class
	instanceVariableNames: ''!

!MLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXIX.
	previous := MLXVII.! !


!classDefinition: #MLXX category: #'Numeros-Naturales'!
II subclass: #MLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXX class' category: #'Numeros-Naturales'!
MLXX class
	instanceVariableNames: ''!

!MLXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXI.
	previous := MLXIX.! !


!classDefinition: #MLXXI category: #'Numeros-Naturales'!
II subclass: #MLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXI class' category: #'Numeros-Naturales'!
MLXXI class
	instanceVariableNames: ''!

!MLXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXII.
	previous := MLXX.! !


!classDefinition: #MLXXII category: #'Numeros-Naturales'!
II subclass: #MLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXII class' category: #'Numeros-Naturales'!
MLXXII class
	instanceVariableNames: ''!

!MLXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXIII.
	previous := MLXXI.! !


!classDefinition: #MLXXIII category: #'Numeros-Naturales'!
II subclass: #MLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXIII class' category: #'Numeros-Naturales'!
MLXXIII class
	instanceVariableNames: ''!

!MLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXIV.
	previous := MLXXII.! !


!classDefinition: #MLXXIV category: #'Numeros-Naturales'!
II subclass: #MLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXIV class' category: #'Numeros-Naturales'!
MLXXIV class
	instanceVariableNames: ''!

!MLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXV.
	previous := MLXXIII.! !


!classDefinition: #MLXXIX category: #'Numeros-Naturales'!
II subclass: #MLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXIX class' category: #'Numeros-Naturales'!
MLXXIX class
	instanceVariableNames: ''!

!MLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXX.
	previous := MLXXVIII.! !


!classDefinition: #MLXXV category: #'Numeros-Naturales'!
II subclass: #MLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXV class' category: #'Numeros-Naturales'!
MLXXV class
	instanceVariableNames: ''!

!MLXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXVI.
	previous := MLXXIV.! !


!classDefinition: #MLXXVI category: #'Numeros-Naturales'!
II subclass: #MLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXVI class' category: #'Numeros-Naturales'!
MLXXVI class
	instanceVariableNames: ''!

!MLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXVII.
	previous := MLXXV.! !


!classDefinition: #MLXXVII category: #'Numeros-Naturales'!
II subclass: #MLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXVII class' category: #'Numeros-Naturales'!
MLXXVII class
	instanceVariableNames: ''!

!MLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXVIII.
	previous := MLXXVI.! !


!classDefinition: #MLXXVIII category: #'Numeros-Naturales'!
II subclass: #MLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXVIII class' category: #'Numeros-Naturales'!
MLXXVIII class
	instanceVariableNames: ''!

!MLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXIX.
	previous := MLXXVII.! !


!classDefinition: #MLXXX category: #'Numeros-Naturales'!
II subclass: #MLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXX class' category: #'Numeros-Naturales'!
MLXXX class
	instanceVariableNames: ''!

!MLXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXXI.
	previous := MLXXIX.! !


!classDefinition: #MLXXXI category: #'Numeros-Naturales'!
II subclass: #MLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXXI class' category: #'Numeros-Naturales'!
MLXXXI class
	instanceVariableNames: ''!

!MLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXXII.
	previous := MLXXX.! !


!classDefinition: #MLXXXII category: #'Numeros-Naturales'!
II subclass: #MLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXXII class' category: #'Numeros-Naturales'!
MLXXXII class
	instanceVariableNames: ''!

!MLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXXIII.
	previous := MLXXXI.! !


!classDefinition: #MLXXXIII category: #'Numeros-Naturales'!
II subclass: #MLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXXIII class' category: #'Numeros-Naturales'!
MLXXXIII class
	instanceVariableNames: ''!

!MLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXXIV.
	previous := MLXXXII.! !


!classDefinition: #MLXXXIV category: #'Numeros-Naturales'!
II subclass: #MLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXXIV class' category: #'Numeros-Naturales'!
MLXXXIV class
	instanceVariableNames: ''!

!MLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXXV.
	previous := MLXXXIII.! !


!classDefinition: #MLXXXIX category: #'Numeros-Naturales'!
II subclass: #MLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXXIX class' category: #'Numeros-Naturales'!
MLXXXIX class
	instanceVariableNames: ''!

!MLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXC.
	previous := MLXXXVIII.! !


!classDefinition: #MLXXXV category: #'Numeros-Naturales'!
II subclass: #MLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXXV class' category: #'Numeros-Naturales'!
MLXXXV class
	instanceVariableNames: ''!

!MLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXXVI.
	previous := MLXXXIV.! !


!classDefinition: #MLXXXVI category: #'Numeros-Naturales'!
II subclass: #MLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXXVI class' category: #'Numeros-Naturales'!
MLXXXVI class
	instanceVariableNames: ''!

!MLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXXVII.
	previous := MLXXXV.! !


!classDefinition: #MLXXXVII category: #'Numeros-Naturales'!
II subclass: #MLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXXVII class' category: #'Numeros-Naturales'!
MLXXXVII class
	instanceVariableNames: ''!

!MLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXXVIII.
	previous := MLXXXVI.! !


!classDefinition: #MLXXXVIII category: #'Numeros-Naturales'!
II subclass: #MLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MLXXXVIII class' category: #'Numeros-Naturales'!
MLXXXVIII class
	instanceVariableNames: ''!

!MLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MLXXXIX.
	previous := MLXXXVII.! !


!classDefinition: #MV category: #'Numeros-Naturales'!
II subclass: #MV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MV class' category: #'Numeros-Naturales'!
MV class
	instanceVariableNames: ''!

!MV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MVI.
	previous := MIV.! !


!classDefinition: #MVI category: #'Numeros-Naturales'!
II subclass: #MVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MVI class' category: #'Numeros-Naturales'!
MVI class
	instanceVariableNames: ''!

!MVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MVII.
	previous := MV.! !


!classDefinition: #MVII category: #'Numeros-Naturales'!
II subclass: #MVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MVII class' category: #'Numeros-Naturales'!
MVII class
	instanceVariableNames: ''!

!MVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MVIII.
	previous := MVI.! !


!classDefinition: #MVIII category: #'Numeros-Naturales'!
II subclass: #MVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MVIII class' category: #'Numeros-Naturales'!
MVIII class
	instanceVariableNames: ''!

!MVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MIX.
	previous := MVII.! !


!classDefinition: #MX category: #'Numeros-Naturales'!
II subclass: #MX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MX class' category: #'Numeros-Naturales'!
MX class
	instanceVariableNames: ''!

!MX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXI.
	previous := MIX.! !


!classDefinition: #MXC category: #'Numeros-Naturales'!
II subclass: #MXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXC class' category: #'Numeros-Naturales'!
MXC class
	instanceVariableNames: ''!

!MXC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXCI.
	previous := MLXXXIX.! !


!classDefinition: #MXCI category: #'Numeros-Naturales'!
II subclass: #MXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXCI class' category: #'Numeros-Naturales'!
MXCI class
	instanceVariableNames: ''!

!MXCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXCII.
	previous := MXC.! !


!classDefinition: #MXCII category: #'Numeros-Naturales'!
II subclass: #MXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXCII class' category: #'Numeros-Naturales'!
MXCII class
	instanceVariableNames: ''!

!MXCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXCIII.
	previous := MXCI.! !


!classDefinition: #MXCIII category: #'Numeros-Naturales'!
II subclass: #MXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXCIII class' category: #'Numeros-Naturales'!
MXCIII class
	instanceVariableNames: ''!

!MXCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXCIV.
	previous := MXCII.! !


!classDefinition: #MXCIV category: #'Numeros-Naturales'!
II subclass: #MXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXCIV class' category: #'Numeros-Naturales'!
MXCIV class
	instanceVariableNames: ''!

!MXCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXCV.
	previous := MXCIII.! !


!classDefinition: #MXCIX category: #'Numeros-Naturales'!
II subclass: #MXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXCIX class' category: #'Numeros-Naturales'!
MXCIX class
	instanceVariableNames: ''!

!MXCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MC.
	previous := MXCVIII.! !


!classDefinition: #MXCV category: #'Numeros-Naturales'!
II subclass: #MXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXCV class' category: #'Numeros-Naturales'!
MXCV class
	instanceVariableNames: ''!

!MXCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXCVI.
	previous := MXCIV.! !


!classDefinition: #MXCVI category: #'Numeros-Naturales'!
II subclass: #MXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXCVI class' category: #'Numeros-Naturales'!
MXCVI class
	instanceVariableNames: ''!

!MXCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXCVII.
	previous := MXCV.! !


!classDefinition: #MXCVII category: #'Numeros-Naturales'!
II subclass: #MXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXCVII class' category: #'Numeros-Naturales'!
MXCVII class
	instanceVariableNames: ''!

!MXCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXCVIII.
	previous := MXCVI.! !


!classDefinition: #MXCVIII category: #'Numeros-Naturales'!
II subclass: #MXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXCVIII class' category: #'Numeros-Naturales'!
MXCVIII class
	instanceVariableNames: ''!

!MXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXCIX.
	previous := MXCVII.! !


!classDefinition: #MXI category: #'Numeros-Naturales'!
II subclass: #MXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXI class' category: #'Numeros-Naturales'!
MXI class
	instanceVariableNames: ''!

!MXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXII.
	previous := MX.! !


!classDefinition: #MXII category: #'Numeros-Naturales'!
II subclass: #MXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXII class' category: #'Numeros-Naturales'!
MXII class
	instanceVariableNames: ''!

!MXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXIII.
	previous := MXI.! !


!classDefinition: #MXIII category: #'Numeros-Naturales'!
II subclass: #MXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXIII class' category: #'Numeros-Naturales'!
MXIII class
	instanceVariableNames: ''!

!MXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXIV.
	previous := MXII.! !


!classDefinition: #MXIV category: #'Numeros-Naturales'!
II subclass: #MXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXIV class' category: #'Numeros-Naturales'!
MXIV class
	instanceVariableNames: ''!

!MXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXV.
	previous := MXIII.! !


!classDefinition: #MXIX category: #'Numeros-Naturales'!
II subclass: #MXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXIX class' category: #'Numeros-Naturales'!
MXIX class
	instanceVariableNames: ''!

!MXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXX.
	previous := MXVIII.! !


!classDefinition: #MXL category: #'Numeros-Naturales'!
II subclass: #MXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXL class' category: #'Numeros-Naturales'!
MXL class
	instanceVariableNames: ''!

!MXL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXLI.
	previous := MXXXIX.! !


!classDefinition: #MXLI category: #'Numeros-Naturales'!
II subclass: #MXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXLI class' category: #'Numeros-Naturales'!
MXLI class
	instanceVariableNames: ''!

!MXLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXLII.
	previous := MXL.! !


!classDefinition: #MXLII category: #'Numeros-Naturales'!
II subclass: #MXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXLII class' category: #'Numeros-Naturales'!
MXLII class
	instanceVariableNames: ''!

!MXLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXLIII.
	previous := MXLI.! !


!classDefinition: #MXLIII category: #'Numeros-Naturales'!
II subclass: #MXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXLIII class' category: #'Numeros-Naturales'!
MXLIII class
	instanceVariableNames: ''!

!MXLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXLIV.
	previous := MXLII.! !


!classDefinition: #MXLIV category: #'Numeros-Naturales'!
II subclass: #MXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXLIV class' category: #'Numeros-Naturales'!
MXLIV class
	instanceVariableNames: ''!

!MXLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXLV.
	previous := MXLIII.! !


!classDefinition: #MXLIX category: #'Numeros-Naturales'!
II subclass: #MXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXLIX class' category: #'Numeros-Naturales'!
MXLIX class
	instanceVariableNames: ''!

!MXLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := ML.
	previous := MXLVIII.! !


!classDefinition: #MXLV category: #'Numeros-Naturales'!
II subclass: #MXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXLV class' category: #'Numeros-Naturales'!
MXLV class
	instanceVariableNames: ''!

!MXLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXLVI.
	previous := MXLIV.! !


!classDefinition: #MXLVI category: #'Numeros-Naturales'!
II subclass: #MXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXLVI class' category: #'Numeros-Naturales'!
MXLVI class
	instanceVariableNames: ''!

!MXLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXLVII.
	previous := MXLV.! !


!classDefinition: #MXLVII category: #'Numeros-Naturales'!
II subclass: #MXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXLVII class' category: #'Numeros-Naturales'!
MXLVII class
	instanceVariableNames: ''!

!MXLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXLVIII.
	previous := MXLVI.! !


!classDefinition: #MXLVIII category: #'Numeros-Naturales'!
II subclass: #MXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXLVIII class' category: #'Numeros-Naturales'!
MXLVIII class
	instanceVariableNames: ''!

!MXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXLIX.
	previous := MXLVII.! !


!classDefinition: #MXV category: #'Numeros-Naturales'!
II subclass: #MXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXV class' category: #'Numeros-Naturales'!
MXV class
	instanceVariableNames: ''!

!MXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXVI.
	previous := MXIV.! !


!classDefinition: #MXVI category: #'Numeros-Naturales'!
II subclass: #MXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXVI class' category: #'Numeros-Naturales'!
MXVI class
	instanceVariableNames: ''!

!MXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXVII.
	previous := MXV.! !


!classDefinition: #MXVII category: #'Numeros-Naturales'!
II subclass: #MXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXVII class' category: #'Numeros-Naturales'!
MXVII class
	instanceVariableNames: ''!

!MXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXVIII.
	previous := MXVI.! !


!classDefinition: #MXVIII category: #'Numeros-Naturales'!
II subclass: #MXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXVIII class' category: #'Numeros-Naturales'!
MXVIII class
	instanceVariableNames: ''!

!MXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXIX.
	previous := MXVII.! !


!classDefinition: #MXX category: #'Numeros-Naturales'!
II subclass: #MXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXX class' category: #'Numeros-Naturales'!
MXX class
	instanceVariableNames: ''!

!MXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXI.
	previous := MXIX.! !


!classDefinition: #MXXI category: #'Numeros-Naturales'!
II subclass: #MXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXI class' category: #'Numeros-Naturales'!
MXXI class
	instanceVariableNames: ''!

!MXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXII.
	previous := MXX.! !


!classDefinition: #MXXII category: #'Numeros-Naturales'!
II subclass: #MXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXII class' category: #'Numeros-Naturales'!
MXXII class
	instanceVariableNames: ''!

!MXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXIII.
	previous := MXXI.! !


!classDefinition: #MXXIII category: #'Numeros-Naturales'!
II subclass: #MXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXIII class' category: #'Numeros-Naturales'!
MXXIII class
	instanceVariableNames: ''!

!MXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXIV.
	previous := MXXII.! !


!classDefinition: #MXXIV category: #'Numeros-Naturales'!
II subclass: #MXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXIV class' category: #'Numeros-Naturales'!
MXXIV class
	instanceVariableNames: ''!

!MXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXV.
	previous := MXXIII.! !


!classDefinition: #MXXIX category: #'Numeros-Naturales'!
II subclass: #MXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXIX class' category: #'Numeros-Naturales'!
MXXIX class
	instanceVariableNames: ''!

!MXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXX.
	previous := MXXVIII.! !


!classDefinition: #MXXV category: #'Numeros-Naturales'!
II subclass: #MXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXV class' category: #'Numeros-Naturales'!
MXXV class
	instanceVariableNames: ''!

!MXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXVI.
	previous := MXXIV.! !


!classDefinition: #MXXVI category: #'Numeros-Naturales'!
II subclass: #MXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXVI class' category: #'Numeros-Naturales'!
MXXVI class
	instanceVariableNames: ''!

!MXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXVII.
	previous := MXXV.! !


!classDefinition: #MXXVII category: #'Numeros-Naturales'!
II subclass: #MXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXVII class' category: #'Numeros-Naturales'!
MXXVII class
	instanceVariableNames: ''!

!MXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXVIII.
	previous := MXXVI.! !


!classDefinition: #MXXVIII category: #'Numeros-Naturales'!
II subclass: #MXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXVIII class' category: #'Numeros-Naturales'!
MXXVIII class
	instanceVariableNames: ''!

!MXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXIX.
	previous := MXXVII.! !


!classDefinition: #MXXX category: #'Numeros-Naturales'!
II subclass: #MXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXX class' category: #'Numeros-Naturales'!
MXXX class
	instanceVariableNames: ''!

!MXXX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXXI.
	previous := MXXIX.! !


!classDefinition: #MXXXI category: #'Numeros-Naturales'!
II subclass: #MXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXXI class' category: #'Numeros-Naturales'!
MXXXI class
	instanceVariableNames: ''!

!MXXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXXII.
	previous := MXXX.! !


!classDefinition: #MXXXII category: #'Numeros-Naturales'!
II subclass: #MXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXXII class' category: #'Numeros-Naturales'!
MXXXII class
	instanceVariableNames: ''!

!MXXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXXIII.
	previous := MXXXI.! !


!classDefinition: #MXXXIII category: #'Numeros-Naturales'!
II subclass: #MXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXXIII class' category: #'Numeros-Naturales'!
MXXXIII class
	instanceVariableNames: ''!

!MXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXXIV.
	previous := MXXXII.! !


!classDefinition: #MXXXIV category: #'Numeros-Naturales'!
II subclass: #MXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXXIV class' category: #'Numeros-Naturales'!
MXXXIV class
	instanceVariableNames: ''!

!MXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXXV.
	previous := MXXXIII.! !


!classDefinition: #MXXXIX category: #'Numeros-Naturales'!
II subclass: #MXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXXIX class' category: #'Numeros-Naturales'!
MXXXIX class
	instanceVariableNames: ''!

!MXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXL.
	previous := MXXXVIII.! !


!classDefinition: #MXXXV category: #'Numeros-Naturales'!
II subclass: #MXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXXV class' category: #'Numeros-Naturales'!
MXXXV class
	instanceVariableNames: ''!

!MXXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXXVI.
	previous := MXXXIV.! !


!classDefinition: #MXXXVI category: #'Numeros-Naturales'!
II subclass: #MXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXXVI class' category: #'Numeros-Naturales'!
MXXXVI class
	instanceVariableNames: ''!

!MXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXXVII.
	previous := MXXXV.! !


!classDefinition: #MXXXVII category: #'Numeros-Naturales'!
II subclass: #MXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXXVII class' category: #'Numeros-Naturales'!
MXXXVII class
	instanceVariableNames: ''!

!MXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXXVIII.
	previous := MXXXVI.! !


!classDefinition: #MXXXVIII category: #'Numeros-Naturales'!
II subclass: #MXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MXXXVIII class' category: #'Numeros-Naturales'!
MXXXVIII class
	instanceVariableNames: ''!

!MXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := MXXXIX.
	previous := MXXXVII.! !


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

!V class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
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

!VI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
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

!VII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:45'!
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

!VIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
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

!X class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XI.
	previous := IX.! !


!classDefinition: #XC category: #'Numeros-Naturales'!
II subclass: #XC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XC class' category: #'Numeros-Naturales'!
XC class
	instanceVariableNames: ''!

!XC class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCI.
	previous := LXXXIX.! !


!classDefinition: #XCI category: #'Numeros-Naturales'!
II subclass: #XCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCI class' category: #'Numeros-Naturales'!
XCI class
	instanceVariableNames: ''!

!XCI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCII.
	previous := XC.! !


!classDefinition: #XCII category: #'Numeros-Naturales'!
II subclass: #XCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCII class' category: #'Numeros-Naturales'!
XCII class
	instanceVariableNames: ''!

!XCII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCIII.
	previous := XCI.! !


!classDefinition: #XCIII category: #'Numeros-Naturales'!
II subclass: #XCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCIII class' category: #'Numeros-Naturales'!
XCIII class
	instanceVariableNames: ''!

!XCIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCIV.
	previous := XCII.! !


!classDefinition: #XCIV category: #'Numeros-Naturales'!
II subclass: #XCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCIV class' category: #'Numeros-Naturales'!
XCIV class
	instanceVariableNames: ''!

!XCIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCV.
	previous := XCIII.! !


!classDefinition: #XCIX category: #'Numeros-Naturales'!
II subclass: #XCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCIX class' category: #'Numeros-Naturales'!
XCIX class
	instanceVariableNames: ''!

!XCIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := C.
	previous := XCVIII.! !


!classDefinition: #XCV category: #'Numeros-Naturales'!
II subclass: #XCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCV class' category: #'Numeros-Naturales'!
XCV class
	instanceVariableNames: ''!

!XCV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCVI.
	previous := XCIV.! !


!classDefinition: #XCVI category: #'Numeros-Naturales'!
II subclass: #XCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCVI class' category: #'Numeros-Naturales'!
XCVI class
	instanceVariableNames: ''!

!XCVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCVII.
	previous := XCV.! !


!classDefinition: #XCVII category: #'Numeros-Naturales'!
II subclass: #XCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCVII class' category: #'Numeros-Naturales'!
XCVII class
	instanceVariableNames: ''!

!XCVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCVIII.
	previous := XCVI.! !


!classDefinition: #XCVIII category: #'Numeros-Naturales'!
II subclass: #XCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCVIII class' category: #'Numeros-Naturales'!
XCVIII class
	instanceVariableNames: ''!

!XCVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCIX.
	previous := XCVII.! !


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

!XI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
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

!XII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
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

!XIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
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

!XIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
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

!XIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XX.
	previous := XVIII.! !


!classDefinition: #XL category: #'Numeros-Naturales'!
II subclass: #XL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XL class' category: #'Numeros-Naturales'!
XL class
	instanceVariableNames: ''!

!XL class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLI.
	previous := XXXIX.! !


!classDefinition: #XLI category: #'Numeros-Naturales'!
II subclass: #XLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLI class' category: #'Numeros-Naturales'!
XLI class
	instanceVariableNames: ''!

!XLI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLII.
	previous := XL.! !


!classDefinition: #XLII category: #'Numeros-Naturales'!
II subclass: #XLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLII class' category: #'Numeros-Naturales'!
XLII class
	instanceVariableNames: ''!

!XLII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLIII.
	previous := XLI.! !


!classDefinition: #XLIII category: #'Numeros-Naturales'!
II subclass: #XLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIII class' category: #'Numeros-Naturales'!
XLIII class
	instanceVariableNames: ''!

!XLIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLIV.
	previous := XLII.! !


!classDefinition: #XLIV category: #'Numeros-Naturales'!
II subclass: #XLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIV class' category: #'Numeros-Naturales'!
XLIV class
	instanceVariableNames: ''!

!XLIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLV.
	previous := XLIII.! !


!classDefinition: #XLIX category: #'Numeros-Naturales'!
II subclass: #XLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIX class' category: #'Numeros-Naturales'!
XLIX class
	instanceVariableNames: ''!

!XLIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := L.
	previous := XLVIII.! !


!classDefinition: #XLV category: #'Numeros-Naturales'!
II subclass: #XLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLV class' category: #'Numeros-Naturales'!
XLV class
	instanceVariableNames: ''!

!XLV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLVI.
	previous := XLIV.! !


!classDefinition: #XLVI category: #'Numeros-Naturales'!
II subclass: #XLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVI class' category: #'Numeros-Naturales'!
XLVI class
	instanceVariableNames: ''!

!XLVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLVII.
	previous := XLV.! !


!classDefinition: #XLVII category: #'Numeros-Naturales'!
II subclass: #XLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVII class' category: #'Numeros-Naturales'!
XLVII class
	instanceVariableNames: ''!

!XLVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLVIII.
	previous := XLVI.! !


!classDefinition: #XLVIII category: #'Numeros-Naturales'!
II subclass: #XLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVIII class' category: #'Numeros-Naturales'!
XLVIII class
	instanceVariableNames: ''!

!XLVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLIX.
	previous := XLVII.! !


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

!XV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
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

!XVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
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

!XVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
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

!XVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
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

!XX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXI.
	previous := XIX.! !


!classDefinition: #XXI category: #'Numeros-Naturales'!
II subclass: #XXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXI class' category: #'Numeros-Naturales'!
XXI class
	instanceVariableNames: ''!

!XXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXII.
	previous := XX.! !


!classDefinition: #XXII category: #'Numeros-Naturales'!
II subclass: #XXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXII class' category: #'Numeros-Naturales'!
XXII class
	instanceVariableNames: ''!

!XXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXIII.
	previous := XXI.! !


!classDefinition: #XXIII category: #'Numeros-Naturales'!
II subclass: #XXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIII class' category: #'Numeros-Naturales'!
XXIII class
	instanceVariableNames: ''!

!XXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXIV.
	previous := XXII.! !


!classDefinition: #XXIV category: #'Numeros-Naturales'!
II subclass: #XXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIV class' category: #'Numeros-Naturales'!
XXIV class
	instanceVariableNames: ''!

!XXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXV.
	previous := XXIII.! !


!classDefinition: #XXIX category: #'Numeros-Naturales'!
II subclass: #XXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIX class' category: #'Numeros-Naturales'!
XXIX class
	instanceVariableNames: ''!

!XXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := AnObsoleteXXX.
	previous := XXVIII.! !


!classDefinition: #XXV category: #'Numeros-Naturales'!
II subclass: #XXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXV class' category: #'Numeros-Naturales'!
XXV class
	instanceVariableNames: ''!

!XXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXVI.
	previous := XXIV.! !


!classDefinition: #XXVI category: #'Numeros-Naturales'!
II subclass: #XXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVI class' category: #'Numeros-Naturales'!
XXVI class
	instanceVariableNames: ''!

!XXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXVII.
	previous := XXV.! !


!classDefinition: #XXVII category: #'Numeros-Naturales'!
II subclass: #XXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVII class' category: #'Numeros-Naturales'!
XXVII class
	instanceVariableNames: ''!

!XXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXVIII.
	previous := XXVI.! !


!classDefinition: #XXVIII category: #'Numeros-Naturales'!
II subclass: #XXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVIII class' category: #'Numeros-Naturales'!
XXVIII class
	instanceVariableNames: ''!

!XXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXIX.
	previous := XXVII.! !


!classDefinition: #XXXI category: #'Numeros-Naturales'!
II subclass: #XXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXI class' category: #'Numeros-Naturales'!
XXXI class
	instanceVariableNames: ''!

!XXXI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXII.
	previous := AnObsoleteXXX.! !


!classDefinition: #XXXII category: #'Numeros-Naturales'!
II subclass: #XXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXII class' category: #'Numeros-Naturales'!
XXXII class
	instanceVariableNames: ''!

!XXXII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXIII.
	previous := XXXI.! !


!classDefinition: #XXXIII category: #'Numeros-Naturales'!
II subclass: #XXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIII class' category: #'Numeros-Naturales'!
XXXIII class
	instanceVariableNames: ''!

!XXXIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXIV.
	previous := XXXII.! !


!classDefinition: #XXXIV category: #'Numeros-Naturales'!
II subclass: #XXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIV class' category: #'Numeros-Naturales'!
XXXIV class
	instanceVariableNames: ''!

!XXXIV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXV.
	previous := XXXIII.! !


!classDefinition: #XXXIX category: #'Numeros-Naturales'!
II subclass: #XXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIX class' category: #'Numeros-Naturales'!
XXXIX class
	instanceVariableNames: ''!

!XXXIX class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XL.
	previous := XXXVIII.! !


!classDefinition: #XXXV category: #'Numeros-Naturales'!
II subclass: #XXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXV class' category: #'Numeros-Naturales'!
XXXV class
	instanceVariableNames: ''!

!XXXV class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXVI.
	previous := XXXIV.! !


!classDefinition: #XXXVI category: #'Numeros-Naturales'!
II subclass: #XXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVI class' category: #'Numeros-Naturales'!
XXXVI class
	instanceVariableNames: ''!

!XXXVI class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXVII.
	previous := XXXV.! !


!classDefinition: #XXXVII category: #'Numeros-Naturales'!
II subclass: #XXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVII class' category: #'Numeros-Naturales'!
XXXVII class
	instanceVariableNames: ''!

!XXXVII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXVIII.
	previous := XXXVI.! !


!classDefinition: #XXXVIII category: #'Numeros-Naturales'!
II subclass: #XXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVIII class' category: #'Numeros-Naturales'!
XXXVIII class
	instanceVariableNames: ''!

!XXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'MB 4/11/2022 15:43:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXIX.
	previous := XXXVII.! !

II initializeAfterFileIn!
C initializeAfterFileIn!
CC initializeAfterFileIn!
CCC initializeAfterFileIn!
CCCI initializeAfterFileIn!
CCCII initializeAfterFileIn!
CCCIII initializeAfterFileIn!
CCCIV initializeAfterFileIn!
CCCIX initializeAfterFileIn!
CCCL initializeAfterFileIn!
CCCLI initializeAfterFileIn!
CCCLII initializeAfterFileIn!
CCCLIII initializeAfterFileIn!
CCCLIV initializeAfterFileIn!
CCCLIX initializeAfterFileIn!
CCCLV initializeAfterFileIn!
CCCLVI initializeAfterFileIn!
CCCLVII initializeAfterFileIn!
CCCLVIII initializeAfterFileIn!
CCCLX initializeAfterFileIn!
CCCLXI initializeAfterFileIn!
CCCLXII initializeAfterFileIn!
CCCLXIII initializeAfterFileIn!
CCCLXIV initializeAfterFileIn!
CCCLXIX initializeAfterFileIn!
CCCLXV initializeAfterFileIn!
CCCLXVI initializeAfterFileIn!
CCCLXVII initializeAfterFileIn!
CCCLXVIII initializeAfterFileIn!
CCCLXX initializeAfterFileIn!
CCCLXXI initializeAfterFileIn!
CCCLXXII initializeAfterFileIn!
CCCLXXIII initializeAfterFileIn!
CCCLXXIV initializeAfterFileIn!
CCCLXXIX initializeAfterFileIn!
CCCLXXV initializeAfterFileIn!
CCCLXXVI initializeAfterFileIn!
CCCLXXVII initializeAfterFileIn!
CCCLXXVIII initializeAfterFileIn!
CCCLXXX initializeAfterFileIn!
CCCLXXXI initializeAfterFileIn!
CCCLXXXII initializeAfterFileIn!
CCCLXXXIII initializeAfterFileIn!
CCCLXXXIV initializeAfterFileIn!
CCCLXXXIX initializeAfterFileIn!
CCCLXXXV initializeAfterFileIn!
CCCLXXXVI initializeAfterFileIn!
CCCLXXXVII initializeAfterFileIn!
CCCLXXXVIII initializeAfterFileIn!
CCCV initializeAfterFileIn!
CCCVI initializeAfterFileIn!
CCCVII initializeAfterFileIn!
CCCVIII initializeAfterFileIn!
CCCX initializeAfterFileIn!
CCCXC initializeAfterFileIn!
CCCXCI initializeAfterFileIn!
CCCXCII initializeAfterFileIn!
CCCXCIII initializeAfterFileIn!
CCCXCIV initializeAfterFileIn!
CCCXCIX initializeAfterFileIn!
CCCXCV initializeAfterFileIn!
CCCXCVI initializeAfterFileIn!
CCCXCVII initializeAfterFileIn!
CCCXCVIII initializeAfterFileIn!
CCCXI initializeAfterFileIn!
CCCXII initializeAfterFileIn!
CCCXIII initializeAfterFileIn!
CCCXIV initializeAfterFileIn!
CCCXIX initializeAfterFileIn!
CCCXL initializeAfterFileIn!
CCCXLI initializeAfterFileIn!
CCCXLII initializeAfterFileIn!
CCCXLIII initializeAfterFileIn!
CCCXLIV initializeAfterFileIn!
CCCXLIX initializeAfterFileIn!
CCCXLV initializeAfterFileIn!
CCCXLVI initializeAfterFileIn!
CCCXLVII initializeAfterFileIn!
CCCXLVIII initializeAfterFileIn!
CCCXV initializeAfterFileIn!
CCCXVI initializeAfterFileIn!
CCCXVII initializeAfterFileIn!
CCCXVIII initializeAfterFileIn!
CCCXX initializeAfterFileIn!
CCCXXI initializeAfterFileIn!
CCCXXII initializeAfterFileIn!
CCCXXIII initializeAfterFileIn!
CCCXXIV initializeAfterFileIn!
CCCXXIX initializeAfterFileIn!
CCCXXV initializeAfterFileIn!
CCCXXVI initializeAfterFileIn!
CCCXXVII initializeAfterFileIn!
CCCXXVIII initializeAfterFileIn!
CCCXXX initializeAfterFileIn!
CCCXXXI initializeAfterFileIn!
CCCXXXII initializeAfterFileIn!
CCCXXXIII initializeAfterFileIn!
CCCXXXIV initializeAfterFileIn!
CCCXXXIX initializeAfterFileIn!
CCCXXXV initializeAfterFileIn!
CCCXXXVI initializeAfterFileIn!
CCCXXXVII initializeAfterFileIn!
CCCXXXVIII initializeAfterFileIn!
CCI initializeAfterFileIn!
CCII initializeAfterFileIn!
CCIII initializeAfterFileIn!
CCIV initializeAfterFileIn!
CCIX initializeAfterFileIn!
CCL initializeAfterFileIn!
CCLI initializeAfterFileIn!
CCLII initializeAfterFileIn!
CCLIII initializeAfterFileIn!
CCLIV initializeAfterFileIn!
CCLIX initializeAfterFileIn!
CCLV initializeAfterFileIn!
CCLVI initializeAfterFileIn!
CCLVII initializeAfterFileIn!
CCLVIII initializeAfterFileIn!
CCLX initializeAfterFileIn!
CCLXI initializeAfterFileIn!
CCLXII initializeAfterFileIn!
CCLXIII initializeAfterFileIn!
CCLXIV initializeAfterFileIn!
CCLXIX initializeAfterFileIn!
CCLXV initializeAfterFileIn!
CCLXVI initializeAfterFileIn!
CCLXVII initializeAfterFileIn!
CCLXVIII initializeAfterFileIn!
CCLXX initializeAfterFileIn!
CCLXXI initializeAfterFileIn!
CCLXXII initializeAfterFileIn!
CCLXXIII initializeAfterFileIn!
CCLXXIV initializeAfterFileIn!
CCLXXIX initializeAfterFileIn!
CCLXXV initializeAfterFileIn!
CCLXXVI initializeAfterFileIn!
CCLXXVII initializeAfterFileIn!
CCLXXVIII initializeAfterFileIn!
CCLXXX initializeAfterFileIn!
CCLXXXI initializeAfterFileIn!
CCLXXXII initializeAfterFileIn!
CCLXXXIII initializeAfterFileIn!
CCLXXXIV initializeAfterFileIn!
CCLXXXIX initializeAfterFileIn!
CCLXXXV initializeAfterFileIn!
CCLXXXVI initializeAfterFileIn!
CCLXXXVII initializeAfterFileIn!
CCLXXXVIII initializeAfterFileIn!
CCV initializeAfterFileIn!
CCVI initializeAfterFileIn!
CCVII initializeAfterFileIn!
CCVIII initializeAfterFileIn!
CCX initializeAfterFileIn!
CCXC initializeAfterFileIn!
CCXCI initializeAfterFileIn!
CCXCII initializeAfterFileIn!
CCXCIII initializeAfterFileIn!
CCXCIV initializeAfterFileIn!
CCXCIX initializeAfterFileIn!
CCXCV initializeAfterFileIn!
CCXCVI initializeAfterFileIn!
CCXCVII initializeAfterFileIn!
CCXCVIII initializeAfterFileIn!
CCXI initializeAfterFileIn!
CCXII initializeAfterFileIn!
CCXIII initializeAfterFileIn!
CCXIV initializeAfterFileIn!
CCXIX initializeAfterFileIn!
CCXL initializeAfterFileIn!
CCXLI initializeAfterFileIn!
CCXLII initializeAfterFileIn!
CCXLIII initializeAfterFileIn!
CCXLIV initializeAfterFileIn!
CCXLIX initializeAfterFileIn!
CCXLV initializeAfterFileIn!
CCXLVI initializeAfterFileIn!
CCXLVII initializeAfterFileIn!
CCXLVIII initializeAfterFileIn!
CCXV initializeAfterFileIn!
CCXVI initializeAfterFileIn!
CCXVII initializeAfterFileIn!
CCXVIII initializeAfterFileIn!
CCXX initializeAfterFileIn!
CCXXI initializeAfterFileIn!
CCXXII initializeAfterFileIn!
CCXXIII initializeAfterFileIn!
CCXXIV initializeAfterFileIn!
CCXXIX initializeAfterFileIn!
CCXXV initializeAfterFileIn!
CCXXVI initializeAfterFileIn!
CCXXVII initializeAfterFileIn!
CCXXVIII initializeAfterFileIn!
CCXXX initializeAfterFileIn!
CCXXXI initializeAfterFileIn!
CCXXXII initializeAfterFileIn!
CCXXXIII initializeAfterFileIn!
CCXXXIV initializeAfterFileIn!
CCXXXIX initializeAfterFileIn!
CCXXXV initializeAfterFileIn!
CCXXXVI initializeAfterFileIn!
CCXXXVII initializeAfterFileIn!
CCXXXVIII initializeAfterFileIn!
CD initializeAfterFileIn!
CDI initializeAfterFileIn!
CDII initializeAfterFileIn!
CDIII initializeAfterFileIn!
CDIV initializeAfterFileIn!
CDIX initializeAfterFileIn!
CDL initializeAfterFileIn!
CDLI initializeAfterFileIn!
CDLII initializeAfterFileIn!
CDLIII initializeAfterFileIn!
CDLIV initializeAfterFileIn!
CDLIX initializeAfterFileIn!
CDLV initializeAfterFileIn!
CDLVI initializeAfterFileIn!
CDLVII initializeAfterFileIn!
CDLVIII initializeAfterFileIn!
CDLX initializeAfterFileIn!
CDLXI initializeAfterFileIn!
CDLXII initializeAfterFileIn!
CDLXIII initializeAfterFileIn!
CDLXIV initializeAfterFileIn!
CDLXIX initializeAfterFileIn!
CDLXV initializeAfterFileIn!
CDLXVI initializeAfterFileIn!
CDLXVII initializeAfterFileIn!
CDLXVIII initializeAfterFileIn!
CDLXX initializeAfterFileIn!
CDLXXI initializeAfterFileIn!
CDLXXII initializeAfterFileIn!
CDLXXIII initializeAfterFileIn!
CDLXXIV initializeAfterFileIn!
CDLXXIX initializeAfterFileIn!
CDLXXV initializeAfterFileIn!
CDLXXVI initializeAfterFileIn!
CDLXXVII initializeAfterFileIn!
CDLXXVIII initializeAfterFileIn!
CDLXXX initializeAfterFileIn!
CDLXXXI initializeAfterFileIn!
CDLXXXII initializeAfterFileIn!
CDLXXXIII initializeAfterFileIn!
CDLXXXIV initializeAfterFileIn!
CDLXXXIX initializeAfterFileIn!
CDLXXXV initializeAfterFileIn!
CDLXXXVI initializeAfterFileIn!
CDLXXXVII initializeAfterFileIn!
CDLXXXVIII initializeAfterFileIn!
CDV initializeAfterFileIn!
CDVI initializeAfterFileIn!
CDVII initializeAfterFileIn!
CDVIII initializeAfterFileIn!
CDX initializeAfterFileIn!
CDXC initializeAfterFileIn!
CDXCI initializeAfterFileIn!
CDXCII initializeAfterFileIn!
CDXCIII initializeAfterFileIn!
CDXCIV initializeAfterFileIn!
CDXCIX initializeAfterFileIn!
CDXCV initializeAfterFileIn!
CDXCVI initializeAfterFileIn!
CDXCVII initializeAfterFileIn!
CDXCVIII initializeAfterFileIn!
CDXI initializeAfterFileIn!
CDXII initializeAfterFileIn!
CDXIII initializeAfterFileIn!
CDXIV initializeAfterFileIn!
CDXIX initializeAfterFileIn!
CDXL initializeAfterFileIn!
CDXLI initializeAfterFileIn!
CDXLII initializeAfterFileIn!
CDXLIII initializeAfterFileIn!
CDXLIV initializeAfterFileIn!
CDXLIX initializeAfterFileIn!
CDXLV initializeAfterFileIn!
CDXLVI initializeAfterFileIn!
CDXLVII initializeAfterFileIn!
CDXLVIII initializeAfterFileIn!
CDXV initializeAfterFileIn!
CDXVI initializeAfterFileIn!
CDXVII initializeAfterFileIn!
CDXVIII initializeAfterFileIn!
CDXX initializeAfterFileIn!
CDXXI initializeAfterFileIn!
CDXXII initializeAfterFileIn!
CDXXIII initializeAfterFileIn!
CDXXIV initializeAfterFileIn!
CDXXIX initializeAfterFileIn!
CDXXV initializeAfterFileIn!
CDXXVI initializeAfterFileIn!
CDXXVII initializeAfterFileIn!
CDXXVIII initializeAfterFileIn!
CDXXX initializeAfterFileIn!
CDXXXI initializeAfterFileIn!
CDXXXII initializeAfterFileIn!
CDXXXIII initializeAfterFileIn!
CDXXXIV initializeAfterFileIn!
CDXXXIX initializeAfterFileIn!
CDXXXV initializeAfterFileIn!
CDXXXVI initializeAfterFileIn!
CDXXXVII initializeAfterFileIn!
CDXXXVIII initializeAfterFileIn!
CI initializeAfterFileIn!
CII initializeAfterFileIn!
CIII initializeAfterFileIn!
CIV initializeAfterFileIn!
CIX initializeAfterFileIn!
CL initializeAfterFileIn!
CLI initializeAfterFileIn!
CLII initializeAfterFileIn!
CLIII initializeAfterFileIn!
CLIV initializeAfterFileIn!
CLIX initializeAfterFileIn!
CLV initializeAfterFileIn!
CLVI initializeAfterFileIn!
CLVII initializeAfterFileIn!
CLVIII initializeAfterFileIn!
CLX initializeAfterFileIn!
CLXI initializeAfterFileIn!
CLXII initializeAfterFileIn!
CLXIII initializeAfterFileIn!
CLXIV initializeAfterFileIn!
CLXIX initializeAfterFileIn!
CLXV initializeAfterFileIn!
CLXVI initializeAfterFileIn!
CLXVII initializeAfterFileIn!
CLXVIII initializeAfterFileIn!
CLXX initializeAfterFileIn!
CLXXI initializeAfterFileIn!
CLXXII initializeAfterFileIn!
CLXXIII initializeAfterFileIn!
CLXXIV initializeAfterFileIn!
CLXXIX initializeAfterFileIn!
CLXXV initializeAfterFileIn!
CLXXVI initializeAfterFileIn!
CLXXVII initializeAfterFileIn!
CLXXVIII initializeAfterFileIn!
CLXXX initializeAfterFileIn!
CLXXXI initializeAfterFileIn!
CLXXXII initializeAfterFileIn!
CLXXXIII initializeAfterFileIn!
CLXXXIV initializeAfterFileIn!
CLXXXIX initializeAfterFileIn!
CLXXXV initializeAfterFileIn!
CLXXXVI initializeAfterFileIn!
CLXXXVII initializeAfterFileIn!
CLXXXVIII initializeAfterFileIn!
CM initializeAfterFileIn!
CMI initializeAfterFileIn!
CMII initializeAfterFileIn!
CMIII initializeAfterFileIn!
CMIV initializeAfterFileIn!
CMIX initializeAfterFileIn!
CML initializeAfterFileIn!
CMLI initializeAfterFileIn!
CMLII initializeAfterFileIn!
CMLIII initializeAfterFileIn!
CMLIV initializeAfterFileIn!
CMLIX initializeAfterFileIn!
CMLV initializeAfterFileIn!
CMLVI initializeAfterFileIn!
CMLVII initializeAfterFileIn!
CMLVIII initializeAfterFileIn!
CMLX initializeAfterFileIn!
CMLXI initializeAfterFileIn!
CMLXII initializeAfterFileIn!
CMLXIII initializeAfterFileIn!
CMLXIV initializeAfterFileIn!
CMLXIX initializeAfterFileIn!
CMLXV initializeAfterFileIn!
CMLXVI initializeAfterFileIn!
CMLXVII initializeAfterFileIn!
CMLXVIII initializeAfterFileIn!
CMLXX initializeAfterFileIn!
CMLXXI initializeAfterFileIn!
CMLXXII initializeAfterFileIn!
CMLXXIII initializeAfterFileIn!
CMLXXIV initializeAfterFileIn!
CMLXXIX initializeAfterFileIn!
CMLXXV initializeAfterFileIn!
CMLXXVI initializeAfterFileIn!
CMLXXVII initializeAfterFileIn!
CMLXXVIII initializeAfterFileIn!
CMLXXX initializeAfterFileIn!
CMLXXXI initializeAfterFileIn!
CMLXXXII initializeAfterFileIn!
CMLXXXIII initializeAfterFileIn!
CMLXXXIV initializeAfterFileIn!
CMLXXXIX initializeAfterFileIn!
CMLXXXV initializeAfterFileIn!
CMLXXXVI initializeAfterFileIn!
CMLXXXVII initializeAfterFileIn!
CMLXXXVIII initializeAfterFileIn!
CMV initializeAfterFileIn!
CMVI initializeAfterFileIn!
CMVII initializeAfterFileIn!
CMVIII initializeAfterFileIn!
CMX initializeAfterFileIn!
CMXC initializeAfterFileIn!
CMXCI initializeAfterFileIn!
CMXCII initializeAfterFileIn!
CMXCIII initializeAfterFileIn!
CMXCIV initializeAfterFileIn!
CMXCIX initializeAfterFileIn!
CMXCV initializeAfterFileIn!
CMXCVI initializeAfterFileIn!
CMXCVII initializeAfterFileIn!
CMXCVIII initializeAfterFileIn!
CMXI initializeAfterFileIn!
CMXII initializeAfterFileIn!
CMXIII initializeAfterFileIn!
CMXIV initializeAfterFileIn!
CMXIX initializeAfterFileIn!
CMXL initializeAfterFileIn!
CMXLI initializeAfterFileIn!
CMXLII initializeAfterFileIn!
CMXLIII initializeAfterFileIn!
CMXLIV initializeAfterFileIn!
CMXLIX initializeAfterFileIn!
CMXLV initializeAfterFileIn!
CMXLVI initializeAfterFileIn!
CMXLVII initializeAfterFileIn!
CMXLVIII initializeAfterFileIn!
CMXV initializeAfterFileIn!
CMXVI initializeAfterFileIn!
CMXVII initializeAfterFileIn!
CMXVIII initializeAfterFileIn!
CMXX initializeAfterFileIn!
CMXXI initializeAfterFileIn!
CMXXII initializeAfterFileIn!
CMXXIII initializeAfterFileIn!
CMXXIV initializeAfterFileIn!
CMXXIX initializeAfterFileIn!
CMXXV initializeAfterFileIn!
CMXXVI initializeAfterFileIn!
CMXXVII initializeAfterFileIn!
CMXXVIII initializeAfterFileIn!
CMXXX initializeAfterFileIn!
CMXXXI initializeAfterFileIn!
CMXXXII initializeAfterFileIn!
CMXXXIII initializeAfterFileIn!
CMXXXIV initializeAfterFileIn!
CMXXXIX initializeAfterFileIn!
CMXXXV initializeAfterFileIn!
CMXXXVI initializeAfterFileIn!
CMXXXVII initializeAfterFileIn!
CMXXXVIII initializeAfterFileIn!
CV initializeAfterFileIn!
CVI initializeAfterFileIn!
CVII initializeAfterFileIn!
CVIII initializeAfterFileIn!
CX initializeAfterFileIn!
CXC initializeAfterFileIn!
CXCI initializeAfterFileIn!
CXCII initializeAfterFileIn!
CXCIII initializeAfterFileIn!
CXCIV initializeAfterFileIn!
CXCIX initializeAfterFileIn!
CXCV initializeAfterFileIn!
CXCVI initializeAfterFileIn!
CXCVII initializeAfterFileIn!
CXCVIII initializeAfterFileIn!
CXI initializeAfterFileIn!
CXII initializeAfterFileIn!
CXIII initializeAfterFileIn!
CXIV initializeAfterFileIn!
CXIX initializeAfterFileIn!
CXL initializeAfterFileIn!
CXLI initializeAfterFileIn!
CXLII initializeAfterFileIn!
CXLIII initializeAfterFileIn!
CXLIV initializeAfterFileIn!
CXLIX initializeAfterFileIn!
CXLV initializeAfterFileIn!
CXLVI initializeAfterFileIn!
CXLVII initializeAfterFileIn!
CXLVIII initializeAfterFileIn!
CXV initializeAfterFileIn!
CXVI initializeAfterFileIn!
CXVII initializeAfterFileIn!
CXVIII initializeAfterFileIn!
CXX initializeAfterFileIn!
CXXI initializeAfterFileIn!
CXXII initializeAfterFileIn!
CXXIII initializeAfterFileIn!
CXXIV initializeAfterFileIn!
CXXIX initializeAfterFileIn!
CXXV initializeAfterFileIn!
CXXVI initializeAfterFileIn!
CXXVII initializeAfterFileIn!
CXXVIII initializeAfterFileIn!
CXXX initializeAfterFileIn!
CXXXI initializeAfterFileIn!
CXXXII initializeAfterFileIn!
CXXXIII initializeAfterFileIn!
CXXXIV initializeAfterFileIn!
CXXXIX initializeAfterFileIn!
CXXXV initializeAfterFileIn!
CXXXVI initializeAfterFileIn!
CXXXVII initializeAfterFileIn!
CXXXVIII initializeAfterFileIn!
D initializeAfterFileIn!
DC initializeAfterFileIn!
DCC initializeAfterFileIn!
DCCC initializeAfterFileIn!
DCCCI initializeAfterFileIn!
DCCCII initializeAfterFileIn!
DCCCIII initializeAfterFileIn!
DCCCIV initializeAfterFileIn!
DCCCIX initializeAfterFileIn!
DCCCL initializeAfterFileIn!
DCCCLI initializeAfterFileIn!
DCCCLII initializeAfterFileIn!
DCCCLIII initializeAfterFileIn!
DCCCLIV initializeAfterFileIn!
DCCCLIX initializeAfterFileIn!
DCCCLV initializeAfterFileIn!
DCCCLVI initializeAfterFileIn!
DCCCLVII initializeAfterFileIn!
DCCCLVIII initializeAfterFileIn!
DCCCLX initializeAfterFileIn!
DCCCLXI initializeAfterFileIn!
DCCCLXII initializeAfterFileIn!
DCCCLXIII initializeAfterFileIn!
DCCCLXIV initializeAfterFileIn!
DCCCLXIX initializeAfterFileIn!
DCCCLXV initializeAfterFileIn!
DCCCLXVI initializeAfterFileIn!
DCCCLXVII initializeAfterFileIn!
DCCCLXVIII initializeAfterFileIn!
DCCCLXX initializeAfterFileIn!
DCCCLXXI initializeAfterFileIn!
DCCCLXXII initializeAfterFileIn!
DCCCLXXIII initializeAfterFileIn!
DCCCLXXIV initializeAfterFileIn!
DCCCLXXIX initializeAfterFileIn!
DCCCLXXV initializeAfterFileIn!
DCCCLXXVI initializeAfterFileIn!
DCCCLXXVII initializeAfterFileIn!
DCCCLXXVIII initializeAfterFileIn!
DCCCLXXX initializeAfterFileIn!
DCCCLXXXI initializeAfterFileIn!
DCCCLXXXII initializeAfterFileIn!
DCCCLXXXIII initializeAfterFileIn!
DCCCLXXXIV initializeAfterFileIn!
DCCCLXXXIX initializeAfterFileIn!
DCCCLXXXV initializeAfterFileIn!
DCCCLXXXVI initializeAfterFileIn!
DCCCLXXXVII initializeAfterFileIn!
DCCCLXXXVIII initializeAfterFileIn!
DCCCV initializeAfterFileIn!
DCCCVI initializeAfterFileIn!
DCCCVII initializeAfterFileIn!
DCCCVIII initializeAfterFileIn!
DCCCX initializeAfterFileIn!
DCCCXC initializeAfterFileIn!
DCCCXCI initializeAfterFileIn!
DCCCXCII initializeAfterFileIn!
DCCCXCIII initializeAfterFileIn!
DCCCXCIV initializeAfterFileIn!
DCCCXCIX initializeAfterFileIn!
DCCCXCV initializeAfterFileIn!
DCCCXCVI initializeAfterFileIn!
DCCCXCVII initializeAfterFileIn!
DCCCXCVIII initializeAfterFileIn!
DCCCXI initializeAfterFileIn!
DCCCXII initializeAfterFileIn!
DCCCXIII initializeAfterFileIn!
DCCCXIV initializeAfterFileIn!
DCCCXIX initializeAfterFileIn!
DCCCXL initializeAfterFileIn!
DCCCXLI initializeAfterFileIn!
DCCCXLII initializeAfterFileIn!
DCCCXLIII initializeAfterFileIn!
DCCCXLIV initializeAfterFileIn!
DCCCXLIX initializeAfterFileIn!
DCCCXLV initializeAfterFileIn!
DCCCXLVI initializeAfterFileIn!
DCCCXLVII initializeAfterFileIn!
DCCCXLVIII initializeAfterFileIn!
DCCCXV initializeAfterFileIn!
DCCCXVI initializeAfterFileIn!
DCCCXVII initializeAfterFileIn!
DCCCXVIII initializeAfterFileIn!
DCCCXX initializeAfterFileIn!
DCCCXXI initializeAfterFileIn!
DCCCXXII initializeAfterFileIn!
DCCCXXIII initializeAfterFileIn!
DCCCXXIV initializeAfterFileIn!
DCCCXXIX initializeAfterFileIn!
DCCCXXV initializeAfterFileIn!
DCCCXXVI initializeAfterFileIn!
DCCCXXVII initializeAfterFileIn!
DCCCXXVIII initializeAfterFileIn!
DCCCXXX initializeAfterFileIn!
DCCCXXXI initializeAfterFileIn!
DCCCXXXII initializeAfterFileIn!
DCCCXXXIII initializeAfterFileIn!
DCCCXXXIV initializeAfterFileIn!
DCCCXXXIX initializeAfterFileIn!
DCCCXXXV initializeAfterFileIn!
DCCCXXXVI initializeAfterFileIn!
DCCCXXXVII initializeAfterFileIn!
DCCCXXXVIII initializeAfterFileIn!
DCCI initializeAfterFileIn!
DCCII initializeAfterFileIn!
DCCIII initializeAfterFileIn!
DCCIV initializeAfterFileIn!
DCCIX initializeAfterFileIn!
DCCL initializeAfterFileIn!
DCCLI initializeAfterFileIn!
DCCLII initializeAfterFileIn!
DCCLIII initializeAfterFileIn!
DCCLIV initializeAfterFileIn!
DCCLIX initializeAfterFileIn!
DCCLV initializeAfterFileIn!
DCCLVI initializeAfterFileIn!
DCCLVII initializeAfterFileIn!
DCCLVIII initializeAfterFileIn!
DCCLX initializeAfterFileIn!
DCCLXI initializeAfterFileIn!
DCCLXII initializeAfterFileIn!
DCCLXIII initializeAfterFileIn!
DCCLXIV initializeAfterFileIn!
DCCLXIX initializeAfterFileIn!
DCCLXV initializeAfterFileIn!
DCCLXVI initializeAfterFileIn!
DCCLXVII initializeAfterFileIn!
DCCLXVIII initializeAfterFileIn!
DCCLXX initializeAfterFileIn!
DCCLXXI initializeAfterFileIn!
DCCLXXII initializeAfterFileIn!
DCCLXXIII initializeAfterFileIn!
DCCLXXIV initializeAfterFileIn!
DCCLXXIX initializeAfterFileIn!
DCCLXXV initializeAfterFileIn!
DCCLXXVI initializeAfterFileIn!
DCCLXXVII initializeAfterFileIn!
DCCLXXVIII initializeAfterFileIn!
DCCLXXX initializeAfterFileIn!
DCCLXXXI initializeAfterFileIn!
DCCLXXXII initializeAfterFileIn!
DCCLXXXIII initializeAfterFileIn!
DCCLXXXIV initializeAfterFileIn!
DCCLXXXIX initializeAfterFileIn!
DCCLXXXV initializeAfterFileIn!
DCCLXXXVI initializeAfterFileIn!
DCCLXXXVII initializeAfterFileIn!
DCCLXXXVIII initializeAfterFileIn!
DCCV initializeAfterFileIn!
DCCVI initializeAfterFileIn!
DCCVII initializeAfterFileIn!
DCCVIII initializeAfterFileIn!
DCCX initializeAfterFileIn!
DCCXC initializeAfterFileIn!
DCCXCI initializeAfterFileIn!
DCCXCII initializeAfterFileIn!
DCCXCIII initializeAfterFileIn!
DCCXCIV initializeAfterFileIn!
DCCXCIX initializeAfterFileIn!
DCCXCV initializeAfterFileIn!
DCCXCVI initializeAfterFileIn!
DCCXCVII initializeAfterFileIn!
DCCXCVIII initializeAfterFileIn!
DCCXI initializeAfterFileIn!
DCCXII initializeAfterFileIn!
DCCXIII initializeAfterFileIn!
DCCXIV initializeAfterFileIn!
DCCXIX initializeAfterFileIn!
DCCXL initializeAfterFileIn!
DCCXLI initializeAfterFileIn!
DCCXLII initializeAfterFileIn!
DCCXLIII initializeAfterFileIn!
DCCXLIV initializeAfterFileIn!
DCCXLIX initializeAfterFileIn!
DCCXLV initializeAfterFileIn!
DCCXLVI initializeAfterFileIn!
DCCXLVII initializeAfterFileIn!
DCCXLVIII initializeAfterFileIn!
DCCXV initializeAfterFileIn!
DCCXVI initializeAfterFileIn!
DCCXVII initializeAfterFileIn!
DCCXVIII initializeAfterFileIn!
DCCXX initializeAfterFileIn!
DCCXXI initializeAfterFileIn!
DCCXXII initializeAfterFileIn!
DCCXXIII initializeAfterFileIn!
DCCXXIV initializeAfterFileIn!
DCCXXIX initializeAfterFileIn!
DCCXXV initializeAfterFileIn!
DCCXXVI initializeAfterFileIn!
DCCXXVII initializeAfterFileIn!
DCCXXVIII initializeAfterFileIn!
DCCXXX initializeAfterFileIn!
DCCXXXI initializeAfterFileIn!
DCCXXXII initializeAfterFileIn!
DCCXXXIII initializeAfterFileIn!
DCCXXXIV initializeAfterFileIn!
DCCXXXIX initializeAfterFileIn!
DCCXXXV initializeAfterFileIn!
DCCXXXVI initializeAfterFileIn!
DCCXXXVII initializeAfterFileIn!
DCCXXXVIII initializeAfterFileIn!
DCI initializeAfterFileIn!
DCII initializeAfterFileIn!
DCIII initializeAfterFileIn!
DCIV initializeAfterFileIn!
DCIX initializeAfterFileIn!
DCL initializeAfterFileIn!
DCLI initializeAfterFileIn!
DCLII initializeAfterFileIn!
DCLIII initializeAfterFileIn!
DCLIV initializeAfterFileIn!
DCLIX initializeAfterFileIn!
DCLV initializeAfterFileIn!
DCLVI initializeAfterFileIn!
DCLVII initializeAfterFileIn!
DCLVIII initializeAfterFileIn!
DCLX initializeAfterFileIn!
DCLXI initializeAfterFileIn!
DCLXII initializeAfterFileIn!
DCLXIII initializeAfterFileIn!
DCLXIV initializeAfterFileIn!
DCLXIX initializeAfterFileIn!
DCLXV initializeAfterFileIn!
DCLXVI initializeAfterFileIn!
DCLXVII initializeAfterFileIn!
DCLXVIII initializeAfterFileIn!
DCLXX initializeAfterFileIn!
DCLXXI initializeAfterFileIn!
DCLXXII initializeAfterFileIn!
DCLXXIII initializeAfterFileIn!
DCLXXIV initializeAfterFileIn!
DCLXXIX initializeAfterFileIn!
DCLXXV initializeAfterFileIn!
DCLXXVI initializeAfterFileIn!
DCLXXVII initializeAfterFileIn!
DCLXXVIII initializeAfterFileIn!
DCLXXX initializeAfterFileIn!
DCLXXXI initializeAfterFileIn!
DCLXXXII initializeAfterFileIn!
DCLXXXIII initializeAfterFileIn!
DCLXXXIV initializeAfterFileIn!
DCLXXXIX initializeAfterFileIn!
DCLXXXV initializeAfterFileIn!
DCLXXXVI initializeAfterFileIn!
DCLXXXVII initializeAfterFileIn!
DCLXXXVIII initializeAfterFileIn!
DCV initializeAfterFileIn!
DCVI initializeAfterFileIn!
DCVII initializeAfterFileIn!
DCVIII initializeAfterFileIn!
DCX initializeAfterFileIn!
DCXC initializeAfterFileIn!
DCXCI initializeAfterFileIn!
DCXCII initializeAfterFileIn!
DCXCIII initializeAfterFileIn!
DCXCIV initializeAfterFileIn!
DCXCIX initializeAfterFileIn!
DCXCV initializeAfterFileIn!
DCXCVI initializeAfterFileIn!
DCXCVII initializeAfterFileIn!
DCXCVIII initializeAfterFileIn!
DCXI initializeAfterFileIn!
DCXII initializeAfterFileIn!
DCXIII initializeAfterFileIn!
DCXIV initializeAfterFileIn!
DCXIX initializeAfterFileIn!
DCXL initializeAfterFileIn!
DCXLI initializeAfterFileIn!
DCXLII initializeAfterFileIn!
DCXLIII initializeAfterFileIn!
DCXLIV initializeAfterFileIn!
DCXLIX initializeAfterFileIn!
DCXLV initializeAfterFileIn!
DCXLVI initializeAfterFileIn!
DCXLVII initializeAfterFileIn!
DCXLVIII initializeAfterFileIn!
DCXV initializeAfterFileIn!
DCXVI initializeAfterFileIn!
DCXVII initializeAfterFileIn!
DCXVIII initializeAfterFileIn!
DCXX initializeAfterFileIn!
DCXXI initializeAfterFileIn!
DCXXII initializeAfterFileIn!
DCXXIII initializeAfterFileIn!
DCXXIV initializeAfterFileIn!
DCXXIX initializeAfterFileIn!
DCXXV initializeAfterFileIn!
DCXXVI initializeAfterFileIn!
DCXXVII initializeAfterFileIn!
DCXXVIII initializeAfterFileIn!
DCXXX initializeAfterFileIn!
DCXXXI initializeAfterFileIn!
DCXXXII initializeAfterFileIn!
DCXXXIII initializeAfterFileIn!
DCXXXIV initializeAfterFileIn!
DCXXXIX initializeAfterFileIn!
DCXXXV initializeAfterFileIn!
DCXXXVI initializeAfterFileIn!
DCXXXVII initializeAfterFileIn!
DCXXXVIII initializeAfterFileIn!
DI initializeAfterFileIn!
DII initializeAfterFileIn!
DIII initializeAfterFileIn!
DIV initializeAfterFileIn!
DIX initializeAfterFileIn!
DL initializeAfterFileIn!
DLI initializeAfterFileIn!
DLII initializeAfterFileIn!
DLIII initializeAfterFileIn!
DLIV initializeAfterFileIn!
DLIX initializeAfterFileIn!
DLV initializeAfterFileIn!
DLVI initializeAfterFileIn!
DLVII initializeAfterFileIn!
DLVIII initializeAfterFileIn!
DLX initializeAfterFileIn!
DLXI initializeAfterFileIn!
DLXII initializeAfterFileIn!
DLXIII initializeAfterFileIn!
DLXIV initializeAfterFileIn!
DLXIX initializeAfterFileIn!
DLXV initializeAfterFileIn!
DLXVI initializeAfterFileIn!
DLXVII initializeAfterFileIn!
DLXVIII initializeAfterFileIn!
DLXX initializeAfterFileIn!
DLXXI initializeAfterFileIn!
DLXXII initializeAfterFileIn!
DLXXIII initializeAfterFileIn!
DLXXIV initializeAfterFileIn!
DLXXIX initializeAfterFileIn!
DLXXV initializeAfterFileIn!
DLXXVI initializeAfterFileIn!
DLXXVII initializeAfterFileIn!
DLXXVIII initializeAfterFileIn!
DLXXX initializeAfterFileIn!
DLXXXI initializeAfterFileIn!
DLXXXII initializeAfterFileIn!
DLXXXIII initializeAfterFileIn!
DLXXXIV initializeAfterFileIn!
DLXXXIX initializeAfterFileIn!
DLXXXV initializeAfterFileIn!
DLXXXVI initializeAfterFileIn!
DLXXXVII initializeAfterFileIn!
DLXXXVIII initializeAfterFileIn!
DV initializeAfterFileIn!
DVI initializeAfterFileIn!
DVII initializeAfterFileIn!
DVIII initializeAfterFileIn!
DX initializeAfterFileIn!
DXC initializeAfterFileIn!
DXCI initializeAfterFileIn!
DXCII initializeAfterFileIn!
DXCIII initializeAfterFileIn!
DXCIV initializeAfterFileIn!
DXCIX initializeAfterFileIn!
DXCV initializeAfterFileIn!
DXCVI initializeAfterFileIn!
DXCVII initializeAfterFileIn!
DXCVIII initializeAfterFileIn!
DXI initializeAfterFileIn!
DXII initializeAfterFileIn!
DXIII initializeAfterFileIn!
DXIV initializeAfterFileIn!
DXIX initializeAfterFileIn!
DXL initializeAfterFileIn!
DXLI initializeAfterFileIn!
DXLII initializeAfterFileIn!
DXLIII initializeAfterFileIn!
DXLIV initializeAfterFileIn!
DXLIX initializeAfterFileIn!
DXLV initializeAfterFileIn!
DXLVI initializeAfterFileIn!
DXLVII initializeAfterFileIn!
DXLVIII initializeAfterFileIn!
DXV initializeAfterFileIn!
DXVI initializeAfterFileIn!
DXVII initializeAfterFileIn!
DXVIII initializeAfterFileIn!
DXX initializeAfterFileIn!
DXXI initializeAfterFileIn!
DXXII initializeAfterFileIn!
DXXIII initializeAfterFileIn!
DXXIV initializeAfterFileIn!
DXXIX initializeAfterFileIn!
DXXV initializeAfterFileIn!
DXXVI initializeAfterFileIn!
DXXVII initializeAfterFileIn!
DXXVIII initializeAfterFileIn!
DXXX initializeAfterFileIn!
DXXXI initializeAfterFileIn!
DXXXII initializeAfterFileIn!
DXXXIII initializeAfterFileIn!
DXXXIV initializeAfterFileIn!
DXXXIX initializeAfterFileIn!
DXXXV initializeAfterFileIn!
DXXXVI initializeAfterFileIn!
DXXXVII initializeAfterFileIn!
DXXXVIII initializeAfterFileIn!
III initializeAfterFileIn!
IV initializeAfterFileIn!
IX initializeAfterFileIn!
L initializeAfterFileIn!
LI initializeAfterFileIn!
LII initializeAfterFileIn!
LIII initializeAfterFileIn!
LIV initializeAfterFileIn!
LIX initializeAfterFileIn!
LV initializeAfterFileIn!
LVI initializeAfterFileIn!
LVII initializeAfterFileIn!
LVIII initializeAfterFileIn!
LX initializeAfterFileIn!
LXI initializeAfterFileIn!
LXII initializeAfterFileIn!
LXIII initializeAfterFileIn!
LXIV initializeAfterFileIn!
LXIX initializeAfterFileIn!
LXV initializeAfterFileIn!
LXVI initializeAfterFileIn!
LXVII initializeAfterFileIn!
LXVIII initializeAfterFileIn!
LXX initializeAfterFileIn!
LXXI initializeAfterFileIn!
LXXII initializeAfterFileIn!
LXXIII initializeAfterFileIn!
LXXIV initializeAfterFileIn!
LXXIX initializeAfterFileIn!
LXXV initializeAfterFileIn!
LXXVI initializeAfterFileIn!
LXXVII initializeAfterFileIn!
LXXVIII initializeAfterFileIn!
LXXX initializeAfterFileIn!
LXXXI initializeAfterFileIn!
LXXXII initializeAfterFileIn!
LXXXIII initializeAfterFileIn!
LXXXIV initializeAfterFileIn!
LXXXIX initializeAfterFileIn!
LXXXV initializeAfterFileIn!
LXXXVI initializeAfterFileIn!
LXXXVII initializeAfterFileIn!
LXXXVIII initializeAfterFileIn!
M initializeAfterFileIn!
MC initializeAfterFileIn!
MCC initializeAfterFileIn!
MCCI initializeAfterFileIn!
MCCII initializeAfterFileIn!
MCCIII initializeAfterFileIn!
MCCIV initializeAfterFileIn!
MCCIX initializeAfterFileIn!
MCCL initializeAfterFileIn!
MCCLI initializeAfterFileIn!
MCCLII initializeAfterFileIn!
MCCLIII initializeAfterFileIn!
MCCLIV initializeAfterFileIn!
MCCLIX initializeAfterFileIn!
MCCLV initializeAfterFileIn!
MCCLVI initializeAfterFileIn!
MCCLVII initializeAfterFileIn!
MCCLVIII initializeAfterFileIn!
MCCLX initializeAfterFileIn!
MCCLXI initializeAfterFileIn!
MCCLXII initializeAfterFileIn!
MCCLXIII initializeAfterFileIn!
MCCLXIV initializeAfterFileIn!
MCCLXIX initializeAfterFileIn!
MCCLXV initializeAfterFileIn!
MCCLXVI initializeAfterFileIn!
MCCLXVII initializeAfterFileIn!
MCCLXVIII initializeAfterFileIn!
MCCLXX initializeAfterFileIn!
MCCLXXI initializeAfterFileIn!
MCCLXXII initializeAfterFileIn!
MCCLXXIII initializeAfterFileIn!
MCCLXXIV initializeAfterFileIn!
MCCLXXIX initializeAfterFileIn!
MCCLXXV initializeAfterFileIn!
MCCLXXVI initializeAfterFileIn!
MCCLXXVII initializeAfterFileIn!
MCCLXXVIII initializeAfterFileIn!
MCCLXXX initializeAfterFileIn!
MCCV initializeAfterFileIn!
MCCVI initializeAfterFileIn!
MCCVII initializeAfterFileIn!
MCCVIII initializeAfterFileIn!
MCCX initializeAfterFileIn!
MCCXI initializeAfterFileIn!
MCCXII initializeAfterFileIn!
MCCXIII initializeAfterFileIn!
MCCXIV initializeAfterFileIn!
MCCXIX initializeAfterFileIn!
MCCXL initializeAfterFileIn!
MCCXLI initializeAfterFileIn!
MCCXLII initializeAfterFileIn!
MCCXLIII initializeAfterFileIn!
MCCXLIV initializeAfterFileIn!
MCCXLIX initializeAfterFileIn!
MCCXLV initializeAfterFileIn!
MCCXLVI initializeAfterFileIn!
MCCXLVII initializeAfterFileIn!
MCCXLVIII initializeAfterFileIn!
MCCXV initializeAfterFileIn!
MCCXVI initializeAfterFileIn!
MCCXVII initializeAfterFileIn!
MCCXVIII initializeAfterFileIn!
MCCXX initializeAfterFileIn!
MCCXXI initializeAfterFileIn!
MCCXXII initializeAfterFileIn!
MCCXXIII initializeAfterFileIn!
MCCXXIV initializeAfterFileIn!
MCCXXIX initializeAfterFileIn!
MCCXXV initializeAfterFileIn!
MCCXXVI initializeAfterFileIn!
MCCXXVII initializeAfterFileIn!
MCCXXVIII initializeAfterFileIn!
MCCXXX initializeAfterFileIn!
MCCXXXI initializeAfterFileIn!
MCCXXXII initializeAfterFileIn!
MCCXXXIII initializeAfterFileIn!
MCCXXXIV initializeAfterFileIn!
MCCXXXIX initializeAfterFileIn!
MCCXXXV initializeAfterFileIn!
MCCXXXVI initializeAfterFileIn!
MCCXXXVII initializeAfterFileIn!
MCCXXXVIII initializeAfterFileIn!
MCI initializeAfterFileIn!
MCII initializeAfterFileIn!
MCIII initializeAfterFileIn!
MCIV initializeAfterFileIn!
MCIX initializeAfterFileIn!
MCL initializeAfterFileIn!
MCLI initializeAfterFileIn!
MCLII initializeAfterFileIn!
MCLIII initializeAfterFileIn!
MCLIV initializeAfterFileIn!
MCLIX initializeAfterFileIn!
MCLV initializeAfterFileIn!
MCLVI initializeAfterFileIn!
MCLVII initializeAfterFileIn!
MCLVIII initializeAfterFileIn!
MCLX initializeAfterFileIn!
MCLXI initializeAfterFileIn!
MCLXII initializeAfterFileIn!
MCLXIII initializeAfterFileIn!
MCLXIV initializeAfterFileIn!
MCLXIX initializeAfterFileIn!
MCLXV initializeAfterFileIn!
MCLXVI initializeAfterFileIn!
MCLXVII initializeAfterFileIn!
MCLXVIII initializeAfterFileIn!
MCLXX initializeAfterFileIn!
MCLXXI initializeAfterFileIn!
MCLXXII initializeAfterFileIn!
MCLXXIII initializeAfterFileIn!
MCLXXIV initializeAfterFileIn!
MCLXXIX initializeAfterFileIn!
MCLXXV initializeAfterFileIn!
MCLXXVI initializeAfterFileIn!
MCLXXVII initializeAfterFileIn!
MCLXXVIII initializeAfterFileIn!
MCLXXX initializeAfterFileIn!
MCLXXXI initializeAfterFileIn!
MCLXXXII initializeAfterFileIn!
MCLXXXIII initializeAfterFileIn!
MCLXXXIV initializeAfterFileIn!
MCLXXXIX initializeAfterFileIn!
MCLXXXV initializeAfterFileIn!
MCLXXXVI initializeAfterFileIn!
MCLXXXVII initializeAfterFileIn!
MCLXXXVIII initializeAfterFileIn!
MCV initializeAfterFileIn!
MCVI initializeAfterFileIn!
MCVII initializeAfterFileIn!
MCVIII initializeAfterFileIn!
MCX initializeAfterFileIn!
MCXC initializeAfterFileIn!
MCXCI initializeAfterFileIn!
MCXCII initializeAfterFileIn!
MCXCIII initializeAfterFileIn!
MCXCIV initializeAfterFileIn!
MCXCIX initializeAfterFileIn!
MCXCV initializeAfterFileIn!
MCXCVI initializeAfterFileIn!
MCXCVII initializeAfterFileIn!
MCXCVIII initializeAfterFileIn!
MCXI initializeAfterFileIn!
MCXII initializeAfterFileIn!
MCXIII initializeAfterFileIn!
MCXIV initializeAfterFileIn!
MCXIX initializeAfterFileIn!
MCXL initializeAfterFileIn!
MCXLI initializeAfterFileIn!
MCXLII initializeAfterFileIn!
MCXLIII initializeAfterFileIn!
MCXLIV initializeAfterFileIn!
MCXLIX initializeAfterFileIn!
MCXLV initializeAfterFileIn!
MCXLVI initializeAfterFileIn!
MCXLVII initializeAfterFileIn!
MCXLVIII initializeAfterFileIn!
MCXV initializeAfterFileIn!
MCXVI initializeAfterFileIn!
MCXVII initializeAfterFileIn!
MCXVIII initializeAfterFileIn!
MCXX initializeAfterFileIn!
MCXXI initializeAfterFileIn!
MCXXII initializeAfterFileIn!
MCXXIII initializeAfterFileIn!
MCXXIV initializeAfterFileIn!
MCXXIX initializeAfterFileIn!
MCXXV initializeAfterFileIn!
MCXXVI initializeAfterFileIn!
MCXXVII initializeAfterFileIn!
MCXXVIII initializeAfterFileIn!
MCXXX initializeAfterFileIn!
MCXXXI initializeAfterFileIn!
MCXXXII initializeAfterFileIn!
MCXXXIII initializeAfterFileIn!
MCXXXIV initializeAfterFileIn!
MCXXXIX initializeAfterFileIn!
MCXXXV initializeAfterFileIn!
MCXXXVI initializeAfterFileIn!
MCXXXVII initializeAfterFileIn!
MCXXXVIII initializeAfterFileIn!
MI initializeAfterFileIn!
MII initializeAfterFileIn!
MIII initializeAfterFileIn!
MIV initializeAfterFileIn!
MIX initializeAfterFileIn!
ML initializeAfterFileIn!
MLI initializeAfterFileIn!
MLII initializeAfterFileIn!
MLIII initializeAfterFileIn!
MLIV initializeAfterFileIn!
MLIX initializeAfterFileIn!
MLV initializeAfterFileIn!
MLVI initializeAfterFileIn!
MLVII initializeAfterFileIn!
MLVIII initializeAfterFileIn!
MLX initializeAfterFileIn!
MLXI initializeAfterFileIn!
MLXII initializeAfterFileIn!
MLXIII initializeAfterFileIn!
MLXIV initializeAfterFileIn!
MLXIX initializeAfterFileIn!
MLXV initializeAfterFileIn!
MLXVI initializeAfterFileIn!
MLXVII initializeAfterFileIn!
MLXVIII initializeAfterFileIn!
MLXX initializeAfterFileIn!
MLXXI initializeAfterFileIn!
MLXXII initializeAfterFileIn!
MLXXIII initializeAfterFileIn!
MLXXIV initializeAfterFileIn!
MLXXIX initializeAfterFileIn!
MLXXV initializeAfterFileIn!
MLXXVI initializeAfterFileIn!
MLXXVII initializeAfterFileIn!
MLXXVIII initializeAfterFileIn!
MLXXX initializeAfterFileIn!
MLXXXI initializeAfterFileIn!
MLXXXII initializeAfterFileIn!
MLXXXIII initializeAfterFileIn!
MLXXXIV initializeAfterFileIn!
MLXXXIX initializeAfterFileIn!
MLXXXV initializeAfterFileIn!
MLXXXVI initializeAfterFileIn!
MLXXXVII initializeAfterFileIn!
MLXXXVIII initializeAfterFileIn!
MV initializeAfterFileIn!
MVI initializeAfterFileIn!
MVII initializeAfterFileIn!
MVIII initializeAfterFileIn!
MX initializeAfterFileIn!
MXC initializeAfterFileIn!
MXCI initializeAfterFileIn!
MXCII initializeAfterFileIn!
MXCIII initializeAfterFileIn!
MXCIV initializeAfterFileIn!
MXCIX initializeAfterFileIn!
MXCV initializeAfterFileIn!
MXCVI initializeAfterFileIn!
MXCVII initializeAfterFileIn!
MXCVIII initializeAfterFileIn!
MXI initializeAfterFileIn!
MXII initializeAfterFileIn!
MXIII initializeAfterFileIn!
MXIV initializeAfterFileIn!
MXIX initializeAfterFileIn!
MXL initializeAfterFileIn!
MXLI initializeAfterFileIn!
MXLII initializeAfterFileIn!
MXLIII initializeAfterFileIn!
MXLIV initializeAfterFileIn!
MXLIX initializeAfterFileIn!
MXLV initializeAfterFileIn!
MXLVI initializeAfterFileIn!
MXLVII initializeAfterFileIn!
MXLVIII initializeAfterFileIn!
MXV initializeAfterFileIn!
MXVI initializeAfterFileIn!
MXVII initializeAfterFileIn!
MXVIII initializeAfterFileIn!
MXX initializeAfterFileIn!
MXXI initializeAfterFileIn!
MXXII initializeAfterFileIn!
MXXIII initializeAfterFileIn!
MXXIV initializeAfterFileIn!
MXXIX initializeAfterFileIn!
MXXV initializeAfterFileIn!
MXXVI initializeAfterFileIn!
MXXVII initializeAfterFileIn!
MXXVIII initializeAfterFileIn!
MXXX initializeAfterFileIn!
MXXXI initializeAfterFileIn!
MXXXII initializeAfterFileIn!
MXXXIII initializeAfterFileIn!
MXXXIV initializeAfterFileIn!
MXXXIX initializeAfterFileIn!
MXXXV initializeAfterFileIn!
MXXXVI initializeAfterFileIn!
MXXXVII initializeAfterFileIn!
MXXXVIII initializeAfterFileIn!
V initializeAfterFileIn!
VI initializeAfterFileIn!
VII initializeAfterFileIn!
VIII initializeAfterFileIn!
X initializeAfterFileIn!
XC initializeAfterFileIn!
XCI initializeAfterFileIn!
XCII initializeAfterFileIn!
XCIII initializeAfterFileIn!
XCIV initializeAfterFileIn!
XCIX initializeAfterFileIn!
XCV initializeAfterFileIn!
XCVI initializeAfterFileIn!
XCVII initializeAfterFileIn!
XCVIII initializeAfterFileIn!
XI initializeAfterFileIn!
XII initializeAfterFileIn!
XIII initializeAfterFileIn!
XIV initializeAfterFileIn!
XIX initializeAfterFileIn!
XL initializeAfterFileIn!
XLI initializeAfterFileIn!
XLII initializeAfterFileIn!
XLIII initializeAfterFileIn!
XLIV initializeAfterFileIn!
XLIX initializeAfterFileIn!
XLV initializeAfterFileIn!
XLVI initializeAfterFileIn!
XLVII initializeAfterFileIn!
XLVIII initializeAfterFileIn!
XV initializeAfterFileIn!
XVI initializeAfterFileIn!
XVII initializeAfterFileIn!
XVIII initializeAfterFileIn!
XX initializeAfterFileIn!
XXI initializeAfterFileIn!
XXII initializeAfterFileIn!
XXIII initializeAfterFileIn!
XXIV initializeAfterFileIn!
XXIX initializeAfterFileIn!
XXV initializeAfterFileIn!
XXVI initializeAfterFileIn!
XXVII initializeAfterFileIn!
XXVIII initializeAfterFileIn!
XXXI initializeAfterFileIn!
XXXII initializeAfterFileIn!
XXXIII initializeAfterFileIn!
XXXIV initializeAfterFileIn!
XXXIX initializeAfterFileIn!
XXXV initializeAfterFileIn!
XXXVI initializeAfterFileIn!
XXXVII initializeAfterFileIn!
XXXVIII initializeAfterFileIn!