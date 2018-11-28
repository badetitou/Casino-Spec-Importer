Extension { #name : #BLAttribute }

{ #category : #'*Casino-Importer-Spec' }
BLAttribute class >> canHandleSpecAttributeInvocation: anInvocation [
	^ false
]

{ #category : #'*Casino-Importer-Spec' }
BLAttribute class >> createAttributeFromSpecInvocation: anInvocation [
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass createAttributeFromSpecInvocation: anInvocation .
			try ifNotNil: [ ^ try ] ].
	(self canHandleSpecAttributeInvocation: anInvocation)
		ifTrue: [ ^ self createSpecAttributeFor: anInvocation ]
		ifFalse: [ ^ nil ]
]

{ #category : #'*Casino-Importer-Spec' }
BLAttribute class >> createSpecAttributeFor: anInvocation [
	^ self new
]
