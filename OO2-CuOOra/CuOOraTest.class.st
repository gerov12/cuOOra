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
	cuOOra := CuOOraMockObject new.
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

{ #category : #tests }
CuOOraTest >> testParsearTopicos [
	| lista |
	lista := cuOOra parsearTopicos: 'T1, T2, T3'.
	self assert: (lista at: 1) equals: 'T1'.
	self assert: (lista at: 2) equals: 'T2'.
	self assert: (lista at: 3) equals: 'T3'.
	
	lista := cuOOra parsearTopicos: 'T1 , T2 , T3'.
	self assert: (lista at: 1) equals: 'T1'.
	self assert: (lista at: 2) equals: 'T2'.
	self assert: (lista at: 3) equals: 'T3'.
	
	lista := cuOOra parsearTopicos: 'T1 ,T2 ,T3'.
	self assert: (lista at: 1) equals: 'T1'.
	self assert: (lista at: 2) equals: 'T2'.
	self assert: (lista at: 3) equals: 'T3'.
	
	lista := cuOOra parsearTopicos: 'T1,T2,T3'.
		self assert: (lista at: 1) equals: 'T1'.
		self assert: (lista at: 2) equals: 'T2'.
		self assert: (lista at: 3) equals: 'T3'.
	
	lista := cuOOra parsearTopicos: 'T1 ,, T2 , , T3'.
		self assert: (lista at: 1) equals: 'T1'.
		self assert: (lista at: 2) equals: 'T2'.
		self assert: (lista at: 3) equals: 'T3'.
]

{ #category : #tests }
CuOOraTest >> testRetornarTopicos [
	"los topicos Python y Java ya existen, Smalltalk y Ruby no"
	self assert: cuOOra topicos size equals: 2.
	self assert: (cuOOra retornarTopicos: 'Python, Java') size equals: 2.
	self assert: (cuOOra retornarTopicos: 'Python, Java') first equals: topico1.
	self assert: (cuOOra retornarTopicos: 'Python, Java') last equals: topico2.
	self assert: (cuOOra retornarTopicos: 'Smalltalk, Ruby') size equals: 2.
	self assert: cuOOra topicos size equals: 4.
]

{ #category : #tests }
CuOOraTest >> testValidarTopico [
	"Python existe, Smalltalk no"
	| topico3 |
	self assert: (cuOOra validarTopico: 'Python') equals: topico1.
	self assert: cuOOra topicos size equals: 2. "Python y Java"
	topico3 := cuOOra validarTopico: 'Smalltalk'.	
	self assert: cuOOra topicos size equals: 3. "Python, Java y Smalltalk"
	self assert: cuOOra topicos last equals: topico3.
]
