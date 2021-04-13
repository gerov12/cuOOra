Class {
	#name : #ComponenteCrearPregunta,
	#superclass : #Esqueleto,
	#instVars : [
		'titulo',
		'cuerpo',
		'topicos'
	],
	#category : #'OO2-CuOOra-seaside'
}

{ #category : #accessing }
ComponenteCrearPregunta >> cuerpo [
	^ cuerpo
]

{ #category : #accessing }
ComponenteCrearPregunta >> cuerpo: anObject [
	cuerpo := anObject
]

{ #category : #callbacks }
ComponenteCrearPregunta >> hacerPublicacion [ 
	| topics |
	topics := self parsearTopicos.
	"debe tener un cuerpo, titulo y al menos un topico"
	(topics isEmpty or: [cuerpo isEmpty or: [titulo isEmpty]]) ifTrue: [ ^ self answer ]. "popup??"
	self session user agregarPreguntaConListaDeTopicos: (self validarTopicosCon: topics) Titulo: titulo yCuerpo: cuerpo.
 	self answer 
]

{ #category : #utils }
ComponenteCrearPregunta >> parsearTopicos [
	(topicos isEmpty or: [topicos = 'Ingrese tópicos separados por coma']) ifTrue: [ ^ OrderedCollection new ].
	^ topicos parseLiterals asOrderedCollection removeAllSuchThat: [ :topic | topic = ',' ].
	
]

{ #category : #rendering }
ComponenteCrearPregunta >> renderButtonsOn: aCanvas [
	aCanvas tableRow: [ 
		aCanvas tableData: [ aCanvas space ]. 
		aCanvas tableData: [  
			aCanvas cancelButton
				callback: [ self answer ];
				with: 'Cancelar'.
			aCanvas space: 2.
			aCanvas submitButton
				callback: [ self hacerPublicacion ];
				with: 'Guardar' ].
	]
			
]

{ #category : #rendering }
ComponenteCrearPregunta >> renderContentOn: aCanvas [
	self renderHeadingContent: aCanvas.
	aCanvas heading level: 2; with: 'Nueva Pregunta'.
	aCanvas horizontalRule.
	aCanvas form: [self renderImputContentOn: aCanvas]
]

{ #category : #rendering }
ComponenteCrearPregunta >> renderImputContentOn: aCanvas [
	aCanvas table: [
		aCanvas tableRow: [    
			aCanvas tableData: [aCanvas emphasis: 'Titulo'; space].
			aCanvas tableData: [(aCanvas textArea on: #titulo of: self) 
			"espacio para escribir el titulo de la pregunta"
				text: 'Escriba aquí el título de su pregunta';
				columns: 80;
				rows: 1]
		].
		aCanvas tableRow: [  
			aCanvas tableData: [aCanvas emphasis: 'Desarrollo'; space: 10].
			aCanvas tableData: [(aCanvas textArea on: #cuerpo of: self) 
			"espacio para escribir el cuerpo de la pregunta"
				text: 'Escriba aquí el desarrollo de su pregunta';
				columns: 80;
				rows: 5]
		].
		aCanvas tableRow: [  
		aCanvas tableData: [aCanvas emphasis: 'Topicos'; space].
		aCanvas tableData: [(aCanvas textArea on: #topicos of: self) 
			"espacio para escribir el cuerpo de la pregunta"
				text: 'Ingrese tópicos separados por coma';
				columns: 80;
				rows: 1].
		self renderButtonsOn: aCanvas
		].
	]
	
]

{ #category : #rendering }
ComponenteCrearPregunta >> style [ 
	^ 'a[href] {
    color: #000000;
    text-decoration: none;
}
'
]

{ #category : #accessing }
ComponenteCrearPregunta >> titulo [
	^ titulo
]

{ #category : #accessing }
ComponenteCrearPregunta >> titulo: anObject [
	titulo := anObject
]

{ #category : #accessing }
ComponenteCrearPregunta >> topicos [
	^ topicos
]

{ #category : #accessing }
ComponenteCrearPregunta >> topicos: anObject [
	topicos := anObject
]

{ #category : #utils }
ComponenteCrearPregunta >> validarTopicosCon: topics [
	| existen lista |
	lista := OrderedCollection new.
	"nombres del imput que coinciden con los nombres de cuoora"
	existen := topics intersection: (CuOOra soleInstance topicos collect: [ :each | each nombre ]) . 
	lista add: (existen collect: [ :each | CuOOra soleInstance topicos detect: [ :cada | cada nombre = each ]]).
	lista add: ((topics difference: existen) collect: [ :each | CuOOra soleInstance agregarTopicoConNombre: each yDescripcion: '']).
	^ lista flatCollect: [  :each | each ]
]
