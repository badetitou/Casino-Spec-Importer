Extension { #name : #FamixStInvocation }

{ #category : #'*Casino-Importer-Spec' }
FamixStInvocation >> pharoKeywords [
	(self signature includesSubstring: ':')
		ifFalse: [ ^ {} ].
	^ ((self signature replaceAllRegex: '\(.*\)' with: '') substrings: ':')
		collect: [ :string | string , ':' ]
]

{ #category : #'*Casino-Importer-Spec' }
FamixStInvocation >> pharoParameters [
	| keywords finalText |
	(self sourceText includesSubstring: ':')
		ifFalse: [ ^ {} ].
	keywords := ((self signature replaceAllRegex: '\(.*\)' with: '') substrings: ':')
		collect: [ :string | string , ':' ].
	finalText := self sourceText
		copyFrom: (self sourceText findString: (keywords at: 1))
		to: self sourceText size.
	keywords do: [ :keyword | finalText := finalText copyReplaceAll: keyword with: '::' ].
	^ ('::' split: finalText) collect: #trimBoth thenSelect: #isNotEmpty
]
