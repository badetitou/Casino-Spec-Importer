Class {
	#name : #CSNWidgetFactorySpec,
	#superclass : #BLWidgetFactory,
	#category : #'Casino-Importer-Spec-Importer'
}

{ #category : #accesing }
CSNWidgetFactorySpec >> createAttributeFrom: anObject [
	^ BLAttribute createAttributeFromSpecInvocation: anObject.
]

{ #category : #accesing }
CSNWidgetFactorySpec >> createLayoutAttributeFrom: aKeyword with: aValue [
	^ BLAttribute createLayoutAttributeFromKeyword: aKeyword withValue: aValue
]

{ #category : #accesing }
CSNWidgetFactorySpec >> createWidgetFrom: anObject [
	^ BLWidget createWidgetFromSpecInvocation: anObject
]
