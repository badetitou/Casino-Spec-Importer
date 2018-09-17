Extension { #name : #BLUITitle }

{ #category : #'*BL-Model-Importer-Spec' }
BLUITitle class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'help:'
]

{ #category : #'*BL-Model-Importer-Spec' }
BLUITitle class >> createSpecAttributeFor: anInvocation [
	| leftToken rightToken |
	leftToken := (anInvocation sourceText
		findString: ''''
		startingAt: anInvocation sourceAnchor startPos) + 1.
	rightToken := (anInvocation sourceText findString: '''' startingAt: leftToken) - 1.
	^ self new
		text: (anInvocation sourceText copyFrom: leftToken to: rightToken);
		yourself
]
