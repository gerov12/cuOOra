Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion',
		'preguntas'
	],
	#category : #'OO2-CuOOra-model'
}

{ #category : #construction }
Topico class >> nombre: unNombre descripcion: unaDescripcion [ 
	^ self new nombre: unNombre descripcion: unaDescripcion 
]

{ #category : #adding }
Topico >> agregarPregunta: unaPregunta [
	preguntas add: unaPregunta .
]

{ #category : #accessing }
Topico >> descripcion [
	^descripcion 
]

{ #category : #deleting }
Topico >> eliminarPregunta: unaPregunta [
	preguntas remove: unaPregunta  ifAbsent: [ ^ self ]
]

{ #category : #accessing }
Topico >> nombre [
	^nombre
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
