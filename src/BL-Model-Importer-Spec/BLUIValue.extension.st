Extension { #name : #BLUIValue }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIValue class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'text:'
]

{ #category : #'*BL-Model-Importer-Spec' }
BLUIValue class >> createSpecAttributeFor: anInvocation [
	| leftToken rightToken |
	leftToken := (anInvocation sourceText findString: '''' startingAt: anInvocation sourceAnchor startPos) +1.
	rightToken := (anInvocation sourceText findString: '''' startingAt: leftToken) -1.
	^ self new text: (anInvocation sourceText copyFrom: leftToken  to: rightToken ); yourself
]
