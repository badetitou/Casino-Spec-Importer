Extension { #name : #BLAttribute }

{ #category : #'*BL-Model-Importer-Spec' }
BLAttribute class >> canHandleSpecAttributeInvocation: anInvocation [
	^ false
]

{ #category : #'*BL-Model-Importer-Spec' }
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

{ #category : #'*BL-Model-Importer-Spec' }
BLAttribute class >> createSpecAttributeFor: anInvocation [
	^ self new
]
