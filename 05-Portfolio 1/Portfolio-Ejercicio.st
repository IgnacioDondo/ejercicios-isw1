!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/16/2022 21:11:51'!
test01PortfolioHaveZeroAsBalanceWhenCreated 

	| portfolio |
	
	portfolio := Portfolio new.

	self assert: 0 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/16/2022 21:18:14'!
test02PortfolioCanAddOneAccount

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio addReceptiveAccount: account.

	self assert: 1 equals: portfolio quantityOfAccounts.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/16/2022 21:20:08'!
test03PortfolioCanAddTwoAccounts

	| portfolio account1 account2 |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio addReceptiveAccount: account1.
	portfolio addReceptiveAccount: account2.

	self assert: 2 equals: portfolio quantityOfAccounts.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/16/2022 21:27:43'!
test04PortfolioIncresesBalanceWhenAddingAnAccountWithDeposit

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio addReceptiveAccount: account.
	Deposit register: 100 on: account. 

	self assert: 100 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/16/2022 21:30:56'!
test05PortfolioIncresesAndDecreasesBalanceWhenAddingAnAccountWithDepositAndWithdraw

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio addReceptiveAccount: account.
	Deposit register: 100 on: account. 
	Withdraw register: 50 on: account. 

	self assert: 50 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/16/2022 21:34:50'!
test06PortfolioIncresesAndDecreasesBalanceWhenAddingManyAccounts

	| portfolio account1 account2 |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio addReceptiveAccount: account1.
	portfolio addReceptiveAccount: account2.
	
	Deposit register: 100 on: account1. 
	Withdraw register: 50 on: account1. 
	
	Deposit register: 250 on: account2. 
	Withdraw register: 100 on: account2. 

	self assert: 200 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/16/2022 21:39:37'!
test07PortfolioCanAddOnePortfolio

	| portfolio portfolioInside |
	
	portfolio := Portfolio new.
	portfolioInside := Portfolio new.
	
	portfolio addPortfolio: portfolioInside.

	self assert: 1 equals: portfolio quantityOfPortfolios.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/16/2022 21:40:56'!
test08PortfolioCanAddTwoPortfolio

	| portfolio portfolioInside1 portfolioInside2 |
	
	portfolio := Portfolio new.
	portfolioInside1 := Portfolio new.
	portfolioInside2 := Portfolio new.
	
	portfolio addPortfolio: portfolioInside1.
	portfolio addPortfolio: portfolioInside2.
	
	self assert: 2 equals: portfolio quantityOfPortfolios.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/16/2022 21:44:51'!
test09PortfolioIncresesBalanceWhenAddingAPortfolioWithPositiveBalance

	| portfolio account portfolioInside |
	
	portfolio := Portfolio new.
	portfolioInside := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio addPortfolio: portfolioInside.
	portfolioInside addReceptiveAccount: account.
	Deposit register: 100 on: account. 

	self assert: 100 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/16/2022 21:51:05'!
test10PortfolioIncresesBalanceWhenAddingManyPortfolioWithPositiveBalance

	| portfolio account1 account2 portfolioInside1 portfolioInside2 |
	
	portfolio := Portfolio new.
	portfolioInside1 := Portfolio new.
	portfolioInside2 := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio addPortfolio: portfolioInside1.
	portfolio addPortfolio: portfolioInside2.
	
	portfolioInside1 addReceptiveAccount: account1.
	Deposit register: 100 on: account1. 
	
	portfolioInside2 addReceptiveAccount: account2.
	Withdraw register: 50 on: account2. 

	self assert: 50 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'MYB 5/16/2022 21:57:01'!
test11PortfolioIncresesBalanceWhenAddingPortfoliosAndAccountsWithPositiveBalance

	| portfolio account portfolioInside accountInside |
	
	portfolio := Portfolio new.
	portfolioInside := Portfolio new.
	account := ReceptiveAccount new.
	accountInside := ReceptiveAccount new.
	
	portfolio addPortfolio: portfolioInside.
	portfolio addReceptiveAccount: account.
	
	portfolioInside addReceptiveAccount: accountInside.
	Deposit register: 100 on: accountInside. 
	
	Withdraw register: 50 on: account.

	self assert: 50 equals: portfolio balance.
! !


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

!AccountTransaction methodsFor: 'value - private' stamp: 'MYB 5/16/2022 20:58:58'!
valueForBalance: aValue

	^ self subclassResponsibility ! !


!AccountTransaction methodsFor: 'value' stamp: 'MYB 5/16/2022 20:57:59'!
sumToBalance: aBalance

	^ aBalance + (self valueForBalance: value)! !

!AccountTransaction methodsFor: 'value' stamp: 'MYB 5/16/2022 20:11:43'!
value 

	^ value! !


!AccountTransaction methodsFor: 'initialization' stamp: 'MYB 5/16/2022 20:19:11'!
initializeFor: aValue

	value := aValue ! !

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


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'receptiveAccounts portfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'MYB 5/16/2022 21:57:57'!
balance
	
	^ (portfolios sum: [:portfolio | portfolio balance] ifEmpty: [0]) +
		(receptiveAccounts sum: [:account | account balance] ifEmpty: [0])! !


!Portfolio methodsFor: 'modifying' stamp: 'MYB 5/16/2022 21:42:01'!
addPortfolio: aPortfolio 
	
	portfolios add: aPortfolio ! !

!Portfolio methodsFor: 'modifying' stamp: 'MYB 5/16/2022 21:22:40'!
addReceptiveAccount: aReceptiveAccount 
	
	receptiveAccounts add: aReceptiveAccount ! !


!Portfolio methodsFor: 'accesing' stamp: 'MYB 5/16/2022 21:22:55'!
quantityOfAccounts
	
	^ receptiveAccounts size! !

!Portfolio methodsFor: 'accesing' stamp: 'MYB 5/16/2022 21:41:43'!
quantityOfPortfolios
	
	^ portfolios size! !


!Portfolio methodsFor: 'initializing' stamp: 'MYB 5/16/2022 21:41:29'!
initialize

	receptiveAccounts := Set new.
	portfolios := Set new.! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'MYB 5/16/2022 20:43:11'!
balance

	| sum |
	sum := 0.
	transactions do: [ :aTransaction | sum := aTransaction sumToBalance: sum ].
	^sum.! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
