Extension { #name : #CSNUITitle }

{ #category : #'*Casino-Importer-Spec' }
CSNUITitle class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'help:'
]

{ #category : #'*Casino-Importer-Spec' }
CSNUITitle class >> createSpecAttributeFor: anInvocation [
	^ self new
		name: (anInvocation pharoKeywords first removeSuffix: ':');
		attributeValue:
			((anInvocation pharoParameters first removePrefix: '''') removeSuffix: '''');
		yourself
]
