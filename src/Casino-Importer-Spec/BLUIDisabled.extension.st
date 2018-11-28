Extension { #name : #BLUIDisabled }

{ #category : #'*Casino-Importer-Spec' }
BLUIDisabled class >> canHandleSpecAttributeInvocation: anInvocation [
	^ (anInvocation signature beginsWith: 'enabled:') or: [ (anInvocation signature beginsWith: 'disable' ) ]
]

{ #category : #'*Casino-Importer-Spec' }
BLUIDisabled class >> createSpecAttributeFor: anInvocation [
	| rightToken |
	(anInvocation signature beginsWith: 'disable') ifTrue: [ ^ self new disabled: true ].
	^ self new
		disabled: ((anInvocation pharoParameters at: 1) includesSubstring: 'false')
]