!classDefinition: #PortfolioTest category: 'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioTest methodsFor: 'creators' stamp: 'MYB 5/30/2022 00:05:58'!
createAccountSummaryReportOf: anAccount

	^(AccountSummaryReport of: anAccount) value! !

!PortfolioTest methodsFor: 'creators' stamp: 'MYB 5/30/2022 00:05:52'!
createTransferNetReportOf: anAccount

	^(TransferNetReport of: anAccount) value! !

!PortfolioTest methodsFor: 'creators' stamp: 'id 5/29/2022 18:09:50'!
splitWithLineBreak: aCollectionOfStrings

	^aCollectionOfStrings
		inject: ''
		into: [ :currentString :aString |
			currentString , aString , String newLineString
		].! !


!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 5/27/2021 17:36:04'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!PortfolioTest methodsFor: 'tests - account summary' stamp: 'MYB 5/30/2022 00:06:41'!
test16AccountSummaryOnlyPrintsBalanceForPortfoliosWithNoTransactions

	| portfolio expectedAccountSummary |
	
	portfolio := Portfolio new.
	
	expectedAccountSummary := self splitWithLineBreak: #('Balance = 0').
	
	self assert: (self createAccountSummaryReportOf: portfolio) equals: expectedAccountSummary.! !

!PortfolioTest methodsFor: 'tests - account summary' stamp: 'MYB 5/30/2022 00:23:47'!
test17AccountSummaryPrintsCorrectAccountSummaryWhenHavingOnlyOneAccount

	| portfolio account expectedAccountSummary |

	account := ReceptiveAccount new.
	portfolio  := Portfolio with: account.
	
	expectedAccountSummary := self splitWithLineBreak: #( 'Balance = 0' ).
	
	self assert: (self createAccountSummaryReportOf: portfolio) equals:  expectedAccountSummary.! !

!PortfolioTest methodsFor: 'tests - account summary' stamp: 'MYB 5/30/2022 00:24:03'!
test18AccountSummaryPrintsCorrectAccountSummaryWhenHavingMultipleAccounts

	| portfolio account1 account2 expectedAccountSummary |

	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 on: account1.
	Withdraw register: 30 on: account2.
	
	portfolio := Portfolio with: account1 with: account2.
	
	expectedAccountSummary := self splitWithLineBreak: #('Depósito por 100.' 'Extracción por 30.' 'Balance = 70').
	
	self assert: (self createAccountSummaryReportOf: portfolio) equals: expectedAccountSummary.! !

!PortfolioTest methodsFor: 'tests - account summary' stamp: 'MYB 5/30/2022 00:24:20'!
test19AccountSummaryPrintsCorrectAccountSummaryWhenHavingOnePortfolio

	| portfolio1 portfolio2 account expectedAccountSummary |

	account := ReceptiveAccount new.
	
	Deposit register: 100 on: account.
	
	portfolio2 := Portfolio with: account.
	portfolio1 := Portfolio with: portfolio2.
	
	expectedAccountSummary := self splitWithLineBreak: #('Depósito por 100.' 'Balance = 100').
	
	self assert: (self createAccountSummaryReportOf: portfolio1) equals: expectedAccountSummary.! !

!PortfolioTest methodsFor: 'tests - account summary' stamp: 'MYB 5/30/2022 00:24:36'!
test20AccountSummaryPrintsCorrectAccountSummaryWhenHavingMultiplePortfolios

	| portfolio1 portfolio2 portfolio3 account1 account2 expectedAccountSummary |

	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 on: account1.
	Withdraw register: 20 on: account2.
	
	portfolio2 := Portfolio with: account1.
	portfolio3 := Portfolio with: account2.
	portfolio1 := Portfolio with: portfolio2 with: portfolio3.
	
	expectedAccountSummary := self splitWithLineBreak: #('Depósito por 100.' 'Extracción por 20.' 'Balance = 80').
	
	self assert: (self createAccountSummaryReportOf: portfolio1) equals: expectedAccountSummary.! !

!PortfolioTest methodsFor: 'tests - account summary' stamp: 'MYB 5/30/2022 00:24:58'!
test21AccountSummaryPrintsCorrectAccountSummaryWhenHavingMultiplePortfoliosAndAccounts

	| portfolio1 portfolio2 portfolio3 account1 account2 account3 account4 expectedAccountSummary |

	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	account4 := ReceptiveAccount new.
	
	Deposit register: 100 on: account1.
	Withdraw register: 20 on: account2.
	Transfer register: 50 from: account3 to: account4.
	
	portfolio2 := Portfolio with: account1.
	portfolio3 := Portfolio with: account2.
	portfolio1 := Portfolio with: portfolio2 with: portfolio3.
	portfolio1 add: account3.
	portfolio1 add: account4.
	
	expectedAccountSummary := self splitWithLineBreak: #('Depósito por 100.' 'Extracción por 20.' 'Salida por transferencia de 50.' 'Entrada por transferencia de 50.' 'Balance = 80').

	self assert: (self createAccountSummaryReportOf: portfolio1) equals: expectedAccountSummary.! !


!PortfolioTest methodsFor: 'tests - transfer net' stamp: 'MYB 5/30/2022 00:25:23'!
test22TransferNetReturnsZeroForPortfolioWithAccountWithNoTransfers

	| portfolio account |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.

	self assert: 0 equals: (self createTransferNetReportOf: portfolio) .! !

!PortfolioTest methodsFor: 'tests - transfer net' stamp: 'MYB 5/30/2022 00:25:28'!
test23TransferNetReturnsTransferValueForDepositTransfer

	| portfolio account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Transfer register: 10 from: account2 to: account1.
	
	portfolio := Portfolio with: account1.

	self assert: 10 equals: (self createTransferNetReportOf: portfolio).! !

!PortfolioTest methodsFor: 'tests - transfer net' stamp: 'MYB 5/30/2022 00:25:34'!
test24TransferNetReturnsTheSumOfTransferValuesForPortfolioWithAccountsWithTwoTransfers

	| portfolio account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Transfer register: 10 from: account2 to: account1.
	
	portfolio := Portfolio with: account1 with: account2.

	self assert: 0 equals: (self createTransferNetReportOf: portfolio).! !

!PortfolioTest methodsFor: 'tests - transfer net' stamp: 'MYB 5/30/2022 00:25:56'!
test25TransferNetReturnsTheSumOfTransferValuesForPortfolioWithAccountsWithMultipleTransfersAndOtherTransactions

	| account1 account2 account3 portfolio1 portfolio2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	
	Transfer register: 10 from: account2 to: account1.
	Transfer register: 10 from: account3 to: account1.
	Deposit register: 100 on: account1.
	
	portfolio2 := Portfolio with: account1 with: account2.
	portfolio1 := Portfolio with: portfolio2.

	self assert: 10 equals: (self createTransferNetReportOf: portfolio1).! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccountTest methodsFor: 'creators' stamp: 'MYB 5/29/2022 23:56:43'!
createAccountSummaryReportOf: anAccount

	^(AccountSummaryReport of: anAccount) value! !

!ReceptiveAccountTest methodsFor: 'creators' stamp: 'MYB 5/29/2022 23:57:17'!
createTransferNetReportOf: anAccount

	^(TransferNetReport of: anAccount) value! !

!ReceptiveAccountTest methodsFor: 'creators' stamp: 'id 5/29/2022 18:11:55'!
splitWithLineBreak: aCollectionOfStrings

	^aCollectionOfStrings
		inject: ''
		into: [ :currentString :aString |
			currentString , aString , String newLineString
		].! !


!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'id 5/28/2022 17:46:51'!
test08TransferIncreasesBalanceOnOneAccountAndDecreasesItInTheOtherOne 

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 on: account1.
	Deposit register: 100 on: account2.
	
	Transfer register: 10 from: account1 to: account2.
	
	self assert: account1 balance equals: 90.
	self assert: account2 balance equals: 110.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'id 5/28/2022 18:04:39'!
test09TransferIsRegisteredInBothAccounts 

	| account1 account2 transfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 on: account1.
	Deposit register: 100 on: account2.
	
	transfer := Transfer register: 10 from: account1 to: account2.
	
	self assert: (account1 hasRegistered: transfer withdrawLeg).
	self assert: (account2 hasRegistered: transfer depositLeg).! !


!ReceptiveAccountTest methodsFor: 'tests - account summary' stamp: 'MYB 5/29/2022 23:57:48'!
test10AccountSummaryOnlyPrintsBalanceForAccountWithNoTransactions

	| account expectedAccountSummary |
	
	account := ReceptiveAccount new.
	
	expectedAccountSummary := self splitWithLineBreak: #('Balance = 0').
	
	self assert: (self createAccountSummaryReportOf: account) equals: expectedAccountSummary.! !

!ReceptiveAccountTest methodsFor: 'tests - account summary' stamp: 'MYB 5/30/2022 00:01:29'!
test11AccountSummaryPrintsCorrectLineForDeposits

	| account expectedAccountSummary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	expectedAccountSummary := self splitWithLineBreak: #('Depósito por 100.' 'Balance = 100').
	
	self assert: (self createAccountSummaryReportOf: account) equals: expectedAccountSummary.! !

!ReceptiveAccountTest methodsFor: 'tests - account summary' stamp: 'MYB 5/30/2022 00:01:34'!
test12AccountSummaryPrintsCorrectLineForDepositsAndWithdraws

	| account expectedAccountSummary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
	
	expectedAccountSummary := self splitWithLineBreak: #('Depósito por 100.' 'Extracción por 50.' 'Balance = 50').
	
	self assert: (self createAccountSummaryReportOf: account) equals: expectedAccountSummary.! !

!ReceptiveAccountTest methodsFor: 'tests - account summary' stamp: 'MYB 5/30/2022 00:01:50'!
test13AccountSummaryPrintsCorrectLineForDepositsAndWithdrawsWithNegativeBalance

	| account expectedAccountSummary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 150 on: account.
	
	expectedAccountSummary := self splitWithLineBreak: #('Depósito por 100.' 'Extracción por 150.' 'Balance = -50').
	
	self assert: (self createAccountSummaryReportOf: account) equals: expectedAccountSummary.! !

!ReceptiveAccountTest methodsFor: 'tests - account summary' stamp: 'MYB 5/30/2022 00:02:09'!
test14AccountSummaryPrintsCorrectLineForWithdrawTransfers

	| account1 account2 expectedAccountSummary |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Transfer register: 20 from: account1 to: account2.
	
	expectedAccountSummary := self splitWithLineBreak: #( 'Salida por transferencia de 20.' 'Balance = -20').
	
	self assert: (self createAccountSummaryReportOf: account1) equals: expectedAccountSummary.! !

!ReceptiveAccountTest methodsFor: 'tests - account summary' stamp: 'MYB 5/30/2022 00:02:17'!
test15AccountSummaryPrintsCorrectLineForDepositTransfers

	| account1 account2 expectedAccountSummary |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Transfer register: 20 from: account2 to: account1.
	
	expectedAccountSummary := self splitWithLineBreak: #('Entrada por transferencia de 20.' 'Balance = 20').
	
	self assert: (self createAccountSummaryReportOf: account1) equals: expectedAccountSummary.! !

!ReceptiveAccountTest methodsFor: 'tests - account summary' stamp: 'MYB 5/30/2022 00:02:27'!
test16AccountSummaryPrintsCorrectLineForAccountWithMultipleTransactions

	| account1 account2 expectedAccountSummary |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 on: account1.
	Transfer register: 20 from: account1 to: account2.
	Deposit register: 200 on: account1.
	Withdraw register: 10 on: account1.
	Transfer register: 20 from: account2 to: account1.
	
	expectedAccountSummary := self splitWithLineBreak: #('Depósito por 100.' 'Salida por transferencia de 20.' 'Depósito por 200.' 'Extracción por 10.' 'Entrada por transferencia de 20.' 'Balance = 290').
	
	self assert: (self createAccountSummaryReportOf: account1) equals: expectedAccountSummary.! !

!ReceptiveAccountTest methodsFor: 'tests - account summary' stamp: 'MYB 5/30/2022 00:02:34'!
test17AccountSummaryPrintsCorrectLineForAccountWithMultipleTransactionsWithNegativeBalance

	| account1 account2 expectedAccountSummary |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 on: account1.
	Transfer register: 20 from: account1 to: account2.
	Withdraw register: 300 on: account1.
	Transfer register: 20 from: account2 to: account1.
	
	expectedAccountSummary := self splitWithLineBreak: #('Depósito por 100.' 'Salida por transferencia de 20.' 'Extracción por 300.' 'Entrada por transferencia de 20.' 'Balance = -200').
	
	self assert: (self createAccountSummaryReportOf: account1) equals: expectedAccountSummary.! !


!ReceptiveAccountTest methodsFor: 'tests - transfer net' stamp: 'MYB 5/30/2022 00:03:13'!
test18TransferNetReturnsZeroForAccountWithNoTransfers

	| account |
	
	account := ReceptiveAccount new.
	
	self assert: 0 equals: (self createTransferNetReportOf: account).! !

!ReceptiveAccountTest methodsFor: 'tests - transfer net' stamp: 'MYB 5/30/2022 00:03:26'!
test19TransferNetReturnsTransferValueForDepositTransfer

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Transfer register: 10 from: account2 to: account1.
	
	self assert: 10 equals: (self createTransferNetReportOf: account1).! !

!ReceptiveAccountTest methodsFor: 'tests - transfer net' stamp: 'MYB 5/30/2022 00:03:32'!
test20TransferNetReturnsTransferValueForWithdrawTransfer

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Transfer register: 10 from: account1 to: account2.
	
	self assert: -10 equals: (self createTransferNetReportOf: account1).! !

!ReceptiveAccountTest methodsFor: 'tests - transfer net' stamp: 'MYB 5/30/2022 00:03:37'!
test21TransferNetReturnsTheSumOfTransferValuesForAccountWithMultipleDepositTransfers

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Transfer register: 20 from: account2 to: account1.
	Transfer register: 100 from: account2 to: account1.
	
	self assert: 120 equals: (self createTransferNetReportOf: account1).! !

!ReceptiveAccountTest methodsFor: 'tests - transfer net' stamp: 'MYB 5/30/2022 00:03:44'!
test22TransferNetReturnsTheSumOfTransferValuesForAccountWithMultipleWithdrawTransfers

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Transfer register: 20 from: account1 to: account2.
	Transfer register: 100 from: account1 to: account2.
	
	self assert: -120 equals: (self createTransferNetReportOf: account1).! !

!ReceptiveAccountTest methodsFor: 'tests - transfer net' stamp: 'MYB 5/30/2022 00:03:50'!
test23TransferNetReturnsTheSumOfTransferValuesForAccountWithMultipleTransfers

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Transfer register: 100 from: account2 to: account1.
	Transfer register: 10 from: account1 to: account2.
	Transfer register: 40 from: account1 to: account2.
	Transfer register: 200 from: account2 to: account1.
	
	self assert: 250 equals: (self createTransferNetReportOf: account1).! !

!ReceptiveAccountTest methodsFor: 'tests - transfer net' stamp: 'MYB 5/30/2022 00:03:56'!
test24TransferNetReturnsTheSumOfTransferValuesForAccountWithMultipleTransfersWithNegativeTransferNet

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Transfer register: 100 from: account1 to: account2.
	Transfer register: 10 from: account2 to: account1.
	Transfer register: 40 from: account2 to: account1.
	Transfer register: 200 from: account1 to: account2.
	
	self assert: -250 equals: (self createTransferNetReportOf: account1).! !

!ReceptiveAccountTest methodsFor: 'tests - transfer net' stamp: 'MYB 5/30/2022 00:04:03'!
test25DepositAndWithdrawDoNotAffectTheTransferNetValue

	| account |
	
	account := ReceptiveAccount new.
	
	Deposit register: 100 on: account.
	Withdraw register: 30 on: account.
	
	self assert: 0 equals: (self createTransferNetReportOf: account).! !


!classDefinition: #TransferTest category: 'Portfolio-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferTest methodsFor: 'auxiliary' stamp: 'id 5/30/2022 01:03:16'!
depositOnAccountsAndTransferFrom: originAccount to: destinationAccount

	Deposit register: 100 on: originAccount.
	Deposit register: 100 on: destinationAccount.
	
	^Transfer register: 10 from: originAccount to: destinationAccount.! !


!TransferTest methodsFor: 'tests' stamp: 'id 5/30/2022 01:03:47'!
test01TransferIncreasesBalanceOfOriginAccountAndDecreasesBalanceOfDestinationAccount

	| originAccount destinationAccount transfer |
	
	originAccount := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	transfer := self depositOnAccountsAndTransferFrom: originAccount to: destinationAccount.
	
	self assert: 10 equals: transfer value.
	self assert: 90 equals: originAccount balance.
	self assert: 110 equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'id 5/30/2022 01:03:42'!
test02TransferRegistersTheTransactionOnOriginAccountAndDestinationAccount

	| originAccount destinationAccount transfer |
	
	originAccount := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	transfer := self depositOnAccountsAndTransferFrom: originAccount to: destinationAccount.
	
	self assert: (originAccount hasRegistered: transfer withdrawLeg).
	self assert: (destinationAccount hasRegistered: transfer depositLeg).! !

!TransferTest methodsFor: 'tests' stamp: 'id 5/30/2022 01:03:58'!
test03CanNavigateFromOriginLegToDestinationLeg

	| originAccount destinationAccount transfer withdrawLeg depositLeg |
	
	originAccount := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	transfer := self depositOnAccountsAndTransferFrom: originAccount to: destinationAccount.
	withdrawLeg := transfer withdrawLeg.
	depositLeg  := transfer depositLeg.
	
	self assert: withdrawLeg depositLeg equals: depositLeg.! !

!TransferTest methodsFor: 'tests' stamp: 'id 5/30/2022 01:04:06'!
test04CanNavigateFromDestinationLegToOriginLeg

	| originAccount destinationAccount transfer withdrawLeg depositLeg |
	
	originAccount := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	transfer := self depositOnAccountsAndTransferFrom: originAccount to: destinationAccount.
	withdrawLeg := transfer withdrawLeg.
	depositLeg  := transfer depositLeg.
	
	self assert: depositLeg withdrawLeg equals: withdrawLeg.! !


!classDefinition: #Account category: 'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!Account methodsFor: 'reports' stamp: 'MYB 5/29/2022 23:24:02'!
useReporter: aReporter
	
	self subclassResponsibility ! !


!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'reports' stamp: 'MYB 5/29/2022 23:24:02'!
useReporter: aReporter
	
	^accounts do: [ :anAccount | anAccount useReporter: aReporter].! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'reports' stamp: 'MYB 5/29/2022 23:24:02'!
useReporter: aReporter
	
	^transactions do: [ :aTransaction | aTransaction useReporter: aReporter].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #AccountTransaction category: 'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'initialization' stamp: 'MYB 5/30/2022 00:31:39'!
initializeFor: aValue

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'reports' stamp: 'id 5/29/2022 17:13:50'!
useReporter: aReporter

	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'reports' stamp: 'id 5/29/2022 17:14:15'!
useReporter: aReporter

	^aReporter reportForDeposit: self.! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: 'Portfolio-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferLeg methodsFor: 'balance' stamp: 'id 5/28/2022 17:15:07'!
affectBalance: aBalance
	
	self subclassResponsibility.! !


!TransferLeg methodsFor: 'initialization' stamp: 'id 5/28/2022 17:31:23'!
initializeFor: aTransfer 
	
	transfer := aTransfer.! !


!TransferLeg methodsFor: 'reports' stamp: 'MYB 5/29/2022 23:24:52'!
useReporter: aReporter

	self subclassResponsibility.! !


!TransferLeg methodsFor: 'value' stamp: 'id 5/28/2022 17:15:24'!
value
	
	^transfer value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'Portfolio-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'id 5/28/2022 17:31:42'!
for: aTransfer
	
	^self new initializeFor: aTransfer! !


!classDefinition: #DepositTransferLeg category: 'Portfolio-Solucion'!
TransferLeg subclass: #DepositTransferLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!DepositTransferLeg methodsFor: 'accessing' stamp: 'id 5/28/2022 18:04:39'!
withdrawLeg
	
	^transfer withdrawLeg.! !


!DepositTransferLeg methodsFor: 'balance' stamp: 'id 5/28/2022 17:11:50'!
affectBalance: aBalance
	
	^aBalance + self value.! !


!DepositTransferLeg methodsFor: 'reports' stamp: 'id 5/29/2022 17:14:35'!
useReporter: aReporter

	^aReporter reportForDepositTransferLeg: self.! !


!classDefinition: #WithdrawTransferLeg category: 'Portfolio-Solucion'!
TransferLeg subclass: #WithdrawTransferLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!WithdrawTransferLeg methodsFor: 'accessing' stamp: 'id 5/28/2022 18:04:26'!
depositLeg
	
	^transfer depositLeg.! !


!WithdrawTransferLeg methodsFor: 'balance' stamp: 'id 5/28/2022 17:02:55'!
affectBalance: aBalance
	
	^aBalance - self value.! !


!WithdrawTransferLeg methodsFor: 'reports' stamp: 'id 5/29/2022 17:14:44'!
useReporter: aReporter

	^aReporter reportForWithdrawTransferLeg: self.! !


!classDefinition: #Withdraw category: 'Portfolio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'reports' stamp: 'id 5/29/2022 17:14:27'!
useReporter: aReporter

	^aReporter reportForWithdraw: self.! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Report category: 'Portfolio-Solucion'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Report methodsFor: 'accesing' stamp: 'MYB 5/30/2022 00:30:18'!
value
	
	self subclassResponsibility ! !


!Report methodsFor: 'initialization' stamp: 'MYB 5/30/2022 00:15:49'!
initializeOf: anAccount 

	anAccount useReporter: self.! !


!Report methodsFor: 'report' stamp: 'MYB 5/30/2022 00:29:00'!
reportForDeposit: aDeposit

	self subclassResponsibility 
! !

!Report methodsFor: 'report' stamp: 'MYB 5/30/2022 00:28:52'!
reportForDepositTransferLeg: aDepositTransferLeg

	self subclassResponsibility 
! !

!Report methodsFor: 'report' stamp: 'MYB 5/30/2022 00:29:24'!
reportForWithdraw: aWithdraw

	self subclassResponsibility 
! !

!Report methodsFor: 'report' stamp: 'MYB 5/30/2022 00:29:13'!
reportForWithdrawTransferLeg: aWithdrawTransferLeg

	self subclassResponsibility 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'Portfolio-Solucion'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 'MYB 5/30/2022 00:16:18'!
of: anAccount 
	
	^self new initializeOf: anAccount.! !


!classDefinition: #AccountSummaryReport category: 'Portfolio-Solucion'!
Report subclass: #AccountSummaryReport
	instanceVariableNames: 'summary balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryReport methodsFor: 'accesing' stamp: 'MYB 5/30/2022 00:00:59'!
value

	^ summary , 'Balance = ', (balance asString), String newLineString.! !


!AccountSummaryReport methodsFor: 'initialization' stamp: 'MYB 5/29/2022 23:58:46'!
initialize

	summary := ''.
	balance := 0.! !


!AccountSummaryReport methodsFor: 'report' stamp: 'MYB 5/29/2022 23:59:06'!
reportForDeposit: aDeposit

	balance := aDeposit affectBalance: balance.
	summary := summary , 'Depósito por ', (aDeposit value) asString, '.' , String newLineString.! !

!AccountSummaryReport methodsFor: 'report' stamp: 'MYB 5/29/2022 23:59:29'!
reportForDepositTransferLeg: aDepositTransferLeg

	balance := aDepositTransferLeg affectBalance: balance.
	summary := summary , 'Entrada por transferencia de ', (aDepositTransferLeg value) asString, '.' , String newLineString.! !

!AccountSummaryReport methodsFor: 'report' stamp: 'MYB 5/29/2022 23:59:33'!
reportForWithdraw: aWithdraw

	balance := aWithdraw affectBalance: balance.
	summary := summary , 'Extracción por ', (aWithdraw value) asString, '.' , String newLineString.! !

!AccountSummaryReport methodsFor: 'report' stamp: 'MYB 5/29/2022 23:59:38'!
reportForWithdrawTransferLeg: aWithdrawTransferLeg

	balance := aWithdrawTransferLeg affectBalance: balance.
	summary := summary , 'Salida por transferencia de ', (aWithdrawTransferLeg value) asString, '.' , String newLineString.! !


!classDefinition: #TransferNetReport category: 'Portfolio-Solucion'!
Report subclass: #TransferNetReport
	instanceVariableNames: 'transferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetReport methodsFor: 'accesing' stamp: 'MYB 5/29/2022 23:45:24'!
value
	
	^transferNet.! !


!TransferNetReport methodsFor: 'initialization' stamp: 'MYB 5/29/2022 23:41:55'!
initialize
	
	transferNet := 0.! !


!TransferNetReport methodsFor: 'report' stamp: 'MYB 5/29/2022 23:54:13'!
reportForDeposit: aDeposit

	! !

!TransferNetReport methodsFor: 'report' stamp: 'MYB 5/29/2022 23:52:02'!
reportForDepositTransferLeg: aDepositTransferLeg

	transferNet := aDepositTransferLeg affectBalance: transferNet.! !

!TransferNetReport methodsFor: 'report' stamp: 'MYB 5/29/2022 23:54:07'!
reportForWithdraw: aWithdraw

	! !

!TransferNetReport methodsFor: 'report' stamp: 'MYB 5/29/2022 23:53:09'!
reportForWithdrawTransferLeg: aWithdrawTransferLeg

	transferNet := aWithdrawTransferLeg affectBalance: transferNet.! !


!classDefinition: #Transfer category: 'Portfolio-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Transfer methodsFor: 'accessing' stamp: 'id 5/28/2022 18:04:26'!
depositLeg
	
	^depositLeg.! !

!Transfer methodsFor: 'accessing' stamp: 'id 5/28/2022 17:04:25'!
value

	^value.! !

!Transfer methodsFor: 'accessing' stamp: 'id 5/28/2022 18:04:39'!
withdrawLeg
	
	^withdrawLeg.! !


!Transfer methodsFor: 'initialization' stamp: 'id 5/28/2022 18:04:10'!
initializeWith: aValue from: anOriginAccount to: aDestinationAccount

	value := aValue.
	withdrawLeg := WithdrawTransferLeg for: self.
	depositLeg := DepositTransferLeg for: self.
	
	anOriginAccount register: withdrawLeg.
	aDestinationAccount register: depositLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'Portfolio-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'id 5/28/2022 17:30:26'!
register: aValue from: anOriginAccount to: aDestinationAccount 

	^self new initializeWith: aValue from: anOriginAccount to: aDestinationAccount.! !

