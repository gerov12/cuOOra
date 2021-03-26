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
	
	pregunta1 := Pregunta topicos: topicos1 titulo: '¿Como hago for en Python' cuerpo: 'necesito ayuda Python' usuario: usuario1 fechaYhora: DateAndTime current.
	pregunta2 := Pregunta topicos: topicos2 titulo: '¿Como hago for en Java' cuerpo: 'necesito ayuda Java' usuario: usuario2 fechaYhora: DateAndTime current.
]

{ #category : #tests }
CuOOraTest >> testAgregarFollower [
	cuOOra agregarFollowerA: usuario2 De: usuario1 .
	self assert: ((usuario1 seguidos) includes: usuario2) equals: true . 
	self assert: ((usuario2 seguidos) includes: usuario1) equals: false . 
]

{ #category : #tests }
CuOOraTest >> testAgregarPregunta [
	cuOOra agregarRespuestaA: pregunta1 conCuerpo: 'No se...' deUsuario: usuario1.
	cuOOra agregarRespuestaA: pregunta1 conCuerpo: 'Tampoco se...' deUsuario: usuario2.
	
	self assert: cuOOra topicos first preguntas first equals: pregunta1.
	self assert: cuOOra topicos last preguntas first equals: pregunta2.
]

{ #category : #tests }
CuOOraTest >> testAgregarRespuesta [
	self assert: pregunta1 respuestas size equals: 2
]

{ #category : #tests }
CuOOraTest >> testAgregarTopico [
	self assert: cuOOra topicos first equals: topico1.
	self assert: cuOOra topicos last equals: topico2.
]

{ #category : #tests }
CuOOraTest >> testCrearUsuario [
	self assert: cuOOra usuarios first equals: usuario1.
	self assert: cuOOra usuarios last equals: usuario2.
]

{ #category : #tests }
CuOOraTest >> testRegistrarLike [
	
]
