Class {
	#name : #ComponenteDeAcceso,
	#superclass : #WAComponent,
	#instVars : [
		'nombre',
		'contraseña'
	],
	#category : #'OO2-CuOOra-seaside'
}

{ #category : #accessing }
ComponenteDeAcceso >> contraseña [
	^ contraseña
]

{ #category : #accessing }
ComponenteDeAcceso >> contraseña: anObject [
	contraseña := anObject
]

{ #category : #model }
ComponenteDeAcceso >> model [
	^ CuOOra soleInstance
]

{ #category : #accessing }
ComponenteDeAcceso >> nombre [
	^ nombre
]

{ #category : #accessing }
ComponenteDeAcceso >> nombre: anObject [
	nombre := anObject
]

{ #category : #private }
ComponenteDeAcceso >> proceedWith: aUser [
	self session user: aUser.
	self call: ComponenteHome new
]

{ #category : #rendering }
ComponenteDeAcceso >> renderButtonsOn: aCanvas [
	self subclassResponsibility . "según el componente elegido los botones serán diferentes"
]

{ #category : #rendering }
ComponenteDeAcceso >> renderContentOn: aCanvas [
	aCanvas form: [
		self renderImputElementsOn: aCanvas. "pongo los imputs de nombre y contraseña"
		self renderButtonsOn: aCanvas. "pongo los botones para iniciar sesion / registrarse"
		]
]

{ #category : #rendering }
ComponenteDeAcceso >> renderImputElementsOn: aCanvas [
	aCanvas label: 'Usuario'.
	aCanvas paragraph: [ aCanvas textInput on: #nombre of: self ]. "espacio para poner nombre de usuario"
	aCanvas label: 'Contraseña'.
	aCanvas paragraph: [ aCanvas passwordInput on: #contraseña of: self ]. "espacio para poner contraseña"
]
