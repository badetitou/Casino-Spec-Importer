Extension { #name : #BLUIList }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIList class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newList'
]
