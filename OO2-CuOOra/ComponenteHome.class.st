Class {
	#name : #ComponenteHome,
	#superclass : #WAComponent,
	#category : #'OO2-CuOOra-seaside'
}

{ #category : #private }
ComponenteHome >> obtenerPreguntas [
	"en caso de haber mas de 5 preguntas se devuelven solo las primeras 5"
	| preguntas |
	preguntas := self session user obtenerPreguntasRelevantes asSortedCollection: [ :a :b | a horaYfecha  > b horaYfecha ].
	(preguntas size < 5) ifTrue: [ ^ preguntas ].
	^ preguntas := preguntas copyFrom: 1 to: 5 

]

{ #category : #rendering }
ComponenteHome >> render: preguntas relevantesOn: aCanvas [
	aCanvas unorderedList: [ 
						preguntas do: [ :each |
							aCanvas listItem: [ 
								aCanvas paragraph: [  
									aCanvas heading level: 3; with: each titulo.
									aCanvas paragraph: [  
										aCanvas text: 'Realizada por '; 
										strong: each usuario nombre;
										text: ' | ', each respuestas size asString,' respuestas'].
									aCanvas paragraph: [
										aCanvas text: each cantidadLikes asString, ' likes ', 
										'| ', each cantidadDislikes asString, ' dislikes'].
									aCanvas horizontalRule.
								]
						 	 ]
						]
			 	]
]

{ #category : #rendering }
ComponenteHome >> renderContentOn: aCanvas [
	aCanvas heading: [self renderHeadingContent: aCanvas].
	aCanvas horizontalRule.
	self renderPreguntasRelevantesOn: aCanvas.
	aCanvas horizontalRule.
	self renderLogoutButtonOn: aCanvas.
		

	
]

{ #category : #rendering }
ComponenteHome >> renderHeadingContent: aCanvas [
	aCanvas paragraph with: 'CuOOra ', self session user nombre.
	

]

{ #category : #rendering }
ComponenteHome >> renderLogoutButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Cerrar Sesion' ] ]
]

{ #category : #rendering }
ComponenteHome >> renderPreguntasRelevantesOn: aCanvas [
	| preguntas |
	aCanvas heading level: 2; with: 'Últimas preguntas'.
	preguntas := self obtenerPreguntas .
	preguntas ifEmpty:[aCanvas paragraph: 'No se encontraron preguntas...']
		ifNotEmpty: [ 
				self render: preguntas relevantesOn: aCanvas
			]
		
]
