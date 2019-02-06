Extension { #name : #CSNUIList }

{ #category : #'*Casino-Importer-Spec' }
CSNUIList class >> specCanHandle: anInvocation [
	^ #('newIconList' 'newList') anySatisfy: [ :keyword | anInvocation signature beginsWith: keyword ]  
]
