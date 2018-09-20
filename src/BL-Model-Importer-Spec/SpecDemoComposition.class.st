Class {
	#name : #SpecDemoComposition,
	#superclass : #ComposablePresenter,
	#instVars : [
		'button',
		'checkbox'
	],
	#category : #'BL-Model-Importer-Spec-TestData'
}

{ #category : #specs }
SpecDemoComposition class >> defaultSpec [

	<spec: #default>

	| fontWidth listWidth |
	fontWidth := (StandardFonts defaultFont widthOfString: 'M').
	listWidth := fontWidth * 20.
	
	^ SpecLayout composed
		newColumn: [ :c | 
			c newRow: [ :row | 
				row add: #button ].
			c newRow: [ :row | 
				row add: #checkbox] ];
		yourself
	
	
]

{ #category : #'instance creation' }
SpecDemoComposition class >> on: aModel [

	^ self basicNew 
		model: aModel;
		initialize;
		yourself.
]

{ #category : #specs }
SpecDemoComposition class >> open [

	<example>
	
	^ self new
		openWithSpec.

]

{ #category : #accessing }
SpecDemoComposition >> button [
	^ button
]

{ #category : #accessing }
SpecDemoComposition >> button: anObject [
	button := anObject
]

{ #category : #accessing }
SpecDemoComposition >> checkbox [
	^ checkbox
]

{ #category : #accessing }
SpecDemoComposition >> checkbox: anObject [
	checkbox := anObject
]

{ #category : #api }
SpecDemoComposition >> extent [

	| fontWidth rowHeight |
	fontWidth := (StandardFonts defaultFont widthOfString: 'M').
	rowHeight := self class inputTextHeight.

	^ (90@24) * (fontWidth @ rowHeight)
	
]

{ #category : #initialization }
SpecDemoComposition >> initializeWidgets [
	button := (self instantiate: SpecDemoButtonsPresenter).
	checkbox := (self instantiate: SpecDemoCheckboxesPresenter).	
]

{ #category : #api }
SpecDemoComposition >> title [
	
	^ 'Spec UI Framework Demo - Composite'.
]
