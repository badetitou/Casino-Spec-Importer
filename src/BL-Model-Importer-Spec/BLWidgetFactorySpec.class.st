Class {
	#name : #BLWidgetFactorySpec,
	#superclass : #BLWidgetFactory,
	#category : #'BL-Model-Importer-Spec-Importer'
}

{ #category : #accesing }
BLWidgetFactorySpec >> createAttributeFrom: anObject [
	^ BLAttribute createAttributeFromSpecInvocation: anObject.
]

{ #category : #accesing }
BLWidgetFactorySpec >> createWidgetFrom: anObject [
	^ BLWidget createWidgetFromSpecInvocation: anObject

]
