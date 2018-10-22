Extension { #name : #BLWidget }

{ #category : #'*BL-Model-Importer-Spec' }
BLWidget class >> createWidgetFromSpecInvocation: anInvocation [
	| class | 
	class := self allSubclasses detect: [:first | first specCanHandle: anInvocation] ifNone: [ ^ nil ].
	^ class newInstanceFor: anInvocation
]

{ #category : #'*BL-Model-Importer-Spec' }
BLWidget class >> newInstanceFor: anInvocation [
	^ self new
]

{ #category : #'*BL-Model-Importer-Spec' }
BLWidget class >> specCanHandle: anInvocation [
	^ false
]
