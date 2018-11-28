Extension { #name : #BLUIPlaceholder }

{ #category : #'*Casino-Importer-Spec' }
BLUIPlaceholder class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'ghostText:'
]

{ #category : #'*Casino-Importer-Spec' }
BLUIPlaceholder class >> createSpecAttributeFor: anInvocation [
	^ self new text: (anInvocation pharoParameters at: 1); yourself
]
