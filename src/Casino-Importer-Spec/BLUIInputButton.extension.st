Extension { #name : #BLUIInputButton }

{ #category : #'*Casino-Importer-Spec' }
BLUIInputButton class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newButton'
]
