Extension { #name : #BLWidget }

{ #category : #'*Casino-Importer-Spec' }
BLWidget class >> createWidgetFromSpecInvocation: anInvocation [
	| class | 
	class := self allSubclasses detect: [:first | first specCanHandle: anInvocation] ifNone: [ ^ nil ].
	^ class newInstanceFor: anInvocation
]

{ #category : #'*Casino-Importer-Spec' }
BLWidget class >> newInstanceFor: anInvocation [
	^ self new source: anInvocation; yourself
]

{ #category : #'*Casino-Importer-Spec' }
BLWidget class >> specCanHandle: anInvocation [
	^ false
]
