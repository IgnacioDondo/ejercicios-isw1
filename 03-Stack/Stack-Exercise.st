!classDefinition: #OOStackTest category: 'Stack-Exercise'!
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


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:31:35'!
initialize

	stack := StackBase new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:32:52'!
isEmpty

	^stack isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:36:26'!
pop
	
	| item |
	item := self top.
	stack := stack previousStackItem.
	^item.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:38:23'!
push: anObject

	stack := stack push: anObject.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:31:54'!
size
	
	^stack size.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:32:11'!
top
	
	^stack top.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/16/2021 17:39:43'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StackBase category: 'Stack-Exercise'!
Object subclass: #StackBase
	instanceVariableNames: 'size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBase methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:17:29'!
initialize

	size := 0.! !

!StackBase methodsFor: 'as yet unclassified' stamp: 'MB 4/26/2022 17:59:53'!
isEmpty

	^true.! !

!StackBase methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:50:19'!
push: anItem

	| newStackItem |
	newStackItem := StackItem withItem: anItem previousStackItem: self size: size.
	^newStackItem.
	! !

!StackBase methodsFor: 'as yet unclassified' stamp: 'MB 4/26/2022 17:59:58'!
size

	^0.! !

!StackBase methodsFor: 'as yet unclassified' stamp: 'id 4/27/2022 19:03:33'!
top

	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #StackItem category: 'Stack-Exercise'!
Object subclass: #StackItem
	instanceVariableNames: 'item previousStackItem size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackItem methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:44:31'!
initializeWithItem: anItem withPreviousStackItem: aStackItem size: aSizeInteger

	item := anItem.
	previousStackItem := aStackItem.
	size := aSizeInteger + 1.! !

!StackItem methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:18:35'!
isEmpty

	^false.! !

!StackItem methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:22:38'!
previousStackItem

	^previousStackItem.! !

!StackItem methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:46:20'!
push: anItem

	^StackItem withItem: anItem previousStackItem: self size: size.! !

!StackItem methodsFor: 'as yet unclassified' stamp: 'id 4/27/2022 19:07:15'!
size

	^size.! !

!StackItem methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:18:53'!
top

	^item.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackItem class' category: 'Stack-Exercise'!
StackItem class
	instanceVariableNames: ''!

!StackItem class methodsFor: 'as yet unclassified' stamp: 'MB 4/27/2022 18:52:51'!
withItem: anItem previousStackItem: aStackItem size: aSizeInteger

	^self new
		initializeWithItem: anItem 
		withPreviousStackItem: aStackItem 
		size: aSizeInteger.! !
