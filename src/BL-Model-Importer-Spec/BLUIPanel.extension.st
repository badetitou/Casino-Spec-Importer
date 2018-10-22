Extension { #name : #BLUIPanel }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIPanel class >> specCanHandle: anInvocation [
	^ (anInvocation signature beginsWith: 'newColumn:') or: [ anInvocation signature beginsWith: 'newRow:' ]
]
