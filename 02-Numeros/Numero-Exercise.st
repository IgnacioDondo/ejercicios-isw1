!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic auxiliary' stamp: 'id 4/23/2022 19:32:22'!
addToEntero: anEnteroBeingAdded

	self subclassResponsibility! !

!Numero methodsFor: 'arithmetic auxiliary' stamp: 'id 4/23/2022 19:32:28'!
addToFraccion: aFraccionBeingAdded
	
	self subclassResponsibility! !

!Numero methodsFor: 'arithmetic auxiliary' stamp: 'id 4/23/2022 19:32:35'!
divideToEntero: anEnteroBeingDivided

	self subclassResponsibility! !

!Numero methodsFor: 'arithmetic auxiliary' stamp: 'id 4/23/2022 19:32:40'!
divideToFraccion: aFraccionBeingDivided

	self subclassResponsibility! !

!Numero methodsFor: 'arithmetic auxiliary' stamp: 'id 4/23/2022 19:32:44'!
multiplyToEntero: anEnteroBeingMultiplied

	self subclassResponsibility! !

!Numero methodsFor: 'arithmetic auxiliary' stamp: 'id 4/23/2022 19:32:48'!
multiplyToFraccion: aFraccionBeingMultiplied

	self subclassResponsibility! !

!Numero methodsFor: 'arithmetic auxiliary' stamp: 'id 4/23/2022 19:32:52'!
subtractToEntero: anEnteroBeingSubtracted 

	self subclassResponsibility! !

!Numero methodsFor: 'arithmetic auxiliary' stamp: 'id 4/23/2022 19:32:55'!
subtractToFraccion: aFraccionBeingSubtracted 

	self subclassResponsibility! !


!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de número inválido!!!!!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic auxiliary' stamp: 'id 4/24/2022 02:00:59'!
addToEntero: anEnteroBeingAdded
	
	^Entero with: anEnteroBeingAdded integerValue + value.! !

!Entero methodsFor: 'arithmetic auxiliary' stamp: 'MB 4/22/2022 15:52:12'!
addToFraccion: aFraccionBeingAdded
	
	^aFraccionBeingAdded denominator * self + aFraccionBeingAdded numerator / aFraccionBeingAdded denominator.
	! !

!Entero methodsFor: 'arithmetic auxiliary' stamp: 'MB 4/23/2022 15:21:06'!
divideToEntero: anEnteroBeingDivided

	^ Fraccion with: anEnteroBeingDivided over: self.! !

!Entero methodsFor: 'arithmetic auxiliary' stamp: 'MB 4/23/2022 15:30:34'!
divideToFraccion: aFraccionBeingDivided

	^ aFraccionBeingDivided numerator / (aFraccionBeingDivided denominator * self).! !

!Entero methodsFor: 'arithmetic auxiliary' stamp: 'id 4/24/2022 02:01:32'!
multiplyToEntero: anEnteroBeingMultiplied

	^Entero with: anEnteroBeingMultiplied integerValue * value.! !

!Entero methodsFor: 'arithmetic auxiliary' stamp: 'MB 4/22/2022 16:07:40'!
multiplyToFraccion: aFraccionBeingMultiplied

	^(aFraccionBeingMultiplied numerator * self / aFraccionBeingMultiplied denominator).! !

!Entero methodsFor: 'arithmetic auxiliary' stamp: 'id 4/24/2022 02:01:40'!
subtractToEntero: anEnteroBeingSubtracted 

	^Entero with: anEnteroBeingSubtracted integerValue - value.! !

!Entero methodsFor: 'arithmetic auxiliary' stamp: 'MB 4/23/2022 16:13:08'!
subtractToFraccion: aFraccionBeingSubtracted 

	^ (aFraccionBeingSubtracted numerator - (self * aFraccionBeingSubtracted denominator)) / aFraccionBeingSubtracted denominator.! !


!Entero methodsFor: 'arithmetic operations' stamp: 'MB 4/22/2022 16:01:57'!
* aMultiplier 
	
	^aMultiplier multiplyToEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'MB 4/21/2022 21:45:45'!
+ anAdder 
	
	^anAdder addToEntero: self.
	
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'id 4/23/2022 19:58:40'!
- aSubtrahend 

	^aSubtrahend subtractToEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'id 4/23/2022 19:58:43'!
/ aDivisor 
	
	^aDivisor divideToEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'id 4/24/2022 02:03:26'!
// aDivisor 
	
	^Entero with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'id 4/24/2022 02:37:16'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'id 4/24/2022 02:02:10'!
greatestCommonDivisorWith: anEntero 
	
	^Entero with: (value gcd: anEntero integerValue).! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'id 4/24/2022 02:35:52'!
isNegative
	
	^false.! !

!Entero methodsFor: 'testing' stamp: 'id 4/24/2022 02:04:27'!
isOne
	
	^false.! !

!Entero methodsFor: 'testing' stamp: 'id 4/24/2022 01:22:26'!
isZero
	
	^false.! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'id 4/24/2022 02:48:33'!
correspondsTo: aValue

	self subclassResponsibility.! !

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/15/2021 16:42:24'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'id 4/24/2022 02:55:41'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
		
	^(self subclasses detect: [ :anEnteroClass | anEnteroClass correspondsTo: aValue ] ifNone: [^self new initalizeWith: aValue.]) with: aValue.! !


!classDefinition: #Cero category: 'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'arithmetic auxiliary' stamp: 'id 4/24/2022 00:56:29'!
divideToEntero: anEnteroBeingDivided

	^self error: Numero canNotDivideByZeroErrorDescription.! !

!Cero methodsFor: 'arithmetic auxiliary' stamp: 'id 4/24/2022 00:41:57'!
divideToFraccion: aFraccionBeingDivided

	^self error: Numero canNotDivideByZeroErrorDescription.! !


!Cero methodsFor: 'arithmetic operations' stamp: 'id 4/24/2022 02:05:05'!
fibonacci

	^Uno new.! !


!Cero methodsFor: 'comparing' stamp: 'id 4/24/2022 00:36:16'!
= anObject

	^(anObject isKindOf: self class).! !


!Cero methodsFor: 'initialization' stamp: 'id 4/24/2022 01:34:32'!
initialize

	value := 0.! !


!Cero methodsFor: 'testing' stamp: 'id 4/24/2022 00:38:18'!
isZero

	^true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numero-Exercise'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'instance creation' stamp: 'id 4/24/2022 02:48:55'!
correspondsTo: aValue

	^aValue isZero.! !

!Cero class methodsFor: 'instance creation' stamp: 'id 4/24/2022 02:50:17'!
with: aValue 
	
	^self new.! !


!classDefinition: #EnteroNegativo category: 'Numero-Exercise'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroNegativo methodsFor: 'testing' stamp: 'id 4/24/2022 02:35:33'!
isNegative
	
	^true.! !


!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'id 4/24/2022 02:36:40'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNegativo class' category: 'Numero-Exercise'!
EnteroNegativo class
	instanceVariableNames: ''!

!EnteroNegativo class methodsFor: 'instance creation' stamp: 'id 4/24/2022 02:49:51'!
correspondsTo: aValue

	^aValue negative.! !

!EnteroNegativo class methodsFor: 'instance creation' stamp: 'id 4/24/2022 02:43:47'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	aValue negative ifFalse: [  self error: 'aValue debe ser negativo' ].
		
	^self new initalizeWith: aValue.! !


!classDefinition: #Uno category: 'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'arithmetic operations' stamp: 'id 4/24/2022 01:56:00'!
fibonacci

	^self class new.! !


!Uno methodsFor: 'comparing' stamp: 'id 4/24/2022 01:56:14'!
= anObject

	^(anObject isKindOf: self class).! !


!Uno methodsFor: 'initialization' stamp: 'id 4/24/2022 01:56:23'!
initialize

	value := 1.! !


!Uno methodsFor: 'testing' stamp: 'id 4/24/2022 01:59:53'!
isOne

	^true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numero-Exercise'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'instance creation' stamp: 'id 4/24/2022 02:49:33'!
correspondsTo: aValue

	^aValue = 1.! !

!Uno class methodsFor: 'instance creation' stamp: 'id 4/24/2022 02:50:31'!
with: aValue 
	
	^self new.! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'arithmetic auxiliary' stamp: 'MB 4/21/2022 21:42:07'!
addToEntero: anEnteroBeingAdded

	^self denominator * anEnteroBeingAdded + self numerator / self denominator.! !

!Fraccion methodsFor: 'arithmetic auxiliary' stamp: 'MB 4/22/2022 15:53:05'!
addToFraccion: aFraccionBeingAdded

	| newNumerator newDenominator |
	
	newNumerator := (numerator * aFraccionBeingAdded denominator) + (denominator * aFraccionBeingAdded numerator).
	newDenominator := denominator * aFraccionBeingAdded denominator.
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'arithmetic auxiliary' stamp: 'MB 4/23/2022 15:21:28'!
divideToEntero: anEnteroBeingDivided

	^ Fraccion with: anEnteroBeingDivided * self denominator over: self numerator.
	! !

!Fraccion methodsFor: 'arithmetic auxiliary' stamp: 'id 4/23/2022 22:37:15'!
divideToFraccion: aFraccionBeingDivided

	^ (aFraccionBeingDivided numerator * denominator) / (aFraccionBeingDivided denominator * numerator).! !

!Fraccion methodsFor: 'arithmetic auxiliary' stamp: 'MB 4/22/2022 16:01:17'!
multiplyToEntero: anEnteroBeingMultiplied

	^(numerator * anEnteroBeingMultiplied / denominator).! !

!Fraccion methodsFor: 'arithmetic auxiliary' stamp: 'MB 4/22/2022 16:05:38'!
multiplyToFraccion: aFraccionBeingMultiplied

	^(numerator * aFraccionBeingMultiplied numerator) / (denominator * aFraccionBeingMultiplied denominator).! !

!Fraccion methodsFor: 'arithmetic auxiliary' stamp: 'MB 4/23/2022 15:56:44'!
subtractToEntero: anEnteroBeingSubtracted

	^ ((anEnteroBeingSubtracted * denominator) - numerator) / denominator.! !

!Fraccion methodsFor: 'arithmetic auxiliary' stamp: 'MB 4/23/2022 16:11:51'!
subtractToFraccion: aFraccionBeingSubtracted

	| newDenominator newNumerator |
	
	newNumerator := (aFraccionBeingSubtracted numerator * denominator) - (aFraccionBeingSubtracted denominator * numerator).
	newDenominator := aFraccionBeingSubtracted denominator * denominator.
	
	^ newNumerator / newDenominator.! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'MB 4/22/2022 16:08:14'!
* aMultiplier 
	
	^aMultiplier multiplyToFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'id 4/23/2022 19:59:03'!
+ anAdder 
	
	^anAdder addToFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'id 4/23/2022 19:58:05'!
- aSubtrahend 
	
	^aSubtrahend subtractToFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'id 4/23/2022 19:55:16'!
/ aDivisor 
	
	^aDivisor divideToFraccion: self.
	
	
	! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'testing' stamp: 'MB 4/22/2022 16:13:42'!
isNegative
	
	^numerator isNegative.! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
