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
		'topico2'
	],
	#category : #'OO2-CuOOra-TestUnit'
}

{ #category : #setup }
CuOOraTest >> setUp [ 
	| topicos1 topicos2 |
	cuOOra := CuOOra new.
	usuario1 := (cuOOra crearUsuario: 'Pepe2020' conContraseña: '1234').
	usuario2 := (cuOOra crearUsuario: 'Carlos123' conContraseña: '4567').
	topico1 := (cuOOra agregarTopicoConNombre: 'Python' yDescripcion: 'Topico sobre el lenguaje python').
	topico2 := (cuOOra agregarTopicoConNombre: 'Java' yDescripcion: 'Topico sobre el lenguaje java').
	
	topicos1 := OrderedCollection new.
	topicos1 add: topico1.
	topicos2 := OrderedCollection new.
	topicos2 add: topico2.
	
	"pregunta1 := Pregunta topicos: topicos1 titulo: '¿Como hago for en Python' cuerpo: 'necesito ayuda Python' usuario: usuario1 fechaYhora: DateAndTime current.
	pregunta2 := Pregunta topicos: topicos2 titulo: '¿Como hago for en Java' cuerpo: 'necesito ayuda Java' usuario: usuario2 fechaYhora: DateAndTime current
	"
]

{ #category : #testing }
CuOOraTest >> testCrearUsuario [
	self assert: cuOOra usuarios first equals: usuario1.
]
