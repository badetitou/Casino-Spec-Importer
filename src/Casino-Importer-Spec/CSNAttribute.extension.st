Extension { #name : #CSNAttribute }

{ #category : #'*Casino-Importer-Spec' }
CSNAttribute class >> canHandleSpecAttributeInvocation: anInvocation [
	^ false
]

{ #category : #'*Casino-Importer-Spec' }
CSNAttribute class >> canHandleSpecLayoutAttributeFromKeyword: aKeyword withValue: aValue [
	^ false
]

{ #category : #'*Casino-Importer-Spec' }
CSNAttribute class >> createAttributeFromSpecInvocation: anInvocation [
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass createAttributeFromSpecInvocation: anInvocation.
			try ifNotNil: [ ^ try ] ].
	(self canHandleSpecAttributeInvocation: anInvocation)
		ifTrue: [ ^ self createSpecAttributeFor: anInvocation ]
		ifFalse: [ ^ nil ]
]

{ #category : #'*Casino-Importer-Spec' }
CSNAttribute class >> createLayoutAttributeFromKeyword: aKeyword withValue: aValue [
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass createLayoutAttributeFromKeyword: aKeyword withValue: aValue.
			try ifNotNil: [ ^ try ] ].
	(self canHandleSpecLayoutAttributeFromKeyword: aKeyword withValue: aValue)
		ifTrue: [ ^ self createSpecLayoutWithKeyword: aKeyword andValue: aValue ]
		ifFalse: [ ^ nil ]
]

{ #category : #'*Casino-Importer-Spec' }
CSNAttribute class >> createSpecAttributeFor: anInvocation [
	^ self new
]

{ #category : #'*Casino-Importer-Spec' }
CSNAttribute class >> createSpecLayoutWithKeyword: aKeyword andValue: aValue [
	^ self new
		name: (aKeyword removeSuffix: ':');
		attributeValue: aValue;
		yourself
]
