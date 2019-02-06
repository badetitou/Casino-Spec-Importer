Extension { #name : #CSNUIInputText }

{ #category : #'*Casino-Importer-Spec' }
CSNUIInputText >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addAttribute: (CSNUIPlaceholder new text: (anInvocation parameters at: 1 ifAbsent: [ '' ])).
	^ widget
]

{ #category : #'*Casino-Importer-Spec' }
CSNUIInputText class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newTextInput'
]
