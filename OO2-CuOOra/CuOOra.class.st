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
CuOOra >> agregarFollowerA: unSeguido De: unSeguidor [
	unSeguidor seguirUsuario: unSeguido.
]

{ #category : #adding }
CuOOra >> agregarPreguntaConListaDeTopicos: unaColeccion Titulo: unTitulo yCuerpo: unCuerpo delUsuario: unUsuario [
	| pregunta |
	pregunta := Pregunta topicos: unaColeccion titulo: unTitulo cuerpo: unCuerpo usuario: unUsuario fechaYhora: DateAndTime current.
	unUsuario agregarPregunta: pregunta.
	unaColeccion for: [ :each | each agregarPregunta: pregunta ].
]

{ #category : #adding }
CuOOra >> agregarRespuestaA: unaPregunta conCuerpo: unCuerpo deUsuario: unUsuario [ 
	| respuesta |
	respuesta := Respuesta cuerpo: unCuerpo usuario: unUsuario fechaYhora: Date current.
	unaPregunta agregarRespuesta: respuesta.
	unUsuario agregarRespuesta: respuesta.
]

{ #category : #adding }
CuOOra >> agregarTopicoConNombre: unNombre yDescripcion: unaDescripcion [
	topicos add: Topico nombre: unNombre descripcion: unaDescripcion .
]

{ #category : #deleting }
CuOOra >> borrarPregunta: unaPregunta [
	unaPregunta eliminar.
]

{ #category : #queries }
CuOOra >> calcularPuntajeUsuario: unUsuario [
	^ unUsuario calcularPuntaje.
]

{ #category : #adding }
CuOOra >> crearUsuario: unNombre conContraseña: unaContraseña [
	usuarios add: Usuario nombre: unNombre contraseña: unaContraseña fechaYhora: DateAndTime current .
]

{ #category : #queries }
CuOOra >> obtenerPreguntasRelevantes: unUsuario [
	^ unUsuario obtenerPreguntasRelevantes.
]

{ #category : #queries }
CuOOra >> obtenerPreguntasTopico: unTopico [ 
	^ unTopico preguntas.
]

{ #category : #queries }
CuOOra >> obtenerPreguntasUsuario: unUsuario [
	^ unUsuario preguntas.
]

{ #category : #queries }
CuOOra >> obtenerRespuestas: unaPregunta [ 
	^ unaPregunta respuestas.
]

{ #category : #queries }
CuOOra >> obtenerRespuestasUsuario: unUsuario [
	^ unUsuario respuestas.
]

{ #category : #adding }
CuOOra >> registrarDislikeA: unaPublicacion De: unUsuario [ 
	unaPublicacion registrarValoracionDe: unUsuario conFechayHora: Date current yLike: false.
]

{ #category : #adding }
CuOOra >> registrarLikeA: unaPublicacion De: unUsuario [ 
	unaPublicacion registrarValoracionDe: unUsuario conFechayHora: Date current yLike: true.
]

{ #category : #adding }
CuOOra >> registrarTopicoInteres: unTopico Para: unUsuario [ 
	unUsuario agregarTopicoInteres: unTopico .
]
