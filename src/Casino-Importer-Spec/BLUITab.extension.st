Extension { #name : #BLUITab }

{ #category : #'*Casino-Importer-Spec' }
BLUITab class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newTab'
]
