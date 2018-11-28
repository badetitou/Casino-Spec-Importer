Extension { #name : #BLUIInputText }

{ #category : #'*Casino-Importer-Spec' }
BLUIInputText class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newTextInput'
]
