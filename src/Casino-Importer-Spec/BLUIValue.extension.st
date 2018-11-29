Extension { #name : #BLUIValue }

{ #category : #'*Casino-Importer-Spec' }
BLUIValue class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'text:'
]

{ #category : #'*Casino-Importer-Spec' }
BLUIValue class >> createSpecAttributeFor: anInvocation [
	^ self new
	name: (anInvocation pharoKeywords first removeSuffix: ':');
		text: anInvocation pharoParameters first;
		yourself
]
