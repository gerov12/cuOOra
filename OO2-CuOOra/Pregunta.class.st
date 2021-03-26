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
	^ self new topicos: unaColeccion titulo: unTitulo cuerpo: unCuerpo usuario: unUsuario fechaYhora: unDatetime .
]

{ #category : #queries }
Pregunta >> agregarRespuesta: unaRespuesta [
	respuestas add: unaRespuesta.
]

{ #category : #method }
Pregunta >> asociarATopics [
	topicos do: [ :each | each agregarPregunta: self ]
]

{ #category : #queries }
Pregunta >> eliminar [
	topicos do: [ :topico | topico eliminarPregunta: self ].
	respuestas do: [ :respuesta | respuesta eliminar ].
	usuario eliminarPregunta: self.
]

{ #category : #accesing }
Pregunta >> respuestas [
	^ respuestas
]

{ #category : #queries }
Pregunta >> retornarPuntaje [
	^ 20 + self retornarDiferencia
]

{ #category : #accessing }
Pregunta >> titulo [
	^titulo
]

{ #category : #accessing }
Pregunta >> topicos [
	^ topicos
]

{ #category : #constructor }
Pregunta >> topicos: unaColeccion titulo: unTitulo cuerpo: unCuerpo usuario: unUsuario fechaYhora: unDatetime [
	topicos := unaColeccion.
	titulo := unTitulo.
	cuerpo := unCuerpo.
	usuario := unUsuario.
	horaYfecha := unDatetime.
	respuestas := OrderedCollection new.
	valoraciones := OrderedCollection new.
	self asociarATopics
]
