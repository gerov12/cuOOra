Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'pregunta',
		'pregunta2',
		'respuesta',
		'topico',
		'usuario1',
		'usuario2'
	],
	#category : #'OO2-CuOOra-TestUnit'
}

{ #category : #setup }
UsuarioTest >> setUp [ 
	| topics |
	usuario1 := Usuario nombre: 'Pedro' contraseña: '1234' fechaYhora: DateAndTime current.
	usuario2 := Usuario nombre: 'Juan' contraseña: '4567' fechaYhora: DateAndTime current.
	
	topico := Topico nombre: 'Python' descripcion: 'informacion sobre el lenguaje Python'.
	topics := OrderedCollection new.
	topics add: topico .
	
	pregunta := Pregunta topicos: topics titulo: '¿Como instalar Python' cuerpo: 'de donde puedo descargarlo?' usuario: usuario1 fechaYhora: DateAndTime current.
	pregunta2 := Pregunta topicos: OrderedCollection new titulo: 'A' cuerpo: 'B' usuario: usuario2 fechaYhora: DateAndTime current.
	
	respuesta := Respuesta cuerpo: 'No se...' usuario: usuario1 fechaYhora: DateAndTime current.
]

{ #category : #test }
UsuarioTest >> testAgregarPregunta [
	self assert: usuario1 preguntas isEmpty .
	
	usuario1 agregarPregunta: pregunta.
	
	self assert: usuario1 preguntas isNotEmpty .
	self assert: (usuario1 preguntas includes: pregunta).
]

{ #category : #test }
UsuarioTest >> testAgregarRespuesta [
	self assert: usuario1 respuestas isEmpty .
	
	usuario1 agregarRespuesta: respuesta.
	
	self assert: usuario1 respuestas isNotEmpty .
	self assert: (usuario1 respuestas includes: respuesta).
]

{ #category : #test }
UsuarioTest >> testAgregarTopicoInteres [
	self assert: usuario1 topicosInteres isEmpty .
	
	usuario1 agregarTopicoInteres: topico.
	
	self assert: usuario1 topicosInteres isNotEmpty .
	self assert: (usuario1 topicosInteres includes: topico).
]

{ #category : #test }
UsuarioTest >> testCalcularPuntaje [
	self assert: usuario1 calcularPuntaje equals: 0.
	usuario1 agregarPregunta: pregunta.
	self assert: usuario1 calcularPuntaje equals: 20.
	usuario1 agregarRespuesta: respuesta.
	self assert: usuario1 calcularPuntaje equals: 70.
	usuario1 eliminarPregunta: pregunta.
	self assert: usuario1 calcularPuntaje equals: 50.
	usuario1 agregarRespuesta: (Respuesta cuerpo: '' usuario: '' fechaYhora: '').
	self assert: usuario1 calcularPuntaje equals: 100.
]

{ #category : #test }
UsuarioTest >> testEliminarPregunta [
	usuario1 agregarPregunta: pregunta.
	self assert: usuario1 preguntas size equals: 1.
	
	usuario1 eliminarPregunta: pregunta.
	self assert: usuario1 preguntas size equals: 0.
	
]

{ #category : #test }
UsuarioTest >> testEliminarRespuesta [
	usuario1 agregarRespuesta: respuesta.
	self assert: usuario1 respuestas size equals: 1.
	
	usuario1 eliminarRespuesta: respuesta.
	self assert: usuario1 respuestas size equals: 0.
]

{ #category : #test }
UsuarioTest >> testObtenerPreguntasRelevantes [ 
	self assert: usuario1 obtenerPreguntasRelevantes isEmpty.
	
	usuario1 agregarTopicoInteres: topico.
	
	self assert: usuario1 obtenerPreguntasRelevantes isNotEmpty.
	self assert: usuario1 obtenerPreguntasRelevantes size equals: 1.
	self assert: (usuario1 obtenerPreguntasRelevantes includes: pregunta).
	
	usuario1 seguirUsuario: usuario2.
	usuario2 agregarPregunta: pregunta2.
	
	self assert: usuario1 obtenerPreguntasRelevantes isNotEmpty.
	self assert: usuario1 obtenerPreguntasRelevantes size equals: 2.
	self assert: (usuario1 obtenerPreguntasRelevantes includes: pregunta).
	self assert: (usuario1 obtenerPreguntasRelevantes includes: pregunta2).
]

{ #category : #test }
UsuarioTest >> testSeguirUsuario [
	self assert: usuario1 seguidos isEmpty.
	
	usuario1 seguirUsuario: usuario2.
	
	self assert: usuario1 seguidos isNotEmpty.
	self assert: usuario1 seguidos size equals: 1.
	self assert: (usuario1 seguidos includes: usuario2).
]
