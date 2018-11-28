Extension { #name : #BLUITextarea }

{ #category : #'*Casino-Importer-Spec' }
BLUITextarea class >> specCanHandle: anInvocation [
	^ anInvocation signature = 'newText()'
]
