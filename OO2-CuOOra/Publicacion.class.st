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

{ #category : #accessing }
Publicacion >> cuerpo [
	^ cuerpo
]

{ #category : #accessing }
Publicacion >> horaYfecha [
	^ horaYfecha 
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

{ #category : #queries }
Publicacion >> retornarDiferencia [
	valoraciones isEmpty ifTrue: [ ^0 ].
	^ (valoraciones select: [ :valoracion | valoracion like ] size)
		- valoraciones reject: [ :valoracion | valoracion like ] size
]

{ #category : #abstract }
Publicacion >> retornarPuntaje [
	^ SubclassResponsibility
]

{ #category : #accessing }
Publicacion >> usuario [
	^usuario
]

{ #category : #accessing }
Publicacion >> valoraciones [
	^ valoraciones
]
