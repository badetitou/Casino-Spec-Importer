Class {
	#name : #CSNWidgetFactorySpec,
	#superclass : #CSNWidgetFactory,
	#category : #'Casino-Importer-Spec-Importer'
}

{ #category : #accesing }
CSNWidgetFactorySpec >> createAttributeFrom: anObject [
	^ CSNAttribute createAttributeFromSpecInvocation: anObject.
]

{ #category : #accesing }
CSNWidgetFactorySpec >> createLayoutAttributeFrom: aKeyword with: aValue [
	^ CSNAttribute createLayoutAttributeFromKeyword: aKeyword withValue: aValue
]

{ #category : #accesing }
CSNWidgetFactorySpec >> createWidgetFrom: anObject [
	^ CSNWidget createWidgetFromSpecInvocation: anObject
]
