Class {
	#name : #Respuesta,
	#superclass : #Publicacion,
	#category : #'OO2-CuOOra'
}

{ #category : #constructor }
Respuesta class >> cuerpo: unCuerpo usuario: unUsuario fechaYhora: unDatetime [
	self cuerpo: unCuerpo horaYfecha: unDatetime usuario: unUsuario
]

{ #category : #constructor }
Respuesta >> eliminar [
	usuario eliminarRespuesta: self.
]

{ #category : #abstract }
Respuesta >> retornarPuntaje [
	^ 50 + self retornarDiferencia
]
