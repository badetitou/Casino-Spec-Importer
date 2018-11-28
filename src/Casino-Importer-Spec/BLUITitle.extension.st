Extension { #name : #BLUITitle }

{ #category : #'*Casino-Importer-Spec' }
BLUITitle class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'help:'
]

{ #category : #'*Casino-Importer-Spec' }
BLUITitle class >> createSpecAttributeFor: anInvocation [
	^ self new
		text: (anInvocation pharoParameters at: 1);
		yourself
]
