Class {
	#name : #MoosePharoImporterTaskSourceAnchor,
	#superclass : #MoosePharoImporterTask,
	#category : #'BL-Model-Importer-Spec-Importer'
}

{ #category : #accessing }
MoosePharoImporterTaskSourceAnchor >> defaultImporterClass [
	"By default the class responsible for the extraction of model from Smalltalk code is SmalltalkImporter."
	^ SmalltalkImporterSourceAnchor
]
