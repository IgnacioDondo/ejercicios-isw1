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
	instanceVariableNames: 'testObjectsFactory debitBehavior clientId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!CashierTest methodsFor: 'setup' stamp: 'MYB 6/12/2022 13:35:22'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ].
	clientId := 1.! !


!CashierTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 13:57:22'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 14:49:13'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 13:57:34'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 14:49:48'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 14:49:23'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 13:59:55'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
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

!TusLibrosSystemFacadeTest methodsFor: 'auxiliary' stamp: 'MYB 6/12/2022 14:47:25'!
createSystemFacade

	| merchantProcessorSimulator |
	merchantProcessorSimulator := CashierTest new.
	merchantProcessorSimulator setUp.
	^ TusLibrosSystemFacade withCatalog: testObjectsFactory defaultCatalog throught: merchantProcessorSimulator! !


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


!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 12:57:16'!
test01CreateCartWithInvalidCredentialsShouldRaiseError

	| systemFacade |
	
	systemFacade := self createSystemFacade.
		
	self 
		should: [ systemFacade createCartWith: self clientId: nil password: nil]
		raise: Error - MessageNotUnderstood 
		withMessageText: TusLibrosSystemFacade couldNotAuthenticateWithInvalidCredentials 
	
	
	! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 12:57:33'!
test02CreateCartWithValidCredentialsShouldReturnCartId

	| newCartId systemFacade |
	
	systemFacade := self createSystemFacade.
	
	newCartId := self createCartWithSystemFacade: systemFacade.
	
	self assert: cartId equals: newCartId
	
	
	! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 12:57:37'!
test03CreatingTwoCartsShouldReturnDifferentsCartIds

	| systemFacade newCartId1 newCartId2 |
	
	systemFacade := self createSystemFacade.
	
	newCartId1 := self createCartWithSystemFacade: systemFacade.
	newCartId2 := self createCartWithSystemFacade: systemFacade.
	
	self deny: newCartId1 = newCartId2.
	
	
	! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 12:57:41'!
test04CreateCartShouldReturnCartIdForAnEmptyCart

	| newCartId cart systemFacade |
	
	systemFacade := self createSystemFacade.
	
	newCartId := self createCartWithSystemFacade: systemFacade.
	
	cart := systemFacade listCartWithId: newCartId.
	
	self assert: cart isEmpty
	
	
	! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 12:57:46'!
test05ListingTwoDifferentCartsShouldReturnDifferentCarts

	| systemFacade cart1 cart2 newCartId1 newCartId2 |
	
	systemFacade := self createSystemFacade.
	
	newCartId1 := self createCartWithSystemFacade: systemFacade.
	newCartId2 := self createCartWithSystemFacade: systemFacade.
	
	cart1 := systemFacade listCartWithId: newCartId1.
	cart2 := systemFacade listCartWithId: newCartId2.
	
	self deny: cart1 = cart2
	
	
	! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 12:57:50'!
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
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty
		]
	
	
	! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'id 6/12/2022 17:58:47'!
test07AddingBooksToCartShouldAddBooksToCart

	| systemFacade book cart newCartId quantity |

	systemFacade := self createSystemFacade.

	newCartId := self createCartWithSystemFacade: systemFacade.
	cart := systemFacade listCartWithId: newCartId.
	book := testObjectsFactory itemSellByTheStore.
	quantity := 3.

	systemFacade addToCart: newCartId aQuantity: quantity ofBook: book.

	self assert: quantity equals: (cart occurrencesOf: book).! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 12:57:58'!
test08CheckoutEmptyCartShouldRaiseError

	| systemFacade newCartId |
	
	systemFacade := self createSystemFacade.
	
	newCartId := self createCartWithSystemFacade: systemFacade.

	self 
		should: [systemFacade checkoutWithCartId: newCartId charging: testObjectsFactory notExpiredCreditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
		]
	
	
	! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 12:58:02'!
test09CheckoutWithInvalidCardShouldRaiseError

	| systemFacade newCartId |
	
	systemFacade := self createSystemFacade.
	
	newCartId := self createCartWithSystemFacade: systemFacade.
	systemFacade addToCart: newCartId aQuantity: 3 ofBook: testObjectsFactory itemSellByTheStore.

	self 
		should: [systemFacade checkoutWithCartId: newCartId charging: testObjectsFactory expiredCreditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
		]
	
	
	! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 14:41:58'!
test10CheckoutCartShouldReturnTransactionId

	| systemFacade newCartId transactionId |
	
	systemFacade := self createSystemFacade.
	
	newCartId := self createCartWithSystemFacade: systemFacade.
	systemFacade addToCart: newCartId aQuantity: 3 ofBook: testObjectsFactory itemSellByTheStore.

	transactionId := systemFacade checkoutWithCartId: newCartId charging: testObjectsFactory notExpiredCreditCard.
	
	self deny: transactionId isNil.
	self deny: (systemFacade listPurchasesWith: self clientId: validClientId password: validPassword) isEmpty ! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 14:31:26'!
test11ListPurchasesOfClientWithoutPurchasesShouldReturnEmptyCollection

	| systemFacade |
	
	systemFacade := self createSystemFacade.
	
	self assert: OrderedCollection new equals: (systemFacade listPurchasesWith: self clientId: validClientId password: validPassword).! !

!TusLibrosSystemFacadeTest methodsFor: 'tests' stamp: 'MYB 6/12/2022 15:36:25'!
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

!Cashier methodsFor: 'checkout - private' stamp: 'MYB 6/12/2022 14:47:46'!
registerSale

	"salesBook add: self createSale."
	
	| sale |
	sale := Sale with: cart.

	salesBook add: sale. ! !


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


!Cashier class methodsFor: 'instance creation' stamp: 'MYB 6/12/2022 13:31:21'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


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



!classDefinition: #TusLibrosSystemFacade category: 'TusLibros'!
Object subclass: #TusLibrosSystemFacade
	instanceVariableNames: 'catalog carts merchantProcessor salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosSystemFacade methodsFor: 'assertions' stamp: 'id 6/12/2022 17:37:48'!
assertValidCredentialsForAPI: anAPI clientId: aClientId password: aPassword

	(anAPI authenticateWithClientId: aClientId password: aPassword) ifFalse: [ self signalCouldNotAuthenticateWithInvalidCredentials. ].! !


!TusLibrosSystemFacade methodsFor: 'exceptions' stamp: 'id 6/12/2022 17:37:32'!
signalCouldNotAuthenticateWithInvalidCredentials

	^ self error: self class couldNotAuthenticateWithInvalidCredentials! !


!TusLibrosSystemFacade methodsFor: 'initialize' stamp: 'MYB 6/12/2022 12:44:45'!
initializeWithCatalog: aCatalog throught: aMerchantProcessor

	catalog := aCatalog.
	carts := Dictionary new.
	salesBook := OrderedCollection new.
	merchantProcessor := aMerchantProcessor.! !


!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'id 6/12/2022 17:57:52'!
addToCart: aCartId aQuantity: aQuantity ofBook: aBook
	
	(carts at: aCartId) add: aQuantity of: aBook.! !

!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'MYB 6/12/2022 14:45:41'!
checkoutWithCartId: aCartId charging: aCreditCard 
	
	| cashier |
	cashier := Cashier
		toCheckout: (carts at: aCartId)
		charging: aCreditCard
		throught: merchantProcessor 
		on: DateAndTime now
		registeringOn: salesBook.
		
	cashier checkOut 
	! !

!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'MYB 6/12/2022 13:52:53'!
createCartWith: anAPI clientId: aClientId password: aPassword
	
	| cartId cart |
	self assertValidCredentialsForAPI: anAPI clientId: aClientId password: aPassword.
	
	cartId := anAPI generateCartId.
	cart := Cart acceptingItemsOf: catalog withOwner: aClientId.
	
	carts add: cartId->cart.
	
	^ cartId
	! !

!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'MYB 6/12/2022 11:32:31'!
listCartWithId: aCartId 
	
	^carts at: aCartId! !

!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'MYB 6/12/2022 14:48:08'!
listPurchasesWith: anAPI clientId: aClientId password: aPassword 
	
	self assertValidCredentialsForAPI: anAPI clientId: aClientId password: aPassword.
	
	^salesBook select: [ :sale | sale client = aClientId ]
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosSystemFacade class' category: 'TusLibros'!
TusLibrosSystemFacade class
	instanceVariableNames: ''!

!TusLibrosSystemFacade class methodsFor: 'instance creation' stamp: 'MYB 6/12/2022 12:45:51'!
withCatalog: aCatalog throught: aMerchantProcessor

	^self new initializeWithCatalog: aCatalog throught: aMerchantProcessor! !


!TusLibrosSystemFacade class methodsFor: 'error descriptions' stamp: 'MYB 6/9/2022 21:30:04'!
couldNotAuthenticateWithInvalidCredentials

	^'Could not authenticate with invalid credentials'! !
