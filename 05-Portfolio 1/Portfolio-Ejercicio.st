!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'portfolio account portfolio2 account2 portfolio3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:05:39'!
test01PortfolioHaveZeroAsBalanceWhenCreated 

	self assert: 0 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:12:10'!
test02PortfolioCanAddOneAccount
	
	portfolio addRegistry: account.

	self assert: 1 equals: portfolio quantityOfRegistries.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:19:02'!
test03PortfolioCanAddTwoAccounts
	
	portfolio addRegistry: account.
	portfolio addRegistry: account2.

	self assert: 2 equals: portfolio quantityOfRegistries.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:12:10'!
test04PortfolioIncresesBalanceWhenAddingAnAccountWithDeposit
	
	portfolio addRegistry: account.
	Deposit register: 100 on: account. 

	self assert: 100 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:12:10'!
test05PortfolioIncresesAndDecreasesBalanceWhenAddingAnAccountWithDepositAndWithdraw
	
	portfolio addRegistry: account.
	Deposit register: 100 on: account. 
	Withdraw register: 50 on: account. 

	self assert: 50 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:19:15'!
test06PortfolioIncresesAndDecreasesBalanceWhenAddingManyAccounts
	
	portfolio addRegistry: account.
	portfolio addRegistry: account2.
	
	Deposit register: 100 on: account. 
	Withdraw register: 50 on: account2. 

	self assert: 50 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:12:58'!
test07PortfolioCanAddOnePortfolio
	
	portfolio addRegistry: portfolio2.

	self assert: 1 equals: portfolio quantityOfRegistries.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:22:02'!
test08PortfolioCanAddTwoPortfolio
	
	portfolio addRegistry: portfolio2.
	portfolio addRegistry: portfolio3.
	
	self assert: 2 equals: portfolio quantityOfRegistries.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:14:07'!
test09PortfolioIncresesBalanceWhenAddingAPortfolioWithPositiveBalance
	
	portfolio addRegistry: portfolio2.
	portfolio2 addRegistry: account.
	Deposit register: 100 on: account. 

	self assert: 100 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:22:10'!
test10PortfolioIncresesBalanceWhenAddingManyPortfolioWithPositiveBalance

	portfolio addRegistry: portfolio2.
	portfolio addRegistry: portfolio3.
	
	portfolio2 addRegistry: account.
	Deposit register: 100 on: account. 
	
	portfolio3 addRegistry: account2.
	Withdraw register: 50 on: account2. 

	self assert: 50 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:19:43'!
test11PortfolioIncresesBalanceWhenAddingPortfoliosAndAccountsWithPositiveBalance
	
	portfolio addRegistry: portfolio2.
	portfolio addRegistry: account.
	
	portfolio2 addRegistry: account2.
	Deposit register: 100 on: account2. 
	
	Withdraw register: 50 on: account.

	self assert: 50 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:12:10'!
test12PortfolioWithoutAccountsHasNotRegisteredATransaction

	| deposit |
	
	deposit := Deposit register: 100 on: account.

	self deny: (portfolio hasRegistered: deposit).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:12:10'!
test13PortfolioWithAnAccountWithTransactionsHasRegisteredATransaction

	| deposit |
	
	deposit := Deposit register: 100 on: account.
	
	portfolio addRegistry: account.

	self assert: (portfolio hasRegistered: deposit).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:20:19'!
test14PortfolioWithAnEmptyAccountHasNotRegisteredATransaction

	| deposit |
	
	deposit := Deposit register: 100 on: account.
	
	portfolio addRegistry: account2.

	self deny: (portfolio hasRegistered: deposit).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:20:33'!
test15PortfolioWithTwoAccountsHasRegisteredATransaction

	| deposit |
	
	deposit := Deposit register: 100 on: account.
	
	portfolio addRegistry: account2.
	portfolio addRegistry: account.

	self assert: (portfolio hasRegistered: deposit).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:16:03'!
test16PortfolioHasRegisteredATransactionWhenAddingPortfolioThatHasIt

	| deposit |
	
	deposit := Deposit register: 100 on: account.
	
	portfolio2 addRegistry: account.
	portfolio addRegistry: portfolio2.

	self assert: (portfolio hasRegistered: deposit).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:05:39'!
test17EmptyPortfolioKnowsItsTransactions

	self assert: 0 equals: portfolio transactions size.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:16:13'!
test18PortfolioWithAccountsKnowsItsTransactions

	| deposit transactions |
	
	deposit := Deposit register: 100 on: account.
	
	portfolio addRegistry: account.
	
	transactions := Set with: deposit.

	self assert: 1 equals: portfolio transactions size.
	self assert: transactions equals: portfolio transactions.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/21/2022 18:21:04'!
test19PortfolioWithPortfolioAndAccountKnowsItsTransactions

	| deposit transactions withdraw |
	
	portfolio addRegistry: portfolio2.
	portfolio addRegistry: account.
	portfolio2 addRegistry: account2.
	
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 100 on: account2.
	
	transactions := Set with: deposit with: withdraw.

	self assert: 2 equals: portfolio transactions size.
	self assert: transactions equals: portfolio transactions.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/22/2022 00:37:46'!
test20PortfolioCannotAddTheSameAccountMoreThanOneTime
	
	portfolio addRegistry: account.
	
	self addingAccountToPortfolioShouldRaiseDuplicatedRegistryError.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/22/2022 00:37:42'!
test21PortfolioWithPortfolioInsideWithAccountCannotAddTheSameAccount
	
	portfolio addRegistry: portfolio2.
	portfolio2 addRegistry: account.
	
	self addingAccountToPortfolioShouldRaiseDuplicatedRegistryError.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/22/2022 00:37:32'!
test22PortfolioWithTwoPortfolioNestedWithAccountCannotAddTheSameAccount
	
	portfolio addRegistry: portfolio2.
	portfolio2 addRegistry: portfolio3.
	portfolio3 addRegistry: account.
	
	self addingAccountToPortfolioShouldRaiseDuplicatedRegistryError.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'id 5/22/2022 20:23:37'!
test23PortfolioWithAccountCannotBeAddedToAPortfolioThatAlreadyHasThatAccount
	
	portfolio addRegistry: account.
	portfolio2 addRegistry: account.
	
	self shouldRaiseDuplicatedRegistryErrorWhenAddingPortfolio: portfolio2.
	self assert: 1 equals: portfolio quantityOfRegistries.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'id 5/22/2022 20:23:30'!
test24PortfolioWithPorfolioWithAccountCannotAddAPortfolioThatAlreadyHasThatAccount
	
	portfolio addRegistry: portfolio2.
	portfolio2 addRegistry: account.
	portfolio3 addRegistry: account.
	
	self shouldRaiseDuplicatedRegistryErrorWhenAddingPortfolio: portfolio3.
	self assert: 1 equals: portfolio quantityOfRegistries.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'id 5/22/2022 20:23:58'!
test25PortfolioWithPorfolioCannotAddAPortfolioThatIsAlreadyInTheSecondPortfolio
	
	portfolio addRegistry: portfolio2.
	
	portfolio2 addRegistry: portfolio3.
	
	self shouldRaiseDuplicatedRegistryErrorWhenAddingPortfolio: portfolio3.
	self assert: 1 equals: portfolio quantityOfRegistries.
! !


!PortfolioTest methodsFor: 'setup' stamp: 'MYB 5/21/2022 18:21:48'!
setUp 
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
! !


!PortfolioTest methodsFor: 'assertions' stamp: 'MYB 5/22/2022 00:37:32'!
addingAccountToPortfolioShouldRaiseDuplicatedRegistryError

	self
		should: [ portfolio addRegistry: account ]
		raise: Error
		withMessageText: Portfolio duplicatedRegistryErrorDescription.
	
	self assert: 1 equals: portfolio quantityOfRegistries.! !

!PortfolioTest methodsFor: 'assertions' stamp: 'id 5/22/2022 20:22:55'!
shouldRaiseDuplicatedRegistryErrorWhenAddingPortfolio: aPortfolio

	^ self
		should: [ portfolio addRegistry: aPortfolio. ]
		raise: Error
		withMessageText: Portfolio duplicatedRegistryErrorDescription! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/16/2022 16:18:39'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/16/2022 16:19:11'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
	
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'initialization' stamp: 'MYB 5/16/2022 20:19:11'!
initializeFor: aValue

	value := aValue ! !


!AccountTransaction methodsFor: 'value' stamp: 'MYB 5/16/2022 20:57:59'!
sumToBalance: aBalance

	^ aBalance + (self valueForBalance: value)! !

!AccountTransaction methodsFor: 'value' stamp: 'MYB 5/16/2022 20:11:43'!
value 

	^ value! !


!AccountTransaction methodsFor: 'value - private' stamp: 'MYB 5/16/2022 20:58:58'!
valueForBalance: aValue

	^ self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'value - private' stamp: 'MYB 5/16/2022 20:56:56'!
valueForBalance: aValue

	^ aValue! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'value - private' stamp: 'MYB 5/16/2022 20:57:08'!
valueForBalance: aValue

	^ aValue negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #FinancialRegistry category: 'Portfolio-Ejercicio'!
Object subclass: #FinancialRegistry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!FinancialRegistry methodsFor: 'accesing' stamp: 'MYB 5/19/2022 21:45:46'!
balance

	^ self subclassResponsibility.! !

!FinancialRegistry methodsFor: 'accesing' stamp: 'MYB 5/19/2022 21:33:17'!
transactions 

	^ self subclassResponsibility.
! !


!FinancialRegistry methodsFor: 'assertions' stamp: 'MYB 5/22/2022 00:45:33'!
assertCanBeAddedInConjunctionWith: anAlreadyInsideRegistry
	
	(self = anAlreadyInsideRegistry) ifTrue: [ ^ self signalDuplicatedRegistry ].! !


!FinancialRegistry methodsFor: 'errors' stamp: 'MYB 5/22/2022 00:46:16'!
signalDuplicatedRegistry

	self error: self class duplicatedRegistryErrorDescription! !


!FinancialRegistry methodsFor: 'testing' stamp: 'MYB 5/19/2022 21:32:53'!
hasRegistered: aTransaction

	^ self subclassResponsibility.
! !

!FinancialRegistry methodsFor: 'testing' stamp: 'MYB 5/22/2022 00:49:19'!
hasRegistryInside: aRegistry

	^ false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FinancialRegistry class' category: 'Portfolio-Ejercicio'!
FinancialRegistry class
	instanceVariableNames: ''!

!FinancialRegistry class methodsFor: 'error descriptions' stamp: 'MYB 5/22/2022 00:47:14'!
duplicatedRegistryErrorDescription

	^ 'The registry you are trying to add is already registered inside'! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
FinancialRegistry subclass: #Portfolio
	instanceVariableNames: 'registries'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'accesing' stamp: 'MYB 5/21/2022 17:53:35'!
balance
	
	^ (registries sum: [:registry | registry balance] ifEmpty: [0])! !

!Portfolio methodsFor: 'accesing' stamp: 'MYB 5/21/2022 17:54:22'!
quantityOfRegistries
	
	^ registries size! !

!Portfolio methodsFor: 'accesing' stamp: 'MYB 5/21/2022 17:54:45'!
transactions
	
	| transactions |
	transactions := Set new.
	registries do: [ :registry | transactions addAll: registry transactions].
	
	^transactions! !


!Portfolio methodsFor: 'initialization' stamp: 'MYB 5/21/2022 17:54:13'!
initialize

	registries := Set new.! !


!Portfolio methodsFor: 'modifying' stamp: 'MYB 5/22/2022 16:00:45'!
addRegistry: aRegistry

	self hasRegistryInside: aRegistry.
	aRegistry hasRegistryInside: self.
	
	self hasItsRegistriesInside: aRegistry.

	registries add: aRegistry.! !


!Portfolio methodsFor: 'testing' stamp: 'MYB 5/22/2022 16:00:45'!
hasItsRegistriesInside: aRegistry

	^ registries do: [ :registry | 
		aRegistry hasRegistryInside: registry.
	]! !

!Portfolio methodsFor: 'testing' stamp: 'MYB 5/21/2022 17:54:03'!
hasRegistered: aTransaction
	
	^(registries anySatisfy: [:registry | registry hasRegistered: aTransaction])! !

!Portfolio methodsFor: 'testing' stamp: 'MYB 5/22/2022 15:56:47'!
hasRegistryInside: aRegistry
	
	registries do: [ :registry | 
		aRegistry assertCanBeAddedInConjunctionWith: registry.
		registry hasRegistryInside: aRegistry.
		aRegistry hasRegistryInside: registry.
	].! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
FinancialRegistry subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'accesing' stamp: 'MYB 5/16/2022 20:43:11'!
balance

	| sum |
	sum := 0.
	transactions do: [ :aTransaction | sum := aTransaction sumToBalance: sum ].
	^sum.! !

!ReceptiveAccount methodsFor: 'accesing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'modifying' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
