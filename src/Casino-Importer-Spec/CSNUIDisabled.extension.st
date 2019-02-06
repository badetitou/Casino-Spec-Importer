Extension { #name : #CSNUIDisabled }

{ #category : #'*Casino-Importer-Spec' }
CSNUIDisabled class >> canHandleSpecAttributeInvocation: anInvocation [
	^ (anInvocation signature beginsWith: 'enabled:') or: [ (anInvocation signature beginsWith: 'disable' ) ]
]

{ #category : #'*Casino-Importer-Spec' }
CSNUIDisabled class >> createSpecAttributeFor: anInvocation [
	(anInvocation signature beginsWith: 'disable')
		ifTrue: [ ^ self new disabled: true ].
	^ self new
		name: (anInvocation pharoKeywords first removeSuffix: ':');
		disabled: ((anInvocation pharoParameters first) includesSubstring: 'false')
]
