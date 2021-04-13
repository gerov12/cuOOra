Class {
	#name : #ComponentePregunta,
	#superclass : #ComponenteDePublicacion,
	#category : #'OO2-CuOOra-seaside'
}

{ #category : #rendering }
ComponentePregunta >> renderContinuacionOn: aCanvas [
	self renderRespuestasOn: aCanvas.
	aCanvas horizontalRule.
	aCanvas anchor
				callback: [ self call: (ComponenteRespuesta con: pregunta) ];
				with: [ aCanvas button: 'Agregar Respuesta' ].
]

{ #category : #rendering }
ComponentePregunta >> renderRespuestasOn: aCanvas [
	aCanvas unorderedList: [ 
		pregunta respuestas do: [ :each |
			aCanvas listItem: [ 
				aCanvas paragraph: [  
					aCanvas heading level: 3; with: [ 
						aCanvas text: 'Respuesta de '.
					   self linkAPerfilDe: (each usuario) On: aCanvas
					].
					aCanvas paragraph: [ aCanvas text: each cuerpo ].
					self renderLikesDislikesDe: each On: aCanvas.
					aCanvas horizontalRule.
				]
			]
		]
	].
	aCanvas big: 'No hay mas respuestas.'
	
]

{ #category : #rendering }
ComponentePregunta >> style [ 
	^ 'a[href] {
    color: #000000;
    text-decoration: none;
}
'
]
