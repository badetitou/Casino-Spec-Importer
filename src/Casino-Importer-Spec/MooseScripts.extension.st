Extension { #name : #MooseScripts }

{ #category : #'*Casino-Importer-Spec' }
MooseScripts class >> createModelNamed: modelName withPackages: packages importer: importClass candidateClass: candidates mergeClassMetaClass: merge contextItems: context withCache: withCache [

	| mooseModel importer importingContext |
	
	mooseModel := FamixStModel new.
	mooseModel name: modelName.
	
	importingContext := MooseImportingContext new.
	(context select: [:anAssoc | anAssoc value = true] thenCollect: [:each | each key]) do: [ :each | importingContext perform: (#import , each) asSymbol ].
	merge ifTrue: [ importingContext mergeClassAndMetaclass ].
	
	importer := importClass new.
	importer
		importingContext: importingContext;
		model: mooseModel;
		addFromPackagesNamed: packages;
		candidateClass: candidates;
		runWithProgress.

	mooseModel installWithCache: withCache.
]
