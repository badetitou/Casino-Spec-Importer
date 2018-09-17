Extension { #name : #BLUIParagraph }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIParagraph class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newLabel'
]
