"
ReMatch: Perl-Style Regular Expression Search Results

I. Introduction

This Class is part of a package of classes providing a Smalltalk wrapper to Philip Hazel's excellent PCRE library.  The Plugin interface and Smalltalk wrapper was written by Andrew C. Greenberg.  As discussed in RePattern aGeneralComment, the functionality is essentially embodied in this class, Class RePattern and certain new messages in Class String.  A summary of the regular expression syntax can be found in RePattern aRegexComment and a summary of the compile option codes available can be found in RePattern anOptionsComment.

II. Principal Match Results

The substring of searchString matched by re is given by:

		m match

which can be derived from searchString as follows:

		m searchString
			copyFrom: (m from)
			to: (m to)

III. Captured Groups (and Collections of Captured Groups)

The number of substrings capturable by a parenthetical grouping in an re (regardless of the number actually matched to create m) is given by:

		m numGroups

The string captured by parenthetical grouping i, where 1<=i<=(m numGroups) is given by

		m matchAt: i

and this can be generated as follows:

		m searchString
			copyFrom: (m fromAt: i)
			to: (m toAt: i)

And an array of size (m numGroups) can be generated from strings and indices accordingly:

		m matches
		m froms
		m tos
!

ReMatch class
	instanceVariableNames: ''
"
Class {
	#name : #ReMatch,
	#superclass : #Object,
	#instVars : [
		'matchArray',
		're',
		'searchString',
		'pos',
		'endpos'
	],
	#category : #RePCRE
}

{ #category : #'instance creation' }
ReMatch class >> matchArray: anIntegerArray forRe: aRePattern 
onString: aString from: startInteger to: stopInteger [ 

	^super new 
		matchArray: anIntegerArray 
		forRe: aRePattern 
		onString: aString 
		from: startInteger 
		to: stopInteger 

]

{ #category : #deprecated }
ReMatch class >> on: srchString search: subjString [

	^ self 
		on: srchString 
		search: subjString 
		opt: ''
]

{ #category : #deprecated }
ReMatch class >> on: srchString search: subjString from: startInteger [

	^ self 
		on: srchString 
		search: subjString 
		from: startInteger
		to: (subjString size)
		opt: ''
]

{ #category : #deprecated }
ReMatch class >> on: srchString search: subjString from: startInteger opt: optString [

	^ self 
		on: srchString 
		search: subjString 
		from: startInteger
		to: (subjString size)
		opt: optString
]

{ #category : #deprecated }
ReMatch class >> on: srchString search: subjString from: startInteger to: stopInteger [

	^ self 
		on: srchString 
		search: subjString 
		from: startInteger
		to: stopInteger
		opt: ''
]

{ #category : #deprecated }
ReMatch class >> on: srchString search: subjString from: startInteger to: stopInteger opt: optString [

	|re|
	re := RePattern 
			on: srchString 
			opt: (optString select: [:ch| 'imsxAEUX' includes: ch]).
	^ re 
		search: subjString 
		from: startInteger
		to: stopInteger
		opt: (optString select: [:ch| 'ABZ' includes: ch])
]

{ #category : #deprecated }
ReMatch class >> on: srchString search: subjString opt: optString [

	|re|
	re := RePattern 
			on: srchString 
			opt: (optString select: [:ch| 'imsxAEUX' includes: ch]).
	^ re 
		search: subjString 
		opt: (optString select: [:ch| 'ABZ' includes: ch])
]

{ #category : #'pattern matching' }
ReMatch class >> search: subjString match: patString opt: oStr [ 

	|re|
	re := RePattern 
			on: patString 
			opt: (oStr select: [:ch| 'imsxAEUX' includes: ch]).
	^ re 
		search: subjString 
		opt: (oStr select: [:ch| 'ABZ' includes: ch])
]

{ #category : #'pattern matching' }
ReMatch class >> search: subjString match: patString opt: oStr from: startInteger to: stopInteger [ 

	|re|
	re := RePattern 
			on: patString 
			opt: (oStr select: [:ch| 'imsxAEUX' includes: ch]).
	^ re 
		search: subjString 
		from: startInteger
		to: stopInteger
		opt: (oStr select: [:ch| 'ABZ' includes: ch])
]

{ #category : #accessing }
ReMatch >> endpos [
	"Answer the final index of the substring of searchString searched to obtain me."

	^endpos
]

{ #category : #'principal matching' }
ReMatch >> from [
	"Answer the initial index of the substring matched by re."

	^self fromAt: 0
]

{ #category : #'subgroup matching' }
ReMatch >> fromAt: anInteger [
	"Answer the initial index of the substring matching grouping anInteger, or nil if group was not matched."

	| offset fromIndex |
	offset := 2 * anInteger.
	((fromIndex := matchArray at: (offset + 1)) < 0)
		ifTrue: [^nil].
	^ fromIndex + pos
]

{ #category : #'subgroup collections' }
ReMatch >> froms [
	"Answer an Array of initial indices of grouping substrings as matched, or nil, respectively."

	^(Array new: (self numGroups))
		collectWithIndex: [:n :i | self fromAt: i].
]

{ #category : #'principal matching' }
ReMatch >> match [
	"Answer the substring matched by re."

	^self matchAt: 0
]

{ #category : #private }
ReMatch >> matchArray: anIntegerArray forRe: aRePattern 
onString: aString from: startInteger to: stopInteger [ 
	"Initialize an instance of me in accordance with the parameters."

	matchArray := anIntegerArray copy.
	re := aRePattern.
	searchString := aString.
	pos := startInteger.
	endpos := stopInteger.

]

{ #category : #'subgroup matching' }
ReMatch >> matchAt: anInteger [
	"Answer the substring matching grouping anInteger, or nil if group was not matched."

	| offset fromIndex |
	offset := 2 * anInteger.
	((fromIndex := matchArray at: (offset + 1)) < 0)
		ifTrue: [^nil].
	^ searchString
		copyFrom: (fromIndex + pos)
		to: ((matchArray at: (offset + 2)) + pos - 1).
]

{ #category : #'subgroup collections' }
ReMatch >> matches [
	"Answer an Array of grouping substrings as matched, or nil, respectively."

	^(Array new: (self numGroups))
		collectWithIndex: [:n :i | self matchAt: i].
]

{ #category : #'subgroup matching' }
ReMatch >> numGroups [
	"Answer the number SubGroups (not including the entire match) potentially matched by re, whether actually matched or not."

	^ ((matchArray size) // 3) - 1
]

{ #category : #accessing }
ReMatch >> pos [
	"Answer the initial index of the substring of searchString searched to obtain me."

	^pos
]

{ #category : #printing }
ReMatch >> printOn: aStream [

	aStream nextPutAll: 'a '.
	(self species) printOn: aStream.
	aStream nextPut: $(.
	(self match) printOn: aStream.
	aStream nextPut: $).
]

{ #category : #accessing }
ReMatch >> re [
	"Answer the re matched to obtain me."

	^re
]

{ #category : #accessing }
ReMatch >> searchString [
	"Answer the substring searched to obtain me."

	^searchString
]

{ #category : #'principal matching' }
ReMatch >> to [
	"Answer the final index of the substring matched by re."

	^self toAt: 0
]

{ #category : #'subgroup matching' }
ReMatch >> toAt: anInteger [
	"Answer the final index of the substring matching grouping anInteger, or nil if group was not matched."

	| offset |
	offset := 2 * anInteger.
	((matchArray at: (offset + 1)) < 0)
		ifTrue: [^nil].
	^ (matchArray at: (offset + 2)) + pos - 1
]

{ #category : #'subgroup collections' }
ReMatch >> tos [
	"Answer an Array of final indices of grouping substrings as matched, or nil, respectively."

	^(Array new: (self numGroups))
		collectWithIndex: [:n :i | self toAt: i].
]
