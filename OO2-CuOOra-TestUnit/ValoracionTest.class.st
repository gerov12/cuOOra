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

{ #category : #'as yet unclassified' }
ValoracionTest >> testConstructor [
	self assert: valoracion usuario equals: Pedro
]
