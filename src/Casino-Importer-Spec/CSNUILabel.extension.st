Extension { #name : #CSNUILabel }

{ #category : #'*Casino-Importer-Spec' }
CSNUILabel class >> canHandleSpecAttributeInvocation: anInvocation [
	^ anInvocation signature beginsWith: 'label:'
]

{ #category : #'*Casino-Importer-Spec' }
CSNUILabel class >> createSpecAttributeFor: anInvocation [
	^ self new
		name: (anInvocation pharoKeywords first removeSuffix: ':');
		attributeValue:
			((anInvocation pharoParameters first
				removePrefix: '''')
				removeSuffix: '''');
		yourself
]
