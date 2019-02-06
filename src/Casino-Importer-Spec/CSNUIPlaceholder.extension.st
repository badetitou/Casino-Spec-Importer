Extension { #name : #CSNUIPlaceholder }

{ #category : #'*Casino-Importer-Spec' }
CSNUIPlaceholder class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'ghostText:'
]

{ #category : #'*Casino-Importer-Spec' }
CSNUIPlaceholder class >> createSpecAttributeFor: anInvocation [
	^ self new
		name: (anInvocation pharoKeywords first removeSuffix: ':');
		attributeValue:
			((anInvocation pharoParameters first removePrefix: '''') removeSuffix: '''');
		yourself
]
