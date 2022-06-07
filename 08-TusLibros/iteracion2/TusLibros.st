!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'book1 book2 book3 book4 catalogue expiredCreditCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'auxiliary' stamp: 'MYB 6/6/2022 19:52:34'!
createCart

	^Cart withCatalogue: (catalogue keys).! !

!CashierTest methodsFor: 'auxiliary' stamp: 'MYB 6/6/2022 19:52:39'!
createCashier

	^Cashier withCatalogue: catalogue! !

!CashierTest methodsFor: 'auxiliary' stamp: 'MYB 6/6/2022 19:56:18'!
createCreditCardWithNumber: creditCardNumber expiration: anExpirationMonth owner: anOwner

	| creditCard |
	creditCard := Dictionary new.
	creditCard add: 'number'->creditCardNumber; add: 'expiration'->anExpirationMonth; add: 'owner'->anOwner.
	
	^creditCard! !


!CashierTest methodsFor: 'setUp' stamp: 'MYB 6/6/2022 19:56:26'!
setUp

	book1 := '1'.
	book2 := '2'.
	book3 := '3'.
	book4 := '4'.
	
	catalogue := Dictionary new.
	catalogue add: book1->1; add: book2->2; add: book3->3; add: book4->4.! !


!CashierTest methodsFor: 'tests' stamp: 'MYB 6/6/2022 19:37:50'!
test01CashierCannotCheckoutAnEmptyCart

	| cart cashier |
	cart := self createCart.
	cashier := self createCashier.
	
	self 
		should: [ cashier checkout: cart ] 
		raise: Error 
		withExceptionDo: 
		[ :error |
			self 
				assert: Cashier cannotCheckoutAnEmptyCart
				equals: error messageText.
			self assert: 0 equals: cashier orderTotal.
		].
	! !

!CashierTest methodsFor: 'tests' stamp: 'MYB 6/6/2022 19:07:26'!
test02OrderTotalBeforeCheckingOutAnyCartIsZero

	| cashier |
	
	cashier := self createCashier.
	
	self assert: 0 equals: cashier orderTotal.! !

!CashierTest methodsFor: 'tests' stamp: 'MYB 6/6/2022 19:09:05'!
test03CashierKnowsOrderTotalAfterCheckingOutACartWithBooks

	| cart cashier |
	
	cart := self createCart.
	cart addBook: book1 withOccurrences: 1.
	cart addBook: book2 withOccurrences: 2.
	
	cashier := self createCashier.
	
	cashier checkout: cart.
	
	self assert: 5 equals: cashier orderTotal.! !

!CashierTest methodsFor: 'tests' stamp: 'MYB 6/6/2022 20:01:56'!
test04CashierCannotDebitFromAnExpiredCreditCard

	| cart cashier creditCard expirationMonth |
	
	cart := self createCart.
	cart addBook: book1 withOccurrences: 1.
	cart addBook: book2 withOccurrences: 2.
	
	cashier := self createCashier.
	
	expirationMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 4.
	
	creditCard := self createCreditCardWithNumber: '123' expiration: expirationMonth owner: 'Hernan'.
	
	self 
		should: [ cashier checkout: cart andPayWith: creditCard ] 
		raise: Error 
		withExceptionDo: 
		[ :error |
			self 
				assert: Cashier cannotCheckoutACartWithExpiredCard
				equals: error messageText.
			self assert: 0 equals: cashier orderTotal.
		].! !


!classDefinition: #TusLibrosModelTest category: 'TusLibros'!
TestCase subclass: #TusLibrosModelTest
	instanceVariableNames: 'book1 book2 book3 book4 catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosModelTest methodsFor: 'setUp' stamp: 'MYB 6/6/2022 21:25:03'!
createCart

	^Cart withCatalogue: (catalogue keys).! !

!TusLibrosModelTest methodsFor: 'setUp' stamp: 'MYB 6/6/2022 21:24:35'!
createCashier

	^Cashier withCatalogue: catalogue! !

!TusLibrosModelTest methodsFor: 'setUp' stamp: 'MYB 6/6/2022 21:24:47'!
setUp

	book1 := '1'.
	book2 := '2'.
	book3 := '3'.
	book4 := '4'.
	
	catalogue := Dictionary new.
	catalogue add: book1->1; add: book2->2; add: book3->3; add: book4->4.! !


!TusLibrosModelTest methodsFor: 'tests' stamp: 'MYB 6/6/2022 21:28:26'!
atest18CashierCannotDebitFromAnExpiredCreditCard

	| cart cashier creditCard expirationMonth |
	
	cart := self createCart.
	cart addBook: book1 withOccurrences: 1.
	cart addBook: book2 withOccurrences: 2.
	
	cashier := self createCashier.
	
	expirationMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 4.
	
	creditCard := self createCreditCardWithNumber: '123' expiration: expirationMonth owner: 'Hernan'.
	
	self 
		should: [ cashier checkout: cart andPayWith: creditCard ] 
		raise: Error 
		withExceptionDo: 
		[ :error |
			self 
				assert: Cashier cannotCheckoutACartWithExpiredCard
				equals: error messageText.
			self assert: 0 equals: cashier orderTotal.
		].! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 21:23:30'!
test01CartIsEmptyWhenCreated

	| cart |
	cart := self createCart.
	
	self assert: cart isEmpty.! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'id 6/5/2022 20:43:37'!
test02CartIsNotEmptyWhenBookIsAdded

	| cart |
	cart := self createCart.
	
	cart addBook: book1 withOccurrences: 1.
	
	self deny: cart isEmpty.! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'MYB 6/2/2022 21:23:31'!
test03CartSizeIsZeroWhenCreated

	| cart |
	cart := self createCart.
	
	self assert: 0 equals: cart size.! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'id 6/5/2022 20:43:55'!
test04CartSizeIsOneWhenBookIsAdded

	| cart |
	cart := self createCart.
	
	cart addBook: book1 withOccurrences: 1.
	
	self assert: 1 equals: cart size.! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'id 6/5/2022 20:44:05'!
test05CartSizeIncresesWhenBooksAreAdded

	| cart |
	cart := self createCart.
	
	cart addBook: book1 withOccurrences: 1.
	cart addBook: book2 withOccurrences: 1.
	
	self assert: 2 equals: cart size.! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'id 6/6/2022 15:30:45'!
test06CannotAddBookToCartIfIsNotIncludedInCatalogue

	| cart book |
	cart := self createCart.
	book := '5'.
	
	self 
		should: [ cart addBook: book withOccurrences: 1. ] 
		raise: Error 
		withExceptionDo: 
		[ :error |
			self 
				assert: Cart cannotAddBookNotIncludedInCartCatalogue 
				equals: error messageText.
			self assert: cart isEmpty.
		].
	
	
	! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'id 6/5/2022 20:50:10'!
test07CannotAddBookToCartIfNumberOfOccurrencesIsNotGreaterThanZero

	| cart |
	cart := self createCart.
	
	self 
		should: [ cart addBook: book1 withOccurrences: -1. ] 
		raise: Error 
		withExceptionDo: 
		[ :error |
			self 
				assert: Cart cannotAddBookIfNumberOfOccurrencesIsNotGreaterThanZero 
				equals: error messageText.
			self assert: cart isEmpty.
		].! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'id 6/5/2022 21:22:54'!
test08CartKnowsOcurrencesOfBookItHasWhenCreated

	| cart |
	cart := self createCart.
	
	self assert: 0 equals: (cart occurrencesOf: book1).
	
	
	! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'id 6/5/2022 21:22:47'!
test09CartKnowsOcurrencesOfBookItHasWhenBookAdded

	| cart |
	cart := self createCart.
	
	cart addBook: book1 withOccurrences: 1.
	
	self assert: 1 equals: (cart occurrencesOf: book1).
	
	
	! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'id 6/5/2022 21:22:40'!
test10CartKnowsOcurrencesOfBookWhenADifferentBookIsAdded

	| cart |
	cart := self createCart.
	
	cart addBook: book1 withOccurrences: 1.
	
	self assert: 0 equals: (cart occurrencesOf: book2).
	
	
	! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'id 6/5/2022 21:22:33'!
test11CartKnowsOcurrencesOfBookWhenSameBookIsAddedRepeteadly

	| cart |
	cart := self createCart.
	
	cart addBook: book1 withOccurrences: 3.
	
	self assert: 3 equals: (cart occurrencesOf: book1).
	
	
	! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'id 6/6/2022 15:31:02'!
test12CartKnowsOcurrencesOfBookWhenBookWithSameISBNIsAddedRepeteadly

	| cart book |
	cart := self createCart.
	book := '1'.

	cart addBook: book1 withOccurrences: 1.
	cart addBook: book withOccurrences: 1.
	
	self assert: 2 equals: (cart occurrencesOf: book1).! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'MYB 6/6/2022 18:45:19'!
test13EmptyCartKnowsItsItems

	| cart |
	cart := self createCart.
	
	self assert: Bag new equals: cart items.
	
	
	
	! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'MYB 6/6/2022 18:48:31'!
test14CartWithBooksKnowsItsItems

	| cart items |
	cart := self createCart.
	cart addBook: book1 withOccurrences: 1.
	cart addBook: book2 withOccurrences: 2.
	cart addBook: book3 withOccurrences: 3.
	
	items := Bag new.
	items add: book1 withOccurrences: 1.
	items add: book2 withOccurrences: 2.
	items add: book3 withOccurrences: 3.
	
	self assert: items equals: cart items.
	
	
	
	! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'MYB 6/6/2022 21:24:08'!
test15CashierCannotCheckoutAnEmptyCart

	| cart cashier |
	cart := self createCart.
	cashier := self createCashier.
	
	self 
		should: [ cashier checkout: cart ] 
		raise: Error 
		withExceptionDo: 
		[ :error |
			self 
				assert: Cashier cannotCheckoutAnEmptyCart
				equals: error messageText.
			self assert: 0 equals: cashier orderTotal.
		].
	
	
	
	! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'MYB 6/6/2022 21:25:24'!
test16OrderTotalBeforeCheckingOutAnyCartIsZero

	| cashier |
	
	cashier := self createCashier.
	
	self assert: 0 equals: cashier orderTotal.
	
	! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'MYB 6/6/2022 21:25:33'!
test17CashierKnowsOrderTotalAfterCheckingOutACartWithBooks

	| cart cashier |
	
	cart := self createCart.
	cart addBook: book1 withOccurrences: 1.
	cart addBook: book2 withOccurrences: 2.
	
	cashier := self createCashier.
	
	cashier checkout: cart.
	
	self assert: 5 equals: cashier orderTotal.! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'MYB 6/6/2022 21:36:43'!
test18CannotCreateCardWithEmptyOwner

	| expirationMonth |
	
	expirationMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 4.
	
	self 
		should: [ CreditCard withNumber: '55555555555555555' expiration: expirationMonth owner: '' ] 
		raise: Error 
		withMessageText: CreditCard cannotCreateCardWithEmptyOwner! !

!TusLibrosModelTest methodsFor: 'tests' stamp: 'MYB 6/6/2022 23:03:33'!
test19CardMustBeCreatedWithSixteenDigits

	| expirationMonth |
	
	expirationMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 4.
	
	self 
		should: [ CreditCard withNumber: '555555555555555' expiration: expirationMonth owner: 'Hernan' ] 
		raise: Error 
		withMessageText: CreditCard cardNumberMustHaveSixteenDigits! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'items catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'accessing' stamp: 'MYB 6/6/2022 19:23:05'!
items
	
	^items copy! !

!Cart methodsFor: 'accessing' stamp: 'MYB 6/6/2022 18:43:13'!
occurrencesOf: aBook 
	
	^items occurrencesOf: aBook.! !

!Cart methodsFor: 'accessing' stamp: 'MYB 6/6/2022 18:43:12'!
size
	
	^items size.! !


!Cart methodsFor: 'exceptions' stamp: 'id 6/5/2022 20:54:21'!
signalCannotAddBookIfNumberOfOccurrencesIsNotGreaterThanZero

	self error: self class cannotAddBookIfNumberOfOccurrencesIsNotGreaterThanZero.! !

!Cart methodsFor: 'exceptions' stamp: 'id 6/5/2022 20:54:38'!
signalCannotAddBookNotIncludedInCartCatalogue

	self error: self class cannotAddBookNotIncludedInCartCatalogue.! !


!Cart methodsFor: 'initialization' stamp: 'MYB 6/6/2022 18:43:12'!
initializeWithCatalogue: aCatalogue

	items := Bag new.
	catalogue := aCatalogue.! !


!Cart methodsFor: 'operations' stamp: 'MYB 6/6/2022 18:43:13'!
addBook: aBook withOccurrences: aNumberOfOccurrences  
	
	self assertCanAddBook: aBook withOccurrences: aNumberOfOccurrences.

	items add: aBook withOccurrences: aNumberOfOccurrences.! !


!Cart methodsFor: 'operations - private' stamp: 'id 6/6/2022 15:28:47'!
assertBookIsInCatalogue: aBook

	(catalogue includes: aBook) ifFalse: [ self signalCannotAddBookNotIncludedInCartCatalogue. ].! !

!Cart methodsFor: 'operations - private' stamp: 'id 6/5/2022 20:56:24'!
assertCanAddBook: aBook withOccurrences: aNumberOfOccurrences 

	self assertBookIsInCatalogue: aBook.

	self assertNumberOfOccurrencesIsGreaterThanZero: aNumberOfOccurrences.! !

!Cart methodsFor: 'operations - private' stamp: 'id 6/5/2022 20:56:32'!
assertNumberOfOccurrencesIsGreaterThanZero: aNumberOfOccurrences

	(aNumberOfOccurrences > 0) ifFalse: [ self signalCannotAddBookIfNumberOfOccurrencesIsNotGreaterThanZero. ].! !


!Cart methodsFor: 'testing' stamp: 'MYB 6/6/2022 18:43:12'!
isEmpty
	
	^items isEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error descriptions' stamp: 'id 6/5/2022 20:51:16'!
cannotAddBookIfNumberOfOccurrencesIsNotGreaterThanZero
	
	^'Cannot add a book if number of occurrences is not greater than zero.'.! !

!Cart class methodsFor: 'error descriptions' stamp: 'MYB 6/4/2022 13:17:47'!
cannotAddBookNotIncludedInCartCatalogue
	
	^'Cannot add a book that is not listed in cart''s catalogue'
! !


!Cart class methodsFor: 'instance creation' stamp: 'id 6/5/2022 20:40:34'!
withCatalogue: aCatalogue

	^self new initializeWithCatalogue: aCatalogue.! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'catalogue cart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'assertions' stamp: 'MYB 6/6/2022 19:39:08'!
assertCartIsNotEmpty: aCart

	^ aCart isEmpty ifTrue: [self signalCannotCheckoutAnEmptyCart]! !


!Cashier methodsFor: 'operations' stamp: 'MYB 6/6/2022 19:39:08'!
checkout: aCart

	self assertCartIsNotEmpty: aCart.
	
	cart := aCart.! !

!Cashier methodsFor: 'operations' stamp: 'MYB 6/6/2022 20:32:52'!
checkout: aCart andPayWith: aCreditCard

	self checkout: aCart.
	
	self error: self class cannotCheckoutACartWithExpiredCard.! !

!Cashier methodsFor: 'operations' stamp: 'MYB 6/6/2022 19:36:23'!
orderTotal
	
	^ cart items sum: [ :item | (catalogue at: item)] ifEmpty: [0]! !


!Cashier methodsFor: 'initialization' stamp: 'MYB 6/6/2022 19:25:31'!
initializeWithCatalogue: aCatalogue 
	
	catalogue := aCatalogue.
	cart := Cart withCatalogue: aCatalogue keys.! !


!Cashier methodsFor: 'errors' stamp: 'MYB 6/6/2022 19:38:31'!
signalCannotCheckoutAnEmptyCart

	^ self error: self class cannotCheckoutAnEmptyCart! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error descriptions' stamp: 'MYB 6/6/2022 18:54:48'!
cannotCheckoutAnEmptyCart
	
	^'Cannot checkout an empty cart'! !


!Cashier class methodsFor: 'instance creation' stamp: 'MYB 6/6/2022 19:19:16'!
withCatalogue: aCatalogue 
	
	^self new initializeWithCatalogue: aCatalogue ! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'creditCardNumber expirationMonthOfYear owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'MYB 6/6/2022 21:38:58'!
initializeWithNumber: aCreditCardNumber expiration: anExpirationMonthOfYear owner: anOwner 
	
	creditCardNumber := aCreditCardNumber.
	expirationMonthOfYear := anExpirationMonthOfYear.
	owner := anOwner.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'error descriptions' stamp: 'MYB 6/6/2022 21:36:23'!
cannotCreateCardWithEmptyOwner

	^'Cannot create card with empty owner'! !

!CreditCard class methodsFor: 'error descriptions' stamp: 'MYB 6/6/2022 21:47:19'!
cardNumberMustHaveSixteenDigits

	^'Card number must have sixteen digits'! !


!CreditCard class methodsFor: 'instance creation - private' stamp: 'MYB 6/6/2022 23:04:45'!
assertCardNumberDigitsAreSixteen: aCreditCardNumber

	^ aCreditCardNumber size = 16 ifFalse: [self error: self cardNumberMustHaveSixteenDigits]! !

!CreditCard class methodsFor: 'instance creation - private' stamp: 'MYB 6/6/2022 21:42:58'!
assertOwnerIsNotEmpty: anOwner

	^ anOwner isEmpty ifTrue: [self error: self cannotCreateCardWithEmptyOwner ]! !


!CreditCard class methodsFor: 'instance creation' stamp: 'MYB 6/6/2022 23:04:45'!
withNumber: aCreditCardNumber expiration: anExpirationMonthOfYear owner: anOwner 
	
	self assertOwnerIsNotEmpty: anOwner. 
	self assertCardNumberDigitsAreSixteen: aCreditCardNumber.
	^self new initializeWithNumber: aCreditCardNumber expiration: anExpirationMonthOfYear owner: anOwner ! !
