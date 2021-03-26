Class {
	#name : #PreguntaTest,
	#superclass : #PublicacionTest,
	#instVars : [
		'ahora',
		'pregunta',
		'topicos',
		'pedro'
	],
	#category : #'OO2-CuOOra-TestUnit'
}

{ #category : #running }
PreguntaTest >> setUp [
	| topicos pregunta |
	ahora := DateAndTime now.
	topicos := OrderedCollection
		with: (Topico
		nombre: 'Python'
		descripcion: 'Topico de Python')
		with: (Topico
		nombre: 'SmallTalk'
		descripcion: 'Topico de SmallTalk').
	pregunta := Pregunta
		topicos: topicos
		titulo: 'Pregunta1'
		cuerpo: 'Esto es un cuerpo'
		usuario:
			(Usuario nombre: 'Pedro' contraseña: '111' fechaYhora: DateAndTime now)
		fechaYhora: ahora
]

{ #category : #tests }
PreguntaTest >> testConstructor [
	self assert: pregunta topicos size equals: 2.
	self assert: pregunta usuario equals: pedro.
]
