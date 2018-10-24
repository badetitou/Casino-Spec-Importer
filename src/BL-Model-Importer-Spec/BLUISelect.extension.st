Extension { #name : #BLUISelect }

{ #category : #'*BL-Model-Importer-Spec' }
BLUISelect class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newDropList'
]
