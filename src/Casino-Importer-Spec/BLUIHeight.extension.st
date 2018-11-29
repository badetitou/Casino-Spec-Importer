Extension { #name : #BLUIHeight }

{ #category : #'*Casino-Importer-Spec' }
BLUIHeight class >> canHandleSpecLayoutAttributeKeyword: aKeyword [
	^ aKeyword beginsWith: 'height:'
]
