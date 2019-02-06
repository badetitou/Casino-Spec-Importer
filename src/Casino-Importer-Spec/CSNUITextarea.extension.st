Extension { #name : #CSNUITextarea }

{ #category : #'*Casino-Importer-Spec' }
CSNUITextarea class >> specCanHandle: anInvocation [
	^ anInvocation signature = 'newText()'
]
