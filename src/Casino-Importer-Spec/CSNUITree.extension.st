Extension { #name : #CSNUITree }

{ #category : #'*Casino-Importer-Spec' }
CSNUITree class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newTree'
]
