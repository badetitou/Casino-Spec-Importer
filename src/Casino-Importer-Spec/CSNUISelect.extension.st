Extension { #name : #CSNUISelect }

{ #category : #'*Casino-Importer-Spec' }
CSNUISelect class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newDropList'
]
