Class {
	#name : #SmalltalkMethodVisitorSourceAnchor,
	#superclass : #SmalltalkMethodVisitor,
	#category : #'BL-Model-Importer-Spec'
}

{ #category : #'visitor-double dispatching' }
SmalltalkMethodVisitorSourceAnchor >> visitMethodNode: aMethodNode [ 
	 self halt. 
	importer importingContext shouldImportArgument 
		ifTrue: 
			[aMethodNode arguments 
				do: 
					[:aVariableNode | | argument | 
					argument := self importer factory parameter new. 
					argument name: aVariableNode name asSymbol. 
					argument parentBehaviouralEntity: self methodEntity. 
					importer addEntity: argument. 
					methodScope 
						at: aVariableNode name 
						bind: argument]]. 
	self extractCommentsFromNode: aMethodNode.
	self visitNode: aMethodNode body. 
	aMethodNode pragmas
		do: [ :each | self visitNode: each ].
		
	"recognize getters/setters/constructors/..."
	self classifyMethodNode: aMethodNode
]
