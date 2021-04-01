Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#category : #'OO2-CuOOra'
}

{ #category : #adding }
CuOOra >> agregarTopicoConNombre: unNombre yDescripcion: unaDescripcion [
	topicos add: (Topico nombre: unNombre descripcion: unaDescripcion).
]

{ #category : #adding }
CuOOra >> crearUsuario: unNombre conContraseña: unaContraseña [
	usuarios add: (Usuario nombre: unNombre contraseña: unaContraseña fechaYhora: DateAndTime current).
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

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios
]
