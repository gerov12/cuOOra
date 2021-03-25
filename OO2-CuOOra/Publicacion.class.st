Class {
	#name : #Publicacion,
	#superclass : #Object,
	#instVars : [
		'cuerpo',
		'horaYfecha',
		'usuario',
		'valoraciones'
	],
	#category : #'OO2-CuOOra'
}

{ #category : #constructor }
Publicacion class >> cuerpo: unString horaYfecha: unDateTime [
	^ self cuerpo: unString horaYfecha: unDateTime
]
