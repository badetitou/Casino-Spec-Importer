Extension { #name : #BLUIAbsoluteWidth }

{ #category : #'*Casino-Importer-Spec' }
BLUIAbsoluteWidth class >> canHandleSpecLayoutAttributeFromKeyword: aKeyword withValue: aValue [
	^ aKeyword beginsWith: 'width:'
]
