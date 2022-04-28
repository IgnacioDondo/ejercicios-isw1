!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptyStack emptySet emptyPrefix prefixWithWhitespaces sentenceFinderByPrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'id 4/27/2022 22:39:09'!
setUp

	emptyStack := OOStack new.
	emptySet := Set new.
	
	emptyPrefix := ''.
	prefixWithWhitespaces := 'with spaces'.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new.! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'id 4/27/2022 22:28:29'!
test01ReturnsAnEmptySetWhenStackIsEmpty

	self
		assert: (sentenceFinderByPrefix findSentencesThatArePrefixedWith: 'hello' inStack: emptyStack)
		equals: emptySet.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'id 4/27/2022 22:11:08'!
test02ReturnsAnEmptySetWhenNoSentencesMatchedTheGivenPrefix

	| result stack |
	
	stack := self createNewStackAndPush: #('hello world').

	result := sentenceFinderByPrefix findSentencesThatArePrefixedWith: 'hola' inStack: stack.

	self assert: result equals: emptySet.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'id 4/27/2022 22:27:21'!
test03ReturnsASetWithTheMatchingSentenceWhenOnlyOneSentenceBeganWithTheGivenPrefix

	self
		shouldSearchingHelloInStackWith: #('hello world')
		findTheSentences: #('hello world').! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'id 4/27/2022 22:26:25'!
test04ReturnsASetWithAllTheMatchingSentences

	self
		shouldSearchingHelloInStackWith: #('hello world' 'this sentence does not begin with hello' 'hellofolks')
		findTheSentences: #('hello world' 'hellofolks').! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'id 4/27/2022 22:27:54'!
test05TheSearchIsCaseSensitive

	self
		shouldSearchingHelloInStackWith: #('hello' 'HELLO')
		findTheSentences: #('hello').! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'id 4/27/2022 22:31:47'!
test06CanNotSearchForSentencesWhenPrefixIsEmpty

	self
		shouldSearchingForPrefix: emptyPrefix
		raiseErrorWithMessage: SentenceFinderByPrefix prefixCanNotBeEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'id 4/27/2022 22:32:11'!
test07CanNotSearchForSentencesWhenPrefixContainsWhitespaces

	self
		shouldSearchingForPrefix: prefixWithWhitespaces
		raiseErrorWithMessage: SentenceFinderByPrefix prefixCanNotContainWhitespaces.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'id 4/27/2022 22:40:02'!
test08TheOriginalStackIsNotChangedAfterTheSearchFinishes

	| stack |
	
	stack := self createNewStackAndPush: #('hello' 'world').

	sentenceFinderByPrefix findSentencesThatArePrefixedWith: 'hello' inStack: stack.

	self assert: stack size equals: 2.
	self assert: stack pop equals: 'world'.
	self assert: stack size equals: 1.
	self assert: stack pop equals: 'hello'.
	self assert: stack size equals: 0.! !


!SentenceFinderByPrefixTest methodsFor: 'auxiliary' stamp: 'id 4/27/2022 22:17:05'!
createNewSetAndAdd: aCollectionOfSentences

	| set |

	set := Set new.
	aCollectionOfSentences do: [ :aSentence | set add: aSentence.].
	
	^set.! !

!SentenceFinderByPrefixTest methodsFor: 'auxiliary' stamp: 'id 4/27/2022 22:13:32'!
createNewStackAndPush: aCollectionOfSentences

	| stack |

	stack := OOStack new.
	aCollectionOfSentences do: [ :aSentence | stack push: aSentence.].
	
	^stack.! !

!SentenceFinderByPrefixTest methodsFor: 'auxiliary' stamp: 'id 4/27/2022 22:31:03'!
shouldSearchingForPrefix: anInvalidPrefix raiseErrorWithMessage: anErrorMessage

	| stack |
	
	stack := self createNewStackAndPush: #('hello').

	self
		should: [sentenceFinderByPrefix findSentencesThatArePrefixedWith: anInvalidPrefix inStack: stack.]
		raise: Error
		withMessageText: anErrorMessage.! !

!SentenceFinderByPrefixTest methodsFor: 'auxiliary' stamp: 'id 4/27/2022 22:25:27'!
shouldSearchingHelloInStackWith: anOrderedCollectionOfSentencesInStack findTheSentences: anOrderedCollectionOfFoundSentences

	| expectedResult result stack |
	
	expectedResult := self createNewSetAndAdd: anOrderedCollectionOfFoundSentences.
	stack := self createNewStackAndPush: anOrderedCollectionOfSentencesInStack.

	result := sentenceFinderByPrefix findSentencesThatArePrefixedWith: 'hello' inStack: stack.

	self assert: result equals: expectedResult.! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'MB 4/27/2022 18:31:35'!
initialize

	stack := StackBase new.! !


!OOStack methodsFor: 'operations' stamp: 'MB 4/27/2022 18:36:26'!
pop
	
	| item |
	item := self top.
	stack := stack previousStackItem.
	^item.
	! !

!OOStack methodsFor: 'operations' stamp: 'MB 4/27/2022 18:38:23'!
push: anObject

	stack := stack push: anObject.
	! !

!OOStack methodsFor: 'operations' stamp: 'MB 4/27/2022 18:31:54'!
size
	
	^stack size.
	! !

!OOStack methodsFor: 'operations' stamp: 'MB 4/27/2022 18:32:11'!
top
	
	^stack top.
	
	! !


!OOStack methodsFor: 'testing' stamp: 'MB 4/27/2022 18:32:52'!
isEmpty

	^stack isEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/16/2021 17:39:43'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #Prefix category: #'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Prefix methodsFor: 'as yet unclassified' stamp: 'id 4/27/2022 22:49:51'!
with: aString! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prefix class' category: #'Stack-Exercise'!
Prefix class
	instanceVariableNames: ''!

!Prefix class methodsFor: 'as yet unclassified' stamp: 'id 4/27/2022 22:43:55'!
with: aString

	^(self subclasses detect: [ :aPrefixClass | aPrefixClass correspondsTo: aString ]) with: aString.! !


!classDefinition: #EmptyPrefix category: #'Stack-Exercise'!
Prefix subclass: #EmptyPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyPrefix class' category: #'Stack-Exercise'!
EmptyPrefix class
	instanceVariableNames: ''!

!EmptyPrefix class methodsFor: 'as yet unclassified' stamp: 'id 4/27/2022 22:44:19'!
correspondsTo: aString

	^aString isEmpty.! !

!EmptyPrefix class methodsFor: 'as yet unclassified' stamp: 'id 4/27/2022 22:47:47'!
with: aString

	^self new.! !


!classDefinition: #NonEmptyPrefixWithNoWhitespaces category: #'Stack-Exercise'!
Prefix subclass: #NonEmptyPrefixWithNoWhitespaces
	instanceVariableNames: 'stringValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyPrefixWithNoWhitespaces methodsFor: 'initialization' stamp: 'id 4/27/2022 22:48:40'!
with: aString

	stringValue := aString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyPrefixWithNoWhitespaces class' category: #'Stack-Exercise'!
NonEmptyPrefixWithNoWhitespaces class
	instanceVariableNames: ''!

!NonEmptyPrefixWithNoWhitespaces class methodsFor: 'as yet unclassified' stamp: 'id 4/27/2022 22:46:55'!
correspondsTo: aString

	^((aString isEmpty not) and: [(aString includesSubString: ' ') not]).! !

!NonEmptyPrefixWithNoWhitespaces class methodsFor: 'as yet unclassified' stamp: 'id 4/27/2022 22:48:23'!
with: aString

	^self new with: aString.! !


!classDefinition: #NonEmptyPrefixWithWhitespaces category: #'Stack-Exercise'!
Prefix subclass: #NonEmptyPrefixWithWhitespaces
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyPrefixWithWhitespaces class' category: #'Stack-Exercise'!
NonEmptyPrefixWithWhitespaces class
	instanceVariableNames: ''!

!NonEmptyPrefixWithWhitespaces class methodsFor: 'as yet unclassified' stamp: 'id 4/27/2022 22:46:33'!
correspondsTo: aString

	^((aString isEmpty not) and: [aString includesSubString: ' ']).! !

!NonEmptyPrefixWithWhitespaces class methodsFor: 'as yet unclassified' stamp: 'id 4/27/2022 22:48:10'!
with: aString

	^self new.! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'id 4/27/2022 21:52:20'!
assertPrefixIsValid: aPrefix

	aPrefix isEmpty ifTrue: [self error: self class prefixCanNotBeEmpty.].

	(aPrefix includesSubString: ' ') ifTrue: [self error: self class prefixCanNotContainWhitespaces.].! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'id 4/27/2022 22:40:39'!
findSentencesThatArePrefixedWith: aPrefix inStack: aStack

	| sentencesThatBeginWithGivenPrefix temporaryStack currentSentence |

	self assertPrefixIsValid: aPrefix.

	sentencesThatBeginWithGivenPrefix := Set new.
	temporaryStack := OOStack new.

	[aStack isEmpty not] whileTrue:
	[ 
		currentSentence := aStack pop.
		temporaryStack push: currentSentence.
		(currentSentence beginsWith: aPrefix) ifTrue: [sentencesThatBeginWithGivenPrefix add: currentSentence.].
	].

	[temporaryStack isEmpty not] whileTrue:
	[ 
		currentSentence := temporaryStack pop.
		aStack push: currentSentence.
	].

	^sentencesThatBeginWithGivenPrefix.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'id 4/27/2022 21:06:04'!
prefixCanNotBeEmpty

	^'Prefix cannot be empty!!!!!!'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'id 4/27/2022 21:50:59'!
prefixCanNotContainWhitespaces

	^'Prefix cannot contain whitespaces!!!!!!'.! !


!classDefinition: #StackBase category: #'Stack-Exercise'!
Object subclass: #StackBase
	instanceVariableNames: 'size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBase methodsFor: 'initialization' stamp: 'MB 4/27/2022 18:17:29'!
initialize

	size := 0.! !


!StackBase methodsFor: 'operations' stamp: 'MB 4/27/2022 18:50:19'!
push: anItem

	| newStackItem |
	newStackItem := StackItem withItem: anItem previousStackItem: self size: size.
	^newStackItem.
	! !

!StackBase methodsFor: 'operations' stamp: 'MB 4/26/2022 17:59:58'!
size

	^0.! !

!StackBase methodsFor: 'operations' stamp: 'id 4/27/2022 19:03:33'!
top

	self error: OOStack stackEmptyErrorDescription.! !


!StackBase methodsFor: 'testing' stamp: 'MB 4/26/2022 17:59:53'!
isEmpty

	^true.! !


!classDefinition: #StackItem category: #'Stack-Exercise'!
Object subclass: #StackItem
	instanceVariableNames: 'item previousStackItem size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackItem methodsFor: 'initialization' stamp: 'MB 4/27/2022 18:44:31'!
initializeWithItem: anItem withPreviousStackItem: aStackItem size: aSizeInteger

	item := anItem.
	previousStackItem := aStackItem.
	size := aSizeInteger + 1.! !


!StackItem methodsFor: 'operations' stamp: 'MB 4/27/2022 18:22:38'!
previousStackItem

	^previousStackItem.! !

!StackItem methodsFor: 'operations' stamp: 'MB 4/27/2022 18:46:20'!
push: anItem

	^StackItem withItem: anItem previousStackItem: self size: size.! !

!StackItem methodsFor: 'operations' stamp: 'id 4/27/2022 19:07:15'!
size

	^size.! !

!StackItem methodsFor: 'operations' stamp: 'MB 4/27/2022 18:18:53'!
top

	^item.! !


!StackItem methodsFor: 'testing' stamp: 'MB 4/27/2022 18:18:35'!
isEmpty

	^false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackItem class' category: #'Stack-Exercise'!
StackItem class
	instanceVariableNames: ''!

!StackItem class methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:52:51'!
withItem: anItem previousStackItem: aStackItem size: aSizeInteger

	^self new
		initializeWithItem: anItem 
		withPreviousStackItem: aStackItem 
		size: aSizeInteger.! !
