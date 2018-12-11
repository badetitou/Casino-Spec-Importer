Extension { #name : #BLUIButton }

{ #category : #'*Casino-Importer-Spec' }
BLUIButton class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newButton'
]
