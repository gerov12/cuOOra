Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuOOra',
		'usuario1',
		'usuario2',
		'pregunta1',
		'pregunta2',
		'topico1',
		'topico2',
		'respuesta'
	],
	#category : #'OO2-CuOOra-TestUnit'
}

{ #category : #setup }
CuOOraTest >> setUp [ 
	| topicos1 topicos2 |
	cuOOra := CuOOra new.
	cuOOra crearUsuario: 'Pepe2020' conContraseña: '1234'.
	cuOOra crearUsuario: 'Carlos123' conContraseña: '4567'.
	cuOOra agregarTopicoConNombre: 'Python' yDescripcion: 'Topico sobre el lenguaje python'.
	cuOOra agregarTopicoConNombre: 'Java' yDescripcion: 'Topico sobre el lenguaje java'.
	
	usuario1:= cuOOra usuarios first.
	usuario2:= cuOOra usuarios last.
	topico1:= cuOOra topicos first.
	topico2:= cuOOra topicos last.
		
	topicos1 := OrderedCollection new.
	topicos1 add: topico1.
	topicos2 := OrderedCollection new.
	topicos2 add: topico2.
	
	cuOOra agregarPreguntaConListaDeTopicos: topicos1 Titulo: '¿Como hago for en Python' yCuerpo: 'necesito ayuda Python' delUsuario: usuario1.
	cuOOra agregarPreguntaConListaDeTopicos: topicos2 Titulo: '¿Como hago for en Java' yCuerpo: 'necesito ayuda Java' delUsuario: usuario2.
	pregunta1 := topico1 preguntas first.
	pregunta2 := topico2 preguntas first.
]

{ #category : #tests }
CuOOraTest >> testAgregarTopico [
	self assert: cuOOra topicos first equals: topico1.
	self assert: cuOOra topicos last equals: topico2.
]

{ #category : #tests }
CuOOraTest >> testCalcularPuntajeUsuario [
		self assert: (cuOOra calcularPuntajeUsuario: usuario1) equals: 20.
		
		cuOOra agregarRespuestaA: pregunta1 conCuerpo: 'No se...' deUsuario: usuario1.
		
		self assert: (cuOOra calcularPuntajeUsuario: usuario1) equals: 70.
]

{ #category : #tests }
CuOOraTest >> testCrearUsuario [
	self assert: cuOOra usuarios first equals: usuario1.
	self assert: cuOOra usuarios last equals: usuario2.
]

{ #category : #tests }
CuOOraTest >> testObtenerPreguntasRelevantes [
	self assert: (cuOOra obtenerPreguntasRelevantes: usuario1) size equals: 0.
	
	cuOOra agregarFollowerA: usuario2 De: usuario1 .
	cuOOra registrarTopicoInteres: topico1 Para: usuario1.
	
	self assert: (cuOOra obtenerPreguntasRelevantes: usuario1) size equals: 2.
	self assert: ((cuOOra obtenerPreguntasRelevantes: usuario1) includes: pregunta1) equals: true.
	self assert: ((cuOOra obtenerPreguntasRelevantes: usuario1) includes: pregunta2) equals: true.
]

{ #category : #tests }
CuOOraTest >> testObtenerPreguntasTopico [
	self assert: (cuOOra obtenerPreguntasTopico: topico1) first equals: pregunta1.
]

{ #category : #tests }
CuOOraTest >> testObtenerPreguntasUsuario [
	self assert: (cuOOra obtenerPreguntasUsuario: usuario1) size equals: 1.
	self assert: (cuOOra obtenerPreguntasUsuario: usuario2) size equals: 1.
	self assert: ((cuOOra obtenerPreguntasUsuario: usuario1) includes: pregunta1) equals: true.
	self assert: ((cuOOra obtenerPreguntasUsuario: usuario2) includes: pregunta2) equals: true.
]

{ #category : #tests }
CuOOraTest >> testObtenerRespuestasUsuario [
	self assert: (cuOOra obtenerRespuestas: pregunta1) size equals: 0.
	
	cuOOra agregarRespuestaA: pregunta1 conCuerpo: 'No se...' deUsuario: usuario1.
	cuOOra agregarRespuestaA: pregunta1 conCuerpo: 'Tampoco se...' deUsuario: usuario2.
	
	self assert: (cuOOra obtenerRespuestas: pregunta1) size equals: 2.
	self assert: (cuOOra obtenerRespuestas: pregunta1) first usuario equals: usuario1.
	self assert: (cuOOra obtenerRespuestas: pregunta1) last usuario equals: usuario2.
]
