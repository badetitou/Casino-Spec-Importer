Extension { #name : #BLUIInputRange }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIInputRange class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newSlider'
]
