Extension { #name : #BLUILabel }

{ #category : #'*Casino-Importer-Spec' }
BLUILabel class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'label:'
]

{ #category : #'*Casino-Importer-Spec' }
BLUILabel class >> createSpecAttributeFor: anInvocation [
	^ self new
	name: (anInvocation pharoKeywords first removeSuffix: ':');
		text: anInvocation pharoParameters first;
		yourself
]
