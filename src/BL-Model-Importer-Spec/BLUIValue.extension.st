Extension { #name : #BLUIValue }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIValue class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'text:'
]

{ #category : #'*BL-Model-Importer-Spec' }
BLUIValue class >> createSpecAttributeFor: anInvocation [
	
	^ self new text: (anInvocation pharoParameters at: 1); yourself
]
