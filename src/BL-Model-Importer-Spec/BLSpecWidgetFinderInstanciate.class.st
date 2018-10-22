Class {
	#name : #BLSpecWidgetFinderInstanciate,
	#superclass : #BLSpecWidgetFinder,
	#category : #'BL-Model-Importer-Spec-Importer'
}

{ #category : #accessing }
BLSpecWidgetFinderInstanciate >> initialize [
	super initialize.
	next := BLSpecWidgetFinderInnerMethod new.
]

{ #category : #accessing }
BLSpecWidgetFinderInstanciate >> tryFindFromInvocations: invocations with: anImporter [
	^ ((invocations at: 1) signature beginsWith: 'instantiate:')
				ifTrue: [ anImporter
						addToModelFamixClassPresenter:
							(anImporter
								findPresenterNamed:( ((invocations at: 1) pharoParameters at: 1)
								trimRight: [ :char | char = $) ])).]
				ifFalse: [ self next tryFindFromInvocations: invocations with: anImporter ]
]
