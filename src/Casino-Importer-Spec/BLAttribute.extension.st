Extension { #name : #BLAttribute }

{ #category : #'*Casino-Importer-Spec' }
BLAttribute class >> canHandleSpecAttributeInvocation: anInvocation [
	^ false
]

{ #category : #'*Casino-Importer-Spec' }
BLAttribute class >> canHandleSpecLayoutAttributeKeyword: aKeyword [
	^ false
]

{ #category : #'*Casino-Importer-Spec' }
BLAttribute class >> createAttributeFromSpecInvocation: anInvocation [
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
BLAttribute class >> createLayoutAttributeFromKeyword: aKeyword withValue: aValue [
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass createLayoutAttributeFromKeyword: aKeyword withValue: aValue.
			try ifNotNil: [ ^ try ] ].
	(self canHandleSpecLayoutAttributeKeyword: aKeyword)
		ifTrue: [ ^ self createSpecLayoutWithKeyword: aKeyword andValue: aValue ]
		ifFalse: [ ^ nil ]
]

{ #category : #'*Casino-Importer-Spec' }
BLAttribute class >> createSpecAttributeFor: anInvocation [
	^ self new
]

{ #category : #'*Casino-Importer-Spec' }
BLAttribute class >> createSpecLayoutWithKeyword: aKeyword andValue: aValue [
	^ self new
		name: (aKeyword removeSuffix: ':');
		attributeValue: aValue;
		yourself
]
