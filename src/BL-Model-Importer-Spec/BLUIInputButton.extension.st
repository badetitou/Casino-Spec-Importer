Extension { #name : #BLUIInputButton }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIInputButton class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newButton'
]
