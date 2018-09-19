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
	^ (anImporter factoryCreateWidgetFrom: (invocations at: 1)) ifNil: [ self next tryFindFromInvocations: invocations with: anImporter ]
]
