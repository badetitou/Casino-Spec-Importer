Extension { #name : #BLUIList }

{ #category : #'*Casino-Importer-Spec' }
BLUIList class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newList'
]
