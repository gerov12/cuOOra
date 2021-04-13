Class {
	#name : #ComponenteHome,
	#superclass : #Esqueleto,
	#category : #'OO2-CuOOra-seaside'
}

{ #category : #private }
ComponenteHome >> obtenerPreguntas [
	"en caso de haber mas de 5 preguntas se devuelven solo las primeras 5"
	| preguntas |
	preguntas := self session user obtenerPreguntasRelevantes.
	(preguntas size < 5) ifTrue: [ ^ preguntas ].
	^ preguntas first: 5.

]

{ #category : #rendering }
ComponenteHome >> render: preguntas relevantesOn: aCanvas [
	aCanvas unorderedList: [ 
		preguntas do: [ :each |
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
ComponenteHome >> renderAutorYRespuestasDe: unaPregunta On: aCanvas [
	aCanvas
		paragraph: [ 
			aCanvas text: 'Realizada por '.
			self linkAPerfilDe: (unaPregunta usuario) On: aCanvas.
			aCanvas text: ' | ' , unaPregunta respuestas size asString , ' respuestas' ]
]

{ #category : #rendering }
ComponenteHome >> renderCabeceraOn: aCanvas [
	aCanvas table: [
		aCanvas tableHead: [  
			aCanvas tableRow: [
				aCanvas tableData: [aCanvas heading level: 2; with: 'Últimas preguntas'.].
				aCanvas tableData: [aCanvas space: 2].
				aCanvas tableData: [
					aCanvas anchor
					callback: [ self call: ComponenteCrearPregunta new ];
					with: [ aCanvas button: 'Hacer una nueva pregunta' ].
				].
			].	
		].
	].
	
]

{ #category : #rendering }
ComponenteHome >> renderContentOn: aCanvas [
	self renderHeadingContent: aCanvas.
	self renderPreguntasRelevantesOn: aCanvas.
		

	
]

{ #category : #rendering }
ComponenteHome >> renderLikesDislikesDe: unaPregunta On: aCanvas [
	aCanvas
		paragraph: [ aCanvas
				text: unaPregunta cantidadLikes asString , ' likes ' , '| ', 
				unaPregunta cantidadDislikes asString , ' dislikes'.
				aCanvas break.
			aCanvas space.
			aCanvas anchor
				callback: [ self valorar: true A: unaPregunta ];
				with: [ aCanvas button: 'like' ].
			aCanvas space: 4.
			aCanvas anchor
				callback: [ self valorar: false A: unaPregunta ];
				with: [ aCanvas button: 'dislike' ] ]
]

{ #category : #rendering }
ComponenteHome >> renderPreguntasRelevantesOn: aCanvas [
	| preguntas |
	self renderCabeceraOn: aCanvas.
	preguntas := self obtenerPreguntas .
	preguntas ifEmpty:[aCanvas paragraph: 'No se encontraron preguntas...']
		ifNotEmpty: [ 
				self render: preguntas relevantesOn: aCanvas
			]
		
]

{ #category : #rendering }
ComponenteHome >> renderTituloDe: unaPregunta On: aCanvas [
	aCanvas anchor
		callback: [ self call: (ComponentePregunta con: unaPregunta) ];
		with: [ aCanvas heading level: 2; with: unaPregunta titulo ]
]

{ #category : #rendering }
ComponenteHome >> renderTopicosDe: pregunta On: aCanvas [
		aCanvas small: [aCanvas citation: 'Topicos: ', ((pregunta topicos collect: [ :each | each nombre ]) asCommaString)]
]

{ #category : #rendering }
ComponenteHome >> style [ 
	^ 'a[href] {
    color: #000000;
    text-decoration: none;
}

.mensaje{
    position: absolute;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: flex-end;
    padding-top: 0.9rem;
    padding-bottom: 0.5rem;
    width: 90%
}'
]

{ #category : #callbacks }
ComponenteHome >> valorar: boolean A: pregunta [ 
	pregunta registrarValoracionDe: (self session user) conFechayHora: DateAndTime current yLike: boolean. 
	
]
