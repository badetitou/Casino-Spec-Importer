Extension { #name : #FAMIXInvocation }

{ #category : #'*BL-Model-Importer-Spec' }
FAMIXInvocation >> pharoParameters [
	| preLeftIndex keywords finalText |
	(self sourceText includesSubstring: ':') ifFalse: [^ {} ].
	self receiver ifNotNil: [ preLeftIndex := self receiver name size + 1 ] ifNil: [ preLeftIndex := 0 ]. 
	keywords := ((self signature replaceAllRegex: '\(.*\)' with: '') substrings: ':') collect: [:string | string].
	finalText := (self sourceText copyFrom: preLeftIndex to: self sourceText size).
	keywords do: [ :keyword | finalText := finalText replaceAllRegex: keyword with: ':' ].
	^ ('::' split: finalText) collect: #trimBoth thenSelect: #isNotEmpty.
]
