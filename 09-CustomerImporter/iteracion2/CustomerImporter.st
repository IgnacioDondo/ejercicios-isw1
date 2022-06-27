!classDefinition: #ImportTest category: 'CustomerImporter'!
TestCase subclass: #ImportTest
	instanceVariableNames: 'session'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:22:05'!
assertAddressOf: importedCustomer at: aStreetName hasNumber: aNumber town: aTown zipCode: aZipCode province: aProvince

	| importedAddress |

	importedAddress := importedCustomer addressAt: aStreetName ifNone: [ self fail ].
	self assert: aStreetName equals: importedAddress streetName.
	self assert: aNumber equals: importedAddress streetNumber.
	self assert: aTown equals: importedAddress town.
	self assert: aZipCode equals: importedAddress zipCode.
	self assert: aProvince equals: importedAddress province.

	! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:27:57'!
assertCustomerWithIdentificationType: anIdType number: anIdNumber hasFirstName: aFirstName lastName: aLastName

	| importedCustomer |

	importedCustomer := self customerWithIdentificationType: anIdType number: anIdNumber.

	self assert: aFirstName equals: importedCustomer firstName.
	self assert: aLastName equals: importedCustomer lastName.
	self assert: anIdType equals: importedCustomer identificationType.
	self assert: anIdNumber equals: importedCustomer identificationNumber.

	^importedCustomer

	! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:12:18'!
assertImportedRightNumberOfCustomers

	^ self assert: 2 equals: (session selectAllOfType: Customer) size! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:28:45'!
assertJuanPerezWasImportedCorrectly

	| importedCustomer |

	importedCustomer := self assertCustomerWithIdentificationType: 'C' number: '23-25666777-9' hasFirstName: 'Juan' lastName: 'Perez'.
	self assertAddressOf: importedCustomer at: 'Alem' hasNumber: 1122 town: 'CABA' zipCode: 1001 province: 'CABA'
	! !

!ImportTest methodsFor: 'assertions' stamp: 'id 6/26/2022 20:44:12'!
assertNoAddressHasBeenImported

	self assert: 0 equals: (session selectAllOfType: Address) size.! !

!ImportTest methodsFor: 'assertions' stamp: 'id 6/26/2022 20:42:57'!
assertNoCustomerHasBeenImported

	self assert: 0 equals: (session selectAllOfType: Customer) size.! !

!ImportTest methodsFor: 'assertions' stamp: 'id 6/26/2022 21:45:47'!
assertOnlyOneCustomerHasBeenImported

	^ self assert: 1 equals: (session selectAllOfType: Customer) size! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:28:05'!
assertPepeSanchezWasImportedCorrecty

	| importedCustomer |

	importedCustomer := self assertCustomerWithIdentificationType: 'D' number: '22333444' hasFirstName: 'Pepe' lastName: 'Sanchez'.
	self assertAddressOf: importedCustomer at: 'San Martin' hasNumber: 3322 town: 'Olivos' zipCode: 1636 province: 'BsAs'.
	self assertAddressOf: importedCustomer at: 'Maipu' hasNumber: 888 town: 'Florida' zipCode: 1122 province: 'Buenos Aires'.


	! !


!ImportTest methodsFor: 'auxiliary' stamp: 'id 6/26/2022 21:26:23'!
importFrom: aStream

	^CustomerImporter valueFrom: aStream into: session.! !

!ImportTest methodsFor: 'auxiliary' stamp: 'id 6/26/2022 21:32:11'!
importingFrom: aStream shouldRaiseErrorWithMessage: anErrorMessage andAssert: anAssertionsBlock  

	self 
		should: [ self importFrom: aStream. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anErrorMessage equals: anError messageText.
			anAssertionsBlock value.
		].! !


!ImportTest methodsFor: 'customer' stamp: 'HAW 5/22/2022 18:14:22'!
customerWithIdentificationType: anIdType number: anIdNumber

	^ (session
		select: [ :aCustomer | aCustomer identificationType = anIdType and: [ aCustomer identificationNumber = anIdNumber ]]
		ofType: Customer) anyOne! !


!ImportTest methodsFor: 'setUp/tearDown' stamp: 'HAW 5/22/2022 00:27:50'!
setUp

	session := DataBaseSession for: (Array with: Address with: Customer).
	session beginTransaction.
! !

!ImportTest methodsFor: 'setUp/tearDown' stamp: 'HAW 5/22/2022 00:28:23'!
tearDown

	session commit.
	session close.
	! !


!ImportTest methodsFor: 'test data' stamp: 'MYB 6/23/2022 21:02:17'!
invalidAddressRecordWithLessThanSixFields
	
	^ ReadStream on:
'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636'! !

!ImportTest methodsFor: 'test data' stamp: 'MYB 6/23/2022 20:58:58'!
invalidAddressRecordWithMoreThanSixFields
	
	^ ReadStream on:
'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636,BsAs, '! !

!ImportTest methodsFor: 'test data' stamp: 'MYB 6/23/2022 20:42:38'!
invalidAddressRecordWithoutPreviousCustomerRecord
	
	^ ReadStream on: 'A,San Martin,3322,Olivos,1636,BsAs'! !

!ImportTest methodsFor: 'test data' stamp: 'MYB 6/23/2022 21:02:47'!
invalidAddressRecordWrongType
	
	^ ReadStream on:
'C,Pepe,Sanchez,D,22333444
Ax,San Martin,3322,Olivos,1636,BsAs'! !

!ImportTest methodsFor: 'test data' stamp: 'MYB 6/23/2022 20:42:44'!
invalidCustomerRecordWithLessThanFiveFields
	
	^ ReadStream on: 'C,Pepe,Sanchez,D'! !

!ImportTest methodsFor: 'test data' stamp: 'MYB 6/23/2022 20:46:38'!
invalidCustomerRecordWithMoreThanFiveFields
	
	^ ReadStream on: 'C,Pepe,Sanchez,D,22333444, '! !

!ImportTest methodsFor: 'test data' stamp: 'MYB 6/23/2022 21:02:59'!
invalidCustomerRecordWrongType
	
	^ ReadStream on: 'Cx,Pepe,Sanchez,D,22333444'! !

!ImportTest methodsFor: 'test data' stamp: 'HAW 5/22/2022 18:08:08'!
validImportData

	^ ReadStream on:
'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636,BsAs
A,Maipu,888,Florida,1122,Buenos Aires
C,Juan,Perez,C,23-25666777-9
A,Alem,1122,CABA,1001,CABA'! !


!ImportTest methodsFor: 'tests' stamp: 'MYB 6/23/2022 19:12:19'!
test01ValidDataIsImportedCorrectly

	CustomerImporter valueFrom: self validImportData into: session.

	self 
		assertImportedRightNumberOfCustomers;
		assertPepeSanchezWasImportedCorrecty;
		assertJuanPerezWasImportedCorrectly.! !

!ImportTest methodsFor: 'tests' stamp: 'id 6/26/2022 21:32:26'!
test02CustomerRecordMustBeOnlyC

	self
		importingFrom: self invalidCustomerRecordWrongType
		shouldRaiseErrorWithMessage: CustomerImporter invalidRecordTypeErrorDescription
		andAssert: [ self assertNoCustomerHasBeenImported. ].! !

!ImportTest methodsFor: 'tests' stamp: 'id 6/26/2022 21:45:47'!
test03AddressRecordMustBeOnlyA

	self
		importingFrom: self invalidAddressRecordWrongType
		shouldRaiseErrorWithMessage: CustomerImporter invalidRecordTypeErrorDescription
		andAssert: [
			self assertOnlyOneCustomerHasBeenImported.
			self assertNoAddressHasBeenImported.
		].! !

!ImportTest methodsFor: 'tests' stamp: 'id 6/26/2022 21:41:37'!
test04AddressRecordMustHasPreviousCustomerRecord

	self
		importingFrom: self invalidAddressRecordWithoutPreviousCustomerRecord
		shouldRaiseErrorWithMessage: CustomerImporter addressRecordMustHavePreviousCustomerRecordErrorDescription
		andAssert: [ self assertNoAddressHasBeenImported. ].! !

!ImportTest methodsFor: 'tests' stamp: 'id 6/26/2022 21:34:59'!
test05CustomerRecordMustNotHaveLessThanFiveFields

	self
		importingFrom: self invalidCustomerRecordWithLessThanFiveFields
		shouldRaiseErrorWithMessage: CustomerImporter customerRecordInvalidQuantityOfFieldsErrorDescription
		andAssert: [ self assertNoCustomerHasBeenImported. ].! !

!ImportTest methodsFor: 'tests' stamp: 'id 6/26/2022 21:35:55'!
test06CustomerRecordMustNotHaveMoreThanFiveFields

	self
		importingFrom: self invalidCustomerRecordWithMoreThanFiveFields
		shouldRaiseErrorWithMessage: CustomerImporter customerRecordInvalidQuantityOfFieldsErrorDescription
		andAssert: [ self assertNoCustomerHasBeenImported. ].! !

!ImportTest methodsFor: 'tests' stamp: 'id 6/26/2022 21:36:30'!
test07AddressRecordMustNotHaveLessThanSixFields

	self
		importingFrom: self invalidAddressRecordWithLessThanSixFields
		shouldRaiseErrorWithMessage: CustomerImporter addressRecordInvalidQuantityOfFieldsErrorDescription
		andAssert: [ self assertNoAddressHasBeenImported. ].! !

!ImportTest methodsFor: 'tests' stamp: 'id 6/26/2022 21:37:04'!
test08AddressRecordMustNotHaveMoreThanSixFields

	self
		importingFrom: self invalidAddressRecordWithMoreThanSixFields
		shouldRaiseErrorWithMessage: CustomerImporter addressRecordInvalidQuantityOfFieldsErrorDescription
		andAssert: [ self assertNoAddressHasBeenImported. ].! !


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


!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 17:55:46'!
isAt: aStreetName

	^streetName = aStreetName ! !

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


!Address methodsFor: 'twon' stamp: 'HAW 5/22/2022 00:19:29'!
town

	^town! !

!Address methodsFor: 'twon' stamp: 'HAW 5/22/2022 00:19:29'!
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

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 17:55:17'!
addressAt: aStreetName ifNone: aNoneBlock

	^addresses detect: [ :address | address isAt: aStreetName ] ifNone: aNoneBlock ! !

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 00:19:29'!
addresses

	^ addresses! !


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


!Customer methodsFor: 'initialization' stamp: 'HAW 5/22/2022 00:19:29'!
initialize

	super initialize.
	addresses := OrderedCollection new.! !


!classDefinition: #CustomerImporter category: 'CustomerImporter'!
Object subclass: #CustomerImporter
	instanceVariableNames: 'session readStream line record newCustomer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!CustomerImporter methodsFor: 'assertions' stamp: 'MYB 6/23/2022 21:16:05'!
assertAddressRecordCanBeImported

	self assertItHadImportedCustomerRecordBeforeAddressRecord.
	record size = self addressRecordDefaultSize 
		ifFalse: [ self error: self class addressRecordInvalidQuantityOfFieldsErrorDescription ]! !

!CustomerImporter methodsFor: 'assertions' stamp: 'MYB 6/23/2022 20:52:20'!
assertCustomerRecordCanBeImported

	record size = self customerRecordDefaultSize 
		ifFalse: [ self error: self class customerRecordInvalidQuantityOfFieldsErrorDescription ]! !

!CustomerImporter methodsFor: 'assertions' stamp: 'MYB 6/23/2022 21:16:05'!
assertItHadImportedCustomerRecordBeforeAddressRecord

	^ newCustomer isNil ifTrue: [ self error: self class addressRecordMustHavePreviousCustomerRecordErrorDescription ]! !


!CustomerImporter methodsFor: 'default records sizes' stamp: 'MYB 6/23/2022 20:54:10'!
addressRecordDefaultSize
	
	^6! !

!CustomerImporter methodsFor: 'default records sizes' stamp: 'MYB 6/23/2022 20:47:15'!
customerRecordDefaultSize

	^ 5! !


!CustomerImporter methodsFor: 'evaluating' stamp: 'MYB 6/23/2022 19:35:44'!
value
	
	self importCustomers.

	! !


!CustomerImporter methodsFor: 'initialization' stamp: 'HAW 5/22/2022 18:06:47'!
initializeFrom: aReadStream into: aSession
	session := aSession.
	readStream := aReadStream.! !


!CustomerImporter methodsFor: 'operations' stamp: 'MYB 6/23/2022 19:25:37'!
createRecord

	^ record := line findTokens: $,! !

!CustomerImporter methodsFor: 'operations' stamp: 'MYB 6/23/2022 20:40:58'!
importAddress

	| newAddress |
	
	self assertAddressRecordCanBeImported.
	
	newAddress := Address new.
	newCustomer addAddress: newAddress.
	newAddress streetName: record second.
	newAddress streetNumber: record third asNumber .
	newAddress town: record fourth.
	newAddress zipCode: record fifth asNumber .
	newAddress province: record sixth! !

!CustomerImporter methodsFor: 'operations' stamp: 'MYB 6/23/2022 20:40:42'!
importCustomer
	
	self assertCustomerRecordCanBeImported.
	
	newCustomer := Customer new.
	newCustomer firstName: record second.
	newCustomer lastName: record third.
	newCustomer identificationType: record fourth.
	newCustomer identificationNumber: record fifth.
	session persist: newCustomer! !

!CustomerImporter methodsFor: 'operations' stamp: 'MYB 6/23/2022 19:35:52'!
importCustomers

	[ self hasLineToImport ] whileTrue: [
		self createRecord.
		self importRecord.
	]! !

!CustomerImporter methodsFor: 'operations' stamp: 'MYB 6/23/2022 20:23:55'!
importRecord

	self isCustomerRecord ifTrue: [ ^self importCustomer ].
	self isAddressRecord ifTrue: [ ^self importAddress ].
	
	self error: self class invalidRecordTypeErrorDescription.! !


!CustomerImporter methodsFor: 'testing' stamp: 'MYB 6/23/2022 19:36:15'!
hasLineToImport

	line := readStream nextLine. 
	^line notNil! !

!CustomerImporter methodsFor: 'testing' stamp: 'MYB 6/23/2022 20:24:06'!
isAddressRecord
	
	^ record first = 'A'
	
	
	! !

!CustomerImporter methodsFor: 'testing' stamp: 'MYB 6/23/2022 20:37:28'!
isCustomerRecord

	^ record first = 'C'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerImporter class' category: 'CustomerImporter'!
CustomerImporter class
	instanceVariableNames: ''!

!CustomerImporter class methodsFor: 'instance creation' stamp: 'HAW 5/22/2022 18:06:47'!
from: aReadStream into: aSession
	^self new initializeFrom: aReadStream into: aSession! !


!CustomerImporter class methodsFor: 'importing' stamp: 'HAW 5/22/2022 18:11:27'!
valueFrom: aReadStream into: aSession

	^(self from: aReadStream into: aSession) value! !


!CustomerImporter class methodsFor: 'error descriptions' stamp: 'MYB 6/23/2022 20:51:52'!
addressRecordInvalidQuantityOfFieldsErrorDescription
	
	^'Address record must have six fields'! !

!CustomerImporter class methodsFor: 'error descriptions' stamp: 'MYB 6/23/2022 20:11:27'!
addressRecordMustHavePreviousCustomerRecordErrorDescription
	
	^'Address record must have previous customer record imported'! !

!CustomerImporter class methodsFor: 'error descriptions' stamp: 'MYB 6/23/2022 20:52:20'!
customerRecordInvalidQuantityOfFieldsErrorDescription
	
	^'Customer record must have five fiels'! !

!CustomerImporter class methodsFor: 'error descriptions' stamp: 'MYB 6/23/2022 19:48:58'!
invalidRecordTypeErrorDescription
	
	^'This type is not for a valid record'! !


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
