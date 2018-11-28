Extension { #name : #BLUIInputCheckbox }

{ #category : #'*Casino-Importer-Spec' }
BLUIInputCheckbox class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newCheckBox'
]
