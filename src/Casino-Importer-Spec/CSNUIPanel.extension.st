Extension { #name : #CSNUIPanel }

{ #category : #'*Casino-Importer-Spec' }
CSNUIPanel class >> newInstanceFor: anInvocation [
	| newInstance |
	newInstance := super newInstanceFor: anInvocation.
	(anInvocation signature beginsWith: 'newColumn:')
		ifTrue: [ newInstance layout: CSNUIVerticalLayout new ].
	(anInvocation signature beginsWith: 'newRow:')
		ifTrue: [ newInstance layout: CSNUIHorizontalLayout new ].
	^ newInstance
]

{ #category : #'*Casino-Importer-Spec' }
CSNUIPanel class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWithAnyOf: #('newColumn:' 'newRow:')
]
