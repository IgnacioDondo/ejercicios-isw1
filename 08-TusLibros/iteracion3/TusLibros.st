!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory clientId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'setup' stamp: 'id 6/12/2022 19:15:40'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	clientId := 1.! !


!CashierTest methodsFor: 'tests' stamp: 'id 6/12/2022 19:26:08'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: testObjectsFactory defaultMerchantProcessor
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'id 6/12/2022 19:26:08'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: testObjectsFactory defaultMerchantProcessor
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'id 6/12/2022 19:26:08'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: testObjectsFactory defaultMerchantProcessor
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'id 6/12/2022 19:26:08'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: testObjectsFactory defaultMerchantProcessor
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'id 6/12/2022 19:19:12'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  merchantProcessor |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
	
	merchantProcessor := testObjectsFactory createMerchantProcessorWith: [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard
	].

	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: merchantProcessor
		on: testObjectsFactory today
		registeringOn: salesBook.

	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'id 6/12/2022 19:20:04'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard merchantProcessor |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	merchantProcessor :=  testObjectsFactory createMerchantProcessorWith: [ :anAmount :aCreditCard |
		self error: Cashier creditCardHasNoCreditErrorMessage
	].

	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: merchantProcessor
		on: testObjectsFactory today
		registeringOn: salesBook.

	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!classDefinition: #TusLibrosSystemFacadeTest category: 'TusLibros'!
TestCase subclass: #TusLibrosSystemFacadeTest
	instanceVariableNames: 'testObjectsFactory authenticateBehaviour cartIdGeneratorBehaviour validClientId validPassword cartId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosSystemFacadeTest methodsFor: 'auxiliary' stamp: 'MYB 6/12/2022 12:00:48'!
createCartWithSystemFacade: systemFacade

	^ systemFacade createCartWith: self clientId: validClientId password: validPassword! !

!TusLibrosSystemFacadeTest methodsFor: 'auxiliary' stamp: 'id 6/12/2022 19:26:08'!
createSystemFacade

	^TusLibrosSystemFacade
		withCatalog: testObjectsFactory defaultCatalog
		throught: testObjectsFactory defaultMerchantProcessor.! !


!TusLibrosSystemFacadeTest methodsFor: 'setup' stamp: 'MYB 6/9/2022 21:33:20'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	validClientId := #validClientId.
	validPassword := #validPassword.
	authenticateBehaviour := [ :aClientId :aPassword | aClientId = validClientId and: aPassword = validPassword ].
	cartId := 0.
	cartIdGeneratorBehaviour := [ 
		cartId := cartId + 1. 
		cartId 
	].! !


!TusLibrosSystemFacadeTest methodsFor: 'system facade protocol' stamp: 'MYB 6/9/2022 21:32:30'!
authenticateWithClientId: aClientId password: aPassword.
	
	^authenticateBehaviour value: aClientId value: aPassword
	
	! !

!TusLibrosSystemFacadeTest methodsFor: 'system facade protocol' stamp: 'MYB 6/9/2022 20:43:54'!
generateCartId
	
	^cartIdGeneratorBehaviour value.! !


!TusLibrosSystemFacadeTest methodsFor: 'tests - add to cart' stamp: 'id 6/12/2022 18:46:07'!
test06AddingInvalidBookToCartShouldRaiseError

	| systemFacade book cart newCartId quantity |
	
	systemFacade := self createSystemFacade.
	
	newCartId := self createCartWithSystemFacade: systemFacade.
	cart := systemFacade listCartWithId: newCartId.
	book := testObjectsFactory itemNotSellByTheStore.
	quantity := 3.

	self 
		should: [systemFacade addToCart: newCartId aQuantity: quantity ofBook: book ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: cart invalidItemErrorMessage equals: anError messageText.
			self assert: cart isEmpty
		].! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - add to cart' stamp: 'id 6/12/2022 17:58:47'!
test07AddingBooksToCartShouldAddBooksToCart

	| systemFacade book cart newCartId quantity |

	systemFacade := self createSystemFacade.

	newCartId := self createCartWithSystemFacade: systemFacade.
	cart := systemFacade listCartWithId: newCartId.
	book := testObjectsFactory itemSellByTheStore.
	quantity := 3.

	systemFacade addToCart: newCartId aQuantity: quantity ofBook: book.

	self assert: quantity equals: (cart occurrencesOf: book).! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - add to cart' stamp: 'id 6/12/2022 20:23:35'!
test13CannotAddNonPositiveAmountOfBooksToCart

	| systemFacade book cart newCartId |

	systemFacade := self createSystemFacade.

	newCartId := self createCartWithSystemFacade: systemFacade.
	cart := systemFacade listCartWithId: newCartId.
	book := testObjectsFactory itemSellByTheStore.

	self
		should: [ systemFacade addToCart: newCartId aQuantity: 0 ofBook: book. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: cart invalidQuantityErrorMessage equals: anError messageText.
			self assert: cart isEmpty.
		].! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - add to cart' stamp: 'id 6/12/2022 20:30:45'!
test14CannotAddBookToAlreadyCheckedOutCart

	| systemFacade book cart newCartId |

	systemFacade := self createSystemFacade.

	newCartId := self createCartWithSystemFacade: systemFacade.
	cart := systemFacade listCartWithId: newCartId.
	book := testObjectsFactory itemSellByTheStore.
	systemFacade addToCart: newCartId aQuantity: 1 ofBook: book.

	systemFacade checkoutWithCartId: newCartId charging: testObjectsFactory notExpiredCreditCard.

	self
		should: [ systemFacade addToCart: newCartId aQuantity: 2 ofBook: book. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TusLibrosSystemFacade invalidCartId equals: anError messageText.
			self assert: 1 equals: (cart occurrencesOf: book).
		].! !


!TusLibrosSystemFacadeTest methodsFor: 'tests - checkout' stamp: 'id 6/12/2022 18:45:58'!
test08CheckoutEmptyCartShouldRaiseError

	| systemFacade newCartId |
	
	systemFacade := self createSystemFacade.
	
	newCartId := self createCartWithSystemFacade: systemFacade.

	self 
		should: [systemFacade checkoutWithCartId: newCartId charging: testObjectsFactory notExpiredCreditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cashier cartCanNotBeEmptyErrorMessage equals: anError messageText.
		].! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - checkout' stamp: 'id 6/12/2022 18:46:25'!
test09CheckoutWithInvalidCardShouldRaiseError

	| systemFacade newCartId |
	
	systemFacade := self createSystemFacade.
	
	newCartId := self createCartWithSystemFacade: systemFacade.
	systemFacade addToCart: newCartId aQuantity: 3 ofBook: testObjectsFactory itemSellByTheStore.

	self 
		should: [systemFacade checkoutWithCartId: newCartId charging: testObjectsFactory expiredCreditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cashier canNotChargeAnExpiredCreditCardErrorMessage equals: anError messageText.
		].! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - checkout' stamp: 'MYB 6/12/2022 14:41:58'!
test10CheckoutCartShouldReturnTransactionId

	| systemFacade newCartId transactionId |
	
	systemFacade := self createSystemFacade.
	
	newCartId := self createCartWithSystemFacade: systemFacade.
	systemFacade addToCart: newCartId aQuantity: 3 ofBook: testObjectsFactory itemSellByTheStore.

	transactionId := systemFacade checkoutWithCartId: newCartId charging: testObjectsFactory notExpiredCreditCard.
	
	self deny: transactionId isNil.
	self deny: (systemFacade listPurchasesWith: self clientId: validClientId password: validPassword) isEmpty ! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - checkout' stamp: 'id 6/12/2022 20:42:49'!
test16CannotCheckoutAnAlreadyCheckedOutCart

	| systemFacade book newCartId |

	systemFacade := self createSystemFacade.

	newCartId := self createCartWithSystemFacade: systemFacade.
	book := testObjectsFactory itemSellByTheStore.
	systemFacade addToCart: newCartId aQuantity: 1 ofBook: book.
	systemFacade checkoutWithCartId: newCartId charging: testObjectsFactory notExpiredCreditCard.

	self
		should: [ systemFacade checkoutWithCartId: newCartId charging: testObjectsFactory notExpiredCreditCard. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TusLibrosSystemFacade invalidCartId equals: anError messageText.
		].! !


!TusLibrosSystemFacadeTest methodsFor: 'tests - create cart' stamp: 'MYB 6/12/2022 12:57:16'!
test01CreateCartWithInvalidCredentialsShouldRaiseError

	| systemFacade |
	
	systemFacade := self createSystemFacade.
		
	self 
		should: [ systemFacade createCartWith: self clientId: nil password: nil]
		raise: Error - MessageNotUnderstood 
		withMessageText: TusLibrosSystemFacade couldNotAuthenticateWithInvalidCredentials 
	
	
	! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - create cart' stamp: 'MYB 6/12/2022 12:57:33'!
test02CreateCartWithValidCredentialsShouldReturnCartId

	| newCartId systemFacade |
	
	systemFacade := self createSystemFacade.
	
	newCartId := self createCartWithSystemFacade: systemFacade.
	
	self assert: cartId equals: newCartId
	
	
	! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - create cart' stamp: 'MYB 6/12/2022 12:57:37'!
test03CreatingTwoCartsShouldReturnDifferentsCartIds

	| systemFacade newCartId1 newCartId2 |
	
	systemFacade := self createSystemFacade.
	
	newCartId1 := self createCartWithSystemFacade: systemFacade.
	newCartId2 := self createCartWithSystemFacade: systemFacade.
	
	self deny: newCartId1 = newCartId2.
	
	
	! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - create cart' stamp: 'MYB 6/12/2022 12:57:41'!
test04CreateCartShouldReturnCartIdForAnEmptyCart

	| newCartId cart systemFacade |
	
	systemFacade := self createSystemFacade.
	
	newCartId := self createCartWithSystemFacade: systemFacade.
	
	cart := systemFacade listCartWithId: newCartId.
	
	self assert: cart isEmpty
	
	
	! !


!TusLibrosSystemFacadeTest methodsFor: 'tests - list cart' stamp: 'MYB 6/12/2022 12:57:46'!
test05ListingTwoDifferentCartsShouldReturnDifferentCarts

	| systemFacade cart1 cart2 newCartId1 newCartId2 |
	
	systemFacade := self createSystemFacade.
	
	newCartId1 := self createCartWithSystemFacade: systemFacade.
	newCartId2 := self createCartWithSystemFacade: systemFacade.
	
	cart1 := systemFacade listCartWithId: newCartId1.
	cart2 := systemFacade listCartWithId: newCartId2.
	
	self deny: cart1 = cart2
	
	
	! !


!TusLibrosSystemFacadeTest methodsFor: 'tests - list purchases' stamp: 'MYB 6/12/2022 14:31:26'!
test11ListPurchasesOfClientWithoutPurchasesShouldReturnEmptyCollection

	| systemFacade |
	
	systemFacade := self createSystemFacade.
	
	self assert: OrderedCollection new equals: (systemFacade listPurchasesWith: self clientId: validClientId password: validPassword).! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - list purchases' stamp: 'MYB 6/12/2022 15:36:25'!
test12ListPurchasesOfClientShouldReturnItsPurchases

	| systemFacade newCartId sale |
	
	systemFacade := self createSystemFacade.
	newCartId := self createCartWithSystemFacade: systemFacade.
	systemFacade addToCart: newCartId aQuantity: 3 ofBook: testObjectsFactory itemSellByTheStore.

	systemFacade checkoutWithCartId: newCartId charging: testObjectsFactory notExpiredCreditCard.
	
	sale := (systemFacade listPurchasesWith: self clientId: validClientId password: validPassword) first.
	
	self assert: validClientId equals: sale client.
	self assert: (Bag new add: testObjectsFactory itemSellByTheStore withOccurrences: 3;yourself) equals: sale items.
	self assert: 30 equals: sale total.! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - list purchases' stamp: 'id 6/12/2022 20:39:27'!
test15CannotListAnAlreadyCheckedOutCart

	| systemFacade book newCartId |

	systemFacade := self createSystemFacade.

	newCartId := self createCartWithSystemFacade: systemFacade.
	book := testObjectsFactory itemSellByTheStore.
	systemFacade addToCart: newCartId aQuantity: 1 ofBook: book.
	systemFacade checkoutWithCartId: newCartId charging: testObjectsFactory notExpiredCreditCard.

	self
		should: [ systemFacade listCartWithId: newCartId. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TusLibrosSystemFacade invalidCartId equals: anError messageText.
		].! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'accesing' stamp: 'MYB 6/12/2022 13:25:29'!
items

	^ items! !

!Cart methodsFor: 'accesing' stamp: 'MYB 6/12/2022 13:56:37'!
owner

	^ owner! !

!Cart methodsFor: 'accesing' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'MYB 6/12/2022 15:31:37'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.
	
	items add: anItem withOccurrences: aQuantity.! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'initialization' stamp: 'MYB 6/12/2022 15:33:58'!
initializeAcceptingItemsOf: aCatalog withOwner: aClientId 
	
	catalog := aCatalog.
	items := Bag new.
	owner := aClientId
	! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !

!Cart methodsFor: 'queries' stamp: 'MYB 6/12/2022 14:08:51'!
registerSale: aSale 
	
	aSale registerWithTotal: self total items: self items client: self owner! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'MYB 6/12/2022 13:53:59'!
acceptingItemsOf: aCatalog withOwner: aSymbol 
	
	^self new initializeAcceptingItemsOf: aCatalog withOwner: aSymbol ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'id 6/12/2022 19:01:04'!
registerSale

	| sale |
	sale := Sale with: cart.

	salesBook add: sale.! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!Cashier class methodsFor: 'instance creation' stamp: 'MYB 6/12/2022 13:31:21'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !


!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #MerchantProcessorSimulator category: 'TusLibros'!
Object subclass: #MerchantProcessorSimulator
	instanceVariableNames: 'behaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorSimulator methodsFor: 'initialization' stamp: 'id 6/12/2022 19:13:10'!
debit: anAmount from: aCreditCard

	^behaviour value: anAmount value: aCreditCard.! !

!MerchantProcessorSimulator methodsFor: 'initialization' stamp: 'id 6/12/2022 19:12:23'!
initializeWith: aBlock

	behaviour := aBlock.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorSimulator class' category: 'TusLibros'!
MerchantProcessorSimulator class
	instanceVariableNames: ''!

!MerchantProcessorSimulator class methodsFor: 'instance creation' stamp: 'id 6/12/2022 19:12:33'!
with: aBlock

	^self new initializeWith: aBlock.! !


!classDefinition: #Sale category: 'TusLibros'!
Object subclass: #Sale
	instanceVariableNames: 'total items client'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'accesing' stamp: 'MYB 6/12/2022 14:11:56'!
client
	
	^ client! !

!Sale methodsFor: 'accesing' stamp: 'MYB 6/12/2022 13:23:11'!
items
	
	^ items! !

!Sale methodsFor: 'accesing' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'MYB 6/12/2022 14:08:11'!
initializeWith: aCart 
	
	aCart registerSale: self! !

!Sale methodsFor: 'initialization' stamp: 'MYB 6/12/2022 14:09:53'!
registerWithTotal: aTotal items: aBagOfItems client: aClientId 
	
	total := aTotal.
	items := aBagOfItems.
	client := aClientId! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: 'TusLibros'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'MYB 6/12/2022 14:06:03'!
with: aCart 
	
	^self new initializeWith: aCart ! !


!classDefinition: #StoreTestObjectsFactory category: 'TusLibros'!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'MYB 6/12/2022 15:29:27'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog withOwner: self defaultClientId! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'MYB 6/12/2022 15:29:41'!
defaultClientId
	
	^1! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'merchant processor' stamp: 'id 6/12/2022 19:15:11'!
createMerchantProcessorWith: aBlock

	^MerchantProcessorSimulator with: aBlock.! !

!StoreTestObjectsFactory methodsFor: 'merchant processor' stamp: 'id 6/12/2022 19:26:08'!
defaultMerchantProcessor

	^self createMerchantProcessorWith: [ :anAmount :aCreditCard | ].! !


!classDefinition: #TusLibrosSystemFacade category: 'TusLibros'!
Object subclass: #TusLibrosSystemFacade
	instanceVariableNames: 'catalog carts merchantProcessor salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosSystemFacade methodsFor: 'assertions' stamp: 'id 6/12/2022 17:37:48'!
assertValidCredentialsForAPI: anAPI clientId: aClientId password: aPassword

	(anAPI authenticateWithClientId: aClientId password: aPassword) ifFalse: [ self signalCouldNotAuthenticateWithInvalidCredentials. ].! !


!TusLibrosSystemFacade methodsFor: 'exceptions' stamp: 'id 6/12/2022 20:35:57'!
signalCouldNotAuthenticateWithInvalidCredentials

	self error: self class couldNotAuthenticateWithInvalidCredentials.! !

!TusLibrosSystemFacade methodsFor: 'exceptions' stamp: 'id 6/12/2022 20:35:53'!
signalInvalidCartId

	self error: self class invalidCartId.! !


!TusLibrosSystemFacade methodsFor: 'initialize' stamp: 'id 6/12/2022 19:23:21'!
initializeWithCatalog: aCatalog throught: aMerchantProcessor

	catalog := aCatalog.
	merchantProcessor := aMerchantProcessor.
	carts := Dictionary new.
	salesBook := OrderedCollection new.! !


!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'id 6/12/2022 20:41:24'!
addToCart: aCartId aQuantity: aQuantity ofBook: aBook

	| cart |

	cart := self getCartWithIdIfPresent: aCartId.

	cart add: aQuantity of: aBook.! !

!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'id 6/12/2022 20:43:56'!
checkoutWithCartId: aCartId charging: aCreditCard 
	
	| cart cashier |

	cart := self getCartWithIdIfPresent: aCartId.

	cashier := Cashier
		toCheckout: cart
		charging: aCreditCard
		throught: merchantProcessor 
		on: DateAndTime now
		registeringOn: salesBook.

	cashier checkOut.

	self invalidateCartId: aCartId.! !

!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'MYB 6/12/2022 13:52:53'!
createCartWith: anAPI clientId: aClientId password: aPassword
	
	| cartId cart |
	self assertValidCredentialsForAPI: anAPI clientId: aClientId password: aPassword.
	
	cartId := anAPI generateCartId.
	cart := Cart acceptingItemsOf: catalog withOwner: aClientId.
	
	carts add: cartId->cart.
	
	^ cartId
	! !

!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'id 6/12/2022 20:41:24'!
listCartWithId: aCartId 
	
	^self getCartWithIdIfPresent: aCartId.! !

!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'MYB 6/12/2022 14:48:08'!
listPurchasesWith: anAPI clientId: aClientId password: aPassword 
	
	self assertValidCredentialsForAPI: anAPI clientId: aClientId password: aPassword.
	
	^salesBook select: [ :sale | sale client = aClientId ]
	! !


!TusLibrosSystemFacade methodsFor: 'operations - private' stamp: 'id 6/12/2022 20:41:24'!
getCartWithIdIfPresent: aCartId

	^ carts at: aCartId ifAbsent: [ self signalInvalidCartId. ]! !

!TusLibrosSystemFacade methodsFor: 'operations - private' stamp: 'id 6/12/2022 20:36:44'!
invalidateCartId: aCartId

	^ carts removeKey: aCartId! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosSystemFacade class' category: 'TusLibros'!
TusLibrosSystemFacade class
	instanceVariableNames: ''!

!TusLibrosSystemFacade class methodsFor: 'error descriptions' stamp: 'MYB 6/9/2022 21:30:04'!
couldNotAuthenticateWithInvalidCredentials

	^'Could not authenticate with invalid credentials'! !

!TusLibrosSystemFacade class methodsFor: 'error descriptions' stamp: 'id 6/12/2022 20:30:30'!
invalidCartId

	^'Invalid cart id'.! !


!TusLibrosSystemFacade class methodsFor: 'instance creation' stamp: 'MYB 6/12/2022 12:45:51'!
withCatalog: aCatalog throught: aMerchantProcessor

	^self new initializeWithCatalog: aCatalog throught: aMerchantProcessor! !
