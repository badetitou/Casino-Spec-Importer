"
I create BL-Model with UI-SubEntities from a Spec application
"
Class {
	#name : #CSNImporterSpec,
	#superclass : #CSNWebModel,
	#category : #'Casino-Importer-Spec-Importer'
}

{ #category : #adding }
CSNImporterSpec >> addToModelFamixClassPresenter: aFamixClassPresenter [
	| page |
	page := self factory create: CSNBusinessPage.
	aFamixClassPresenter ifNil: [ ^ page ].
	page name: aFamixClassPresenter name.
	((((aFamixClassPresenter methods select: [ :method | method name = 'defaultSpec' ]) at: 1) outgoingInvocations asOrderedCollection sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ])
		select: [ :a | a receiver isNil and: [ self isAddingLayout: a ] ])
		do: [ :createWidgetInvocation | 
			| widget |
			widget := self exploreCreateWidget: createWidgetInvocation in: aFamixClassPresenter.
			page addWidget: widget ].
	^ page
]

{ #category : #adding }
CSNImporterSpec >> addToModelFirstFamixClassPresenter: aFamixClassPresenter [
	| page |
	page := (self factory create: CSNPage) name: aFamixClassPresenter name.
	page
		addAllWidgets:
			(((((aFamixClassPresenter methods select: [ :method | method name = 'defaultSpec' ]) at: 1)
				outgoingInvocations asOrderedCollection
				sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ])
				select: [ :a | a receiver isNil and: [ self isAddingLayout: a ] ])
				collect: [ :createWidgetInvocation | 
					self exploreCreateWidget: createWidgetInvocation in: aFamixClassPresenter ])
]

{ #category : #'private - processing' }
CSNImporterSpec >> computeAttributeFromInvocations: invocations forWidget: aWidget [
	invocations do: [ :invoc | 
		(self factory createAttributeFrom: invoc)
			ifNotNil: [ :attribute | 
				aWidget addAttribute: attribute.
				model silentlyAdd: attribute ] ]
]

{ #category : #adding }
CSNImporterSpec >> computeStartPosOfAccessAfter: anAccess [
	" If the access is an affectation (blabla := hello). We have to take the endPos of the access itSelf"

	anAccess isWrite
		ifTrue: [ ^ anAccess sourceAnchor endPos ].
	^ (((anAccess from accesses asOrderedCollection sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ])
		select: [ :access | access sourceAnchor startPos > anAccess sourceAnchor startPos ]) at: 1 ifAbsent: [ ^ anAccess from sourceAnchor sourceText size ])
		sourceAnchor startPos
]

{ #category : #'private - processing' }
CSNImporterSpec >> computeWidgetAddByVariable: aVariable in: aPresenter [
	"Must return widgets collection"
	^ aVariable receivingInvocations
		collect: [ :aCreationWidgetInvocation | 
			(self isAddingLayout: aCreationWidgetInvocation)
				ifTrue: [ self exploreCreateWidget: aCreationWidgetInvocation in: aPresenter ]
				ifFalse: [ (self isAddWidget: aCreationWidgetInvocation)
						ifTrue: [ self exploreAddInvocation: aCreationWidgetInvocation in: aPresenter ]
						ifFalse: [ (self isAddLayoutAndWidgetAtTheSameTime: aCreationWidgetInvocation)
								ifTrue: [ self exploreAddInvocation: aCreationWidgetInvocation in: aPresenter ]
								ifFalse: [ "unexpectedError" ] ] ] ] thenReject: #isNil
]

{ #category : #'private - processing' }
CSNImporterSpec >> createFactory [
	factory := CSNWidgetFactorySpec new model: model; yourself
]

{ #category : #'private - processing' }
CSNImporterSpec >> createLayoutAttributeFrom: aCreationWidgetInvocation for: widget [
	2 to: aCreationWidgetInvocation pharoKeywords size do: [ :position | 
		(self factory
			createLayoutAttributeFrom: (aCreationWidgetInvocation pharoKeywords at: position)
			with: (aCreationWidgetInvocation pharoParameters at: position))
			ifNotNil: [ :attribute | 
				model silentlyAdd: attribute.
				widget addAttribute: attribute ] ]
]

{ #category : #'private - processing' }
CSNImporterSpec >> exploreAccess: anAccess [
	"Must return a widget"

	| widget |
	widget := self findFromInvocations: (self outgoingInvocationOfAccess: anAccess).
	self
		computeAttributeFromInvocations:
			(anAccess to accessors
				collect: [ :accessor | 
					| localAccesses |
					localAccesses := accessor accesses select: [ :anLocalAccess | anLocalAccess to = anAccess to ].
					accessor outgoingInvocations
						select: [ :invoc |
							localAccesses
								anySatisfy: [ :anLocalAccess | 
									invoc sourceAnchor startPos >= anLocalAccess sourceAnchor startPos
										and: [ invoc sourceAnchor endPos <= (self computeStartPosOfAccessAfter: anLocalAccess) ] ] ] ]) asOrderedCollection flattened
		forWidget: widget.
	^ widget
]

{ #category : #'private - processing' }
CSNImporterSpec >> exploreAddInvocation: aCreationWidgetInvocation in: aPresenter [
	"must return a widget"

	| selector widget |
	selector := aCreationWidgetInvocation pharoParameters first.
	widget := (self
		exploreAccess:
		((((((aPresenter withSuperclassHierarchy flatCollect: #methods) select: [ :a | (selector copyFrom: 2 to: selector size) = a name ]) first) accesses first) to incomingAccesses
		select: [ :access | access isWrite and: [ access from name = 'initializeWidgets' ] ]) first))
		name: (selector removePrefix: '#');
		source: aCreationWidgetInvocation;
		yourself.
	self createLayoutAttributeFrom: aCreationWidgetInvocation for: widget.
	^ widget
]

{ #category : #'private - processing' }
CSNImporterSpec >> exploreCreateWidget: createWidgetInvocation in: aPresenter [
	| widget |
	widget := self factoryCreateWidgetFrom: createWidgetInvocation.
	model silentlyAdd: widget.
	widget
		addAllWidgets:
			(self
				computeWidgetAddByVariable: (self findFirstAttributeOfInvocation: createWidgetInvocation)
				in: aPresenter).
				self createLayoutAttributeFrom: createWidgetInvocation for: widget.
	^ widget
]

{ #category : #'private - processing' }
CSNImporterSpec >> findFirstAttributeOfInvocation: anInvocation [
    ^ ((anInvocation from localVariables
        select: [ :localVariable | 
            localVariable sourceAnchor startPos > anInvocation sourceAnchor startPos
                and: [ localVariable sourceAnchor endPos < anInvocation sourceAnchor endPos ] ])
        sort:
            [ :localVariableA :localVariableB | localVariableA sourceAnchor startPos < localVariableB sourceAnchor startPos ])
        first
]

{ #category : #'private - processing' }
CSNImporterSpec >> findFromInvocations: invocations [
	| widget |
	widget := CSNSpecWidgetFinderFactory new tryFindFromInvocations: invocations with: self.
	self model add: widget.
	^ widget
]

{ #category : #'private - processing' }
CSNImporterSpec >> findPresenterNamed: aString [
	^ (((sourceModel allModelClasses select: [ :class | class name = aString ]) ifEmpty: [ ^ nil ])
				at: 1).
]

{ #category : #adding }
CSNImporterSpec >> generateSourceModelWith: aComposablePresenter andPackages: packages [
	MooseScripts
		createModelNamed: aComposablePresenter name
		withPackages: packages
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
CSNImporterSpec >> import [
	"begin"
	model := MooseModel new name: 'Showroom'; yourself.
	model add: CSNPage new.
	^ model
]

{ #category : #api }
CSNImporterSpec >> importPresenter: aComposablePresenter [
	^ self importPresenter: aComposablePresenter withPackages: { aComposablePresenter package name }
]

{ #category : #api }
CSNImporterSpec >> importPresenter: aComposablePresenter withPackages: packages [
	model := CSNUIMooseModel new name: aComposablePresenter package name.
	self preImport.
	sourceModel := self generateSourceModelWith: aComposablePresenter andPackages: packages .
	self
		addToModelFirstFamixClassPresenter: (self findPresenterNamed: aComposablePresenter name ).
	self postImport.
	^ model
]

{ #category : #'private - processing' }
CSNImporterSpec >> isAddLayoutAndWidgetAtTheSameTime: anInvocation [
	^ anInvocation signature beginsWithAnyOf:  #('newColumn:' 'newRow:')
]

{ #category : #'private - utility' }
CSNImporterSpec >> isAddWidget: anInvocation [
	^ anInvocation signature beginsWithAnyOf:  #('add:')
]

{ #category : #'private - utility' }
CSNImporterSpec >> isAddingLayout: anInvocation [
	^ (anInvocation signature beginsWithAnyOf:  #('newColumn:' 'newRow:')) and: [ 
	anInvocation sourceAnchor sourceText matchesRegex: '.*\[.*\].*'  ]
]

{ #category : #'private - processing' }
CSNImporterSpec >> outgoingInvocationOfAccess: anAccess [
    ^ (anAccess from outgoingInvocations
        select: [ :anInvocation | 
            anInvocation sourceAnchor startPos >= anAccess sourceAnchor startPos
                and: [ anInvocation sourceAnchor endPos <= anAccess sourceAnchor endPos ] ])
        sort: [ :a :b | a sourceAnchor startPos < b sourceAnchor startPos ]
]
