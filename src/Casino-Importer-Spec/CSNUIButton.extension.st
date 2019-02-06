Extension { #name : #CSNUIButton }

{ #category : #'*Casino-Importer-Spec' }
CSNUIButton class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newButton'
]
