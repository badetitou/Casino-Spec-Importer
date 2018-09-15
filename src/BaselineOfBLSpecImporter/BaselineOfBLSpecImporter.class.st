Class {
	#name : #BaselineOfBLSpecImporter,
	#superclass : #BaselineOf,
	#category : #BaselineOfBLSpecImporter
}

{ #category : #baselines }
BaselineOfBLSpecImporter >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfBLSpecImporter >> defineDependencies: spec [
	spec
			baseline: 'BLToolkit' 
			with: [ 
				spec
				loads: 'core-extented';
				repository: 'github://badetitou/BL-Toolkit/:src'.].
]

{ #category : #baselines }
BaselineOfBLSpecImporter >> defineGroups: spec [
	spec
		group: 'default' with: #('BL-Model-Importer-Spec')
]

{ #category : #baselines }
BaselineOfBLSpecImporter >> definePackages: spec [
	spec
		repository: 'https://github.com/badetitou/BL-ToolKit';
		package: 'BL-Model-Importer-Spec' with: [ spec requires: #('BLToolkit')].
]
