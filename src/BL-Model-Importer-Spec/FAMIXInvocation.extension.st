Extension { #name : #FAMIXInvocation }

{ #category : #'*BL-Model-Importer-Spec' }
FAMIXInvocation >> pharoParameters [
	| preLeftIndex keywords finalText |
	(self sourceText includesSubstring: ':') ifFalse: [^ {} ].
	keywords := ((self signature replaceAllRegex: '\(.*\)' with: '') substrings: ':') collect: [:string | string].
	finalText := (self sourceText copyFrom: (self sourceText findString: (keywords at: 1)) to: self sourceText size).
	keywords do: [ :keyword | finalText := finalText replaceAllRegex: keyword with: ':' ].
	^ ('::' split: finalText) collect: #trimBoth thenSelect: #isNotEmpty.
]
