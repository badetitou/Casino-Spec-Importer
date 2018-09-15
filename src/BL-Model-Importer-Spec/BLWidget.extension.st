Extension { #name : #BLWidget }

{ #category : #'*BL-Model-Importer-Spec' }
BLWidget class >> createWidgetFromSpecInvocation: anInvocation [
	| class | 
	class := self allSubclasses detect: [:first | first specCanHandle: anInvocation] ifNone: [ self ].
	^ class new
]

{ #category : #'*BL-Model-Importer-Spec' }
BLWidget class >> specCanHandle: anInvocation [
	^ false
]
