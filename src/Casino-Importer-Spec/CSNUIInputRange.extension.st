Extension { #name : #CSNUIInputRange }

{ #category : #'*Casino-Importer-Spec' }
CSNUIInputRange class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newSlider'
]
