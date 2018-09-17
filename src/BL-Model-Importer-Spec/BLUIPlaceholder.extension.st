Extension { #name : #BLUIPlaceholder }

{ #category : #'*BL-Model-Importer-Spec' }
BLUIPlaceholder class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'ghostText:'
]

{ #category : #'*BL-Model-Importer-Spec' }
BLUIPlaceholder class >> createSpecAttributeFor: anInvocation [
	| leftToken rightToken |
	leftToken := (anInvocation sourceText findString: '''' startingAt: anInvocation sourceAnchor startPos) +1.
	rightToken := (anInvocation sourceText findString: '''' startingAt: leftToken) -1.
	^ self new text: (anInvocation sourceText copyFrom: leftToken  to: rightToken ); yourself
]
