Extension { #name : #BLUILabel }

{ #category : #'*Casino-Importer-Spec' }
BLUILabel class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'label:'
]

{ #category : #'*Casino-Importer-Spec' }
BLUILabel class >> createSpecAttributeFor: anInvocation [

	^ self new text: (anInvocation pharoParameters at: 1)
]
