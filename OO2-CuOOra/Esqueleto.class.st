Class {
	#name : #Esqueleto,
	#superclass : #WAComponent,
	#category : #'OO2-CuOOra-seaside'
}

{ #category : #utils }
Esqueleto >> linkAPerfilDe: unUsuario On: aCanvas [
	^ aCanvas anchor
		callback: [ self call: (ComponentePerfil con: unUsuario) ];
		with: [ aCanvas strong: unUsuario nombre asCapitalizedPhrase ]
]

{ #category : #callback }
Esqueleto >> logout [
	self session unregister. 
   self requestContext redirectTo: self application url
]

{ #category : #accessing }
Esqueleto >> model [
	^ CuOOra soleInstance 
]

{ #category : #rendering }
Esqueleto >> renderCuOOraOn: aCanvas [
	aCanvas anchor 
		callback: [ self call: (ComponenteHome new) ];
		with: [ aCanvas heading level: 1; with: 'CuOOra ' ]
]

{ #category : #rendering }
Esqueleto >> renderHeadingContent: aCanvas [
"una tabla de una fila, con 3 datos en ella"
	aCanvas table: [
		aCanvas tableHead: [  
			aCanvas tableRow: [
				aCanvas tableData: [self renderCuOOraOn: aCanvas].
				aCanvas tableData: [aCanvas space: 2].
				aCanvas tableData: [
					aCanvas strong: '¡Bienvenido, '. 
					self linkAPerfilDe: self session user On: aCanvas.
					aCanvas strong: '!'.
				].
				aCanvas tableData: [self renderLogoutButtonOn: aCanvas].		
			].	
		].
	].
	aCanvas horizontalRule.
	

]

{ #category : #rendering }
Esqueleto >> renderLogoutButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self logout ];
				with: [ aCanvas button with: 'Cerrar Sesion' ] ]
]
