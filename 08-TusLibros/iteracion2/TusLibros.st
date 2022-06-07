!classDefinition: #TusLibrosModelTest category: 'TusLibros'!
TestCase subclass: #TusLibrosModelTest
	instanceVariableNames: 'book1 book2 book3 book4 priceList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosModelTest methodsFor: 'setUp' stamp: 'id 6/7/2022 19:02:44'!
createCart

	^Cart withPriceList: priceList.! !

!TusLibrosModelTest methodsFor: 'setUp' stamp: 'id 6/7/2022 20:03:49'!
createCashier

	^Cashier withDate: (GregorianMonthOfYear yearNumber: 2022 monthNumber: 2).! !

!TusLibrosModelTest methodsFor: 'setUp' stamp: 'id 6/7/2022 18:19:59'!
createCreditCardWithExpiration: aMonthOfYear 
	
	^CreditCard withNumber: '1234567890123456' expiration: aMonthOfYear owner: 'Hernan'.! !

!TusLibrosModelTest methodsFor: 'setUp' stamp: 'id 6/7/2022 18:51:39'!
setUp

	book1 := '1'.
	book2 := '2'.
	book3 := '3'.
	book4 := '4'.
	
	priceList := Dictionary new.
	priceList add: book1->1; add: book2->2; add: book3->3; add: book4->4.! !


!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'MYB 6/2/2022 21:23:30'!
test01CartIsEmptyWhenCreated

	| cart |
	cart := self createCart.
	
	self assert: cart isEmpty.! !

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/5/2022 20:43:37'!
test02CartIsNotEmptyWhenBookIsAdded

	| cart |
	cart := self createCart.
	
	cart addBook: book1 withOccurrences: 1.
	
	self deny: cart isEmpty.! !

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'MYB 6/2/2022 21:23:31'!
test03CartSizeIsZeroWhenCreated

	| cart |
	cart := self createCart.
	
	self assert: 0 equals: cart size.! !

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/5/2022 20:43:55'!
test04CartSizeIsOneWhenBookIsAdded

	| cart |
	cart := self createCart.
	
	cart addBook: book1 withOccurrences: 1.
	
	self assert: 1 equals: cart size.! !

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/5/2022 20:44:05'!
test05CartSizeIncresesWhenBooksAreAdded

	| cart |
	cart := self createCart.
	
	cart addBook: book1 withOccurrences: 1.
	cart addBook: book2 withOccurrences: 1.
	
	self assert: 2 equals: cart size.! !

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/6/2022 15:30:45'!
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

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/5/2022 20:50:10'!
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

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/7/2022 19:08:09'!
test08CannotAddBookToCartIfNumberOfOccurrencesIsNotAnInteger

	| cart |
	cart := self createCart.
	
	self 
		should: [ cart addBook: book1 withOccurrences: 1.5. ] 
		raise: Error 
		withExceptionDo: 
		[ :error |
			self 
				assert: Cart cannotAddBookIfNumberOfOccurrencesIsNotAnInteger 
				equals: error messageText.
			self assert: cart isEmpty.
		].! !

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/7/2022 19:08:03'!
test09CartKnowsOcurrencesOfBookItHasWhenCreated

	| cart |
	cart := self createCart.
	
	self assert: 0 equals: (cart occurrencesOf: book1).
	
	
	! !

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/7/2022 19:07:59'!
test10CartKnowsOcurrencesOfBookItHasWhenBookAdded

	| cart |
	cart := self createCart.
	
	cart addBook: book1 withOccurrences: 1.
	
	self assert: 1 equals: (cart occurrencesOf: book1).
	
	
	! !

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/7/2022 19:07:54'!
test11CartKnowsOcurrencesOfBookWhenADifferentBookIsAdded

	| cart |
	cart := self createCart.
	
	cart addBook: book1 withOccurrences: 1.
	
	self assert: 0 equals: (cart occurrencesOf: book2).
	
	
	! !

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/7/2022 19:07:51'!
test12CartKnowsOcurrencesOfBookWhenSameBookIsAddedRepeteadly

	| cart |
	cart := self createCart.
	
	cart addBook: book1 withOccurrences: 3.
	
	self assert: 3 equals: (cart occurrencesOf: book1).
	
	
	! !

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/7/2022 19:07:48'!
test13CartKnowsOcurrencesOfBookWhenBookWithSameISBNIsAddedRepeteadly

	| cart book |
	cart := self createCart.
	book := '1'.

	cart addBook: book1 withOccurrences: 1.
	cart addBook: book withOccurrences: 1.
	
	self assert: 2 equals: (cart occurrencesOf: book1).! !

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/7/2022 19:43:04'!
test14EmptyCartKnowsItsTotalPrice

	| cart |
	cart := self createCart.
	
	self assert: Bag new equals: cart items.! !

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/7/2022 19:43:31'!
test15CartWithBooksKnowsItsTotalPrice

	| cart items |
	cart := self createCart.
	cart addBook: book1 withOccurrences: 1.
	cart addBook: book2 withOccurrences: 2.
	cart addBook: book3 withOccurrences: 3.
	
	items := Bag new.
	items add: book1 withOccurrences: 1.
	items add: book2 withOccurrences: 2.
	items add: book3 withOccurrences: 3.
	
	self assert: items equals: cart items.! !

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/7/2022 19:43:14'!
test16EmptyCartKnowsItsTotalPrice

	| cart |

	cart := self createCart.
	
	self assert: 0 equals: cart totalPrice.! !

!TusLibrosModelTest methodsFor: 'tests - cart' stamp: 'id 6/7/2022 19:43:41'!
test17CartWithBooksKnowsItsTotalPrice

	| cart |
	
	cart := self createCart.
	cart addBook: book1 withOccurrences: 1.
	cart addBook: book2 withOccurrences: 2.
	cart addBook: book3 withOccurrences: 3.
	
	self assert: 14 equals: cart totalPrice.! !


!TusLibrosModelTest methodsFor: 'tests - cashier' stamp: 'id 6/7/2022 20:17:36'!
test24CashierCannotCheckoutAnEmptyCart

	| cart cashier creditCard expirationMonth merchantProcessorMock |
	
	merchantProcessorMock := MerchantProcessorMock new.
	
	expirationMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 4.

	cart := self createCart.
	cashier := self createCashier.
	creditCard := self createCreditCardWithExpiration: expirationMonth.

	self 
		should: [ cashier checkout: cart andDebitFrom: creditCard. ]
		raise: Error 
		withExceptionDo: 
		[ :error |
			self 
				assert: Cashier cannotCheckoutAnEmptyCart
				equals: error messageText.
			self deny: (merchantProcessorMock hasBeenCalled).
		].! !

!TusLibrosModelTest methodsFor: 'tests - cashier' stamp: 'id 6/7/2022 20:17:32'!
test25OrderTotalBeforeCheckingOutAnyCartIsZero

	| cashier cart |
	
	cart := self createCart.
	cashier := self createCashier.
	
	self assert: 0 equals: (cashier orderTotalFor: cart).! !

!TusLibrosModelTest methodsFor: 'tests - cashier' stamp: 'id 6/7/2022 20:17:29'!
test26CashierKnowsOrderTotalAfterCheckingOutACartWithBooks

	| cart cashier |
	
	cart := self createCart.
	cart addBook: book1 withOccurrences: 1.
	cart addBook: book2 withOccurrences: 2.
	
	cashier := self createCashier.
	
	self assert: 5 equals: (cashier orderTotalFor: cart).! !

!TusLibrosModelTest methodsFor: 'tests - cashier' stamp: 'id 6/7/2022 20:17:26'!
test27CashierCannotDebitFromAnExpiredCreditCard

	| cart cashier creditCard expirationMonth merchantProcessorMock |
	
	merchantProcessorMock := MerchantProcessorMock new.
	
	cart := self createCart.
	cart addBook: book1 withOccurrences: 1.
	cart addBook: book2 withOccurrences: 2.

	expirationMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 4.
	
	cashier := Cashier withDate: (GregorianMonthOfYear yearNumber: 2022 monthNumber: 5).

	creditCard := self createCreditCardWithExpiration: expirationMonth.

	self 
		should: [ cashier checkout: cart andDebitFrom: creditCard ] 
		raise: Error 
		withExceptionDo: 
		[ :error |
			self 
				assert: Cashier cannotDebitFromAnExpiredCard
				equals: error messageText.
			self deny: (merchantProcessorMock hasBeenCalled).
		].! !

!TusLibrosModelTest methodsFor: 'tests - cashier' stamp: 'id 6/7/2022 20:17:21'!
test28CashierDebitsFromCreditCardWhenCardIsNotExpiredAndCartHasItems

	| cart cashier creditCard expirationMonth expectedArguments merchantProcessorMock |
	
	cart := self createCart.
	cart addBook: book1 withOccurrences: 1.
	cart addBook: book2 withOccurrences: 2.

	cashier := self createCashier.
	
	expirationMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 4.
	
	creditCard := self createCreditCardWithExpiration: expirationMonth.
	
	expectedArguments := Dictionary new.
	expectedArguments add: 'creditCardNumber'->creditCard cardNumber.
	expectedArguments add: 'creditCardExpiration'->creditCard expirationMonth.
	expectedArguments add: 'creditCardOwner'->creditCard cardOwner.
	expectedArguments add: 'transactionAmout'->cart totalPrice.

	merchantProcessorMock := MerchantProcessorMock new.

	cashier checkout: cart andDebitFrom: creditCard.

	self assert: (merchantProcessorMock hasBeenCalledWith: expectedArguments).
	
	
	! !


!TusLibrosModelTest methodsFor: 'tests - credit card' stamp: 'id 6/7/2022 20:17:05'!
test18CannotCreateCardWithEmptyOwner

	| expirationMonth |
	
	expirationMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 4.
	
	self 
		should: [ CreditCard withNumber: '1234567890123456' expiration: expirationMonth owner: '' ] 
		raise: Error 
		withMessageText: CreditCard cannotCreateCardWithEmptyOwner.! !

!TusLibrosModelTest methodsFor: 'tests - credit card' stamp: 'id 6/7/2022 20:17:01'!
test19CannotCreateCardWithOnlyBlankSpacesAsOwnerName

	| expirationMonth |
	
	expirationMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 4.
	
	self 
		should: [ CreditCard withNumber: '1234567890123456' expiration: expirationMonth owner: '       ' ] 
		raise: Error 
		withMessageText: CreditCard cannotCreateCardWithEmptyOwner.! !

!TusLibrosModelTest methodsFor: 'tests - credit card' stamp: 'id 6/7/2022 20:16:58'!
test20CardMustBeCreatedWithSixteenDigits

	| expirationMonth |
	
	expirationMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 4.
	
	self 
		should: [ CreditCard withNumber: '123456789012345' expiration: expirationMonth owner: 'Hernan' ] 
		raise: Error 
		withMessageText: CreditCard cardNumberMustHaveSixteenDigits.! !

!TusLibrosModelTest methodsFor: 'tests - credit card' stamp: 'id 6/7/2022 20:16:53'!
test21CardMustBeCreatedWithSixteenNonBlankDigits

	| expirationMonth |
	
	expirationMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 4.
	
	self 
		should: [ CreditCard withNumber: '   1234567890   ' expiration: expirationMonth owner: 'Hernan' ] 
		raise: Error 
		withMessageText: CreditCard cardNumberMustHaveSixteenDigits.! !

!TusLibrosModelTest methodsFor: 'tests - credit card' stamp: 'id 6/7/2022 20:16:50'!
test22CardKnowsItIsNotExpiredOnADateBeforeItsExpiration

	| expirationMonth creditCard nonExpiredMonth |
	
	expirationMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 4.
	nonExpiredMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 3.
	
	creditCard := self createCreditCardWithExpiration: expirationMonth.
	
	self deny: (creditCard isExpiredOn: nonExpiredMonth).! !

!TusLibrosModelTest methodsFor: 'tests - credit card' stamp: 'id 6/7/2022 20:16:46'!
test23CardKnowsItIsExpiredOnADateAfterItsExpiration

	| expirationMonth creditCard expiredMonth |
	
	expirationMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 4.
	expiredMonth := GregorianMonthOfYear yearNumber: 2022 monthNumber: 5.
	
	creditCard := self createCreditCardWithExpiration: expirationMonth.
	
	self assert: (creditCard isExpiredOn: expiredMonth).! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'items priceList'
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


!Cart methodsFor: 'exceptions' stamp: 'id 6/7/2022 19:07:20'!
signalCannotAddBookIfNumberOfOccurrencesIsNotAnInteger

	self error: self class cannotAddBookIfNumberOfOccurrencesIsNotAnInteger.! !

!Cart methodsFor: 'exceptions' stamp: 'id 6/5/2022 20:54:21'!
signalCannotAddBookIfNumberOfOccurrencesIsNotGreaterThanZero

	self error: self class cannotAddBookIfNumberOfOccurrencesIsNotGreaterThanZero.! !

!Cart methodsFor: 'exceptions' stamp: 'id 6/5/2022 20:54:38'!
signalCannotAddBookNotIncludedInCartCatalogue

	self error: self class cannotAddBookNotIncludedInCartCatalogue.! !


!Cart methodsFor: 'initialization' stamp: 'id 6/7/2022 19:00:49'!
initializeWithPriceList: aPriceList

	items := Bag new.
	priceList := aPriceList.! !


!Cart methodsFor: 'operations' stamp: 'MYB 6/6/2022 18:43:13'!
addBook: aBook withOccurrences: aNumberOfOccurrences  
	
	self assertCanAddBook: aBook withOccurrences: aNumberOfOccurrences.

	items add: aBook withOccurrences: aNumberOfOccurrences.! !

!Cart methodsFor: 'operations' stamp: 'id 6/7/2022 19:39:13'!
totalPrice

	^items sum: [ :item | (priceList at: item)] ifEmpty: 0.! !


!Cart methodsFor: 'operations - private' stamp: 'id 6/7/2022 19:10:08'!
assertBookIsInCatalogue: aBook

	(self isBookInCatalogue: aBook) ifFalse: [ self signalCannotAddBookNotIncludedInCartCatalogue. ].! !

!Cart methodsFor: 'operations - private' stamp: 'id 6/7/2022 19:05:27'!
assertCanAddBook: aBook withOccurrences: aNumberOfOccurrences 

	self assertBookIsInCatalogue: aBook.

	self assertNumberOfOccurrencesIsGreaterThanZero: aNumberOfOccurrences.
	
	self assertNumberOfOccurrencesIsAnInteger: aNumberOfOccurrences.! !

!Cart methodsFor: 'operations - private' stamp: 'id 6/7/2022 19:06:47'!
assertNumberOfOccurrencesIsAnInteger: aNumberOfOccurrences 

	(aNumberOfOccurrences isKindOf: Integer) ifFalse: [ self signalCannotAddBookIfNumberOfOccurrencesIsNotAnInteger. ].! !

!Cart methodsFor: 'operations - private' stamp: 'id 6/5/2022 20:56:32'!
assertNumberOfOccurrencesIsGreaterThanZero: aNumberOfOccurrences

	(aNumberOfOccurrences > 0) ifFalse: [ self signalCannotAddBookIfNumberOfOccurrencesIsNotGreaterThanZero. ].! !

!Cart methodsFor: 'operations - private' stamp: 'id 6/7/2022 19:10:20'!
isBookInCatalogue: aBook

	^(priceList keys) includes: aBook.! !


!Cart methodsFor: 'testing' stamp: 'MYB 6/6/2022 18:43:12'!
isEmpty
	
	^items isEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error descriptions' stamp: 'id 6/7/2022 19:05:05'!
cannotAddBookIfNumberOfOccurrencesIsNotAnInteger
	
	^'Cannot add a book if number of occurrences is not an integer.'.! !

!Cart class methodsFor: 'error descriptions' stamp: 'id 6/5/2022 20:51:16'!
cannotAddBookIfNumberOfOccurrencesIsNotGreaterThanZero
	
	^'Cannot add a book if number of occurrences is not greater than zero.'.! !

!Cart class methodsFor: 'error descriptions' stamp: 'MYB 6/4/2022 13:17:47'!
cannotAddBookNotIncludedInCartCatalogue
	
	^'Cannot add a book that is not listed in cart''s catalogue'
! !


!Cart class methodsFor: 'instance creation' stamp: 'id 6/7/2022 18:59:52'!
withPriceList: aPriceList

	^self new initializeWithPriceList: aPriceList.! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'date'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'assertions' stamp: 'MYB 6/6/2022 19:39:08'!
assertCartIsNotEmpty: aCart

	^ aCart isEmpty ifTrue: [self signalCannotCheckoutAnEmptyCart]! !

!Cashier methodsFor: 'assertions' stamp: 'id 6/7/2022 20:08:29'!
assertCreditCardIsNotExpired: aCreditCard

	^(aCreditCard isExpiredOn: date) ifTrue: [ self signalCannotDebitFromAnExpiredCreditCard. ].! !


!Cashier methodsFor: 'errors' stamp: 'MYB 6/6/2022 19:38:31'!
signalCannotCheckoutAnEmptyCart

	^ self error: self class cannotCheckoutAnEmptyCart! !

!Cashier methodsFor: 'errors' stamp: 'id 6/7/2022 20:07:47'!
signalCannotDebitFromAnExpiredCreditCard

	^ self error: self class cannotDebitFromAnExpiredCard! !


!Cashier methodsFor: 'initialization' stamp: 'id 6/7/2022 19:51:25'!
initializeWithDate: aDate

	date := aDate.! !


!Cashier methodsFor: 'operations' stamp: 'id 6/7/2022 20:08:51'!
checkout: aCart andDebitFrom: aCreditCard

	self assertCartIsNotEmpty: aCart.
	self assertCreditCardIsNotExpired: aCreditCard.
	
	"orderTotal := self orderTotalFor: Cart new."! !

!Cashier methodsFor: 'operations' stamp: 'id 6/7/2022 19:39:39'!
orderTotalFor: aCart
	
	^aCart totalPrice.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error descriptions' stamp: 'MYB 6/6/2022 18:54:48'!
cannotCheckoutAnEmptyCart
	
	^'Cannot checkout an empty cart'! !

!Cashier class methodsFor: 'error descriptions' stamp: 'id 6/7/2022 19:23:15'!
cannotDebitFromAnExpiredCard

	^'Cannot debit from an expired card'.! !


!Cashier class methodsFor: 'instance creation' stamp: 'id 6/7/2022 20:04:19'!
withDate: aMonthOfYear

	^self new initializeWithDate: aMonthOfYear.! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'creditCardNumber expirationMonthOfYear owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'accessing' stamp: 'id 6/7/2022 20:01:04'!
cardNumber

	^creditCardNumber.! !

!CreditCard methodsFor: 'accessing' stamp: 'id 6/7/2022 20:01:31'!
cardOwner
	
	^owner.! !

!CreditCard methodsFor: 'accessing' stamp: 'id 6/7/2022 20:01:19'!
expirationMonth
	
	^expirationMonthOfYear.! !


!CreditCard methodsFor: 'initialization' stamp: 'MYB 6/6/2022 21:38:58'!
initializeWithNumber: aCreditCardNumber expiration: anExpirationMonthOfYear owner: anOwner 
	
	creditCardNumber := aCreditCardNumber.
	expirationMonthOfYear := anExpirationMonthOfYear.
	owner := anOwner.! !


!CreditCard methodsFor: 'testing' stamp: 'id 6/7/2022 18:26:41'!
isExpiredOn: aMonthOfYear

	^expirationMonthOfYear < aMonthOfYear.! !

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


!CreditCard class methodsFor: 'instance creation' stamp: 'MYB 6/6/2022 23:04:45'!
withNumber: aCreditCardNumber expiration: anExpirationMonthOfYear owner: anOwner 
	
	self assertOwnerIsNotEmpty: anOwner. 
	self assertCardNumberDigitsAreSixteen: aCreditCardNumber.
	^self new initializeWithNumber: aCreditCardNumber expiration: anExpirationMonthOfYear owner: anOwner ! !


!CreditCard class methodsFor: 'instance creation - private' stamp: 'id 6/7/2022 18:52:42'!
assertCardNumberDigitsAreSixteen: aCreditCardNumber

	| creditCardNumberWithoutBlankSpaces |
	
	creditCardNumberWithoutBlankSpaces := aCreditCardNumber withBlanksTrimmed.

	^creditCardNumberWithoutBlankSpaces size = 16 ifFalse: [self error: self cardNumberMustHaveSixteenDigits].! !

!CreditCard class methodsFor: 'instance creation - private' stamp: 'id 6/7/2022 18:52:49'!
assertOwnerIsNotEmpty: anOwner

	| ownerNameWithoutBlankSpaces |

	ownerNameWithoutBlankSpaces := anOwner withBlanksTrimmed.

	^ownerNameWithoutBlankSpaces isEmpty ifTrue: [self error: self cannotCreateCardWithEmptyOwner ].! !


!classDefinition: #MerchantProcessorMock category: 'TusLibros'!
Object subclass: #MerchantProcessorMock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorMock methodsFor: 'operations' stamp: 'id 6/7/2022 20:15:23'!
hasBeenCalled
	
	^false.! !

!MerchantProcessorMock methodsFor: 'operations' stamp: 'id 6/7/2022 20:10:32'!
hasBeenCalledWith: aDictionaryOfExpectedParameters

	^true.! !
