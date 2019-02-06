Extension { #name : #CSNUIParagraph }

{ #category : #'*Casino-Importer-Spec' }
CSNUIParagraph class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newLabel'
]
