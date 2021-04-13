Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuOOra',
		'usuario1',
		'usuario2',
		'topico1',
		'topico2'
	],
	#category : #'OO2-CuOOra-TestUnit'
}

{ #category : #setup }
CuOOraTest >> setUp [ 
	cuOOra := CuOOra new.
	cuOOra crearUsuario: 'Pepe2020' conContraseña: '1234'.
	cuOOra crearUsuario: 'Carlos123' conContraseña: '4567'.
	cuOOra agregarTopicoConNombre: 'Python' yDescripcion: 'Topico sobre el lenguaje python'.
	cuOOra agregarTopicoConNombre: 'Java' yDescripcion: 'Topico sobre el lenguaje java'.
	
	usuario1:= cuOOra usuarios first.
	usuario2:= cuOOra usuarios last.
	topico1:= cuOOra topicos first.
	topico2:= cuOOra topicos last.
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
