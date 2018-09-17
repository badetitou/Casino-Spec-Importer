Extension { #name : #BLUIInputDate }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIInputDate class >> specCanHandle: anInvocation [
	^ (anInvocation pharoParameters ifEmpty: [^ false ] ifNotEmpty: [:el | el at: 1]) beginsWith: 'DatePresenter'
]
