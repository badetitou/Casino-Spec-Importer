Extension { #name : #CSNUITab }

{ #category : #'*Casino-Importer-Spec' }
CSNUITab class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newTab'
]
