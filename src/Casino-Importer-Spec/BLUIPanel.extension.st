Extension { #name : #BLUIPanel }

{ #category : #'*Casino-Importer-Spec' }
BLUIPanel class >> newInstanceFor: anInvocation [
	| newInstance |
	newInstance := super newInstanceFor: anInvocation.
	(anInvocation signature beginsWith: 'newColumn:')
		ifTrue: [ newInstance layout: BLUIVerticalLayout new ].
	(anInvocation signature beginsWith: 'newRow:')
		ifTrue: [ newInstance layout: BLUIHorizontalLayout new ].
	^ newInstance
]

{ #category : #'*Casino-Importer-Spec' }
BLUIPanel class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWithAnyOf: #('newColumn:' 'newRow:')
]
