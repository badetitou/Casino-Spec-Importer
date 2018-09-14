"
I create BL-Model with UI-SubEntities from a Spec application
"
Class {
	#name : #BLImporterSpec,
	#superclass : #BLWebModel,
	#category : #'BL-Model-Importer-Spec'
}

{ #category : #api }
BLImporterSpec >> import [
	"begin"
	model := MooseModel new name: 'Showroom'; yourself.
	model add: BLPhase new.
	^ model
]
