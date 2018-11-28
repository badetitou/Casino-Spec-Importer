Class {
	#name : #CSNSpecWidgetFinderInnerMethod,
	#superclass : #CSNSpecWidgetFinder,
	#category : #'Casino-Importer-Spec-Importer'
}

{ #category : #accessing }
CSNSpecWidgetFinderInnerMethod >> initialize [
	super initialize.
	next := CSNSpecWidgetFinderEnd new.
]

{ #category : #accessing }
CSNSpecWidgetFinderInnerMethod >> tryFindFromInvocations: invocations with: anImporter [
	^ (invocations first receiver isNotNil and: [ invocations first receiver isSelf and: [ invocations first to isNotEmpty ] ])
		ifTrue: [ CSNSpecWidgetFinderFactory new tryFindFromInvocations: (invocations first to first outgoingInvocations asOrderedCollection sort: [:a :b | a sourceAnchor startPos < b sourceAnchor startPos ]) 
			with: anImporter ] 
		ifFalse: [ self next tryFindFromInvocations: invocations with: anImporter ]
]
