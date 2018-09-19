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
	aFamixClassPresenter ifNil: [ ^ BLPageMetier new name: 'nil'  ].
	page := BLPageMetier new name: aFamixClassPresenter name.
	((((aFamixClassPresenter methods select: [ :method | method name = 'defaultSpec' ]) at: 1)
		outgoingInvocations asOrderedCollection
		sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ])
		select: [ :a | a receiver isNil and: [ self isAddingLayout: a ] ])
		do: [ :createWidgetInvocation | 
			| widget |
			widget := self exploreCreateWidget: createWidgetInvocation in: aFamixClassPresenter.
			page widgets add: widget ].
	model add: page.
	^ page
]

{ #category : #adding }
BLImporterSpec >> addToModelFirstFamixClassPresenter: aFamixClassPresenter [
	| page |
	page := BLPhase new name: aFamixClassPresenter name.
	page widgets addAll: (((((aFamixClassPresenter methods select: [ :method | method name = 'defaultSpec' ]) at: 1)
		outgoingInvocations asOrderedCollection
		sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ])
		select: [ :a | a receiver isNil and: [ self isAddingLayout: a ] ])
		collect: [ :createWidgetInvocation | 
			self exploreCreateWidget: createWidgetInvocation in: aFamixClassPresenter. ]).
	model add: page
]

{ #category : #'private - processing' }
BLImporterSpec >> computeAttributeFromInvocations: invocations forWidget: aWidget [
	2 to: invocations size do: [ :index | 
                (self factory createAttributeFrom: (invocations at: index))
                    ifNotNil: [ :attribute | aWidget addAttribute: attribute ] ]
]

{ #category : #'private - processing' }
BLImporterSpec >> computeWidgetAddByVariable: aVariable in: aPresenter [
	"Must return widgets collection"
	^ aVariable receivingInvocations
		collect: [ :aCreationWidgetInvocation | 
			(self isAddingLayout: aCreationWidgetInvocation)
				ifTrue: [ self exploreCreateWidget: aCreationWidgetInvocation in: aPresenter ]
				ifFalse: [ (self isAddWidget: aCreationWidgetInvocation)
						ifTrue: [ self exploreAddInvocation: aCreationWidgetInvocation in: aPresenter ]
						ifFalse: [ "unexpected error" ] ] ]
]

{ #category : #'private - processing' }
BLImporterSpec >> exploreAccess: anAccess [
    "Must return a widget"
    ^ self findFromInvocations: (self outgoingInvocationOfAccess: anAccess)
]

{ #category : #'private - processing' }
BLImporterSpec >> exploreAddInvocation: aCreationWidgetInvocation in: aPresenter [
	"must return a widget"

	| selector |
	selector := aCreationWidgetInvocation pharoParameters at: 1.
	^ self
		exploreAccess:
			(((((aPresenter methods select: [ :a | (selector copyFrom: 2 to: selector size) = a name ]) at: 1) accesses at: 1) to incomingAccesses
				select: [ :access | access isWrite and: [ access from name = 'initializeWidgets' ] ]) at: 1)
]

{ #category : #'private - processing' }
BLImporterSpec >> exploreCreateWidget: createWidgetInvocation in: aPresenter [
	| widget |
	widget := self factoryCreateWidgetFrom: createWidgetInvocation.
	model add: widget.
	widget addAllWidgets: (self computeWidgetAddByVariable: (self findFirstAttributeOfInvocation: createWidgetInvocation) in: aPresenter).
	^ widget
]

{ #category : #accesing }
BLImporterSpec >> factory [
	^ BLWidgetFactorySpec 
]

{ #category : #'private - processing' }
BLImporterSpec >> findFirstAttributeOfInvocation: anInvocation [
    ^ ((anInvocation from localVariables
        select: [ :localVariable | 
            localVariable sourceAnchor startPos > anInvocation sourceAnchor startPos
                and: [ localVariable sourceAnchor endPos < anInvocation sourceAnchor endPos ] ])
        sort:
            [ :localVariableA :localVariableB | localVariableA sourceAnchor startPos < localVariableB sourceAnchor startPos ])
        first
]

{ #category : #'private - processing' }
BLImporterSpec >> findFromInvocations: invocations [
    | widget |
    widget := BLSpecWidgetFinderFactory new tryFindFromInvocations: invocations with: self.
    ((invocations includes: widget source) not and: [ widget source isNotNil ])
        ifTrue: [ self
                computeAttributeFromInvocations: (widget source from outgoingInvocations asOrderedCollection sort: [:a :b | a sourceAnchor startPos < b sourceAnchor startPos])
                forWidget: widget ]
        ifFalse: [ self computeAttributeFromInvocations: invocations forWidget: widget ].
    ^ widget
]

{ #category : #'private - processing' }
BLImporterSpec >> findPresenterNamed: aString [
	^ (((sourceModel allModelClasses select: [ :class | class name = aString ]) ifEmpty: [ ^ nil ])
				at: 1).
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
	self
		addToModelFirstFamixClassPresenter: (self findPresenterNamed: aComposablePresenter name ).
	^ model
]

{ #category : #'private - utility' }
BLImporterSpec >> isAddWidget: anInvocation [
	^ anInvocation signature beginsWithAnyOf:  #('add:')
]

{ #category : #'private - utility' }
BLImporterSpec >> isAddingLayout: anInvocation [
	^ anInvocation signature beginsWithAnyOf:  #('newColumn:' 'newRow:')
]

{ #category : #'private - processing' }
BLImporterSpec >> outgoingInvocationOfAccess: anAccess [
    ^ (anAccess from outgoingInvocations
        select: [ :anInvocation | 
            anInvocation sourceAnchor startPos >= anAccess sourceAnchor startPos
                and: [ anInvocation sourceAnchor endPos <= anAccess sourceAnchor endPos ] ])
        sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ]
]
