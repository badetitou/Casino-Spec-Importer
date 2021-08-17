# Casino-Spec-Importer

## Installation


1. Download the last Moose Image
2. In the Moose Image execute

```st
Metacello new
  githubUser: 'badetitou' project: 'Casino-Spec-Importer' commitish: 'master' path: 'src';
  baseline: 'CasinoSpecImporter';
  load
```

## Usage 

```st
specModel := CSNImporterSpec new
  importPresenter: SpecDemoComposition "name of the presenter"
  withPackages: { SpecDemoComposition package name. #'Spec-Examples'}. "package in which there are widgets used in the presenter"
```

