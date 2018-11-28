Extension { #name : #BLUISelect }

{ #category : #'*Casino-Importer-Spec' }
BLUISelect class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newDropList'
]
