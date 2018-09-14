Class {
	#name : #SmalltalkMethodVisitorSourceAnchor,
	#superclass : #SmalltalkMethodVisitor,
	#category : #'BL-Model-Importer-Spec'
}

{ #category : #'visitor-double dispatching' }
SmalltalkMethodVisitorSourceAnchor >> visitMessageNode: aMessageNode [ 
	 
	| invocation | 
	importer importingContext shouldImportInvocation 
		ifTrue: 
			[invocation := self importer factory invocation new. 
			invocation sender: self methodEntity. 
			
			invocation signature: (self importer factory nameResolver signatureFromSmalltalkSelectorOn: aMessageNode selector).
			"invocation  
				setInvokes: 
					(FAMIXNameResolver signatureFromSmalltalkSelector: aMessageNode selector)." 
			aMessageNode receiver isVariable 
				ifTrue: 
					[invocation 
						receiver: (self resolve: aMessageNode receiver name asString)]. 
			"aMessageNode receiver isVariable 
				ifTrue: 
					[invocation 
						setReceivingVariable: (self resolve: aMessageNode receiver name)]. "
			aMessageNode selector == #subclassResponsibility 
				ifTrue: [self methodEntity isAbstract: true].
			invocation sourceAnchor: (FAMIXPharoPositionAnchor new sourceEntity: self methodEntity; startPos: aMessageNode keywordsPositions first; endPos: (aMessageNode keywordsPositions first + aMessageNode keywords first size - 1  )). 
				
			importer addEntity: invocation]. 
	(aMessageNode isCascaded not or: [aMessageNode isFirstCascaded]) 
		ifTrue: [self visitNode: aMessageNode receiver]. 
	importer importingContext shouldImportArgument 
		ifTrue: [aMessageNode arguments do: [:each | self visitNode: each]]. 
	self extractCommentsFromNode: aMessageNode
]
