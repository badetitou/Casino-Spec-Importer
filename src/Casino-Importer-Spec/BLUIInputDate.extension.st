Extension { #name : #BLUIInputDate }

{ #category : #'*Casino-Importer-Spec' }
BLUIInputDate class >> specCanHandle: anInvocation [
	^ (anInvocation pharoParameters ifEmpty: [^ false ] ifNotEmpty: [:el | el at: 1]) beginsWith: 'DatePresenter'
]
