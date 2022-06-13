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

!CartTest methodsFor: 'tests' stamp: 'id 6/12/2022 21:02:27'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cart invalidItemErrorMessage.
			self assert: cart isEmpty ].! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'id 6/12/2022 21:03:52'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ].! !

!CartTest methodsFor: 'tests' stamp: 'id 6/12/2022 21:04:02'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cart invalidItemErrorMessage.
			self assert: cart isEmpty ].! !

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


!CashierTest methodsFor: 'tests' stamp: 'id 6/12/2022 22:25:35'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: testObjectsFactory defaultMerchantProcessor
			on: testObjectsFactory today
			with: testObjectsFactory defaultTransactionIdGenerator
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'id 6/12/2022 23:01:26'!
test02CalculatedTotalIsCorrect

	| cart cashier sale |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: testObjectsFactory defaultMerchantProcessor
		on: testObjectsFactory today
		with: testObjectsFactory defaultTransactionIdGenerator
		registeringOn: OrderedCollection new.
		
	sale := cashier checkOut.
	
	self assert: (testObjectsFactory itemSellByTheStorePrice * 2) equals: sale total.! !

!CashierTest methodsFor: 'tests' stamp: 'id 6/12/2022 22:25:53'!
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
				with: testObjectsFactory defaultTransactionIdGenerator
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'id 6/12/2022 23:07:44'!
test04CheckoutRegistersASale

	| cart cashier salesBook sale |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: testObjectsFactory defaultMerchantProcessor
		on: testObjectsFactory today
		with: testObjectsFactory defaultTransactionIdGenerator
		registeringOn: salesBook.
		
	sale := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = sale total.! !

!CashierTest methodsFor: 'tests' stamp: 'id 6/12/2022 23:09:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook creditCard debitedAmout debitedCreditCard  merchantProcessor sale |

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
		with: testObjectsFactory defaultTransactionIdGenerator
		registeringOn: salesBook.

	sale := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = sale total.! !

!CashierTest methodsFor: 'tests' stamp: 'id 6/12/2022 22:26:19'!
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
		with: testObjectsFactory defaultTransactionIdGenerator
		registeringOn: salesBook.

	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!classDefinition: #TusLibrosSystemFacadeTest category: 'TusLibros'!
TestCase subclass: #TusLibrosSystemFacadeTest
	instanceVariableNames: 'testObjectsFactory authenticateBehaviour cartIdGeneratorBehaviour validClientId validPassword cartId invalidClientId invalidPassword validClientId2 validPassword2 clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosSystemFacadeTest methodsFor: 'auxiliary' stamp: 'MYB 6/12/2022 12:00:48'!
createCartWithSystemFacade: systemFacade

	^ systemFacade createCartWith: self clientId: validClientId password: validPassword! !

!TusLibrosSystemFacadeTest methodsFor: 'auxiliary' stamp: 'id 6/13/2022 00:46:48'!
createSystemFacade

	^self createSystemFacadeWithTransactionIdGenerator: testObjectsFactory defaultTransactionIdGenerator.! !

!TusLibrosSystemFacadeTest methodsFor: 'auxiliary' stamp: 'id 6/13/2022 01:04:47'!
createSystemFacadeWithTransactionIdGenerator: aTransactionIdGenerator

	^TusLibrosSystemFacade
		withCatalog: testObjectsFactory defaultCatalog
		throught: testObjectsFactory defaultMerchantProcessor
		withTransactionIdGenerator: aTransactionIdGenerator
		withClock: clock.! !

!TusLibrosSystemFacadeTest methodsFor: 'auxiliary' stamp: 'id 6/13/2022 01:04:47'!
forwardTime: aDuration 

	clock forwardTime: aDuration.! !


!TusLibrosSystemFacadeTest methodsFor: 'setup' stamp: 'id 6/13/2022 01:04:47'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	clock := Clock with: DateAndTime now.
	validClientId := #validClientId.
	validPassword := #validPassword.
	validClientId2 := #validClientId2.
	validPassword2 := #validPassword2.
	invalidClientId := nil.
	invalidPassword := nil.
	authenticateBehaviour := [ :aClientId :aPassword |
		(aClientId = validClientId and: aPassword = validPassword) or: [
			(aClientId = validClientId2 and: aPassword = validPassword2)
		]
	].
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


!TusLibrosSystemFacadeTest methodsFor: 'tests - add to cart' stamp: 'id 6/12/2022 21:04:21'!
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
			self assert: Cart invalidItemErrorMessage equals: anError messageText.
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

!TusLibrosSystemFacadeTest methodsFor: 'tests - add to cart' stamp: 'id 6/12/2022 21:04:28'!
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
			self assert: Cart invalidQuantityErrorMessage equals: anError messageText.
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

!TusLibrosSystemFacadeTest methodsFor: 'tests - add to cart' stamp: 'id 6/13/2022 00:39:16'!
test20CannotAddBookToExpiredCart

	| systemFacade book cart newCartId |

	systemFacade := self createSystemFacade.
	newCartId := self createCartWithSystemFacade: systemFacade.
	cart := systemFacade listCartWithId: newCartId.
	book := testObjectsFactory itemSellByTheStore.

	self forwardTime: (Duration minutes: 31).

	self
		should: [ systemFacade addToCart: newCartId aQuantity: 1 ofBook: book. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TusLibrosSystemFacade cannotOperateOnExpiredCart equals: anError messageText.
			self assert: cart isEmpty.
		].! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - add to cart' stamp: 'id 6/13/2022 01:28:55'!
test23AddingBooksDelaysExpirationOfCart

	| systemFacade book cart newCartId |

	systemFacade := self createSystemFacade.
	newCartId := self createCartWithSystemFacade: systemFacade.
	book := testObjectsFactory itemSellByTheStore.

	self forwardTime: (Duration minutes: 25).
	
	systemFacade addToCart: newCartId aQuantity: 1 ofBook: book.

	self forwardTime: (Duration minutes: 10).
	
	systemFacade addToCart: newCartId aQuantity: 1 ofBook: book.
	cart := systemFacade listCartWithId: newCartId.

	self assert: 2 equals: (cart occurrencesOf: book).! !


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

!TusLibrosSystemFacadeTest methodsFor: 'tests - checkout' stamp: 'id 6/12/2022 21:12:39'!
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

!TusLibrosSystemFacadeTest methodsFor: 'tests - checkout' stamp: 'id 6/12/2022 23:11:15'!
test10CheckoutCartShouldReturnTransactionId

	| systemFacade newCartId transactionId transactionIdGenerator expectedTransactionId |

	expectedTransactionId := 42.
	transactionIdGenerator := TransactionIdGeneratorSimulator with: [ expectedTransactionId. ].
	systemFacade := self createSystemFacadeWithTransactionIdGenerator: transactionIdGenerator.

	newCartId := self createCartWithSystemFacade: systemFacade.
	systemFacade addToCart: newCartId aQuantity: 3 ofBook: testObjectsFactory itemSellByTheStore.

	transactionId := systemFacade checkoutWithCartId: newCartId charging: testObjectsFactory notExpiredCreditCard.

	self assert: expectedTransactionId equals: transactionId.
	self deny: (systemFacade listPurchasesWith: self clientId: validClientId password: validPassword) isEmpty.! !

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

!TusLibrosSystemFacadeTest methodsFor: 'tests - checkout' stamp: 'id 6/13/2022 01:25:19'!
test22CannotCheckoutAnExpiredCart

	| systemFacade book newCartId |

	systemFacade := self createSystemFacade.
	newCartId := self createCartWithSystemFacade: systemFacade.
	book := testObjectsFactory itemSellByTheStore.
	systemFacade addToCart: newCartId aQuantity: 1 ofBook: book.

	self forwardTime: (Duration minutes: 31).

	self
		should: [ systemFacade checkoutWithCartId: newCartId charging: testObjectsFactory notExpiredCreditCard. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TusLibrosSystemFacade cannotOperateOnExpiredCart equals: anError messageText.
		].! !


!TusLibrosSystemFacadeTest methodsFor: 'tests - create cart' stamp: 'id 6/12/2022 23:21:54'!
test01CreateCartWithInvalidCredentialsShouldRaiseError

	| systemFacade |
	
	systemFacade := self createSystemFacade.
		
	self 
		should: [ systemFacade createCartWith: self clientId: invalidClientId password: invalidPassword. ]
		raise: Error - MessageNotUnderstood 
		withMessageText: TusLibrosSystemFacade couldNotAuthenticateWithInvalidCredentials.! !

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


!TusLibrosSystemFacadeTest methodsFor: 'tests - list cart' stamp: 'id 6/12/2022 20:39:27'!
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

!TusLibrosSystemFacadeTest methodsFor: 'tests - list cart' stamp: 'id 6/12/2022 20:59:23'!
test17ListCartReturnsCartsBooksWithQuantity

	| systemFacade book1 book2 newCartId expectedResult |

	systemFacade := self createSystemFacade.
	newCartId := self createCartWithSystemFacade: systemFacade.
	book1 := testObjectsFactory itemSellByTheStore.
	book2 := testObjectsFactory itemSellByTheStore.
	systemFacade addToCart: newCartId aQuantity: 1 ofBook: book1.
	systemFacade addToCart: newCartId aQuantity: 2 ofBook: book2.

	expectedResult := Bag new.
	expectedResult add: book1 withOccurrences: 1.
	expectedResult add: book2 withOccurrences: 2.

	self
		assert: expectedResult
		equals: (systemFacade listCartWithId: newCartId).! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - list cart' stamp: 'id 6/13/2022 01:21:54'!
test21CannotListContentsOfAnExpiredCart

	| systemFacade newCartId |

	systemFacade := self createSystemFacade.
	newCartId := self createCartWithSystemFacade: systemFacade.
	
	self forwardTime: (Duration minutes: 31).

	self
		should: [ systemFacade listCartWithId: newCartId. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TusLibrosSystemFacade cannotOperateOnExpiredCart equals: anError messageText.
		].! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - list cart' stamp: 'id 6/13/2022 02:14:13'!
test24ListingCartDelaysItsExpiration

	| systemFacade newCartId firstListing secondListing |

	systemFacade := self createSystemFacade.
	newCartId := self createCartWithSystemFacade: systemFacade.

	self forwardTime: (Duration minutes: 25).
	
	firstListing := systemFacade listCartWithId: newCartId.

	self forwardTime: (Duration minutes: 10).
	
	secondListing := systemFacade listCartWithId: newCartId.

	self assert: firstListing = secondListing.! !


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

!TusLibrosSystemFacadeTest methodsFor: 'tests - list purchases' stamp: 'id 6/12/2022 23:22:16'!
test18ListPurchasesWithInvalidCredentialsShouldRaiseError

	| systemFacade |
	
	systemFacade := self createSystemFacade.

	self 
		should: [ systemFacade listPurchasesWith: self clientId: invalidClientId password: invalidPassword. ]
		raise: Error - MessageNotUnderstood 
		withMessageText: TusLibrosSystemFacade couldNotAuthenticateWithInvalidCredentials.! !

!TusLibrosSystemFacadeTest methodsFor: 'tests - list purchases' stamp: 'id 6/12/2022 23:30:21'!
test19ListPurchasesOfClientShouldReturnItsPurchasesWhenThereHaveBeenMultiplePurchases

	| systemFacade newCartId1 newCartId2 sales1 sales2 |
	
	systemFacade := self createSystemFacade.
	newCartId1 := self createCartWithSystemFacade: systemFacade.
	systemFacade addToCart: newCartId1 aQuantity: 3 ofBook: testObjectsFactory itemSellByTheStore.
	systemFacade checkoutWithCartId: newCartId1 charging: testObjectsFactory notExpiredCreditCard.
	sales1 := (systemFacade listPurchasesWith: self clientId: validClientId password: validPassword).

	newCartId2 := self createCartWithSystemFacade: systemFacade.
	systemFacade addToCart: newCartId2 aQuantity: 1 ofBook: testObjectsFactory itemSellByTheStore.
	systemFacade checkoutWithCartId: newCartId2 charging: testObjectsFactory notExpiredCreditCard.
	sales2 := (systemFacade listPurchasesWith: self clientId: validClientId2 password: validPassword2).

	self deny: sales1 = sales2.! !


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


!Cart methodsFor: 'assertions' stamp: 'id 6/12/2022 21:03:12'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self class invalidItemErrorMessage. ].! !

!Cart methodsFor: 'assertions' stamp: 'id 6/12/2022 21:03:36'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self class invalidQuantityErrorMessage. ].! !


!Cart methodsFor: 'initialization' stamp: 'MYB 6/12/2022 15:33:58'!
initializeAcceptingItemsOf: aCatalog withOwner: aClientId 
	
	catalog := aCatalog.
	items := Bag new.
	owner := aClientId
	! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !

!Cart methodsFor: 'queries' stamp: 'id 6/12/2022 23:09:42'!
registerSale: aSale 

	aSale
		registerWithTotal: self total
		items: self items
		client: self owner.! !


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

!Cart class methodsFor: 'error messages' stamp: 'id 6/12/2022 21:02:08'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart class methodsFor: 'error messages' stamp: 'id 6/12/2022 21:03:26'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart class methodsFor: 'instance creation' stamp: 'MYB 6/12/2022 13:53:59'!
acceptingItemsOf: aCatalog withOwner: aSymbol 
	
	^self new initializeAcceptingItemsOf: aCatalog withOwner: aSymbol ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total transactionIdGenerator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout' stamp: 'id 6/12/2022 23:00:22'!
checkOut

	| sale |

	self calculateTotal.
	self debitTotal.
	sale := self registerSale.

	^sale.! !


!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'id 6/13/2022 02:46:17'!
registerSale

	| sale |
	sale := Sale with: cart andIdGenerator: transactionIdGenerator.

	salesBook add: sale.
	
	^sale.! !


!Cashier methodsFor: 'initialization' stamp: 'id 6/12/2022 22:16:27'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor with: aTransactionIdGenerator registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	transactionIdGenerator := aTransactionIdGenerator.
	salesBook := aSalesBook.! !

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


!Cashier class methodsFor: 'instance creation' stamp: 'id 6/12/2022 22:17:40'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate with: aTransactionIdGenerator registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new
		initializeToCheckout: aCart
		charging: aCreditCard
		throught: aMerchantProcessor
		with: aTransactionIdGenerator
		registeringOn: aSalesBook.! !


!classDefinition: #Clock category: 'TusLibros'!
Object subclass: #Clock
	instanceVariableNames: 'currentTime'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Clock methodsFor: 'accessing' stamp: 'id 6/13/2022 00:59:31'!
now

	^currentTime.! !


!Clock methodsFor: 'initialization' stamp: 'id 6/13/2022 01:01:18'!
initializeWith: aTime

	currentTime := aTime.! !


!Clock methodsFor: 'operations' stamp: 'id 6/13/2022 00:59:50'!
forwardTime: aDuration

	currentTime := currentTime + aDuration.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Clock class' category: 'TusLibros'!
Clock class
	instanceVariableNames: ''!

!Clock class methodsFor: 'instance creation' stamp: 'id 6/13/2022 01:01:50'!
with: aTime

	^self new initializeWith: aTime.! !


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
	instanceVariableNames: 'total items client transactionId'
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

!Sale methodsFor: 'accesing' stamp: 'id 6/12/2022 23:11:27'!
transactionId
	
	^transactionId.! !


!Sale methodsFor: 'initialization' stamp: 'id 6/13/2022 02:46:32'!
initializeWith: aCart andIdGenerator: aTransactionIdGenerator 

	transactionId := aTransactionIdGenerator generateId.
	aCart registerSale: self.! !

!Sale methodsFor: 'initialization' stamp: 'MYB 6/12/2022 14:09:53'!
registerWithTotal: aTotal items: aBagOfItems client: aClientId 
	
	total := aTotal.
	items := aBagOfItems.
	client := aClientId! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: 'TusLibros'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'id 6/13/2022 02:45:40'!
with: aCart andIdGenerator: aTransactionIdGenerator 
	
	^self new initializeWith: aCart andIdGenerator: aTransactionIdGenerator.! !


!classDefinition: #Simulator category: 'TusLibros'!
Object subclass: #Simulator
	instanceVariableNames: 'behaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Simulator methodsFor: 'initialization' stamp: 'id 6/12/2022 23:14:53'!
initializeWith: aBlock

	behaviour := aBlock.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Simulator class' category: 'TusLibros'!
Simulator class
	instanceVariableNames: ''!

!Simulator class methodsFor: 'instance creation' stamp: 'id 6/12/2022 23:13:58'!
with: aBlock

	^self new initializeWith: aBlock.! !


!classDefinition: #MerchantProcessorSimulator category: 'TusLibros'!
Simulator subclass: #MerchantProcessorSimulator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorSimulator methodsFor: 'operations' stamp: 'id 6/12/2022 19:13:10'!
debit: anAmount from: aCreditCard

	^behaviour value: anAmount value: aCreditCard.! !


!classDefinition: #TransactionIdGeneratorSimulator category: 'TusLibros'!
Simulator subclass: #TransactionIdGeneratorSimulator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TransactionIdGeneratorSimulator methodsFor: 'operations' stamp: 'id 6/12/2022 22:19:18'!
generateId

	^behaviour value.! !


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

!StoreTestObjectsFactory methodsFor: 'merchant processor' stamp: 'id 6/12/2022 23:32:02'!
defaultMerchantProcessor

	^self createMerchantProcessorWith: [ :anAmount :aCreditCard |
		anAmount.
		aCreditCard.
	].! !


!StoreTestObjectsFactory methodsFor: 'transactionId generator' stamp: 'id 6/12/2022 22:20:21'!
createTransactionIdGeneratorWith: aBlock

	^TransactionIdGeneratorSimulator with: aBlock.! !

!StoreTestObjectsFactory methodsFor: 'transactionId generator' stamp: 'id 6/12/2022 22:33:45'!
defaultTransactionIdGenerator

	^self createTransactionIdGeneratorWith: [ nil ].! !


!classDefinition: #TusLibrosSystemFacade category: 'TusLibros'!
Object subclass: #TusLibrosSystemFacade
	instanceVariableNames: 'catalog carts merchantProcessor salesBook transactionIdGenerator expirationTimeByCartId clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosSystemFacade methodsFor: 'assertions' stamp: 'id 6/13/2022 02:22:39'!
assertCartIdIsNotExpired: aCartId
	
	| expirationTimeOfCartId |
	
	expirationTimeOfCartId := expirationTimeByCartId at: aCartId ifAbsent: [ self signalInvalidCartId. ].
	
	(self isCartIdExpired: expirationTimeOfCartId on: clock now) ifTrue: [ self signalCannotOperateOnExpiredCart. ].! !

!TusLibrosSystemFacade methodsFor: 'assertions' stamp: 'id 6/12/2022 17:37:48'!
assertValidCredentialsForAPI: anAPI clientId: aClientId password: aPassword

	(anAPI authenticateWithClientId: aClientId password: aPassword) ifFalse: [ self signalCouldNotAuthenticateWithInvalidCredentials. ].! !

!TusLibrosSystemFacade methodsFor: 'assertions' stamp: 'id 6/13/2022 02:05:57'!
isCartIdExpired: expirationTimeOfCartId on: aTime 

	^expirationTimeOfCartId < aTime.! !

!TusLibrosSystemFacade methodsFor: 'assertions' stamp: 'id 6/13/2022 02:07:06'!
signalCannotOperateOnExpiredCart

	self error: self class cannotOperateOnExpiredCart.! !


!TusLibrosSystemFacade methodsFor: 'exceptions' stamp: 'id 6/12/2022 20:35:57'!
signalCouldNotAuthenticateWithInvalidCredentials

	self error: self class couldNotAuthenticateWithInvalidCredentials.! !

!TusLibrosSystemFacade methodsFor: 'exceptions' stamp: 'id 6/12/2022 20:35:53'!
signalInvalidCartId

	self error: self class invalidCartId.! !


!TusLibrosSystemFacade methodsFor: 'initialize' stamp: 'id 6/13/2022 02:07:36'!
initializeWithCatalog: aCatalog throught: aMerchantProcessor withTransactionIdGenerator: aTransactionIdGenerator withClock: aClock  

	catalog := aCatalog.
	merchantProcessor := aMerchantProcessor.
	transactionIdGenerator := aTransactionIdGenerator.
	clock := aClock.
	carts := Dictionary new.
	expirationTimeByCartId := Dictionary new.
	salesBook := OrderedCollection new.! !


!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'id 6/13/2022 02:08:19'!
addToCart: aCartId aQuantity: aQuantity ofBook: aBook

	| cart |

	cart := self getCartWithIdIfPresent: aCartId.
	self assertCartIdIsNotExpired: aCartId.

	cart add: aQuantity of: aBook.
	
	self updateExpirationOf: aCartId.! !

!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'id 6/13/2022 01:25:44'!
checkoutWithCartId: aCartId charging: aCreditCard 
	
	| cart cashier sale |

	self assertCartIdIsNotExpired: aCartId.

	cart := self getCartWithIdIfPresent: aCartId.

	cashier := Cashier
		toCheckout: cart
		charging: aCreditCard
		throught: merchantProcessor 
		on: DateAndTime now
		with: transactionIdGenerator
		registeringOn: salesBook.

	sale := cashier checkOut.

	self invalidateCartId: aCartId.
	
	^sale transactionId.! !

!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'id 6/13/2022 02:11:58'!
createCartWith: anAPI clientId: aClientId password: aPassword
	
	| cartId cart |
	self assertValidCredentialsForAPI: anAPI clientId: aClientId password: aPassword.
	
	cartId := anAPI generateCartId.
	cart := Cart acceptingItemsOf: catalog withOwner: aClientId.
	
	carts add: cartId->cart.
	self updateExpirationOf: cartId.

	^cartId.! !

!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'id 6/13/2022 02:14:52'!
listCartWithId: aCartId 
	
	| items |

	self assertCartIdIsNotExpired: aCartId.

	items := (self getCartWithIdIfPresent: aCartId) items.
	
	self updateExpirationOf: aCartId.
	
	^items.! !

!TusLibrosSystemFacade methodsFor: 'operations' stamp: 'MYB 6/12/2022 14:48:08'!
listPurchasesWith: anAPI clientId: aClientId password: aPassword 
	
	self assertValidCredentialsForAPI: anAPI clientId: aClientId password: aPassword.
	
	^salesBook select: [ :sale | sale client = aClientId ]
	! !


!TusLibrosSystemFacade methodsFor: 'operations - private' stamp: 'id 6/13/2022 01:17:28'!
computeExpirationTime

	^clock now + self class lifespanOfCartId.! !

!TusLibrosSystemFacade methodsFor: 'operations - private' stamp: 'id 6/12/2022 20:41:24'!
getCartWithIdIfPresent: aCartId

	^ carts at: aCartId ifAbsent: [ self signalInvalidCartId. ]! !

!TusLibrosSystemFacade methodsFor: 'operations - private' stamp: 'id 6/13/2022 02:20:53'!
invalidateCartId: aCartId

	carts removeKey: aCartId.
	expirationTimeByCartId removeKey: aCartId.! !

!TusLibrosSystemFacade methodsFor: 'operations - private' stamp: 'id 6/13/2022 02:09:45'!
updateExpirationOf: aCartId

	expirationTimeByCartId
		at: aCartId
		put: self computeExpirationTime.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosSystemFacade class' category: 'TusLibros'!
TusLibrosSystemFacade class
	instanceVariableNames: ''!

!TusLibrosSystemFacade class methodsFor: 'error descriptions' stamp: 'id 6/13/2022 00:41:59'!
cannotOperateOnExpiredCart

	^'Cannot operate on expired cart.'.! !

!TusLibrosSystemFacade class methodsFor: 'error descriptions' stamp: 'MYB 6/9/2022 21:30:04'!
couldNotAuthenticateWithInvalidCredentials

	^'Could not authenticate with invalid credentials'! !

!TusLibrosSystemFacade class methodsFor: 'error descriptions' stamp: 'id 6/12/2022 20:30:30'!
invalidCartId

	^'Invalid cart id'.! !


!TusLibrosSystemFacade class methodsFor: 'id expiration' stamp: 'id 6/13/2022 01:15:39'!
lifespanOfCartId

	^Duration minutes: 30.! !


!TusLibrosSystemFacade class methodsFor: 'instance creation' stamp: 'id 6/13/2022 00:45:33'!
withCatalog: aCatalog throught: aMerchantProcessor withTransactionIdGenerator: aTransactionIdGenerator withClock: aClock  

	^self new
		initializeWithCatalog: aCatalog
		throught: aMerchantProcessor
		withTransactionIdGenerator: aTransactionIdGenerator
		withClock: aClock.! !
