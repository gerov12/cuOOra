Class {
	#name : #ComponentePerfil,
	#superclass : #ComponenteHome,
	#instVars : [
		'usuario'
	],
	#category : #'OO2-CuOOra-seaside'
}

{ #category : #constructor }
ComponentePerfil class >> con: unUsuario [
	^ self new con: unUsuario 
]

{ #category : #initialization }
ComponentePerfil >> con: unUsuario [
	usuario := unUsuario
]

{ #category : #rendering }
ComponentePerfil >> renderAutorYRespuestasDe: unaPregunta On: aCanvas [
	aCanvas
		paragraph: [ aCanvas 
			text: 'Realizada por '; 
			strong: usuario nombre; 
			text: ' | ' , unaPregunta respuestas size asString , ' respuestas' ]
]

{ #category : #rendering }
ComponentePerfil >> renderContentOn: aCanvas [
	self renderHeadingContent: aCanvas.
	self renderPreguntasOn: aCanvas.
]

{ #category : #rendering }
ComponentePerfil >> renderListadoOn: aCanvas [
	aCanvas unorderedList: [ 
		usuario preguntas do: [ :each |
			aCanvas listItem: [ 
				aCanvas paragraph: [  
					self renderTituloDe: each On: aCanvas.
					self renderTopicosDe: each On: aCanvas.
					self renderAutorYRespuestasDe: each On: aCanvas.
					self renderLikesDislikesDe: each On: aCanvas.
					aCanvas horizontalRule.
				]
			]
		]
	]
]

{ #category : #rendering }
ComponentePerfil >> renderPreguntasOn: aCanvas [
	aCanvas heading level: 2; with: 'Preguntas de ', usuario nombre asCapitalizedPhrase.
	usuario preguntas ifEmpty:[aCanvas paragraph: 'No se encontraron preguntas...']
		ifNotEmpty: [ 
				self renderListadoOn: aCanvas
			]
]
