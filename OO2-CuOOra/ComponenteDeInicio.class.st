"
aplicacion := WAAdmin register: ComponenteDeInicio asApplicationAt: 'cuOOra'.
aplicacion sessionClass: SessionConUsuario .


"
Class {
	#name : #ComponenteDeInicio,
	#superclass : #ComponenteDeAcceso,
	#category : #'OO2-CuOOra-seaside'
}

{ #category : #callbacks }
ComponenteDeInicio >> iniciarSesion [
	(self model usuarioConNombre: nombre protegidoPor: contraseña)
		ifNotNil: [ :it | self proceedWith: it ].
	nombre := nil.
	contraseña := nil
]

{ #category : #callbacks }
ComponenteDeInicio >> registrarUsuario [
	self call: ComponenteDeRegistro new
]

{ #category : #rendering }
ComponenteDeInicio >> renderButtonsOn: aCanvas [
	aCanvas submitButton "boton de iniciar sesión"
			callback: [ self iniciarSesion ];
			with: 'Ingresar'.
	aCanvas horizontalRule. "separador horizontal"
	aCanvas paragraph: '¿No tienes una cuenta?'. 
	aCanvas submitButton "boton para registrarse"
		callback: [ self registrarUsuario ];
		with: 'Registrate'
]
