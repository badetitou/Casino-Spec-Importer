Extension { #name : #BLUIPlaceholder }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIPlaceholder class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'ghostText:'
]

{ #category : #'*BL-Model-Importer-Spec' }
BLUIPlaceholder class >> createSpecAttributeFor: anInvocation [
	^ self new text: (anInvocation pharoParameters at: 1); yourself
]
