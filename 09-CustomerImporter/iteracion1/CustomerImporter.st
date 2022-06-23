!classDefinition: #ImportTest category: 'CustomerImporter'!
TestCase subclass: #ImportTest
	instanceVariableNames: 'session'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!ImportTest methodsFor: 'assertions' stamp: 'id 6/16/2022 21:21:16'!
assertAddress: importedAddress streetNumber: streetNumber town: town zipCode: zipCode province: province    

	self assert: streetNumber equals: importedAddress streetNumber.
	self assert: town equals: importedAddress town.
	self assert: zipCode equals: importedAddress zipCode.
	self assert: province equals: importedAddress province! !

!ImportTest methodsFor: 'assertions' stamp: 'id 6/16/2022 21:19:00'!
assertCustomer: importedCustomer firstName: firstName lastName: lastName  

	self assert: firstName equals: importedCustomer firstName.
	self assert: lastName equals: importedCustomer lastName! !

!ImportTest methodsFor: 'assertions' stamp: 'id 6/22/2022 22:24:31'!
assertFirstCustomerAndTheirAddressesWereCorrectlyImported

	| importedCustomer address |
	
	self
		assertHasCustomerIdentifiedWith: '22333444'
		identificationType: 'D'
		firstName: 'Pepe'
		lastName: 'Sanchez'.
	
	importedCustomer := self getCustomerWith: '22333444' andType: 'D'.
	address := importedCustomer getAddressAt: 'San Martin'.

	self
		assertAddress: address
		streetNumber: 3322
		town: 'Olivos'
		zipCode: 1636
		province: 'BsAs'.

	address := importedCustomer getAddressAt: 'Maipu'.

	self
		assertAddress: address
		streetNumber: 888
		town: 'Florida'
		zipCode: 1122
		province: 'Buenos Aires'.


! !

!ImportTest methodsFor: 'assertions' stamp: 'id 6/22/2022 22:12:46'!
assertHasCustomerIdentifiedWith: identificationNumber identificationType: identificationType firstName: firstName lastName: lastName

	| importedCustomer |

	importedCustomer := self getCustomerWith: identificationNumber andType: identificationType.	

	self assertCustomer: importedCustomer firstName: firstName lastName: lastName.! !

!ImportTest methodsFor: 'assertions' stamp: 'id 6/22/2022 22:23:42'!
assertSecondCustomerAndTheirAddressesWereCorrectlyImported

	| importedCustomer address |

	self
		assertHasCustomerIdentifiedWith: '23-25666777-9'
		identificationType: 'C'
		firstName: 'Juan'
		lastName: 'Perez'.

	importedCustomer := self getCustomerWith: '23-25666777-9' andType: 'C'.
	address := importedCustomer getAddressAt: 'Alem'.

	self
		assertAddress: address
		streetNumber: 1122
		town: 'CABA'
		zipCode: 1001
		province: 'CABA'.



! !


!ImportTest methodsFor: 'auxiliary' stamp: 'id 6/22/2022 22:19:47'!
getCustomerWith: identificationNumber andType: identificationType 

	^(session
		select: [ :aCustomer | aCustomer isIdentifiedWith:  identificationNumber andType: identificationType. ]
		ofType: Customer) anyOne.! !

!ImportTest methodsFor: 'auxiliary' stamp: 'id 6/22/2022 21:27:14'!
importCustomers: stream

	^(CustomerImporter from: stream to: session) compute.! !

!ImportTest methodsFor: 'auxiliary' stamp: 'id 6/16/2022 21:00:37'!
stream

	^ ReadStream on: 'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636,BsAs
A,Maipu,888,Florida,1122,Buenos Aires
C,Juan,Perez,C,23-25666777-9
A,Alem,1122,CABA,1001,CABA'! !


!ImportTest methodsFor: 'setUp' stamp: 'id 6/16/2022 20:42:08'!
setUp

	session := DataBaseSession for: (Array with: Address with: Customer).
	session beginTransaction! !


!ImportTest methodsFor: 'tearDown' stamp: 'id 6/22/2022 21:21:05'!
tearDown

	session commit.
	session close.! !


!ImportTest methodsFor: 'tests' stamp: 'id 6/22/2022 21:26:59'!
test01Import

	self importCustomers: self stream.
	
	self assertFirstCustomerAndTheirAddressesWereCorrectlyImported.
	
	self assertSecondCustomerAndTheirAddressesWereCorrectlyImported.
	
	
	
	
	
	
	
	! !


!classDefinition: #Address category: 'CustomerImporter'!
Object subclass: #Address
	instanceVariableNames: 'id streetName streetNumber town zipCode province'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Address methodsFor: 'province' stamp: 'HAW 5/22/2022 00:19:29'!
province

	^province! !

!Address methodsFor: 'province' stamp: 'HAW 5/22/2022 00:19:29'!
province: aProvince

	province := aProvince
	! !


!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetName

	^streetName ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetName: aStreetName

	streetName := aStreetName ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetNumber

	^streetNumber ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetNumber: aStreetNumber

	streetNumber := aStreetNumber ! !


!Address methodsFor: 'testing' stamp: 'id 6/16/2022 21:12:30'!
isAt: aStreetName

	^streetName = aStreetName.! !


!Address methodsFor: 'town' stamp: 'HAW 5/22/2022 00:19:29'!
town

	^town! !

!Address methodsFor: 'town' stamp: 'HAW 5/22/2022 00:19:29'!
town: aTown

	town := aTown! !


!Address methodsFor: 'zip code' stamp: 'HAW 5/22/2022 00:19:29'!
zipCode

	^zipCode! !

!Address methodsFor: 'zip code' stamp: 'HAW 5/22/2022 00:19:29'!
zipCode: aZipCode

	zipCode := aZipCode! !


!classDefinition: #Customer category: 'CustomerImporter'!
Object subclass: #Customer
	instanceVariableNames: 'id firstName lastName identificationType identificationNumber addresses'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 00:19:29'!
addAddress: anAddress

	addresses add: anAddress ! !

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 00:19:29'!
addresses

	^ addresses! !

!Customer methodsFor: 'addresses' stamp: 'id 6/22/2022 22:22:23'!
getAddressAt: aStreetName

	^(addresses select: [ :anAddress | anAddress isAt: aStreetName. ]) anyOne.! !


!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
firstName

	^firstName ! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
firstName: aName

	firstName := aName! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
lastName

	^lastName ! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
lastName: aLastName

	lastName := aLastName
! !


!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationNumber

	^identificationNumber ! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationNumber: anIdentificationNumber

	identificationNumber := anIdentificationNumber! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationType

	^identificationType ! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationType: anIdentificationType

	identificationType := anIdentificationType! !


!Customer methodsFor: 'testing' stamp: 'id 6/22/2022 22:15:24'!
isIdentifiedWith: anIdentificationNumber andType: anIdentificationType

	^identificationNumber = anIdentificationNumber and: [identificationType = anIdentificationType].! !


!Customer methodsFor: 'initialization' stamp: 'HAW 5/22/2022 00:19:29'!
initialize

	super initialize.
	addresses := OrderedCollection new.! !


!classDefinition: #CustomerImporter category: 'CustomerImporter'!
Object subclass: #CustomerImporter
	instanceVariableNames: 'session stream'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!CustomerImporter methodsFor: 'initialization' stamp: 'id 6/22/2022 22:15:58'!
initializeFrom: aStream to: aSession

	session := aSession.
	stream := aStream.! !


!CustomerImporter methodsFor: 'evaluating' stamp: 'id 6/22/2022 22:26:24'!
compute

	| newCustomer line |

	line := stream nextLine.

	[ line notNil ] whileTrue: [
		(line beginsWith: 'C') ifTrue: [ | customerData |
			customerData := line findTokens: $,.
			newCustomer := Customer new.
			newCustomer firstName: customerData second.
			newCustomer lastName: customerData third.
			newCustomer identificationType: customerData fourth.
			newCustomer identificationNumber: customerData fifth.
			session persist: newCustomer ].

		(line beginsWith: 'A') ifTrue: [ | addressData newAddress |
			addressData := line findTokens: $,.
			newAddress := Address new.
			newCustomer addAddress: newAddress.
			newAddress streetName: addressData second.
			newAddress streetNumber: addressData third asNumber .
			newAddress town: addressData fourth.
			newAddress zipCode: addressData fifth asNumber .
			newAddress province: addressData sixth ].

		line := stream nextLine. ].

	stream close.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerImporter class' category: 'CustomerImporter'!
CustomerImporter class
	instanceVariableNames: ''!

!CustomerImporter class methodsFor: 'instance creation' stamp: 'id 6/16/2022 21:03:25'!
from: aStream to: aSession
	^self new initializeFrom: aStream to: aSession! !


!classDefinition: #DataBaseSession category: 'CustomerImporter'!
Object subclass: #DataBaseSession
	instanceVariableNames: 'configuration tables id'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!DataBaseSession methodsFor: 'transaction management' stamp: 'HAW 5/22/2022 00:19:29'!
beginTransaction

	! !

!DataBaseSession methodsFor: 'transaction management' stamp: 'HAW 5/22/2022 19:17:36'!
commit

	(tables at: Customer ifAbsent: [#()]) do: [ :aCustomer | self persistAddressesOf: aCustomer ]
	! !


!DataBaseSession methodsFor: 'closing' stamp: 'HAW 5/22/2022 00:19:29'!
close

	! !


!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
defineIdOf: anObject

	anObject instVarNamed: 'id' put: (self newIdFor: anObject).! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
delay

	(Delay forMilliseconds: 100) wait! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 19:29:06'!
objectsOfType: aType

	^ tables at: aType ifAbsent: [ #() ]! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
persistAddressesOf: anObjectWithAddresses

	anObjectWithAddresses addresses do: [ :anAddress | self persist: anAddress ]
	! !


!DataBaseSession methodsFor: 'initialization' stamp: 'HAW 5/22/2022 00:19:29'!
initializeFor: aConfiguration

	configuration := aConfiguration.
	tables := Dictionary new.
	id := 0.! !


!DataBaseSession methodsFor: 'id' stamp: 'HAW 5/22/2022 00:19:29'!
newIdFor: anObject

	id := id + 1.
	^id! !


!DataBaseSession methodsFor: 'persistance' stamp: 'HAW 5/22/2022 00:19:29'!
persist: anObject

	| table |

	self delay.
	table := tables at: anObject class ifAbsentPut: [ Set new ].

	self defineIdOf: anObject.
	table add: anObject.

	(anObject isKindOf: Customer) ifTrue: [ self persistAddressesOf: anObject ].! !


!DataBaseSession methodsFor: 'selecting' stamp: 'HAW 5/22/2022 19:29:06'!
select: aCondition ofType: aType

	self delay.
	^(self objectsOfType: aType) select: aCondition ! !

!DataBaseSession methodsFor: 'selecting' stamp: 'HAW 5/22/2022 19:29:06'!
selectAllOfType: aType

	self delay.
	^(self objectsOfType: aType) copy ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DataBaseSession class' category: 'CustomerImporter'!
DataBaseSession class
	instanceVariableNames: ''!

!DataBaseSession class methodsFor: 'instance creation' stamp: 'HAW 5/22/2022 00:19:29'!
for: aConfiguration

	^self new initializeFor: aConfiguration! !
