Class {
	#name : #BLSpecWidgetFinderInnerMethod,
	#superclass : #BLSpecWidgetFinder,
	#category : #'BL-Model-Importer-Spec'
}

{ #category : #accessing }
BLSpecWidgetFinderInnerMethod >> initialize [
	super initialize.
	next := BLSpecWidgetFinderEnd new.
]

{ #category : #accessing }
BLSpecWidgetFinderInnerMethod >> tryFindFromInvocations: invocations with: anImporter [
	^ self  next tryFindFromInvocations: invocations with: anImporter
]
