"
I create BL-Model with UI-SubEntities from a Spec application
"
Class {
	#name : #BLImporterSpec,
	#superclass : #BLWebModel,
	#category : #'BL-Model-Importer-Spec'
}

{ #category : #api }
BLImporterSpec >> addToModelFamixClassPresenter: aFamixClassPresenter [
	| page |
	page := BLPhase new name: aFamixClassPresenter name.
	(aFamixClassPresenter methods select: [ :method | method name = 'defaultSpec' ]) at: 1.
	model add: page
]

{ #category : #api }
BLImporterSpec >> generateSourceModelWith: aComposablePresenter [
	MooseScripts
		createModelNamed: aComposablePresenter name
		withPackages: {aComposablePresenter package name}
		importer: MoosePharoImporterTask
		candidateClass: CandidateListOperator
		mergeClassMetaClass: true
		contextItems:
			{('Namespace' -> true).
			('Folder' -> true).
			('LocalVariable' -> true).
			('Access' -> true).
			('FormalParameter' -> true).
			('Literal' -> true).
			('Invocation' -> true).
			('Inheritance' -> true).
			('Comment' -> true).
			('Package' -> true).
			('ClassExtension' -> true).
			('File' -> true).
			('GlobalVariable' -> true).
			('ImplicitVariable' -> true).
			('Class' -> true).
			('Method' -> true).
			('Attribute' -> true).
			('Argument' -> true)}.
		^ (MooseModel root allModels select: [ :generatedSourceModel | generatedSourceModel name = aComposablePresenter name ]) at: 1
]

{ #category : #api }
BLImporterSpec >> import [
	"begin"
	model := MooseModel new name: 'Showroom'; yourself.
	model add: BLPhase new.
	^ model
]

{ #category : #api }
BLImporterSpec >> importPresenter: aComposablePresenter [
	model := MooseModel new name: aComposablePresenter package name.
	sourceModel := self generateSourceModelWith: aComposablePresenter.
	self addToModelFamixClassPresenter: ((sourceModel allModelClasses select: [:class | class name = aComposablePresenter name]) at: 1).
	^ model
]
