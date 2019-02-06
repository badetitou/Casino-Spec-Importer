Extension { #name : #CSNUIAbsoluteHeight }

{ #category : #'*Casino-Importer-Spec' }
CSNUIAbsoluteHeight class >> canHandleSpecLayoutAttributeFromKeyword: aKeyword withValue: aValue [
	^ (aKeyword beginsWith: 'height:') and: [ aValue asInteger ifNotNil: [ true ] ifNil: [ #(#'buttonHeight' #'inputTextHeight') anySatisfy: [ :possibleFixedValue | aValue includesSubstring: possibleFixedValue ] ] ]
]

{ #category : #'*Casino-Importer-Spec' }
CSNUIAbsoluteHeight class >> createSpecLayoutWithKeyword: aKeyword andValue: aValue [
	^ self new
		name: (aKeyword removeSuffix: ':');
		attributeValue: (aValue asInteger ifNotNil: [ aValue ] ifNil: [ ComposablePresenter buttonHeight asString ]);
		yourself
]
