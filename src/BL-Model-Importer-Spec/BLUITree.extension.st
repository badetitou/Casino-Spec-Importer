Extension { #name : #BLUITree }

{ #category : #'*BL-Model-Importer-Spec' }
BLUITree class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newButton'
]
