Extension { #name : #BLUITabManager }

{ #category : #'*Casino-Importer-Spec' }
BLUITabManager class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newTabManager'
]
