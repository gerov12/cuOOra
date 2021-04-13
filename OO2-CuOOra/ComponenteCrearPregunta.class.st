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
	topics := self model retornarTopicos: topicos.
	"debe tener un cuerpo, titulo y al menos un topico"
	(topics isEmpty or: [cuerpo isEmpty or: [titulo isEmpty]]) ifTrue: [ ^ self answer ]. "popup??"
	self session user agregarPreguntaConListaDeTopicos: topics Titulo: titulo yCuerpo: cuerpo.
 	self answer 
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
	aCanvas form: [self renderInputContentOn: aCanvas]
]

{ #category : #rendering }
ComponenteCrearPregunta >> renderInputContentOn: aCanvas [
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

.mensaje{
    position: absolute;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: flex-end;
    padding-top: 0.9rem;
    padding-bottom: 0.5rem;
    width: 90%
}'
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
