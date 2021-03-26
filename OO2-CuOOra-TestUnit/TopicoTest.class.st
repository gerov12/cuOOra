Class {
	#name : #TopicoTest,
	#superclass : #TestCase,
	#instVars : [
		'topico'
	],
	#category : #'OO2-CuOOra-TestUnit'
}

{ #category : #running }
TopicoTest >> setUp [
	topico := Topico
		nombre: 'Smalltalk'
		descripcion: 'Topico sobre Smalltalk'
]

{ #category : #tests }
TopicoTest >> testAgregarPregunta [
	self assert: topico preguntas size equals: 0.
	topico agregarPregunta: Pregunta new.
	self assert: topico preguntas size equals: 1.
]

{ #category : #tests }
TopicoTest >> testConstructor [
	self assert: topico nombre equals: 'Smalltalk'.
	self assert: topico descripcion equals: 'Topico sobre Smalltalk'.
	self assert: topico preguntas size equals: 0
]

{ #category : #tests }
TopicoTest >> testEliminarPregunta [
	|pregunta|
	pregunta := Pregunta new.
	self assert: topico preguntas size equals: 0.
	topico agregarPregunta: pregunta.
	self assert: topico preguntas size equals: 1.
	topico eliminarPregunta: pregunta.
	self assert: topico preguntas size equals: 0.
]
