Class {
	#name : #CSNSpecWidgetFinder,
	#superclass : #Object,
	#instVars : [
		'next'
	],
	#category : #'Casino-Importer-Spec-Importer'
}

{ #category : #accessing }
CSNSpecWidgetFinder >> initialize [
	super initialize.
]

{ #category : #accessing }
CSNSpecWidgetFinder >> next [
	^ next
]

{ #category : #accessing }
CSNSpecWidgetFinder >> tryFindFromInvocations: invocations with: anImporter [
	self subclassResponsibility 
]
