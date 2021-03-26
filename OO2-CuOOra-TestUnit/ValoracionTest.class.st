Class {
	#name : #ValoracionTest,
	#superclass : #TestCase,
	#instVars : [
		'ahora',
		'valor',
		'valoracion',
		'Pedro'
	],
	#category : #'OO2-CuOOra-TestUnit'
}

{ #category : #running }
ValoracionTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	ahora := DateAndTime now.
	Pedro := Usuario
		nombre: 'Pedro'
		contraseña: '123456'
		fechaYhora: ahora.
	valor := true.
	valoracion := Valoracion usuario: Pedro horaYfecha: ahora like: valor
]

{ #category : #tests }
ValoracionTest >> testCambiarValoracion [
	|ahora2|
	
	ahora2 := DateAndTime now.
	
	valoracion cambiarValoracion: false conFechaYHora: ahora.
	self assert: valoracion like equals: false.
	self assert: valoracion horaYfecha equals: ahora.
	
	valoracion cambiarValoracion: false conFechaYHora: ahora2.
	self assert: valoracion like equals: nil.
	self assert: valoracion horaYfecha equals: ahora2.
]

{ #category : #tests }
ValoracionTest >> testConstructor [
	self assert: valoracion usuario equals: Pedro.
	self assert: valoracion like equals: true.
	self assert: valoracion horaYfecha equals: ahora
]
