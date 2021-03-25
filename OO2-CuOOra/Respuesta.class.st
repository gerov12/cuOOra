Class {
	#name : #Respuesta,
	#superclass : #Publicacion,
	#category : #'OO2-CuOOra'
}

{ #category : #constructor }
Respuesta class >> cuerpo: unCuerpo usuario: unUsuario fechaYhora: unDatetime [
	^ self new cuerpo: unCuerpo horaYfecha: unDatetime usuario: unUsuario .
]

{ #category : #constructor }
Respuesta >> cuerpo: unString horaYfecha: unDateTime usuario: unUsuario [
	valoraciones := OrderedCollection new.
	cuerpo := unString.
	horaYfecha := unDateTime.
	usuario := unUsuario
]

{ #category : #queries }
Respuesta >> eliminar [
	usuario eliminarRespuesta: self.
]

{ #category : #queries }
Respuesta >> retornarPuntaje [
	^ 50 + self retornarDiferencia
]
