Extension { #name : #BLUITabManager }

{ #category : #'*BL-Model-Importer-Spec' }
BLUITabManager class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newTabManager'
]
