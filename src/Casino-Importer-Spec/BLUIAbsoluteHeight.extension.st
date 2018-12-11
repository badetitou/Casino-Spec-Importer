Extension { #name : #BLUIAbsoluteHeight }

{ #category : #'*Casino-Importer-Spec' }
BLUIAbsoluteHeight class >> canHandleSpecLayoutAttributeFromKeyword: aKeyword withValue: aValue [
	^ (aKeyword beginsWith: 'height:') and: [ aValue asInteger ifNotNil: [ true ] ifNil: [ #(#'buttonHeight' #'inputTextHeight') anySatisfy: [ :possibleFixedValue | aValue includesSubstring: possibleFixedValue ] ] ]
]

{ #category : #'*Casino-Importer-Spec' }
BLUIAbsoluteHeight class >> createSpecLayoutWithKeyword: aKeyword andValue: aValue [
	^ self new
		name: (aKeyword removeSuffix: ':');
		attributeValue: (aValue asInteger ifNotNil: [ aValue ] ifNil: [ ComposablePresenter buttonHeight asString ]);
		yourself
]
