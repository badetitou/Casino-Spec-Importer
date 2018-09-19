Class {
	#name : #BLSpecWidgetFinder,
	#superclass : #Object,
	#instVars : [
		'next'
	],
	#category : #'BL-Model-Importer-Spec'
}

{ #category : #accessing }
BLSpecWidgetFinder >> initialize [
	super initialize.
]

{ #category : #accessing }
BLSpecWidgetFinder >> next [
	^ next
]

{ #category : #accessing }
BLSpecWidgetFinder >> tryFindFromInvocations: invocations with: anImporter [
	self subclassResponsibility 
]
