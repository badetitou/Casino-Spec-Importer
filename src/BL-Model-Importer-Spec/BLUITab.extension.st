Extension { #name : #BLUITab }

{ #category : #'*BL-Model-Importer-Spec' }
BLUITab class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newTab'
]
