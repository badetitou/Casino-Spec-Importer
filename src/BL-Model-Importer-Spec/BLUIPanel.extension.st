Extension { #name : #BLUIPanel }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIPanel class >> newInstanceFor: anInvocation [
	| newInstance |
	newInstance := self new.
	(anInvocation signature beginsWith: 'newColumn:')
		ifTrue: [ newInstance layout: BLUIVerticalLayout new ].
	(anInvocation signature beginsWith: 'newRow:')
		ifTrue: [ newInstance layout: BLUIHorizontalLayout new ].
	^ newInstance
]

{ #category : #'*BL-Model-Importer-Spec' }
BLUIPanel class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWithAnyOf: #('newColumn:' 'newRow:')
]
