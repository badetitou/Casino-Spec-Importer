Extension { #name : #BLUIHorizontalPanel }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIHorizontalPanel class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newRow:'
]
