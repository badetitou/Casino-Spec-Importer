Class {
	#name : #BLWidgetFactorySpec,
	#superclass : #BLWidgetFactory,
	#category : #'BL-Model-Importer-Spec'
}

{ #category : #accesing }
BLWidgetFactorySpec >> factoryMethod [
	^ #createWidgetFromSpecInvocation:
]

{ #category : #accesing }
BLWidgetFactorySpec >> factoryMethodForAttribute [
	^ #createAttributeFromSpecInvocation:
]
