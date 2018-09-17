Extension { #name : #BLUIInputText }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIInputText class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newTextInput'
]
