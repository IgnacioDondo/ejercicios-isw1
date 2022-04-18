!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'abstractions' stamp: 'MB 4/11/2022 21:38:19'!
createCustomerBookAndAdd: customer

	| customerBook |
	
	customerBook := CustomerBook new.
	
	^ customerBook addCustomerNamed: customer.! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'MB 4/11/2022 21:37:47'!
doing: something ShouldNotTakeMoreThan: time

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	something value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (time)
	
! !

!CustomerBookTest methodsFor: 'abstractions' stamp: 'MB 4/16/2022 19:42:12'!
suspendCustomer: customerToSuspend From: customerBook AndCheckCustomerInclusion: customerToCheck
	
	[ customerBook suspendCustomerNamed: customerToSuspend.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: customerToCheck) ]! !


!CustomerBookTest methodsFor: 'testing' stamp: 'MB 4/11/2022 21:37:47'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self doing: [customerBook addCustomerNamed: 'John Lennon'.] ShouldNotTakeMoreThan: 50 * millisecond.
	
	
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MB 4/11/2022 21:38:19'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self createCustomerBookAndAdd: paulMcCartney.
	
	self doing: [customerBook removeCustomerNamed: paulMcCartney.] ShouldNotTakeMoreThan: 100 * millisecond.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'id 4/17/2022 21:40:52'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MB 4/11/2022 21:55:13'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookAndAdd: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MB 4/11/2022 21:38:19'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self createCustomerBookAndAdd: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MB 4/11/2022 21:38:19'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self createCustomerBookAndAdd: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MB 4/16/2022 19:42:27'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookAndAdd: johnLennon.
	
	self suspendCustomer: 'George Harrison' From: customerBook AndCheckCustomerInclusion: johnLennon
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MB 4/16/2022 19:42:31'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookAndAdd: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self suspendCustomer: johnLennon From: customerBook AndCheckCustomerInclusion: johnLennon
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'id 4/17/2022 21:14:00'!
includesCustomerNamed: aName

	^(self includesActiveCustomerNamed: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'abstractions' stamp: 'id 4/17/2022 21:13:34'!
includesActiveCustomerNamed: aName

	^active includes: aName.! !

!CustomerBook methodsFor: 'abstractions' stamp: 'id 4/17/2022 21:27:14'!
removeCustomerNamed: aName FromCollection: aCollection
	
	1 to: aCollection size do: 
	[ :index |
		aName = (aCollection at: index)
			ifTrue: [
				aCollection removeAt: index.
				^ aName 
			] 
	].

	^ NotFound signal.! !


!CustomerBook methodsFor: 'customer management' stamp: 'id 4/17/2022 21:11:13'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	( self includesCustomerNamed: aName ) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'id 4/17/2022 21:07:23'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'MB 4/17/2022 15:50:14'!
removeCustomerNamed: aName 

 	[^ self removeCustomerNamed: aName FromCollection: active.] 
		on: NotFound 
		do: [^self removeCustomerNamed: aName FromCollection: suspended.].

! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'id 4/17/2022 21:14:40'!
suspendCustomerNamed: aName 
	
	(self includesActiveCustomerNamed: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/11/2022 07:18:12'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/11/2022 07:18:16'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
