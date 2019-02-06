Extension { #name : #CSNUITabManager }

{ #category : #'*Casino-Importer-Spec' }
CSNUITabManager class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newTabManager'
]
