Class {
	#name : #SessionConUsuario,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'OO2-CuOOra-seaside'
}

{ #category : #accessing }
SessionConUsuario >> user [
	^ user
]

{ #category : #accessing }
SessionConUsuario >> user: anObject [
	user := anObject
]
