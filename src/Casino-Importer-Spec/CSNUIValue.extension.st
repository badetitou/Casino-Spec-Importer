Extension { #name : #CSNUIValue }

{ #category : #'*Casino-Importer-Spec' }
CSNUIValue class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'text:'
]

{ #category : #'*Casino-Importer-Spec' }
CSNUIValue class >> createSpecAttributeFor: anInvocation [
	^ self new
		name: (anInvocation pharoKeywords first removeSuffix: ':');
		attributeValue:
			((anInvocation pharoParameters first removePrefix: '''') removeSuffix: '''');
		yourself
]
