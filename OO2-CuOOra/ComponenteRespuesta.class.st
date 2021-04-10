Class {
	#name : #ComponenteRespuesta,
	#superclass : #ComponenteDePublicacion,
	#instVars : [
		'cuerpo'
	],
	#category : #'OO2-CuOOra-seaside'
}

{ #category : #accessing }
ComponenteRespuesta >> cuerpo [
	^ cuerpo
]

{ #category : #accessing }
ComponenteRespuesta >> cuerpo: anObject [
	cuerpo := anObject
]

{ #category : #callbacks }
ComponenteRespuesta >> hacerPublicacion [
	cuerpo ifEmpty: [ ^ self ].
	self session user agregarRespuestaA: pregunta conCuerpo: cuerpo.
 	self answer
]

{ #category : #rendering }
ComponenteRespuesta >> renderContinuacionOn: aCanvas [
	aCanvas big; strong: 'RESPONDER'.
	aCanvas space: 10.
	aCanvas form: [ 
		(aCanvas textArea on: #cuerpo of: self) "espacio para escribir respuesta"
				text: 'Escriba aquí su respuesta...';
				columns: 80;
				rows: 5.
		aCanvas break.
		aCanvas cancelButton
			callback: [ self answer ];
			with: 'Cancelar'.	
		aCanvas submitButton
			callback: [ self hacerPublicacion ];
			with: 'Guardar' 
	]
	
]

{ #category : #rendering }
ComponenteRespuesta >> style [ 
	^ 'a[href] {
    color: #000000;
    text-decoration: none;
}
'
]
