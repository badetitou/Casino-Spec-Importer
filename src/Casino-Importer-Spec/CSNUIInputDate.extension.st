Extension { #name : #CSNUIInputDate }

{ #category : #'*Casino-Importer-Spec' }
CSNUIInputDate class >> specCanHandle: anInvocation [
	^ (anInvocation pharoParameters ifEmpty: [^ false ] ifNotEmpty: [:el | el at: 1]) beginsWith: 'DatePresenter'
]
