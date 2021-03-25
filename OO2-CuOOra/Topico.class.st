Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion',
		'preguntas'
	],
	#category : #'OO2-CuOOra'
}

{ #category : #construction }
Topico class >> nombre: unNombre descripcion: unaDescripcion [ 
	^ self nombre: unNombre descripcion: unaDescripcion 
]

{ #category : #adding }
Topico >> agregarPregunta: unaPregunta [
	preguntas add: unaPregunta .
]

{ #category : #deleting }
Topico >> eliminarPregunta: unaPregunta [
	preguntas remove: unaPregunta  ifAbsent: [ ^ self ]
]

{ #category : #initialization }
Topico >> nombre: unNombre descripcion: unaDescripcion [ 
	nombre := unNombre .
	descripcion := unaDescripcion .
	preguntas := OrderedCollection new.
]

{ #category : #accessing }
Topico >> preguntas [
	^ preguntas
]
