Class {
	#name : #Valoracion,
	#superclass : #Object,
	#instVars : [
		'usuario',
		'horaYfecha',
		'like'
	],
	#category : #'OO2-CuOOra-model'
}

{ #category : #constructor }
Valoracion class >> usuario: unUsuario horaYfecha: unDateTime like: unBooleano [
	^ self new usuario: unUsuario horaYfecha: unDateTime like: unBooleano
]

{ #category : #setter }
Valoracion >> cambiarValoracion: unBooleano conFechaYHora: unDatetime [
	like ~= unBooleano
		ifTrue: [ like := unBooleano ].
	horaYfecha := unDatetime
]

{ #category : #accessing }
Valoracion >> horaYfecha [
	^ horaYfecha 
]

{ #category : #accessing }
Valoracion >> like [
	^ like
]

{ #category : #accessing }
Valoracion >> usuario [
	^usuario
]

{ #category : #constructor }
Valoracion >> usuario: unUsuario horaYfecha: unDateTime like: unBooleano [
	usuario := unUsuario.
	horaYfecha := unDateTime.
	like := unBooleano.
]
