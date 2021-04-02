Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'OO2-CuOOra-model'
}

{ #category : #'instance creation' }
CuOOra class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #'instance creation' }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #adding }
CuOOra >> agregarTopicoConNombre: unNombre yDescripcion: unaDescripcion [
	topicos add: (Topico nombre: unNombre descripcion: unaDescripcion).
]

{ #category : #adding }
CuOOra >> crearUsuario: unNombre conContraseña: unaContraseña [
	usuarios add: (Usuario nombre: unNombre contraseña: unaContraseña fechaYhora: DateAndTime current).
	usuarios last agregarTopicoInteres: self topicos last. "BORRAR (HARDCODE)"
	^ usuarios last.
]

{ #category : #hardcode }
CuOOra >> hardCodePreguntas [
	|usuario1 topico1 lista|
	self agregarTopicoConNombre: 'Topico1' yDescripcion: 'descripcion'. 
	topico1 := self topicos last.
	lista := OrderedCollection new.
	lista add: topico1.
	self crearUsuario: 'Usuario1' conContraseña: '1'. 
	usuario1 := self usuarios last.

	Pregunta topicos: lista titulo: 'Pregunta1' cuerpo: 'Cuerpo1' usuario: usuario1 fechaYhora: DateAndTime current.
	Pregunta topicos: lista titulo: 'Pregunta2' cuerpo: 'Cuerpo2' usuario: usuario1 fechaYhora: DateAndTime current.
	Pregunta topicos: lista titulo: 'Pregunta3' cuerpo: 'Cuerpo1' usuario: usuario1 fechaYhora: DateAndTime current.
	Pregunta topicos: lista titulo: 'Pregunta4' cuerpo: 'Cuerpo1' usuario: usuario1 fechaYhora: DateAndTime current.
	Pregunta topicos: lista titulo: 'Pregunta5' cuerpo: 'Cuerpo1' usuario: usuario1 fechaYhora: DateAndTime current.
]

{ #category : #initialize }
CuOOra >> initialize [ 
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new.
	self hardCodePreguntas.
]

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos
]

{ #category : #utility }
CuOOra >> usuarioConNombre: unNombre protegidoPor: unaContraseña [
	^ usuarios
		detect: [ :each | each nombre = unNombre & (each contraseña = unaContraseña) ]
		ifNone: [ nil ]
]

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios
]
