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

{ #category : #setter }
Valoracion >> cambiarValoracion: unBooleano conFechaYHora: unDatetime [
	(like equals: unBooleano)
		ifTrue: [ like := nil.
			^ self].
	like := unBooleano.
	horaYfecha := unDatetime
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
