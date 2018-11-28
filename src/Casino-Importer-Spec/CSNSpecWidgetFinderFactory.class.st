Class {
	#name : #CSNSpecWidgetFinderFactory,
	#superclass : #CSNSpecWidgetFinder,
	#category : #'Casino-Importer-Spec-Importer'
}

{ #category : #accessing }
CSNSpecWidgetFinderFactory >> initialize [
	super initialize.
	next := CSNSpecWidgetFinderInstanciate new.
]

{ #category : #accessing }
CSNSpecWidgetFinderFactory >> tryFindFromInvocations: invocations with: anImporter [
    ^ (anImporter factoryCreateWidgetFrom: invocations first)
        ifNil: [ self next tryFindFromInvocations: invocations with: anImporter ]
ifNotNil: [ :widget | widget source: invocations first; yourself ]
]
