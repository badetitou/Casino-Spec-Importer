Extension { #name : #BLUIInputCheckbox }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIInputCheckbox class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newCheckBox'
]
