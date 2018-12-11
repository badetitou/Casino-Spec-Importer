Extension { #name : #BLUIInputText }

{ #category : #'*Casino-Importer-Spec' }
BLUIInputText >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget
		addAttribute: (BLUIPlaceholder new text: (anInvocation parameters at: 1 ifAbsent: [ '' ])).
	^ widget
]

{ #category : #'*Casino-Importer-Spec' }
BLUIInputText class >> specCanHandle: anInvocation [
	^ anInvocation signature beginsWith: 'newTextInput'
]
