Extension { #name : #BLUIDisabled }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIDisabled class >> canHandleSpecAttributeInvocation: anInvocation [
	^ (anInvocation signature beginsWith: 'enabled:') or: [ (anInvocation signature beginsWith: 'disable' ) ]
]

{ #category : #'*BL-Model-Importer-Spec' }
BLUIDisabled class >> createSpecAttributeFor: anInvocation [
	| rightToken |
	(anInvocation signature beginsWith: 'disable') ifTrue: [ ^ self new disabled: true ].
	rightToken := (anInvocation sourceText findString: '.' startingAt: anInvocation sourceAnchor startPos + 1) - 1.
	^ self new
		disabled: ((anInvocation sourceText copyFrom: anInvocation sourceAnchor endPos + 1 to: rightToken) includesSubstring: 'false')
]
