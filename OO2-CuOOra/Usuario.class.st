Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'contraseña',
		'fechaYhora',
		'seguidos',
		'preguntas',
		'respuestas',
		'topicosInteres'
	],
	#category : #'OO2-CuOOra'
}

{ #category : #construction }
Usuario class >> nombre: unNombre contraseña: unaContraseña fechaYhora: unDateTime [ 
	^ self new nombre: unNombre contraseña: unaContraseña fechaYhora: unDateTime .
]

{ #category : #adding }
Usuario >> agregarPregunta: unaPregunta [
	preguntas add: unaPregunta .
]

{ #category : #adding }
Usuario >> agregarRespuesta: unaRespuesta [
	respuestas add: unaRespuesta .
]

{ #category : #adding }
Usuario >> agregarTopicoInteres: unTopico [
	topicosInteres add: unTopico .
]

{ #category : #queries }
Usuario >> calcularPuntaje [
	^ (preguntas sumNumbers: [ :each | each retornarPuntaje ]) + (preguntas sumNumbers: [ :each | each retornarPuntaje ]) .
]

{ #category : #deleting }
Usuario >> eliminarPregunta: unaPregunta [ 
	preguntas remove: unaPregunta  ifAbsent: [ ^ self ]

]

{ #category : #deleting }
Usuario >> eliminarRespuesta: unaRespuesta [ 
	respuestas remove: unaRespuesta  ifAbsent: [ ^ self ]
]

{ #category : #initialization }
Usuario >> nombre: unNombre contraseña: unaContraseña fechaYhora: unDateTime [ 
	nombre := unNombre .
	contraseña := unaContraseña .
	fechaYhora := unDateTime .
	seguidos := OrderedCollection new.
	preguntas := OrderedCollection new.
	respuestas := OrderedCollection new.
	topicosInteres := OrderedCollection new.
]

{ #category : #queries }
Usuario >> obtenerPreguntasRelevantes [
	|  preguntasAux |
	preguntasAux := OrderedCollection new.
	preguntasAux add: ((topicosInteres collect: [ :each | each preguntas ]) flatCollect: [ :each | each ]).
	preguntasAux add: ((seguidos collect: [ :each | each preguntas ]) flatCollect: [ :each | each ]).
	^ preguntasAux flatCollect: [ :each | each ]. 
]

{ #category : #accessing }
Usuario >> preguntas [
	^ preguntas
]

{ #category : #accessing }
Usuario >> respuestas [
	^ respuestas
]

{ #category : #accessing }
Usuario >> seguidos [
	^ seguidos
]

{ #category : #adding }
Usuario >> seguirUsuario: unUsuario [ 
	seguidos add: unUsuario .
]
