Extension { #name : #BLUIWidth }

{ #category : #'*Casino-Importer-Spec' }
BLUIWidth class >> canHandleSpecLayoutAttributeKeyword: aKeyword [
	^ aKeyword beginsWith: 'width:'
]
