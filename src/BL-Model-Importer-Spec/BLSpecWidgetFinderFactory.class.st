Class {
	#name : #BLSpecWidgetFinderFactory,
	#superclass : #BLSpecWidgetFinder,
	#category : #'BL-Model-Importer-Spec'
}

{ #category : #accessing }
BLSpecWidgetFinderFactory >> initialize [
	super initialize.
	next := BLSpecWidgetFinderInstanciate new.
]

{ #category : #accessing }
BLSpecWidgetFinderFactory >> tryFindFromInvocations: invocations with: anImporter [
    ^ (anImporter factoryCreateWidgetFrom: invocations first)
        ifNil: [ self next tryFindFromInvocations: invocations with: anImporter ]
ifNotNil: [ :widget | widget source: invocations first; yourself ]
]
