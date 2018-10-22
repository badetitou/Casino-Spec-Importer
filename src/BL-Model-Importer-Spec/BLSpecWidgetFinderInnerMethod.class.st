Class {
	#name : #BLSpecWidgetFinderInnerMethod,
	#superclass : #BLSpecWidgetFinder,
	#category : #'BL-Model-Importer-Spec-Importer'
}

{ #category : #accessing }
BLSpecWidgetFinderInnerMethod >> initialize [
	super initialize.
	next := BLSpecWidgetFinderEnd new.
]

{ #category : #accessing }
BLSpecWidgetFinderInnerMethod >> tryFindFromInvocations: invocations with: anImporter [
	^ (invocations first receiver isNotNil and: [ invocations first receiver isSelf and: [ invocations first to isNotEmpty ] ])
		ifTrue: [ BLSpecWidgetFinderFactory new tryFindFromInvocations: (invocations first to first outgoingInvocations asOrderedCollection sort: [:a :b | a sourceAnchor startPos < b sourceAnchor startPos ]) 
			with: anImporter ] 
		ifFalse: [ self next tryFindFromInvocations: invocations with: anImporter ]
]
