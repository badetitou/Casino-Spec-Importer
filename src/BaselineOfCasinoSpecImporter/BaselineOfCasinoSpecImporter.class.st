Class {
	#name : #BaselineOfCasinoSpecImporter,
	#superclass : #BaselineOf,
	#category : #BaselineOfCasinoSpecImporter
}

{ #category : #baselines }
BaselineOfCasinoSpecImporter >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfCasinoSpecImporter >> defineDependencies: spec [
	spec
			baseline: 'Casino' 
			with: [ 
				spec
				loads: 'core-extented';
				repository: 'github://badetitou/Casino:v2/src'.].
]

{ #category : #baselines }
BaselineOfCasinoSpecImporter >> defineGroups: spec [
	spec
		group: 'default' with: #('Casino-Importer-Spec')
]

{ #category : #baselines }
BaselineOfCasinoSpecImporter >> definePackages: spec [
	spec
		repository: 'https://github.com/badetitou/Casino';
		package: 'Casino-Importer-Spec' with: [ spec requires: #('Casino')].
]
