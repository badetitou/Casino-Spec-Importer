Extension { #name : #BLUIDisabled }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIDisabled class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'enabled:'
]

{ #category : #'*BL-Model-Importer-Spec' }
BLUIDisabled class >> createSpecAttributeFor: anInvocation [
	| rightToken |
	rightToken := (anInvocation sourceText
		findString: '.'
		startingAt: anInvocation sourceAnchor startPos + 1) - 1.
	^ self new
		disabled:
			((anInvocation sourceText copyFrom: (anInvocation sourceAnchor endPos + 1) to: rightToken)
				includesSubstring: 'false')
]
