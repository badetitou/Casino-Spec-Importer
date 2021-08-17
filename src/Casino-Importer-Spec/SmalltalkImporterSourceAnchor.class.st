Class {
	#name : #SmalltalkImporterSourceAnchor,
	#superclass : #SmalltalkImporter,
	#category : #'Casino-Importer-Spec-Visitor'
}

{ #category : #'private-entity-creation' }
SmalltalkImporterSourceAnchor >> createMethod: aCompiledMethod [
	| method thisClass anchor |
	method := methods at: aCompiledMethod put: self factory method new.
	method name: aCompiledMethod selector.
	method isAbstract: false.
	thisClass := aCompiledMethod methodClass.
	method parentType: (self ensureClass: thisClass).
	method signature: aCompiledMethod signature.
	"here we have two possibilities for the parentPackage of the method: 
	=> the method belong to a package extension, we should refer to this extending packages 
	=> if not, we should not refer to package of the class"
	"parentPackage := aCompiledMethod methodClass package."
	aCompiledMethod methodClass extendingPackages
		do: [ :aRPackage | 
			(aCompiledMethod isExtensionInPackage: aRPackage)
				ifTrue: [ method parentPackage: (self ensurePackage: aRPackage) ] ].
	method isClassSide: aCompiledMethod methodClass isMeta.
	method
		protocol:
			(aCompiledMethod methodClass organization
				categoryOfElement: aCompiledMethod selector).
	method timeStamp: aCompiledMethod timeStamp.
	importingContext shouldImportMethodBody
		ifTrue: [ | visitor |
			visitor := SmalltalkMethodVisitorSourceAnchor on: self.
			visitor runWith: aCompiledMethod and: method ].
	anchor := self factory anchor new
		element: method;
		pharoEntity: aCompiledMethod;
		yourself.
	method sourceAnchor: anchor.
	self addEntity: anchor.
	^ method
]
