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
Publicacion >> cuerpo: unString horaYfecha: unDateTime [
	valoraciones := OrderedCollection new.
	cuerpo := unString.
	horaYfecha := unDateTime.
]

{ #category : #'as yet unclassified' }
Publicacion >> registrarValoracionConUsuario: unUsuario horaYfecha: unDatetime valor: unBoolean [
	valoraciones detect: [ :valoracion | valoracion usuario = unUsuario ] ifFound: [ ^self ] ifNone: [ valoraciones add Valoracion usuario: unUsuario horaYfecha: unDatetime like: unBoolean ]
]

{ #category : #'as yet unclassified' }
Publicacion >> registrarValoracionDe: unUsuario conFechayHora: unDatetime yLike: unBoolean [

	|unaValoracion nuevaValoracion|
	nuevaValoracion := Valoracion usuario: unUsuario horaYfecha: unDatetime like: unBoolean.
	
	unaValoracion := valoraciones
		detect: [ :valoracion | valoracion usuario = unUsuario ].
	
	unaValoracion isNotNil ifTrue: [ unaValoracion cambiarValoracion: unBoolean conFechaYHora: unDatetime ] ifFalse: [ valoraciones add Valoracion usuario: unUsuario horaYfecha: unDatetime like: unBoolean ]
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
