Extension { #name : #BLUIPlaceholder }

{ #category : #'*Casino-Importer-Spec' }
BLUIPlaceholder class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'ghostText:'
]

{ #category : #'*Casino-Importer-Spec' }
BLUIPlaceholder class >> createSpecAttributeFor: anInvocation [
	^ self new
		name: (anInvocation pharoKeywords first removeSuffix: ':');
		text: (anInvocation pharoParameters first
				removePrefix: '''';
				removeSuffix: '''');
		yourself
]
