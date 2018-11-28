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
			baseline: 'BLToolkit' 
			with: [ 
				spec
				loads: 'core-extented';
				repository: 'github://badetitou/BL-Toolkit:master/src'.].
]

{ #category : #baselines }
BaselineOfCasinoSpecImporter >> defineGroups: spec [
	spec
		group: 'default' with: #('Casino-Importer-Spec')
]

{ #category : #baselines }
BaselineOfCasinoSpecImporter >> definePackages: spec [
	spec
		repository: 'https://github.com/badetitou/BL-ToolKit';
		package: 'Casino-Importer-Spec' with: [ spec requires: #('BLToolkit')].
]
