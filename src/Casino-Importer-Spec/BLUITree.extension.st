Extension { #name : #BLUITree }

{ #category : #'*Casino-Importer-Spec' }
BLUITree class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newTree'
]
