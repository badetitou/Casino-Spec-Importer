Extension { #name : #CSNUIAbsoluteWidth }

{ #category : #'*Casino-Importer-Spec' }
CSNUIAbsoluteWidth class >> canHandleSpecLayoutAttributeFromKeyword: aKeyword withValue: aValue [
	^ aKeyword beginsWith: 'width:'
]
