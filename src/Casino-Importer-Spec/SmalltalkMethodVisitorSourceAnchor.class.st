Class {
	#name : #SmalltalkMethodVisitorSourceAnchor,
	#superclass : #SmalltalkMethodVisitor,
	#category : #'Casino-Importer-Spec-Visitor'
}

{ #category : #'visitor-double dispatching' }
SmalltalkMethodVisitorSourceAnchor >> visitAssignmentNode: anAssignmentNode [
    | access |
    importer importingContext shouldImportAccess
        ifTrue: [ access := self importer factory access new.
            access isWrite: true.
            access variable: (self resolve: anAssignmentNode variable name).
            access accessor: self methodEntity.
            access
                sourceAnchor:
                    (FAMIXPharoPositionAnchor new
                        sourceEntity: self methodEntity;
                        startPos: anAssignmentNode start;
                        endPos: anAssignmentNode stop).
            importer addEntity: access ].
    self extractCommentsFromNode: anAssignmentNode.
    self visitNode: anAssignmentNode value
]

{ #category : #'visitor-double dispatching' }
SmalltalkMethodVisitorSourceAnchor >> visitBlockNode: aBlockNode [
	| local |
	importer importingContext shouldImportLocalVariable
		ifTrue: [ aBlockNode arguments
				do: [ :aVariableNode | 
					local := self importer factory localVariable new.
					local name: aVariableNode name asSymbol.
					local
						sourceAnchor:
							(FAMIXPharoPositionAnchor new
								sourceEntity: self methodEntity;
								startPos: aVariableNode start;
								endPos: aVariableNode stop).
					local parentBehaviouralEntity: self methodEntity.
					importer addEntity: local.
					methodScope at: aVariableNode name bind: local ] ].
	self extractCommentsFromNode: aBlockNode.	"self visitArguments: aBlockNode arguments."
	self visitNode: aBlockNode body
]

{ #category : #'visitor-double dispatching' }
SmalltalkMethodVisitorSourceAnchor >> visitMessageNode: aMessageNode [
    | invocation |
    importer importingContext shouldImportInvocation
        ifTrue: [ invocation := self importer factory invocation new.
            invocation sender: self methodEntity.
            invocation
                signature: (self importer factory nameResolver signatureFromSmalltalkSelectorOn: aMessageNode selector).
            "invocation  
				setInvokes: 
					(FAMIXNameResolver signatureFromSmalltalkSelector: aMessageNode selector)."
            aMessageNode receiver isVariable
                ifTrue: [ invocation receiver: (self resolve: aMessageNode receiver name asString) ].
            (aMessageNode receiver isMessage
                and: [ aMessageNode parent isMessage and: [ aMessageNode parent receiver isVariable ] ])
                ifTrue: [ invocation receiver: (self resolve: aMessageNode parent receiver name asString)].
            aMessageNode selector == #subclassResponsibility
                ifTrue: [ self methodEntity isAbstract: true ].
            invocation
                sourceAnchor:
                    (FAMIXPharoPositionAnchor new
                        sourceEntity: self methodEntity;
                        startPos: aMessageNode keywordsPositions first;
                        endPos: aMessageNode stop).
            importer addEntity: invocation ].
    (aMessageNode isCascaded not or: [ aMessageNode isFirstCascaded ])
        ifTrue: [ self visitNode: aMessageNode receiver ].
    importer importingContext shouldImportArgument
        ifTrue: [ aMessageNode arguments do: [ :each | self visitNode: each ] ].
    self extractCommentsFromNode: aMessageNode
]

{ #category : #'visitor-double dispatching' }
SmalltalkMethodVisitorSourceAnchor >> visitSequenceNode: aSequenceNode [
	"self visitArguments: aSequenceNode temporaries."

	| local |
	importer importingContext shouldImportLocalVariable
		ifTrue: [ aSequenceNode temporaries
				do: [ :aVariableNode | 
					local := self importer factory localVariable new.
					local
						sourceAnchor:
							(FAMIXPharoPositionAnchor new
								sourceEntity: self methodEntity;
								startPos: aVariableNode start;
								endPos: aVariableNode stop).
					local name: aVariableNode name asSymbol.
					local parentBehaviouralEntity: self methodEntity.
					importer addEntity: local.
					methodScope at: aVariableNode name bind: local ] ].
	self extractCommentsFromNode: aSequenceNode.
	aSequenceNode statements do: [ :each | self visitNode: each ]
]

{ #category : #'visitor-double dispatching' }
SmalltalkMethodVisitorSourceAnchor >> visitVariableNode: aVariableNode [
	importer importingContext shouldImportAccess
		ifTrue: [ | access namedEntity global |
			"Warning! Smalltalk is both a Namespace and a GlobalVariable.
		By default the importer resolves Smalltalk to the namespace (for class and namespace creation).
		When we access Smalltalk as a variable, we create an access to the SmalltalkGlobalVariable instead"
			aVariableNode name = 'Smalltalk'
				ifTrue: [ global := importer ensureGlobalVariable: #SmalltalkGlobalVariable value: Smalltalk.
					access := self createAccessTo: global writing: false ]
				ifFalse: [ namedEntity := self resolve: aVariableNode name.
					access := (namedEntity isKindOf: self importer factory classEntity) ifTrue: [ self createReferenceTo: namedEntity ] ifFalse: [ self createAccessTo: namedEntity writing: false ] ].
			access
				sourceAnchor:
					(FAMIXPharoPositionAnchor new
						sourceEntity: self methodEntity;
						startPos: aVariableNode start;
						endPos: aVariableNode stop).
			importer addEntity: access ].
	self extractCommentsFromNode: aVariableNode
]
