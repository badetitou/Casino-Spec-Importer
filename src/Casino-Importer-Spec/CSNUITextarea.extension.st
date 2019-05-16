Extension { #name : #CSNUITextarea }

{ #category : #'*Casino-Importer-Spec' }
CSNUITextarea class >> specCanHandle: anInvocation [
	^ #('newText()' 'newCode()') anySatisfy: [ :possibility | anInvocation signature = possibility ]
]
