!classDefinition: #TusLibrosClientTestWindow category: 'TusLibrosREST'!
SystemWindow subclass: #TusLibrosClientTestWindow
	instanceVariableNames: 'cartIdsListMorph booksCatalogListMorph cartContentListMorph addToCartButtonMorph listCartButtonMorph selectedCartLabelMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosREST'!

!TusLibrosClientTestWindow methodsFor: 'events' stamp: 'NR 6/13/2022 07:06:24'!
informBook: bookIsbn addedToCart: cartId

	self inform: bookIsbn,' added to CartId: ', cartId asString
	
! !

!TusLibrosClientTestWindow methodsFor: 'events' stamp: 'NR 6/13/2022 07:06:29'!
refreshCartButtonsLabels: anIndex

	self refreshButton: listCartButtonMorph withLabel: 'List CartId: '  onIndex: anIndex.
	self refreshButton: addToCartButtonMorph withLabel: 'Add to CartId: '  onIndex: anIndex.
	
	
	! !

!TusLibrosClientTestWindow methodsFor: 'events' stamp: 'NR 6/13/2022 07:06:35'!
refreshCurrentSelectedCartContent: cartId

	cartContentListMorph updateList.
	selectedCartLabelMorph contents: 'Books in CartId: ', cartId
	
	
	! !

!TusLibrosClientTestWindow methodsFor: 'events' stamp: 'NR 6/13/2022 07:06:39'!
refreshListOfCartIds

	cartIdsListMorph updateList
	! !


!TusLibrosClientTestWindow methodsFor: 'private' stamp: 'NR 6/13/2022 07:06:48'!
refreshButton: aButton withLabel: aLabel onIndex: anIndex

	| newLabel |

	newLabel := aLabel.
	(anIndex ~= 0) ifTrue: [newLabel := newLabel,  (self model cartIds at: anIndex) asString].
	aButton label: newLabel.
	aButton morphHeight: self heightOfButtons.
	aButton redrawNeeded 
	
	! !


!TusLibrosClientTestWindow methodsFor: 'GUI building' stamp: 'NR 6/13/2022 07:05:51'!
build1stRow

	| createCartButtonMorph firstRowLayoutMorph |
	
	createCartButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #createCart label: 'Create Cart'.	
	addToCartButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #addToCart label: 'Add To Cart'.	
	
	firstRowLayoutMorph := LayoutMorph newRow.
	firstRowLayoutMorph separation: 25;
	axisEdgeWeight: 0.5;
	addMorph: createCartButtonMorph;
	addMorph: self build2ndColumn1stRow;
	addMorph: self build3rdColumn1stRow;
	addMorph:  addToCartButtonMorph.
	
	
	^firstRowLayoutMorph.! !

!TusLibrosClientTestWindow methodsFor: 'GUI building' stamp: 'NR 6/9/2022 08:11:48'!
build2ndColumn1stRow

	| secondColumnLayoutMorphOfFirstRow |
	
	cartIdsListMorph := PluggableListMorph model: self model listGetter: #cartIds indexGetter: #cartIdsIndex indexSetter: #cartIdsIndex:.
	cartIdsListMorph  borderColor: Color lightBlue; borderWidth: 1; morphWidth:300.
		
	secondColumnLayoutMorphOfFirstRow := LayoutMorph newColumn.
	secondColumnLayoutMorphOfFirstRow separation: 5; 
	axisEdgeWeight: 0.5;
	addMorph: (LabelMorph contents:'Carts Created');
	addMorph: cartIdsListMorph.
	
	secondColumnLayoutMorphOfFirstRow layoutSpec fixedWidth: 390.
	cartIdsListMorph layoutSpec proportionalWidth: 1.
	cartIdsListMorph layoutSpec proportionalHeight: 1.
		
	^secondColumnLayoutMorphOfFirstRow.! !

!TusLibrosClientTestWindow methodsFor: 'GUI building' stamp: 'NR 6/13/2022 07:05:59'!
build2ndColumn2ndRow

	| secondColumnLayoutMorphOfSecondRow |

	cartContentListMorph := PluggableListMorph model: self model listGetter: #cartContent indexGetter: nil indexSetter: nil.
	cartContentListMorph  borderColor: Color lightBlue; borderWidth: 1; morphWidth:300.
	
	selectedCartLabelMorph := LabelMorph contents:'Books in CartId: '.
		
	secondColumnLayoutMorphOfSecondRow := LayoutMorph newColumn.
	secondColumnLayoutMorphOfSecondRow separation: 5; 
	axisEdgeWeight: 0.5;
	addMorph: selectedCartLabelMorph;
	addMorph: cartContentListMorph.
	
	secondColumnLayoutMorphOfSecondRow layoutSpec fixedWidth: 390.
	cartContentListMorph layoutSpec proportionalWidth: 1.
	cartContentListMorph layoutSpec proportionalHeight: 1.
		
	^secondColumnLayoutMorphOfSecondRow.! !

!TusLibrosClientTestWindow methodsFor: 'GUI building' stamp: 'NR 6/13/2022 07:06:04'!
build2ndRow

	| secondRowLayoutMorph |

	listCartButtonMorph := PluggableButtonMorph model: self model stateGetter: nil  action: #listCart label: 'List CartId: '.	
	
	secondRowLayoutMorph := LayoutMorph newRow.
	secondRowLayoutMorph separation: 25;
	axisEdgeWeight: 0.5;
	addMorph: listCartButtonMorph;
	addMorph: self build2ndColumn2ndRow.
	
	^secondRowLayoutMorph

		! !

!TusLibrosClientTestWindow methodsFor: 'GUI building' stamp: 'NR 6/9/2022 08:12:04'!
build3rdColumn1stRow

	| thirdColumnLayoutMorphOfFirstRow |
	
	booksCatalogListMorph := PluggableListMorph model: self model listGetter: #booksCatalog indexGetter: #booksCatalogIndex indexSetter: #booksCatalogIndex:.
	booksCatalogListMorph borderColor: Color lightBlue; borderWidth: 1; morphWidth:300.
		
	thirdColumnLayoutMorphOfFirstRow  := LayoutMorph newColumn.
	thirdColumnLayoutMorphOfFirstRow  separation: 5; 
	axisEdgeWeight: 0.5;
	addMorph: (LabelMorph contents:'Book Catalog');
	addMorph: booksCatalogListMorph.
	
	thirdColumnLayoutMorphOfFirstRow layoutSpec fixedWidth: 390.
		
	^thirdColumnLayoutMorphOfFirstRow.! !

!TusLibrosClientTestWindow methodsFor: 'GUI building' stamp: 'NR 6/9/2022 08:12:08'!
buildMorphicWindow

	self layoutMorph beColumn;
	separation: 15;
	axisEdgeWeight: 0;
	addMorph: self build1stRow;
	addMorph: self build2ndRow.
	! !

!TusLibrosClientTestWindow methodsFor: 'GUI building' stamp: 'NR 6/9/2022 08:12:11'!
defaultExtent

	^ 1035@485
	! !

!TusLibrosClientTestWindow methodsFor: 'GUI building' stamp: 'NR 6/13/2022 07:06:16'!
heightOfButtons

	^ 66! !


!TusLibrosClientTestWindow methodsFor: 'initialization' stamp: 'NR 6/13/2022 07:07:04'!
initializeWith: aTitle

	self setLabel: aTitle.
	self model: (TusLibrosClientTestWindowModel new).
	self morphExtent: (self defaultExtent).
	self buildMorphicWindow.
	self openInWorld.
			
	self model when: #newCartIdArrived send: #refreshListOfCartIds to: self.		
	self model when: #selectedCartChanged send: #refreshCartButtonsLabels: to: self.	
	self model when: #bookAddedToCart send: #informBook:addedToCart: to: self.
	self model when: #newCurrentSelectedCartContentArrived send: #refreshCurrentSelectedCartContent: to: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientTestWindow class' category: 'TusLibrosREST'!
TusLibrosClientTestWindow class
	instanceVariableNames: ''!

!TusLibrosClientTestWindow class methodsFor: 'instance creation' stamp: 'NR 6/9/2022 02:07:29'!
open
	
	^self new initializeWith: 'TusLibros Client Test Window'.! !


!classDefinition: #RealTimeClock category: 'TusLibrosREST'!
Clock subclass: #RealTimeClock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosREST'!

!RealTimeClock methodsFor: 'time' stamp: 'HAW 5/5/2020 17:07:39'!
now

	^DateAndTime now! !

!RealTimeClock methodsFor: 'time' stamp: 'HAW 5/5/2020 17:07:48'!
today

	^Date today! !


!classDefinition: #DefaultMerchantProcessor category: 'TusLibrosREST'!
MerchantProcessor subclass: #DefaultMerchantProcessor
	instanceVariableNames: 'transactionId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosREST'!

!DefaultMerchantProcessor methodsFor: 'debit' stamp: 'HAW 5/5/2020 17:13:16'!
debit: anAmount from: aCreditCard 

	transactionId := transactionId + 1.
	^transactionId! !


!DefaultMerchantProcessor methodsFor: 'initialization' stamp: 'HAW 5/5/2020 17:13:31'!
initialize

	super initialize.
	transactionId := 0! !


!classDefinition: #TusLibrosClientRestInterface category: 'TusLibrosREST'!
Object subclass: #TusLibrosClientRestInterface
	instanceVariableNames: 'port'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosREST'!

!TusLibrosClientRestInterface methodsFor: 'requests' stamp: 'NR 6/13/2022 07:05:17'!
add: quantity of: bookIsbn toCartIdentifiedAs: cartId

	| fieldDict resp |

	fieldDict := Dictionary newFromPairs: {'cartId'. cartId. 'bookIsbn'. bookIsbn. 'bookQuantity'. quantity}.		
		
	resp := WebClient htmlSubmit: (self url,'/addToCart') fields: fieldDict.
		
	resp isSuccess 
		ifTrue:[^(WebUtils jsonDecode: ((resp content) readStream))]
		ifFalse:[^self error: resp content]! !

!TusLibrosClientRestInterface methodsFor: 'requests' stamp: 'NR 6/9/2022 08:11:20'!
createCartFor: aUser password: aPassword

	| fieldDict resp |
	
	fieldDict := Dictionary newFromPairs: {'clientId'. aUser. 'password'. aPassword}.		
	
	resp := WebClient htmlSubmit: (self url,'/createCart') fields: fieldDict.
		
	resp isSuccess 
		ifTrue:[^(WebUtils jsonDecode: ((resp content) readStream))] 
		ifFalse:[^self error: resp content]! !

!TusLibrosClientRestInterface methodsFor: 'requests' stamp: 'NR 6/9/2022 08:11:24'!
listCart: cartId

	| fieldDict resp |
	
	fieldDict := Dictionary newFromPairs: {'cartId'. cartId. }.		
	
	resp := WebClient htmlSubmit: (self url,'/listCart') fields: fieldDict.
		
	resp isSuccess 
		ifTrue:[^(WebUtils jsonDecode: ((resp content) readStream)) asOrderedCollection] 
		ifFalse:[^self error: resp content]! !


!TusLibrosClientRestInterface methodsFor: 'initialization' stamp: 'NR 6/9/2022 08:11:33'!
port

	^port ifNil: [port:=9999].! !

!TusLibrosClientRestInterface methodsFor: 'initialization' stamp: 'NR 6/9/2022 08:11:37'!
url

	^'http://localhost:', self port asString! !


!classDefinition: #TusLibrosClientTestWindowModel category: 'TusLibrosREST'!
Object subclass: #TusLibrosClientTestWindowModel
	instanceVariableNames: 'cartIds selectedCartIdsIndex selectedBookCatalogIndex currentSelectedCartContent restInterface'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosREST'!

!TusLibrosClientTestWindowModel methodsFor: 'accessing' stamp: 'NR 6/13/2022 07:09:38'!
selectedBook

	^self booksCatalog at: selectedBookCatalogIndex! !

!TusLibrosClientTestWindowModel methodsFor: 'accessing' stamp: 'NR 6/13/2022 07:09:42'!
selectedCartId

	^self cartIds at: selectedCartIdsIndex! !


!TusLibrosClientTestWindowModel methodsFor: 'testing' stamp: 'NR 6/13/2022 07:09:49'!
areCartIdAndBookSelected

	^selectedCartIdsIndex  ~= 0 and: [selectedBookCatalogIndex  ~= 0]! !

!TusLibrosClientTestWindowModel methodsFor: 'testing' stamp: 'NR 6/13/2022 07:09:52'!
isCartIdSelected

	^selectedCartIdsIndex ~= 0! !


!TusLibrosClientTestWindowModel methodsFor: 'listSelectors' stamp: 'NR 6/13/2022 07:10:01'!
booksCatalog

	^self defaultCatalog keys! !

!TusLibrosClientTestWindowModel methodsFor: 'listSelectors' stamp: 'NR 6/9/2022 08:12:38'!
booksCatalogIndex

	^selectedBookCatalogIndex! !

!TusLibrosClientTestWindowModel methodsFor: 'listSelectors' stamp: 'NR 6/9/2022 08:12:41'!
booksCatalogIndex: anIndex

	selectedBookCatalogIndex  := anIndex! !

!TusLibrosClientTestWindowModel methodsFor: 'listSelectors' stamp: 'NR 6/9/2022 08:12:45'!
cartContent

	^currentSelectedCartContent! !

!TusLibrosClientTestWindowModel methodsFor: 'listSelectors' stamp: 'NR 6/9/2022 08:12:57'!
cartIds

	^cartIds! !

!TusLibrosClientTestWindowModel methodsFor: 'listSelectors' stamp: 'NR 6/13/2022 07:10:15'!
cartIdsIndex

	^selectedCartIdsIndex! !

!TusLibrosClientTestWindowModel methodsFor: 'listSelectors' stamp: 'NR 6/13/2022 07:10:19'!
cartIdsIndex: anIndex

	selectedCartIdsIndex  := anIndex. 
		
	self triggerEvent: #selectedCartChanged with: selectedCartIdsIndex
	! !


!TusLibrosClientTestWindowModel methodsFor: 'buttonSelectors' stamp: 'MYB 6/15/2022 19:00:46'!
addToCart

	| cartId bookIsbn |

	(self areCartIdAndBookSelected) ifTrue:[
		[cartId := self selectedCartId.
		bookIsbn := self selectedBook.
		restInterface add: 1 of: bookIsbn toCartIdentifiedAs: cartId.
		self triggerEvent: #bookAddedToCart withArguments: (Array with: bookIsbn with: cartId)] fork
	]! !

!TusLibrosClientTestWindowModel methodsFor: 'buttonSelectors' stamp: 'MYB 6/15/2022 18:59:45'!
createCart

	[| newCartId |
	
	newCartId := restInterface createCartFor: 'hernan' password: 'smalltalk'.
	cartIds add: newCartId.
	self triggerEvent: #newCartIdArrived] fork! !

!TusLibrosClientTestWindowModel methodsFor: 'buttonSelectors' stamp: 'MYB 6/15/2022 19:01:04'!
listCart

	| cartId |
	
	(self isCartIdSelected) ifTrue:[
		[cartId := self selectedCartId.
		currentSelectedCartContent := restInterface listCart: cartId.
		self triggerEvent: #newCurrentSelectedCartContentArrived with: cartId ] fork
	]! !


!TusLibrosClientTestWindowModel methodsFor: 'initialization' stamp: 'NR 6/9/2022 08:13:11'!
defaultCatalog 

	^Dictionary new
		at: 'GreenBook' put: 10*dollar;
		at: 'BlueBook' put: 15*dollar;
		at: 'MartinFierro' put: 350*peso;
		yourself! !

!TusLibrosClientTestWindowModel methodsFor: 'initialization' stamp: 'NR 6/9/2022 08:13:15'!
initialize

	cartIds := OrderedCollection new.
	currentSelectedCartContent := OrderedCollection new.
	selectedCartIdsIndex := 0.
	selectedBookCatalogIndex := 0.
	restInterface := TusLibrosClientRestInterface new.! !


!classDefinition: #TusLibrosServerRestInterface category: 'TusLibrosREST'!
Object subclass: #TusLibrosServerRestInterface
	instanceVariableNames: 'systemFacade'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosREST'!

!TusLibrosServerRestInterface methodsFor: 'initialization' stamp: 'HAW 5/5/2020 17:18:31'!
initializeOn: aTusLibrosSystemFacade 
	
	systemFacade := aTusLibrosSystemFacade.! !


!TusLibrosServerRestInterface methodsFor: 'request' stamp: 'NR 6/9/2022 08:15:16'!
answer: aBlock to: aRequest 

	| response |
	
	[ response := aBlock value.
	aRequest send200Response: (WebUtils jsonEncode: (response))]
		on: Error
		do: [ :anError | aRequest send400Response: anError messageText ]! !

!TusLibrosServerRestInterface methodsFor: 'request' stamp: 'HAW 7/23/2020 16:18:57'!
cartIdFrom: requestFields

	^ (requestFields at: 'cartId') asNumber! !

!TusLibrosServerRestInterface methodsFor: 'request' stamp: 'HAW 7/23/2020 16:20:08'!
clientIdFrom: requestFields

	^ requestFields at: 'clientId'! !

!TusLibrosServerRestInterface methodsFor: 'request' stamp: 'HAW 7/23/2020 16:20:19'!
passwordFrom: requestFields

	^ requestFields at: 'password'! !

!TusLibrosServerRestInterface methodsFor: 'request' stamp: 'HAW 5/5/2020 18:26:47'!
withFieldsOf: aRequest do: aBlock

	[ aBlock value: aRequest fields ]
		on: Error
		do: [ :anError | aRequest 
			sendResponseCode: 400 
			content: ('Invalid request: ', anError messageText) asUtf8
			type: 'text/plain; charset=utf-8'
			close: true ]! !


!TusLibrosServerRestInterface methodsFor: 'rest interface' stamp: 'NR 6/13/2022 07:11:45'!
addToCart: aRequest

	| bookIsbn cartId quantity |

	(Delay forSeconds: 3) wait.
	
	self withFieldsOf: aRequest do: [ :requestFields |
		cartId := self cartIdFrom: requestFields.
		bookIsbn := requestFields at: 'bookIsbn'.
		quantity := (requestFields at: 'bookQuantity') asNumber ].
		
	self 
		answer: [
			systemFacade add: quantity of: bookIsbn toCartIdentifiedAs: cartId.
			'OK' ]
		to: aRequest 
	! !

!TusLibrosServerRestInterface methodsFor: 'rest interface' stamp: 'HAW 7/23/2020 16:19:16'!
checkOutCart: aRequest

	| cartId creditCardNumber creditCardOwner creditCartExpirationDate creditCartExpirationDateString transactionId |
	
	self withFieldsOf: aRequest do: [ :requestFields |
		cartId := self cartIdFrom: requestFields.
		creditCardNumber := requestFields at: 'ccn'.
		creditCartExpirationDateString := requestFields at: 'cced'.
		creditCartExpirationDate := Month 
			month: (creditCartExpirationDateString first: 2) asNumber 
			year: (creditCartExpirationDateString last: 4) asNumber.
		creditCardOwner := requestFields at: 'cco' ].
	
	self 
		answer: [
			transactionId := systemFacade 
					checkOutCartIdentifiedAs: cartId 
					withCreditCardNumbered: creditCardNumber 
					ownedBy: creditCardOwner 
					expiringOn: creditCartExpirationDate. 
			transactionId printString ]
		to: aRequest ! !

!TusLibrosServerRestInterface methodsFor: 'rest interface' stamp: 'NR 6/13/2022 07:11:38'!
createCart: aRequest

	| clientId password |

	(Delay forSeconds: 1) wait.
	
	self withFieldsOf: aRequest do: [ :requestFields |
		clientId := self clientIdFrom: requestFields.
		password := self passwordFrom: requestFields ].
	
	self 
		answer: [ | cartId | 
			cartId := systemFacade createCartFor: clientId authenticatedWith: password.
			cartId printString ]
		to: aRequest ! !

!TusLibrosServerRestInterface methodsFor: 'rest interface' stamp: 'NR 6/13/2022 07:11:31'!
listCart: aRequest

	| cartId |

	(Delay forSeconds: 10) wait.
	
	self withFieldsOf: aRequest do: [ :requestFields |
		cartId := self cartIdFrom: requestFields ].
	
	self 
		answer: [(systemFacade listCartIdentifiedAs: cartId) asArray]
		to: aRequest 
! !

!TusLibrosServerRestInterface methodsFor: 'rest interface' stamp: 'HAW 7/23/2020 16:20:19'!
listPurchases: aRequest

	| clientId password purchases response |
	
	self withFieldsOf: aRequest do: [ :requestFields |
		clientId := self clientIdFrom: requestFields.
		password := self passwordFrom: requestFields ].
	
	self 
		answer: [ | soldItems total |
			purchases := systemFacade listPurchasesOf: clientId authenticatingWith: password.
			soldItems := purchases first.
			total := purchases second.
			response := String streamContents: [:stream | 
				soldItems keysAndValuesDo: [ :isbn :amount |
					stream nextPutAll: isbn; nextPut: $|; print: amount; nextPut: $| ].
				stream print: total ].
			response ]
		to: aRequest ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosServerRestInterface class' category: 'TusLibrosREST'!
TusLibrosServerRestInterface class
	instanceVariableNames: ''!

!TusLibrosServerRestInterface class methodsFor: 'default objects' stamp: 'HAW 5/5/2020 17:11:42'!
createSalesBook
	
	^OrderedCollection new! !

!TusLibrosServerRestInterface class methodsFor: 'default objects' stamp: 'HAW 5/5/2020 17:47:11'!
defaultCatalog 
	
	^Dictionary new
		at: 'GreenBook' put: 10*dollar;
		at: 'BlueBook' put: 15*dollar;
		at: 'MartinFierro' put: 350*peso;
		yourself! !

!TusLibrosServerRestInterface class methodsFor: 'default objects' stamp: 'HAW 5/5/2020 17:13:55'!
defaultMerchantProcessor 
	
	^DefaultMerchantProcessor new! !

!TusLibrosServerRestInterface class methodsFor: 'default objects' stamp: 'HAW 5/5/2020 17:13:46'!
defaultSystem

	| clock systemFacade |
	
	clock := RealTimeClock new.
	systemFacade := TusLibrosSystemFacade 
		authenticatingWith: self validUsersAndPasswords 
		acceptingItemsOf: self defaultCatalog 
		registeringOn: self createSalesBook
		debitingThrought: self defaultMerchantProcessor 
		measuringTimeWith: clock.

	^systemFacade ! !

!TusLibrosServerRestInterface class methodsFor: 'default objects' stamp: 'HAW 5/5/2020 17:10:11'!
validUsersAndPasswords 
	
	^Dictionary new
		at: 'hernan' put: 'smalltalk';
		at: 'maximo' put: 'ruby';
		yourself! !


!TusLibrosServerRestInterface class methodsFor: 'instance creation' stamp: 'HAW 5/5/2020 17:18:06'!
on: aTusLibrosSystemFacade 

	^self new initializeOn: aTusLibrosSystemFacade ! !


!TusLibrosServerRestInterface class methodsFor: 'installation' stamp: 'MYB 6/15/2022 18:28:31'!
installForDefaultSystem

	"self installForDefaultSystem"
	
	| server port interface |
	
	interface := self on: self defaultSystem.
	
	"Esto es para poder acceder a la interface de manera global - Hernan"
	Smalltalk at: #CurrentTusLibrosRestInterface put: interface.
	
	port := 9999.
	server := WebServer reset default.
	server listenOn: port.
	server 
		addService: '/createCart' 
		action: [:request | interface createCart: request ].
	server 
		addService: '/addToCart' 
		action: [:request | interface addToCart: request ].
	server
		addService: '/listCart' 
		action: [:request | interface listCart: request ].
	server
		addService: '/checkOutCart' 
		action: [:request | interface checkOutCart: request ].
	server
		addService: '/listPurchases' 
		action: [:request | interface listPurchases: request ].
	server useDebugErrorHandler ! !
