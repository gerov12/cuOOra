Class {
	#name : #Esqueleto,
	#superclass : #WAComponent,
	#category : #'OO2-CuOOra-seaside'
}

{ #category : #utils }
Esqueleto >> linkAPerfilDe: unUsuario On: aCanvas [
	^ aCanvas anchor
		callback: [ self call: (ComponentePerfil con: unUsuario) ];
		with: [ aCanvas strong: unUsuario nombre ]
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
Esqueleto >> renderContenidoOn: aCanvas [
	self subclassResponsibility 
]

{ #category : #rendering }
Esqueleto >> renderContentOn: aCanvas [
	self renderHeadingContent: aCanvas.
	self renderContenidoOn: aCanvas
]

{ #category : #rendering }
Esqueleto >> renderHeadingContent: aCanvas [
"una tabla de una fila, con 3 datos en ella"
	aCanvas table: [ 
		aCanvas tableRow: [
			aCanvas tableData class: 'cuoora'; with: [
				aCanvas heading level: 1; with: 'CuOOra '].
			aCanvas tableData class: 'mensaje'; with: [
				aCanvas strong: '¡Bienvenido,'; space. 
				self linkAPerfilDe: self session user On: aCanvas.
				aCanvas strong: '!'; space: 2.
				self renderLogoutButtonOn: aCanvas]
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
