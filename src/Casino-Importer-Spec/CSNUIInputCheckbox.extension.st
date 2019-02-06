Extension { #name : #CSNUIInputCheckbox }

{ #category : #'*Casino-Importer-Spec' }
CSNUIInputCheckbox class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newCheckBox'
]
