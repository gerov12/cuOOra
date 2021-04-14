Class {
	#name : #CuOOraMockObject,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'OO2-CuOOra-TestUnit'
}

{ #category : #'instance creation' }
CuOOraMockObject class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #'instance creation' }
CuOOraMockObject class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #adding }
CuOOraMockObject >> agregarTopicoConNombre: unNombre yDescripcion: unaDescripcion [
	topicos add: (Topico nombre: unNombre descripcion: unaDescripcion).

	
]

{ #category : #adding }
CuOOraMockObject >> crearUsuario: unNombre conContraseña: unaContraseña [
	usuarios add: (Usuario nombre: unNombre contraseña: unaContraseña fechaYhora: DateAndTime current).
	^ usuarios last.
]

{ #category : #private }
CuOOraMockObject >> hardCode [
	|pedro diego juan oo1 testU smalltalk listaP listaD|
	self agregarTopicoConNombre: 'OO1' yDescripcion: 'descripcion oo1'. 
	self agregarTopicoConNombre: 'Test de unidad' yDescripcion: 'descripcion testUnit'. 
	self agregarTopicoConNombre: 'Smalltalk' yDescripcion: 'descripcion smalltalk'. 
	oo1 := topicos at: 1.
	testU := topicos at: 2.
	smalltalk := topicos at: 3.
	
	listaP := OrderedCollection new.
	listaP add: oo1. listaP add: testU.
	
	listaD := OrderedCollection new.
	listaD add: oo1. listaD add: smalltalk.
	
	pedro := self crearUsuario: 'pedro@cuoora.com' conContraseña: 'pedro@cuoora.com'.
	diego := self crearUsuario: 'diego@cuoora.com' conContraseña: 'diego@cuoora.com'.
	juan := self crearUsuario: 'juan@cuoora.com' conContraseña: 'juan@cuoora.com'.

	juan seguirUsuario: diego. pedro seguirUsuario: juan.
	
	pedro agregarPreguntaConListaDeTopicos: listaP Titulo: '¿Para qué sirve el método SetUp?' yCuerpo: '...' .
	diego agregarPreguntaConListaDeTopicos: listaD Titulo: '¿Qué significa #messageNotUnderstoood?' yCuerpo: '...' .
	
	diego agregarRespuestaA: (pedro preguntas first) conCuerpo: 
		'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de cada test.'.
	pedro agregarRespuestaA: (diego preguntas first) conCuerpo: 
		'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.'.
]

{ #category : #initialize }
CuOOraMockObject >> initialize [ 
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new.
]

{ #category : #private }
CuOOraMockObject >> parsearTopicos: listaNombres [
	(listaNombres isEmpty or: [listaNombres = 'Ingrese tópicos separados por coma']) 
	ifTrue: [ ^ OrderedCollection new ].
	^ listaNombres findTokens: (', ', ',').
]

{ #category : #utility }
CuOOraMockObject >> retornarTopicos: listaNombres [
	| lista |
	lista := (self parsearTopicos: listaNombres).
	lista ifNotEmpty: 
		[ ^ lista collect: [ :each | self validarTopico: each ]].
	^ lista
]

{ #category : #accessing }
CuOOraMockObject >> topicos [
	^ topicos
]

{ #category : #utility }
CuOOraMockObject >> usuarioConNombre: unNombre protegidoPor: unaContraseña [
	^ usuarios
		detect: [ :each | each nombre = unNombre & (each contraseña = unaContraseña) ]
		ifNone: [ nil ]
]

{ #category : #accessing }
CuOOraMockObject >> usuarios [
	^ usuarios
]

{ #category : #private }
CuOOraMockObject >> validarTopico: nombreTopico [
	^ topicos 
		detect: [ :each | each nombre = nombreTopico ] 
		ifNone: [ self agregarTopicoConNombre: nombreTopico yDescripcion: ''.
					 ^ topicos last.]
]
