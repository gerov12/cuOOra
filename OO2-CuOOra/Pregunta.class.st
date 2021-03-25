Class {
	#name : #Pregunta,
	#superclass : #Publicacion,
	#instVars : [
		'titulo',
		'topicos',
		'respuestas'
	],
	#category : #'OO2-CuOOra'
}

{ #category : #constructor }
Pregunta class >> topicos: unaColeccion titulo: unTitulo cuerpo: unCuerpo usuario: unUsuario fechaYhora: unDatetime [
	^  self topicos: unaColeccion titulo: unTitulo cuerpo: unCuerpo usuario: unUsuario fechaYhora: unDatetime
]

{ #category : #constructor }
Pregunta >> agregarRespueta: unaRespuesta [
	respuestas add: unaRespuesta.
]

{ #category : #constructor }
Pregunta >> eliminar [
	topicos do: [ :topico | topico eliminarPregunta: self ].
	respuestas do: [ :respuesta | respuesta eliminar ].
	usuario eliminarPregunta: self.
]

{ #category : #constructor }
Pregunta >> obtenerRespuestas [
	^ respuestas
]

{ #category : #constructor }
Pregunta >> retornarPuntaje [
	^ 20 + self retornarDiferencia
]

{ #category : #constructor }
Pregunta >> topicos: unaColeccion titulo: unTitulo cuerpo: unCuerpo usuario: unUsuario fechaYhora: unDatetime [
	topicos := unaColeccion.
	titulo := unTitulo.
	cuerpo := unCuerpo.
	usuario := unUsuario.
	horaYfecha := unDatetime.
	respuestas := OrderedCollection new.
]
