Class {
	#name : #FAMIXPharoPositionAnchor,
	#superclass : #FAMIXSourceAnchor,
	#instVars : [
		'startPos',
		'endPos',
		'sourceEntity'
	],
	#category : #'Casino-Importer-Spec-Visitor'
}

{ #category : #meta }
FAMIXPharoPositionAnchor class >> annotation [

	<MSEClass: #PharoPositionAnchor super: #FAMIXSourceAnchor>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-File' }
FAMIXPharoPositionAnchor >> containerFiles [
	^ {  }
]

{ #category : #'Famix-File' }
FAMIXPharoPositionAnchor >> endPos [

	<MSEProperty: #endPos type: #Number>
	<MSEComment: 'Stop position in the source'>
	^ endPos
]

{ #category : #'Famix-File' }
FAMIXPharoPositionAnchor >> endPos: anObject [

	endPos := anObject

]

{ #category : #'Famix-File' }
FAMIXPharoPositionAnchor >> lineCount [
	^ self sourceText ifNotNil: #lineCount ifNil: [ self notExistentMetricValue ]
]

{ #category : #'Famix-File' }
FAMIXPharoPositionAnchor >> sourceEntity [

	<MSEProperty: #sourceEntity type: #Object>
	<MSEComment: 'Source entity'>
	^ sourceEntity
]

{ #category : #'Famix-File' }
FAMIXPharoPositionAnchor >> sourceEntity: anObject [

	sourceEntity := anObject

]

{ #category : #'Famix-File' }
FAMIXPharoPositionAnchor >> sourceText [
	^ sourceEntity sourceText copyFrom: startPos to: endPos
]

{ #category : #'Famix-File' }
FAMIXPharoPositionAnchor >> startPos [

	<MSEProperty: #startPos type: #Number>
	<MSEComment: 'Start position in the source'>
	^ startPos
]

{ #category : #'Famix-File' }
FAMIXPharoPositionAnchor >> startPos: anObject [

	startPos := anObject

]
