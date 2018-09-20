Extension { #name : #BLUITextarea }

{ #category : #'*BL-Model-Importer-Spec' }
BLUITextarea class >> specCanHandle: anInvocation [
	^ anInvocation signature = 'newText()'
]
