Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'ahora',
		'pregunta',
		'topicos',
		'pedro'
	],
	#category : #'OO2-CuOOra-TestUnit'
}

{ #category : #running }
PreguntaTest >> setUp [
	ahora := DateAndTime now.
	topicos := OrderedCollection
		with: (Topico nombre: 'Python' descripcion: 'Topico de Python')
		with: (Topico nombre: 'SmallTalk' descripcion: 'Topico de SmallTalk').
	pedro := Usuario nombre: 'Pedro' contraseña: '111' fechaYhora: DateAndTime now.
	pregunta := Pregunta
		topicos: topicos
		titulo: 'Pregunta1'
		cuerpo: 'Esto es un cuerpo'
		usuario: pedro
		fechaYhora: ahora
]

{ #category : #tests }
PreguntaTest >> testAgregarRespuesta [
	| respuesta |
	self assert: pregunta respuestas size equals: 0.
	respuesta := Respuesta
		cuerpo: 'Una respuesta'
		usuario: pedro
		fechaYhora: DateAndTime now.
	pregunta agregarRespuesta: respuesta.
	self assert: pregunta respuestas size equals: 1
]

{ #category : #tests }
PreguntaTest >> testConstructor [
	self assert: pregunta topicos size equals: 2.
	self assert: pregunta usuario equals: pedro.
	self assert: pregunta cuerpo equals: 'Esto es un cuerpo'.
	self assert: pregunta titulo equals: 'Pregunta1'.
	self assert: pregunta horaYfecha equals: ahora.
	self assert: pregunta respuestas size equals: 0.
	self assert: pregunta valoraciones size equals: 0.
]

{ #category : #tests }
PreguntaTest >> testRegistrarValoracion [
	self assert: pregunta valoraciones size equals: 0.
	pregunta
		registrarValoracionDe: pedro
		conFechayHora: ahora
		yLike: true.
	self assert: pregunta valoraciones size equals: 1.
	pregunta
		registrarValoracionDe: (Usuario nombre: 'Mario' contraseña: '' fechaYhora: DateAndTime now)
		conFechayHora: ahora
		yLike: true.
	self assert: pregunta valoraciones size equals: 2.
	pregunta
		registrarValoracionDe: pedro
		conFechayHora: ahora
		yLike: false.
	self assert: pregunta valoraciones size equals: 2
]

{ #category : #tests }
PreguntaTest >> testRespuestas [
	| respuesta |
	
	self assert: pregunta respuestas size equals: 0.
	
	respuesta := Respuesta cuerpo: 'Una respuesta' usuario: pedro fechaYhora: DateAndTime now.
	
	pregunta agregarRespuesta: respuesta.
	
	self assert: pregunta respuestas size equals: 1.
]

{ #category : #tests }
PreguntaTest >> testRetornarPuntaje [
	self assert: pregunta retornarPuntaje equals: 20.
	pregunta
		registrarValoracionDe: pedro
		conFechayHora: ahora
		yLike: true.
	pregunta
		registrarValoracionDe: (Usuario nombre: 'Agustin' contraseña: '' fechaYhora: '')
		conFechayHora: ahora
		yLike: true.
	pregunta
		registrarValoracionDe: (Usuario nombre: 'Mario' contraseña: '' fechaYhora: '')
		conFechayHora: ahora
		yLike: false.
	self assert: pregunta retornarPuntaje equals: 21
]
