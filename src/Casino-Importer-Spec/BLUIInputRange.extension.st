Extension { #name : #BLUIInputRange }

{ #category : #'*Casino-Importer-Spec' }
BLUIInputRange class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newSlider'
]
