Extension { #name : #BLUITitle }

{ #category : #'*Casino-Importer-Spec' }
BLUITitle class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'help:'
]

{ #category : #'*Casino-Importer-Spec' }
BLUITitle class >> createSpecAttributeFor: anInvocation [
	^ self new
		name: (anInvocation pharoKeywords first removeSuffix: ':');
		text:
			((anInvocation pharoParameters first removePrefix: '''') removeSuffix: '''');
		yourself
]
