Class {
	#name : #Valoracion,
	#superclass : #Object,
	#instVars : [
		'usuario',
		'horaYfecha',
		'like'
	],
	#category : #'OO2-CuOOra'
}

{ #category : #constructor }
Valoracion class >> usuario: unUsuario horaYfecha: unDateTime like: unBooleano [
	^ self usuario: unUsuario horaYfecha: unDateTime like: unBooleano
]

{ #category : #'as yet unclassified' }
Valoracion >> cambiarValoracion: unBooleano [
	like := unBooleano
]

{ #category : #constructor }
Valoracion >> usuario: unUsuario horaYfecha: unDateTime like: unBooleano [
	usuario := unUsuario.
	horaYfecha := unDateTime.
	like := unBooleano.
]
