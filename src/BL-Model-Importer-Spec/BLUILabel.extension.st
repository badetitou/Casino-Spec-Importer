Extension { #name : #BLUILabel }

{ #category : #'*BL-Model-Importer-Spec' }
BLUILabel class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'label:'
]

{ #category : #'*BL-Model-Importer-Spec' }
BLUILabel class >> createSpecAttributeFor: anInvocation [

	^ self new text: (anInvocation pharoParameters at: 1)
]
