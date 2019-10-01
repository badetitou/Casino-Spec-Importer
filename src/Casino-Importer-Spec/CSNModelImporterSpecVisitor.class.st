Class {
	#name : #CSNModelImporterSpecVisitor,
	#superclass : #CSNModelImporterVisitor,
	#category : #'Casino-Importer-Spec-Importer'
}

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNOriginedEntity: aCSNOriginedEntity [
	^ nil
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUIButton: aCSNUIButton [
	^ ((source signature beginsWith: 'newButton') or: [ (source pharoParameters ifEmpty: [ ^ nil ] ifNotEmpty: [ :el | el first ]) beginsWith: 'ButtonPresenter' ])
		ifTrue: [ self create: aCSNUIButton fromSource: source ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUIInputCheckbox: aCSNUIInputCheckbox [
	^ (source signature beginsWith: 'newCheckBox')
		ifTrue: [ self create: aCSNUIInputCheckbox fromSource: source ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUIInputDate: aCSNUIInputDate [
	^ ((source pharoParameters ifEmpty: [^ nil ] ifNotEmpty: [:el | el at: 1]) beginsWith: 'DatePresenter')
		ifTrue: [ self create: aCSNUIInputDate fromSource: source ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUIInputEmail: aCSNUIInputEmail [
	^ nil
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUIInputPassword: aCSNUIInputPassword [
	^ nil
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUIInputRange: aCSNUIInputRange [
	^ (source signature beginsWith: 'newSlider')
		ifTrue: [ self create: aCSNUIInputRange fromSource: source ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUIInputText: aCSNUIInputText [
	^ (source signature beginsWith: 'newTextInput')
		ifTrue: [ | input |
			input := self create: aCSNUIInputText fromSource: source.
			input addAttribute: ((self create: CSNUIPlaceholder) attributeValue: (source pharoParameters at: 1 ifAbsent: [ '' ])).
			input ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUIList: aCSNUIList [
	^ (#('newIconList' 'newList') anySatisfy: [ :keyword | source signature beginsWith: keyword ]) ifTrue: [ self create: aCSNUIList fromSource: source ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUIPanel: aCSNUIPanel [
	^ (source signature beginsWithAnyOf: #('newColumn:' 'newRow:'))
		ifTrue: [ | panel |
			panel := self create: aCSNUIPanel fromSource: source.
			(source signature beginsWith: 'newColumn:') ifTrue: [ panel layout: (self create: CSNLVerticalLayout) ].
			(source signature beginsWith: 'newRow:') ifTrue: [ panel layout: (self create: CSNLHorizontalLayout) ].
			panel ]
		ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUIParagraph: aCSNUIPanel [
	^ (source signature beginsWith: 'newLabel') ifTrue: [ self create: aCSNUIPanel fromSource: source ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUISelect: aCSNUISelect [
	^ (source signature beginsWith: 'newDropList') ifTrue: [ self create: aCSNUISelect fromSource: source ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUITab: aCSNUITab [
	^ (source signature beginsWith: 'newTab') ifTrue: [ self create: aCSNUITab fromSource: source ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUITabManager: aCSNUITabManager [
	^ (source signature beginsWith: 'newTabManager') ifTrue: [ self create: aCSNUITabManager fromSource: source ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUITextarea: aCSNUITextarea [
	^ (#('newText()' 'newCode()') anySatisfy: [ :possibility | source signature = possibility ]) ifTrue: [ self create: aCSNUITextarea fromSource: source ] ifFalse: [ nil ]
]

{ #category : #visiting }
CSNModelImporterSpecVisitor >> visitCSNUITree: aCSNUITree [
	^ (source signature beginsWith: 'newTree') ifTrue: [ self create: aCSNUITree fromSource: source ] ifFalse: [ nil ]
]
