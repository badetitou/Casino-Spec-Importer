Extension { #name : #CSNWidget }

{ #category : #'*Casino-Importer-Spec' }
CSNWidget class >> createWidgetFromSpecInvocation: anInvocation [
	| class | 
	class := self allSubclasses detect: [:first | first specCanHandle: anInvocation] ifNone: [ ^ nil ].
	^ class newInstanceFor: anInvocation
]

{ #category : #'*Casino-Importer-Spec' }
CSNWidget class >> newInstanceFor: anInvocation [
	^ self new source: anInvocation; yourself
]

{ #category : #'*Casino-Importer-Spec' }
CSNWidget class >> specCanHandle: anInvocation [
	^ false
]
