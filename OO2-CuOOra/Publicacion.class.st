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

{ #category : #constructor }
Publicacion >> cuerpo: unString horaYfecha: unDateTime usuario: unUsuario [
	valoraciones := OrderedCollection new.
	cuerpo := unString.
	horaYfecha := unDateTime.
	usuario := unUsuario
]

{ #category : #queries }
Publicacion >> registrarValoracionDe: unUsuario conFechayHora: unDatetime yLike: unBoolean [
	valoraciones
		detect: [ :cada | cada usuario = unUsuario ]
		ifFound:
			[ :valoracion | valoracion cambiarValoracion: unBoolean conFechaYHora: unDatetime ]
		ifNone: [ valoraciones
				add: (Valoracion usuario: unUsuario horaYfecha: unDatetime like: unBoolean) ]
]

{ #category : #abstract }
Publicacion >> retornarDiferencia [
	^ (valoraciones
		select: [ :valoracion | valoracion like ] size ) - valoraciones
		reject: [ :valoracion | valoracion like ] size
]

{ #category : #abstract }
Publicacion >> retornarPuntaje [
	^ SubclassResponsibility
]
