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
	^ usuarios last.
]

{ #category : #initialize }
CuOOra >> initialize [ 
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new.
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
