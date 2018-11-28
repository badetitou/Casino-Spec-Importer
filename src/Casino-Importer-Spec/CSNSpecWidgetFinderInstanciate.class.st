Class {
	#name : #CSNSpecWidgetFinderInstanciate,
	#superclass : #CSNSpecWidgetFinder,
	#category : #'Casino-Importer-Spec-Importer'
}

{ #category : #accessing }
CSNSpecWidgetFinderInstanciate >> initialize [
	super initialize.
	next := CSNSpecWidgetFinderInnerMethod new.
]

{ #category : #accessing }
CSNSpecWidgetFinderInstanciate >> tryFindFromInvocations: invocations with: anImporter [
	^ ((invocations at: 1) signature beginsWith: 'instantiate:')
				ifTrue: [ anImporter
						addToModelFamixClassPresenter:
							(anImporter
								findPresenterNamed:( ((invocations at: 1) pharoParameters at: 1)
								trimRight: [ :char | char = $) ])).]
				ifFalse: [ self next tryFindFromInvocations: invocations with: anImporter ]
]
