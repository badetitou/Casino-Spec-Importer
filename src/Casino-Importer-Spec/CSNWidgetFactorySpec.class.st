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
CSNWidgetFactorySpec >> createWidgetFrom: anObject [
	^ BLWidget createWidgetFromSpecInvocation: anObject

]
