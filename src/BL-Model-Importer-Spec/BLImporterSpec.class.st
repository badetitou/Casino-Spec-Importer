"
I create BL-Model with UI-SubEntities from a Spec application
"
Class {
	#name : #BLImporterSpec,
	#superclass : #BLWebModel,
	#category : #'BL-Model-Importer-Spec'
}

{ #category : #adding }
BLImporterSpec >> addToModelFamixClassPresenter: aFamixClassPresenter [
	| page |
	page := BLPhase new name: aFamixClassPresenter name.
	((((aFamixClassPresenter methods select: [ :method | method name = 'defaultSpec' ]) at: 1)
		outgoingInvocations asOrderedCollection sort: [:a :b | a sourceAnchor startPos < b sourceAnchor startPos ])
		select: [:a | a receiver isNil and: [ self isAddingLayout: a ] ]) do: [:createWidgetInvocation | self exploreCreateWidget: createWidgetInvocation ].
	self halt. 
	model add: page
]

{ #category : #'private - processing' }
BLImporterSpec >> exploreCreateWidget: createWidgetInvocation [
	| widget | 
	^ ''
]

{ #category : #adding }
BLImporterSpec >> generateSourceModelWith: aComposablePresenter [
	MooseScripts
		createModelNamed: aComposablePresenter name
		withPackages: {aComposablePresenter package name}
		importer: MoosePharoImporterTaskSourceAnchor
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

{ #category : #'private - utility' }
BLImporterSpec >> isAddingLayout: anInvocation [
	^ anInvocation signature beginsWithAnyOf:  #('newColumn:' 'newRow:')
]
