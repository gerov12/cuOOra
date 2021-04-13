Class {
	#name : #ComponenteDePublicacion,
	#superclass : #Esqueleto,
	#instVars : [
		'pregunta'
	],
	#category : #'OO2-CuOOra-seaside'
}

{ #category : #constructor }
ComponenteDePublicacion class >> con: pregunta [ 
	^ self new con: pregunta yourself.
]

{ #category : #initialize }
ComponenteDePublicacion >> con: unaPregunta [ 
	pregunta := unaPregunta.
]

{ #category : #rendering }
ComponenteDePublicacion >> renderAutorYRespuestasOn: aCanvas [
	aCanvas
		paragraph: [ 
			aCanvas text: 'Realizada por '.
			self linkAPerfilDe: (pregunta usuario) On: aCanvas.
			aCanvas text: ' | ' , pregunta respuestas size asString , ' respuestas' ]
]

{ #category : #rendering }
ComponenteDePublicacion >> renderContentOn: aCanvas [
	self renderHeadingContent: aCanvas.
	aCanvas paragraph: [ 
			aCanvas heading level: 2; with: pregunta titulo.
			self renderTopicosOn: aCanvas.
			aCanvas paragraph: [aCanvas text: pregunta cuerpo].
			self renderAutorYRespuestasOn: aCanvas.
			self renderLikesDislikesDe: pregunta On: aCanvas].
	aCanvas horizontalRule.
	aCanvas paragraph: [ 
		self renderContinuacionOn: aCanvas.
	]

]

{ #category : #rendering }
ComponenteDePublicacion >> renderContinuacionOn: aCanvas [
	self subclassResponsibility 
]

{ #category : #rendering }
ComponenteDePublicacion >> renderLikesDislikesDe: unaPublicacion On: aCanvas [
	aCanvas
		paragraph: [ aCanvas
				text: unaPublicacion cantidadLikes asString , ' likes ' , '| ', 
				unaPublicacion cantidadDislikes asString , ' dislikes'.
				aCanvas break.
			aCanvas space.
			aCanvas anchor
				callback: [ self valorar: true A: unaPublicacion ];
				with: [ aCanvas button: 'like' ].
			aCanvas space: 4.
			aCanvas anchor
				callback: [ self valorar: false A: unaPublicacion ];
				with: [ aCanvas button: 'dislike' ] ]
]

{ #category : #rendering }
ComponenteDePublicacion >> renderTopicosOn: aCanvas [
		aCanvas small: [aCanvas citation: 'Topicos: ', ((pregunta topicos collect: [ :each | each nombre ]) asCommaString)]
]

{ #category : #callbacks }
ComponenteDePublicacion >> valorar: boolean A: unaPublicacion [ 
	unaPublicacion registrarValoracionDe: (self session user) conFechayHora: DateAndTime current yLike: boolean. 
]
