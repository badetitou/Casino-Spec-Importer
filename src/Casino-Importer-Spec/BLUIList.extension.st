Extension { #name : #BLUIList }

{ #category : #'*Casino-Importer-Spec' }
BLUIList class >> specCanHandle: anInvocation [
	^ #('newIconList' 'newList') anySatisfy: [ :keyword | anInvocation signature beginsWith: keyword ]  
]
