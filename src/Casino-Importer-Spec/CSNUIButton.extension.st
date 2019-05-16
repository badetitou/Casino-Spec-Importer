Extension { #name : #CSNUIButton }

{ #category : #'*Casino-Importer-Spec' }
CSNUIButton class >> specCanHandle: anInvocation [
	^ (anInvocation signature beginsWith: 'newButton') or: [ (anInvocation pharoParameters ifEmpty: [^ false ] ifNotEmpty: [:el | el first]) beginsWith: 'ButtonPresenter' ]
]
