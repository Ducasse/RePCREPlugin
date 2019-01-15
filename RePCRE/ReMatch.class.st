"
RePattern: Compiled Perl-Style Regular Expressions

I.  Introduction.

This Smalltalk implementation of modern Perl-Style regular expressions was compiled by Andrew Greenberg <werdna@gate.net> and contributors, based upon the excellent PCRE library by Philip Hazel. As discussed in RePattern aGeneralComment, the functionality is essentially embodied in this class, Class ReMatch and certain new messages in Class String.  A summary of the regular expression syntax can be found in RePattern aRegexComment and a summary of the compile option codes available can be found in RePattern anOptionsComment.

A substantially more detailed description of RePlugin is available downloading the file ""RePluginDoco,"" which can be obtained from http://www.gate.net/~werdna/RePlugin.html, into your default directory, and then executing

		Utilities reconstructTextWindowsFromFileNamed: 'RePluginDoco'

II.  To Search a String or Substring For Pattern Matches (Once Only):

Examples:

		'Squeak or Squawk!!' reMatch: '^Squ(ea|aw)k'
		'Squeak or Squawk!!' reMatch: '^Squ(ea|aw)k' opt: 'imsxABEXZ'
		'Squeak or Squawk!!' reMatch: '^Squ(ea|aw)k!!' from: 11

more generally,
		
		srchStr reMatch: patStr [opt: oStr] [from: start] [to: stop]

For a one-time search of a string (or substring) for occurences of a match pattern.  The message will be answered with nil (if there is no match) or an instance of ReMatch, which can then be queried for further details about the match.

III. Global Searching and Replacing

	The re package provides rudimentary facilities for global searches and replacements on a string.  The following expressions

		'\w+' reMatch: 'this is a test' collect: [:m | m]
		(RePattern on: '\w+') search: 'this is a test' collect: [:m | m]

return an ordered collection of the results of repeated non-overlapping applications of the pattern to the string, or nil if there are no matches in the string.  To produce a list of matched strings, you can for example execute the following:

		'\w+' reMatch: 'this is a test' collect: [:m| m match]
		(RePattern on: '\w+') search: 'this is a test' collect: [:m | m match]

You can also perform global search and string replacements, where the answer is a string with unmatched text left alone, and matched text replaced by the result of a call to a Block passed the ReMatch object as a single parameter.  For example,

		('\w+' reMatch: 'this is a test' sub: [:m| '<', (m match), '>']
and
		(RePattern on: '\w+') search: 'this is a test' sub: [:m| '<', (m match), '>']

return a string with each nonblank word surrounded by angle brackets.  For more details, see RePattern aGlobalSearchComment.

IV. To Create Compiled Regular Expression Objects (For Repeated Matching):

		'^Squ(ea|aw)k!!$' asRePattern
		'^Squ(ea|aw)k!!$' asRePatternOpt: 'imsxAEX'
		'^Squ(ea|aw)k!!$' asRePatternOpt: 'imsxAEX' onErrorRun: aBlock

		RePattern on: '^Squ(ea|aw)k!!$'
		RePattern on: '^Squ(ea|aw)k!!$' opt: 'imsxAEX'
		RePattern 
			on: '^Squ(ea|aw)k!!$' 
			opt: 'imsxAEX' 
			onErrorRun: [:pat :offset :message | ""your code here"" ]

	Each of the preceding expressions returns an instance of RePattern, compiled for efficient  matching when the pattern is repeatedly searched against different strings.  RePattern ordinarily caches a dozen or so of the most recently compiled patterns, but nevertheless invokes a cost for the table lookup.  To avoid compile and lookup costs, use the above messages.  To perform a one-time search, see above.

V. To Search a Compiled Regexp Against A String or Substring for Matches:

		searchString reMatch: re [from: from] [to: to] [opt: optStr]
or
		re search: searchString [from: from] [to: to] [opt: optStr]

Examples:

		'Squeak or Squawk' reMatch: re.
		re search: 'Squeak or Squawk!!'.
		re search: 'Squeak or Squawk!!' opt: 'ABZ'.
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
