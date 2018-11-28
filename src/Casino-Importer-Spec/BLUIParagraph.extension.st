Extension { #name : #BLUIParagraph }

{ #category : #'*Casino-Importer-Spec' }
BLUIParagraph class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newLabel'
]
