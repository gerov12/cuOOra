Class {
	#name : #RespuestaTest,
	#superclass : #TestCase,
	#instVars : [
		'ahora',
		'pedro',
		'respuesta',
		'mario'
	],
	#category : #'OO2-CuOOra-TestUnit'
}

{ #category : #running }
RespuestaTest >> setUp [
	ahora := DateAndTime now.
	pedro := Usuario nombre: 'Pedro' contraseña: '111' fechaYhora: ahora.
	mario := Usuario nombre: 'Mario' contraseña: '222' fechaYhora: ahora.
	respuesta := Respuesta
		cuerpo: 'Esto es una respuesta'
		usuario: pedro
		fechaYhora: ahora
]

{ #category : #tests }
RespuestaTest >> testConstructor [
	self assert: respuesta cuerpo equals: 'Esto es una respuesta'.
	self assert: respuesta usuario equals: pedro.
	self assert: respuesta valoraciones size equals: 0.
	self assert: respuesta horaYfecha equals: ahora.
]

{ #category : #tests }
RespuestaTest >> testRegistrarValoracion [
	self assert: respuesta valoraciones size equals: 0.
	respuesta
		registrarValoracionDe: pedro
		conFechayHora: ahora
		yLike: true.
	self assert: respuesta valoraciones size equals: 1.
	respuesta
		registrarValoracionDe: pedro
		conFechayHora: ahora
		yLike: false.
	self assert: respuesta valoraciones size equals: 1.
	respuesta
		registrarValoracionDe: mario
		conFechayHora: ahora
		yLike: false.
	self assert: respuesta valoraciones size equals: 2
]

{ #category : #tests }
RespuestaTest >> testRetornarPuntaje [
	self assert: respuesta retornarPuntaje equals: 50.
	respuesta
		registrarValoracionDe: pedro
		conFechayHora: ahora
		yLike: false.
	self assert: respuesta retornarPuntaje equals: 49.
	respuesta
		registrarValoracionDe: pedro
		conFechayHora: ahora
		yLike: true.
	self assert: respuesta retornarPuntaje equals: 51.
	respuesta
		registrarValoracionDe: mario
		conFechayHora: ahora
		yLike: false.
	self assert: respuesta retornarPuntaje equals: 50
]
