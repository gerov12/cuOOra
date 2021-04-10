Class {
	#name : #ComponenteDeRegistro,
	#superclass : #ComponenteDeAcceso,
	#category : #'OO2-CuOOra-seaside'
}

{ #category : #callbacks }
ComponenteDeRegistro >> registrarseEIniciar [
	"creo un usuario en la clase CuOOra (la clase retorna el usuario creado)"
	"inicio sesión con el usuario creado"
	self proceedWith: (self model crearUsuario: nombre conContraseña: contraseña). 
]

{ #category : #rendering }
ComponenteDeRegistro >> renderButtonsOn: aCanvas [
	aCanvas submitButton "boton para registrarse"
		callback: [ self registrarseEIniciar ];
		with: 'Registrarse'.
	aCanvas space: 2.
	aCanvas cancelButton "boton para volver a login"
		callback: [ self answer ];
		with: 'Cancelar'
]
