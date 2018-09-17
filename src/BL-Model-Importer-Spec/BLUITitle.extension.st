Extension { #name : #BLUITitle }

{ #category : #'*BL-Model-Importer-Spec' }
BLUITitle class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'help:'
]

{ #category : #'*BL-Model-Importer-Spec' }
BLUITitle class >> createSpecAttributeFor: anInvocation [
	^ self new
		text: (anInvocation pharoParameters at: 1);
		yourself
]
