"
RePattern: Compiled Perl-Style Regular Expressions

I.  Introduction.

This Smalltalk implementation of modern Perl-Style regular expressions was compiled by Andrew Greenberg <werdna@gate.net> and contributors, based upon the excellent PCRE library by Philip Hazel. As discussed in RePattern aGeneralComment, the functionality is essentially embodied in this class, Class ReMatch and certain new messages in Class String.  A summary of the regular expression syntax can be found in RePattern aRegexComment and a summary of the compile option codes available can be found in RePattern anOptionsComment.

A substantially more detailed description of RePlugin is available downloading the file ""RePluginDoco,"" which can be obtained from http://www.gate.net/~werdna/RePlugin.html, into your default directory, and then executing

		Utilities reconstructTextWindowsFromFileNamed: 'RePluginDoco'

II.  To Search a String or Substring For Pattern Matches (Once Only):

Examples:

		'Squeak or Squawk!' reMatch: '^Squ(ea|aw)k'
		'Squeak or Squawk!' reMatch: '^Squ(ea|aw)k' opt: 'imsxABEXZ'
		'Squeak or Squawk!' reMatch: '^Squ(ea|aw)k!' from: 11

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

		'^Squ(ea|aw)k!$' asRePattern
		'^Squ(ea|aw)k!$' asRePatternOpt: 'imsxAEX'
		'^Squ(ea|aw)k!$' asRePatternOpt: 'imsxAEX' onErrorRun: aBlock

		RePattern on: '^Squ(ea|aw)k!$'
		RePattern on: '^Squ(ea|aw)k!$' opt: 'imsxAEX'
		RePattern 
			on: '^Squ(ea|aw)k!$' 
			opt: 'imsxAEX' 
			onErrorRun: [:pat :offset :message | ""your code here"" ]

	Each of the preceding expressions returns an instance of RePattern, compiled for efficient  matching when the pattern is repeatedly searched against different strings.  RePattern ordinarily caches a dozen or so of the most recently compiled patterns, but nevertheless invokes a cost for the table lookup.  To avoid compile and lookup costs, use the above messages.  To perform a one-time search, see above.

V. To Search a Compiled Regexp Against A String or Substring for Matches:

		searchString reMatch: re [from: from] [to: to] [opt: optStr]
or
		re search: searchString [from: from] [to: to] [opt: optStr]

Examples:

		'Squeak or Squawk' reMatch: re.
		re search: 'Squeak or Squawk!'.
		re search: 'Squeak or Squawk!' opt: 'ABZ'.

If no match is found, these messages answer nil.  Otherwise, they answer with a corresponding instance of ReMatch.!

RePattern class
	instanceVariableNames: 'Patterns Options CompileObjects Front '
"
Class {
	#name : #RePattern,
	#superclass : #Object,
	#instVars : [
		'pattern',
		'compileOptions',
		'pcrePointer',
		'extraPointer',
		'errorString',
		'offset',
		'matchOptions',
		'matchSpace',
		'lastMatchResult'
	],
	#classInstVars : [
		'Patterns',
		'Options',
		'CompileObjects',
		'Front'
	],
	#category : #RePCRE
}

{ #category : #'pattern caching' }
RePattern class >> debugReport [

	^ String cr,
		'Front: ', (Front asString), String cr,
		'Patterns: ', (Patterns asString), String cr,
		'Options: ', (Options asString), String cr,
		'CompileObjects: ', (CompileObjects asString), String cr.
]

{ #category : #'pattern caching' }
RePattern class >> initialize [

	self initializeCache
	
]

{ #category : #'pattern caching' }
RePattern class >> initializeCache [

	|size |
	size := self queueSize.
	Patterns := Array new: size.
	Options := Array new: size.
	CompileObjects := Array new: size.
	Front := size.
	
]

{ #category : #'instance creation' }
RePattern class >> on: aString [
	"Answer an instance of a compiled re for matching aString under Standard options.  If compile fails, display an appropriate notifier."

	^self 
		search: aString 
		opt: ''
		ifAbsentAdd:[self new compile: aString].
]

{ #category : #'instance creation' }
RePattern class >> on: aString opt: optString [
	"Answer an instance of a compiled re for matching aString under the options specified by optString.  If compile fails, display an appropriate notifier."

	^ self 
		search: aString 
		opt: optString
		ifAbsentAdd: [self new compile: aString opt: optString]
]

{ #category : #'instance creation' }
RePattern class >> on: aString opt: optString onErrorRun: aBlock [
"Answer an instance of a compiled re for matching aString under the options specified by optString.  If compile fails, send aBlock the following message:

	aBlock value: aString value: anInteger value: anErrorString

where, anInteger is the offset in aString where the error was identified, and anErrorString is a descriptive error message.
"

	^self 
		search: aString 
		opt: optString
		ifAbsentAdd:[self new 
			compile: aString
			opt: optString 
			onErrorRun: aBlock]
]

{ #category : #'pattern caching' }
RePattern class >> primCacheSearch: pStr opt: oStr [

	<primitive: 'primCacheSearch' module: 'rePlugin'>
	^RePlugin doPrimitive: 'primCacheSearch'

]

{ #category : #'pattern caching' }
RePattern class >> queueSize [

	^10
]

{ #category : #'pattern caching' }
RePattern class >> search: pStr opt: oStr ifAbsentAdd: aBlock [

	|result |
	pStr ifNil: [^nil].
	Patterns withIndexDo: [:p :i | 
		((p = pStr) and: [(Options at: i) = oStr])
				ifTrue:[^CompileObjects at: i]].
	result := aBlock value.
	(Front == (self queueSize))
		ifTrue: [Front := 1]
		ifFalse: [Front := Front + 1].
	Patterns at: Front put: pStr.
	Options at: Front put: oStr.
	CompileObjects at: Front put: result.
	^result
]

{ #category : #constants }
RePattern >> PCREANCHORED [

	^16
]

{ #category : #constants }
RePattern >> PCRECASELESS [

	^1


]

{ #category : #constants }
RePattern >> PCREDOLLARENDONLY [

	^32

]

{ #category : #constants }
RePattern >> PCREDOTALL [

	^4
]

{ #category : #constants }
RePattern >> PCREEXTENDED [

	^8
]

{ #category : #constants }
RePattern >> PCREEXTRA [

	^64

]

{ #category : #constants }
RePattern >> PCREMULTILINE [

	^2
]

{ #category : #constants }
RePattern >> PCRENOTBOL [

	^128
]

{ #category : #constants }
RePattern >> PCRENOTEOL [

	^256
]

{ #category : #constants }
RePattern >> PCREUNGREEDY [

	^512
]

{ #category : #documentation }
RePattern >> aGeneralComment [ "

Perl-Style Regular Expressions in Smalltalk
by Andrew C. Greenberg

Use of RePattern directly is deprecated.  For versions 3.2 and upward, class Re serves as the primary interface.  RePattern will likely be deleted or supplanted in future versions."

]

{ #category : #private }
RePattern >> compile: aString [
	"Initialize me so I can match aString using standard options.  If the compile fails, display an appropriate notifier and answer nil.  Otherwise answer self."

	^self compile: aString opt: ''.
]

{ #category : #private }
RePattern >> compile: aString opt: optString [
	"Initialize me so I can match aString using options specified in optString.  If the compile fails, display an appropriate notifier and answer nil.  Otherwise answer self."

	^self 
		compile: aString 
		opt: optString
		onErrorRun: [:pat :off :err | self error: err. ^nil].
]

{ #category : #private }
RePattern >> compile: aString opt: optString onErrorRun: aBlock [
	"Initialize me so I can match aString using options specified in optString.  If the compile of aString fails, send aBlock the following message:

	aBlock value: aString value: anInteger value: anErrorString

where, anInteger is the offset in aString where the error was identified, and anErrorString is a descriptive error message.  Answer nil if compiles fails, otherwise self."

	pattern := (aString, (Character characterTable at: 1) asString). "Must be Zero-Terminated"
	compileOptions := self evalCompileString: optString onErrorRun: aBlock.
	pcrePointer := extraPointer := errorString := offset := nil.
	matchOptions := 0.
	(self primPCRECompile)
		ifNotNil: [aBlock value: pattern value: offset value: errorString].
	matchSpace := IntegerArray new: 3 * ( 1 + (self primPCRENumSubPatterns)).
	^ self.
]

{ #category : #private }
RePattern >> compile: aString optCode: anInteger onErrorRun: aBlock [
	"Initialize me so I can match aString using options specified in optString.  If the compile of aString fails, send aBlock the following message:

	aBlock value: aString value: anInteger value: anErrorString

where, anInteger is the offset in aString where the error was identified, and anErrorString is a descriptive error message.  Answer nil if compiles fails, otherwise self."

	pattern := (aString, (Character characterTable at: 1) asString). "Must be Zero-Terminated"
	compileOptions := anInteger.
	pcrePointer := extraPointer := errorString := offset := nil.
	matchOptions := 0.
	(self primPCRECompile)
		ifNotNil: [aBlock value: pattern value: offset value: errorString].
	matchSpace := IntegerArray new: 3 * ( 1 + (self primPCRENumSubPatterns)).
	^ self.
]

{ #category : #private }
RePattern >> evalCompileString: aString onErrorRun: aBlock [
	"Answer an integer recognized by PCRE, and representing the compile time codes indicated in aString.  For details about the codes, see the comments for the corresponding constant function.  If aString contains unrecognized options, sent a message to aBlock"

	|result|
	result := 0.
	aString doWithIndex: [:ch :index|
		"Traditional Perl Options"
		(ch == $i) ifTrue: [result := result bitOr: (self PCRECASELESS)].
		(ch == $m) ifTrue: [result := result bitOr: (self PCREMULTILINE)].
		(ch == $s) ifTrue: [result := result bitOr: (self PCREDOTALL)].
		(ch == $x) ifTrue: [result := result bitOr: (self PCREEXTENDED)].
		"PCRE Extensions"
		(ch == $A) ifTrue: [result := result bitOr: (self PCREANCHORED)].
		(ch == $E) ifTrue: [result := result bitOr: (self PCREDOLLARENDONLY)].
		(ch == $U) ifTrue: [result := result bitOr: (self PCREUNGREEDY)].
		(ch == $X) ifTrue: [result := result bitOr: (self PCREEXTRA)].
		('imsxABEUXZ' includes: ch) 
			ifFalse: [
				aBlock 
					value: aString 
					value: index 
					value: ('Invalid RE Compile Option: ', ch asString)]].
	^result
]

{ #category : #private }
RePattern >> evalMatchString: aString [
	"Answer an integer recognized by PCRE, and representing the match time codes indicated in aString.  For details about the codes, see the comments for the corresponding constant function.  If aString contains unrecognized options, display a notifier"

	^self 
		evalMatchString: aString
		onErrorRun: [:source :index :message | self error: message]
]

{ #category : #private }
RePattern >> evalMatchString: aString onErrorRun: aBlock [
	"Answer an integer recognized by PCRE, and representing the match time codes indicated in aString.  For details about the codes, see the comments for the corresponding constant function.  If aString contains unrecognized options, sent a message to aBlock"

	|result|
	result := 0.
	aString doWithIndex: [:ch :index |
		(ch == $A) ifTrue: [result := result bitOr: (self PCREANCHORED)].
		(ch == $B) ifTrue: [result := result bitOr: (self PCRENOTBOL)].
		(ch == $Z) ifTrue: [result := result bitOr: (self PCRENOTEOL)].
		('imsxABEUXZ' includes: ch) 
			ifFalse: [
				aBlock 
					value: aString 
					value: index 
					value: ('Invalid RE Match Option: ', ch asString)]].
	^result
]

{ #category : #deprecated }
RePattern >> gsearch: aString [

	^self gsearch: aString opt: ''.
]

{ #category : #deprecated }
RePattern >> gsearch: aString collect: aBlock [

	| collection |
	collection := self gsearch: aString.
	^collection
		ifNil: [nil]
		ifNotNil: [collection collect: aBlock]
			
]

{ #category : #deprecated }
RePattern >> gsearch: aString opt: optString [
"Answer Collection of MatchObjects resulting sequential searches of aString for matches to me, or nil if there are no matches.  Do not include empty matches that are adjacent to a previous match."

	| from to m results lastMatchFrom |
	aString ifNil: [^nil].
	from := 1. to := aString size. lastMatchFrom := -1.
	results  := OrderedCollection new.

	[from <= (to+1)]
		whileTrue: [
			(m := self search: aString from: from to: to opt: optString)
				ifNil: [
					(0 = results size) ifTrue: [^nil].
					^results]
				ifNotNil: [
					from := (m to) + 1.
					(0 = m match size) 
						ifTrue: [
							from := from + 1.
							(lastMatchFrom = m from) ifFalse: [results add:m]]
						ifFalse: [lastMatchFrom := from. results add:m]]].
	^results
]

{ #category : #deprecated }
RePattern >> gsearch: aString opt: optString num: limitInteger [
"Answer Collection of MatchObjects resulting sequential searches of aString for up to limitInteger matches to me, or nil if there are no matches at all.  Do not include empty matches that are adjacent to a previous match."

	| from to m results lastMatchFrom matchesSoFar |
	aString ifNil: [^nil].
	((limitInteger isNil) or: [limitInteger < 0]) ifTrue: [^self gsearch: aString opt: optString].
	from := 1. to := aString size. lastMatchFrom := -1. matchesSoFar := 0.
	results  := OrderedCollection new.

	[(from <= (to+1)) and: [matchesSoFar < limitInteger]]
		whileTrue: [
			(m := self search: aString from: from to: to opt: optString)
				ifNil: [
					(0 = results size) ifTrue: [^nil].
					^results]
				ifNotNil: [
					from := (m to) + 1.
					(0 = m match size) 
						ifTrue: [
							from := from + 1.
							(lastMatchFrom = m from) ifFalse: [results add:m]]
						ifFalse: [lastMatchFrom := from. results add:m]]].
	^results
]

{ #category : #deprecated }
RePattern >> gsearch: aString sub: aBlock [

	^self gsearch: aString sub: aBlock opt: ''
]

{ #category : #deprecated }
RePattern >> gsearch: aString sub: aBlock opt: optString [

	|start m result |
	start := 1.
	m := self search: aString from: start opt: optString.
	result := ''.
	[m isNil]
		whileFalse: [
			((m from) > start) 
				ifTrue: [ result := result , (aString copyFrom: start to: ((m from) - 1))].
			0 = m match size
				ifTrue: [
					start > aString size ifTrue: [^ result].
					result := result , (aString at: start) asString.
					start := start + 1]
				ifFalse: [
					result := result , (aBlock value: m).
					start := (m to) + 1].
			m := self search: aString from: start opt: optString].
	(start <= (aString size))
		ifTrue: [result := result, (aString copyFrom: start)].
	^result
			
]

{ #category : #deprecated }
RePattern >> gsearch: aString sub: aBlock opt: optString num: limitInteger [

	|start m result |
	start := 1.
	m := self search: aString from: start opt: optString.
	result := ''.
	[m isNil]
		whileFalse: [
			((m from) > start) 
				ifTrue: [ result := result , (aString copyFrom: start to: ((m from) - 1))].
			0 = m match size
				ifTrue: [
					start > aString size ifTrue: [^ result].
					result := result , (aString at: start) asString.
					start := start + 1]
				ifFalse: [
					result := result , (aBlock value: m).
					start := (m to) + 1].
			m := self search: aString from: start opt: optString].
	(start <= (aString size))
		ifTrue: [result := result, (aString copyFrom: start)].
	^result
			
]

{ #category : #deprecated }
RePattern >> initialize: aString [
	"Initialize me so I can match aString using standard options.  If the compile fails, display an appropriate notifier and answer nil.  Otherwise answer self."

	^self initialize: aString opt: ''.
]

{ #category : #deprecated }
RePattern >> initialize: aString opt: optString [
	"Initialize me so I can match aString using options specified in optString.  If the compile fails, display an appropriate notifier and answer nil.  Otherwise answer self."

	^self 
		initialize: aString 
		opt: optString
		onErrorRun: [:pat :off :err | self error: err. ^nil].
]

{ #category : #deprecated }
RePattern >> initialize: aString opt: optString onErrorRun: aBlock [
	"Initialize me so I can match aString using options specified in optString.  If the compile of aString fails, send aBlock the following message:

	aBlock value: aString value: anInteger value: anErrorString

where, anInteger is the offset in aString where the error was identified, and anErrorString is a descriptive error message.  Answer nil if compiles fails, otherwise self."

	pattern := (aString, (Character characterTable at: 1) asString). "Must be Zero-Terminated"
	compileOptions := self evalCompileString: optString onErrorRun: aBlock.
	pcrePointer := extraPointer := errorString := offset := nil.
	matchOptions := 0.
	(self primPCRECompile)
		ifNotNil: [aBlock value: pattern value: offset value: errorString].
	matchSpace := IntegerArray new: 3 * ( 1 + (self primPCRENumSubPatterns)).
	^ self.
]

{ #category : #deprecated }
RePattern >> initializePattern: aPatString [

	^self
		initializePattern: aPatString 
		onErrorRun:  [:pat :off :err | self error: err. ^nil].
]

{ #category : #deprecated }
RePattern >> initializePattern: aPatString onErrorRun: aBlock [

	|pstr delimiter patStream optionString optionCode |
	pstr := ReadStream on: aPatString.

	"Get and check the delimiter"
	delimiter := pstr next.
	('!@#$%^&*()_+-=[]{}|;:''"/?,.<>`~' includes: delimiter)
		ifFalse: [
			self error: (
				'rePattern: improper delimiter ',
				(delimiter asString),
				' in pattern ',
				aPatString)].

	"Get the pattern string, permit delimiter to be escaped with $\"
	patStream := ReadWriteStream on: (String new: (aPatString size)).
	patStream nextPutAll: (pstr upTo: delimiter).
	[$\ = (pstr last)]
		whileTrue: [
			patStream nextPut: delimiter. 
			patStream nextPutAll:(pstr upTo: delimiter)].

	"Get and verify the option string"
	optionString := pstr upToEnd.
	optionCode := 0.
	optionString do: [:ch | 
		(ch = 'i') ifTrue: [optionCode := optionCode bitOr: (self PCRECASELESS)].
		(ch = 'm') ifTrue: [optionCode := optionCode bitOr: (self PCREMULTILINE)].
		(ch = 's') ifTrue: [optionCode := optionCode bitOr: (self PCREDOTALL)].
		(ch = 'x') ifTrue: [optionCode := optionCode bitOr: (self PCREEXTENDED)].
		('imsx' includes: ch)
			ifFalse: [
				self error: (
					'rePattern: improper option ', 
					(ch asString) ,
					' in pattern ',
					optionString)].].

	^self initialize: patStream contents opt: optionCode onErrorRun: aBlock.
]

{ #category : #private }
RePattern >> memoryState [
	"Answer a report of the malloc:/free: engine (for tracking memory leaks)"

	^String cr, 
		((self primNumAllocs) asString), ' Allocations', String cr,
		((self primNumFrees) asString), ' Frees', String cr,
		((self primNetMemory) asString), ' Net Memory Taken', String cr
]

{ #category : #accessing }
RePattern >> pattern [
	"Answer the pattern I am setup to match."

	^ pattern
]

{ #category : #primitives }
RePattern >> primGetModuleName [

	<primitive: 'getModuleName' module: 'rePlugin'>
	^nil
]

{ #category : #private }
RePattern >> primLastAlloc [

	<primitive: 'primLastAlloc' module: 'rePlugin'>
	^RePlugin doPrimitive: 'primLastAlloc'

]

{ #category : #private }
RePattern >> primNetMemory [

	<primitive: 'primNetMemory' module: 'rePlugin'>
	^RePlugin doPrimitive: 'primNetMemory'

]

{ #category : #private }
RePattern >> primNumAllocs [

	<primitive: 'primNumAllocs' module: 'rePlugin'>
	^RePlugin doPrimitive: 'primNumAllocs'

]

{ #category : #private }
RePattern >> primNumFrees [

	<primitive: 'primNumFrees' module: 'rePlugin'>
	^RePlugin doPrimitive: 'primNumFrees'

]

{ #category : #primitives }
RePattern >> primPCRECompile [

	<primitive: 'primPCRECompile' module: 'rePlugin'>
	^RePlugin doPrimitive: 'primPCRECompile'
]

{ #category : #primitives }
RePattern >> primPCREExec: aCharBufferObject [

	<primitive: 'primPCREExec' module: 'rePlugin'>
	^RePlugin doPrimitive: 'primPCREExec'

]

{ #category : #primitives }
RePattern >> primPCREExec: aCharBufferObject from: fromInteger to: toInteger [

	<primitive: 'primPCREExecfromto' module: 'rePlugin'>
	^RePlugin doPrimitive: 'primPCREExecfromto'

]

{ #category : #primitives }
RePattern >> primPCRENumSubPatterns [

	<primitive: 'primPCRENumSubPatterns' module: 'rePlugin'>
	^RePlugin doPrimitive: 'primPCRENumSubPatterns'

]

{ #category : #printing }
RePattern >> printOn: aStream [

	aStream nextPutAll: 'a '.
	(self species) printOn: aStream.
	aStream nextPut: $(.
	(self pattern) printOn: aStream.
	aStream nextPut: $).
]

{ #category : #searching }
RePattern >> search: aString [
	"Answer nil if I don't match aString using standard options.  Otherwise return an appropriate ReMatch."

	^ self search: aString opt: ''
]

{ #category : #'global searching' }
RePattern >> search: aString collect: aBlock [

	^self search: aString opt: '' collect: aBlock

]

{ #category : #'global searching' }
RePattern >> search: aString collect: aBlock num: limitInteger [

	^self search: aString opt: '' collect: aBlock num: limitInteger
]

{ #category : #searching }
RePattern >> search: aString from: anInteger [
	"Answer nil if I don't match the substring of aString beginning at anInteger using standard options.  Otherwise return an appropriate ReMatch."

	^ self
		search: aString
		from: anInteger
		to: (aString size)
		opt: ''
]

{ #category : #searching }
RePattern >> search: srchString from: anInteger opt: optString [
	"Answer nil if I don't match the substring of srchString beginning at anInteger using options specified by optString.  Otherwise return an appropriate ReMatch."

	^ self
		search: srchString
		from: anInteger
		to: (srchString size)
		opt: optString
]

{ #category : #searching }
RePattern >> search: aString from: posInteger to: endposInteger [
	"Answer nil if I don't match the substring of aString beginning at posInteger and ending at endposInteger using standard options.  Otherwise return an appropriate ReMatch."

	^self 
		search: aString
		from: posInteger
		to: endposInteger
		opt: ''
]

{ #category : #searching }
RePattern >> search: aString from: posInteger to: endposInteger opt: matchOptString [
	"Answer nil if I don't match the substring of srchString beginning at posInteger and ending at endposInteger using options specified by optString.  Otherwise return an appropriate ReMatch."

	matchOptions := self evalMatchString: matchOptString.
	lastMatchResult := self 
		primPCREExec: aString from: posInteger to: endposInteger.
	(lastMatchResult < 0) ifTrue: [^nil].
	^ReMatch 
		matchArray: matchSpace
		forRe: self 
		onString: aString
		from: posInteger
		to: endposInteger

]

{ #category : #'methods for RE' }
RePattern >> search: aString from: posInteger to: endposInteger optCode: matchOptionsInteger [

	"Answer nil if I don't match the substring of srchString beginning at posInteger and ending at endposInteger using options specified by optString.  Otherwise return an appropriate ReMatch."

	matchOptions := matchOptionsInteger.
	lastMatchResult := self 
		primPCREExec: aString from: posInteger to: endposInteger.
	(lastMatchResult < 0) ifTrue: [^nil].
	^ReMatch 
		matchArray: matchSpace
		forRe: self 
		onString: aString
		from: posInteger
		to: endposInteger

]

{ #category : #searching }
RePattern >> search: srchString opt: optString [
	"Answer nil if I don't match srchString using options specified by optString.  Otherwise return an appropriate ReMatch."

	matchOptions := self evalMatchString: optString.
	lastMatchResult := self 
		primPCREExec: srchString.
	(lastMatchResult < 0) ifTrue: [^nil].
	^ReMatch 
		matchArray: matchSpace
		forRe: self 
		onString: srchString
		from: 1
		to: (srchString size)
]

{ #category : #'global searching' }
RePattern >> search: aString opt: optString collect: aBlock [
"Sequentially search aString until no more matches are found.  Begin a subsequent search immediately where the preceding search ends, but handle empty matches specially as described below.  Answer an OrderedCollection of the result of applying aBlock to each match, or nil if no matches were found.

For example:

	(RePattern on: 'x+')
		gsearch: 'x xx xxx xxxxx xxxxxx'
		opt: '' 
		collect: [:m | m match] 
Answers: 	

	OrderedCollection ('x' 'xx' 'xxx' 'xxxxx' 'xxxxxx' )

After an empty string is matched, a subsequent search would attain the same result.  Accordingly, we simply bump the search one character in such cases.  Additionally, we do not count as a match empty matches which are adjacent to a preceding match." 

	| from to m results lastMatchFrom matchesSoFar |
	aString ifNil: [^nil].
	from := 1. to := aString size. lastMatchFrom := -1. matchesSoFar := 0.
	results  := OrderedCollection new.

	[from <= (to+1)]
		whileTrue: [
			(m := self search: aString from: from to: to opt: optString)
				ifNil: [
					(0 = results size) ifTrue: [^nil].
					^results]
				ifNotNil: [
					matchesSoFar := matchesSoFar + 1.
					from := (m to) + 1.
					(0 = m match size)
						ifTrue: [ "Handle an empty match"
							from := from + 1.
							(lastMatchFrom = m from) 
								ifFalse: [results add:(aBlock value: m)]]
						ifFalse: [ "Handle a non-empty match"
							lastMatchFrom := from. 
							results add:(aBlock value: m)]]].
	^results
]

{ #category : #'global searching' }
RePattern >> search: aString opt: optString collect: aBlock num: limitInteger [
"Sequentially search aString until no more matches are found, or limitInteger matches are found, whichever occurs first.  Begin a subsequent searche immediately where the preceding search ended, but handle empty specially as described below.  Answer an OrderedCollection of the result of applying aBlock to each match, or nil if no matches were found.

For example:

	(RePattern on: 'x+')
		gsearch: 'x  xx xxx xxxxx xxxxxx'
		opt: '' 
		collect: [:m | m match] 
		num: 3 

Answers: 	

	OrderedCollection ('x' 'xx' 'xxx' )

After an empty string is matched, a subsequent search would attain the same result.  Accordingly, we simply bump the search one character in such cases.  Additionally, we do not count as a match empty matches which are adjacent to a preceding match." 

	| from to m results lastMatchFrom matchesSoFar |
	aString ifNil: [^nil].
	((limitInteger isNil) or: [limitInteger < 0]) ifTrue: [^self gsearch: aString opt: optString].
	from := 1. to := aString size. lastMatchFrom := -1. matchesSoFar := 0.
	results  := OrderedCollection new.

	[(from <= (to+1)) and: [matchesSoFar < limitInteger]]
		whileTrue: [
			(m := self search: aString from: from to: to opt: optString)
				ifNil: [
					(0 = results size) ifTrue: [^nil].
					^results]
				ifNotNil: [
					from := (m to) + 1.
					(0 = m match size)
						ifTrue: [ "Handle an empty match"
							from := from + 1.
							(lastMatchFrom = m from) 
								ifFalse: [ "empty match not adjacent preceding match"
									matchesSoFar := matchesSoFar + 1.
									results add:(aBlock value: m)]]
						ifFalse: [ "Handle a non-empty match"
							matchesSoFar := matchesSoFar + 1.
							lastMatchFrom := from. 
							results add:(aBlock value: m)]]].

	(0 = results size) ifTrue: [^nil].
	^results
]

{ #category : #'global searching' }
RePattern >> search: aString opt: optString sub: aBlock [

	|start m result |
	start := 1.
	m := self search: aString from: start opt: optString.
	result := WriteStream on: (String new).
	[m isNil]
		whileFalse: [
			((m from) > start) 
				ifTrue: [ result nextPutAll: (aString copyFrom: start to: ((m from) - 1))].
			0 = m match size
				ifTrue: [
					start > aString size ifTrue: [
						result nextPutAll: (aBlock value: m). 
						^result contents].
					result nextPutAll: (aBlock value: m); nextPut: (aString at: start).
					start := start + 1]
				ifFalse: [
					result nextPutAll: (aBlock value: m).
					start := (m to) + 1].
			m := self search: aString from: start opt: optString].
	(start <= (aString size))
		ifTrue: [result nextPutAll: (aString copyFrom: start to: (aString size))].
	^(result contents)
			
]

{ #category : #'global searching' }
RePattern >> search: aString opt: optString  sub: aBlock num: limitInteger [

	|start m result numMatchesSoFar |
	start := 1. numMatchesSoFar := 0.
	((limitInteger isNil) or: [limitInteger < 0]) ifTrue: [^self gsearch: aString opt: optString].
	m := self search: aString from: start opt: optString.
	result := WriteStream on: (String new).
	[(m isNil) or: [numMatchesSoFar >= limitInteger]]
		whileFalse: [
			numMatchesSoFar := numMatchesSoFar + 1.
			((m from) > start) 
				ifTrue: [ result := result , (aString copyFrom: start to: ((m from) - 1))].
			0 = m match size
				ifTrue: [
					start > aString size ifTrue: [
						result nextPutAll: (aBlock value: m). 
						^result contents].
					result nextPutAll: (aBlock value: m); nextPut: (aString at: start).
					start := start + 1]
				ifFalse: [
					result nextPutAll: (aBlock value: m).
					start := (m to) + 1].
			m := self search: aString from: start opt: optString].
	(start <= (aString size))
		ifTrue: [result nextPutAll: (aString copyFrom: start to: (aString size))].
	^(result contents)
]

{ #category : #'methods for RE' }
RePattern >> search: aString optCode: anInteger collect: aBlock [
"Sequentially search aString until no more matches are found.  Begin a subsequent search immediately where the preceding search ends, but handle empty matches specially as described below.  Answer an OrderedCollection of the result of applying aBlock to each match, or nil if no matches were found.

For example:

	(RePattern on: 'x+')
		gsearch: 'x xx xxx xxxxx xxxxxx'
		opt: '' 
		collect: [:m | m match] 
Answers: 	

	OrderedCollection ('x' 'xx' 'xxx' 'xxxxx' 'xxxxxx' )

After an empty string is matched, a subsequent search would attain the same result.  Accordingly, we simply bump the search one character in such cases.  Additionally, we do not count as a match empty matches which are adjacent to a preceding match." 

	| from to m results lastMatchFrom matchesSoFar |
	aString ifNil: [^nil].
	from := 1. to := aString size. lastMatchFrom := -1. matchesSoFar := 0.
	results  := OrderedCollection new.

	[from <= (to+1)]
		whileTrue: [
			(m := self search: aString from: from to: to optCode: anInteger)
				ifNil: [
					(0 = results size) ifTrue: [^nil].
					^results]
				ifNotNil: [
					matchesSoFar := matchesSoFar + 1.
					from := (m to) + 1.
					(0 = m match size)
						ifTrue: [ "Handle an empty match"
							from := from + 1.
							(lastMatchFrom = m from) 
								ifFalse: [results add:(aBlock value: m)]]
						ifFalse: [ "Handle a non-empty match"
							lastMatchFrom := from. 
							results add:(aBlock value: m)]]].
	^results
]

{ #category : #'methods for RE' }
RePattern >> search: aString optCode: optInteger collect: aBlock num: limitInteger [
"Sequentially search aString until no more matches are found, or limitInteger matches are found, whichever occurs first.  Begin a subsequent searche immediately where the preceding search ended, but handle empty specially as described below.  Answer an OrderedCollection of the result of applying aBlock to each match, or nil if no matches were found.

For example:

	(RePattern on: 'x+')
		gsearch: 'x  xx xxx xxxxx xxxxxx'
		opt: '' 
		collect: [:m | m match] 
		num: 3 

Answers: 	

	OrderedCollection ('x' 'xx' 'xxx' )

After an empty string is matched, a subsequent search would attain the same result.  Accordingly, we simply bump the search one character in such cases.  Additionally, we do not count as a match empty matches which are adjacent to a preceding match." 

	| from to m results lastMatchFrom matchesSoFar |
	aString ifNil: [^nil].
	((limitInteger isNil) or: [limitInteger < 0]) 
		ifTrue: [^self search: aString optCode: optInteger collect: aBlock].
	from := 1. to := aString size. lastMatchFrom := -1. matchesSoFar := 0.
	results  := OrderedCollection new.

	[(from <= (to+1)) and: [matchesSoFar < limitInteger]]
		whileTrue: [
			(m := self search: aString from: from to: to optCode: optInteger)
				ifNil: [
					(0 = results size) ifTrue: [^nil].
					^results]
				ifNotNil: [
					from := (m to) + 1.
					(0 = m match size)
						ifTrue: [ "Handle an empty match"
							from := from + 1.
							(lastMatchFrom = m from) 
								ifFalse: [ "empty match not adjacent preceding match"
									matchesSoFar := matchesSoFar + 1.
									results add:(aBlock value: m)]]
						ifFalse: [ "Handle a non-empty match"
							matchesSoFar := matchesSoFar + 1.
							lastMatchFrom := from. 
							results add:(aBlock value: m)]]].

	(0 = results size) ifTrue: [^nil].
	^results
]

{ #category : #'methods for RE' }
RePattern >> search: aString optCode: anInteger sub: aBlock [

	|start m result |
	start := 1.
	m := self search: aString from: 1 to: aString size optCode: anInteger.
	result := WriteStream on: (String new).
	[m isNil]
		whileFalse: [
			((m from) > start) 
				ifTrue: [ result nextPutAll: (aString copyFrom: start to: ((m from) - 1))].
			0 = m match size
				ifTrue: [
					start > aString size ifTrue: [
						result nextPutAll: (aBlock value: m). 
						^result contents].
					result nextPutAll: (aBlock value: m); nextPut: (aString at: start).
					start := start + 1]
				ifFalse: [
					result nextPutAll: (aBlock value: m).
					start := (m to) + 1].
			m := self search: aString from: start to: aString size optCode: anInteger].
	(start <= (aString size))
		ifTrue: [result nextPutAll: (aString copyFrom: start to: (aString size))].
	^(result contents)
			
]

{ #category : #'methods for RE' }
RePattern >> search: aString optCode: anInteger  sub: aBlock num: limitInteger [

	|start m result numMatchesSoFar |
	start := 1. numMatchesSoFar := 0.
	((limitInteger isNil) or: [limitInteger < 0]) ifTrue: 
		[^self search: aString optCode: anInteger  sub: aBlock].
	m := self search: aString from: start to: aString size optCode: anInteger.
	result := WriteStream on: (String new).
	[(m isNil) or: [numMatchesSoFar >= limitInteger]]
		whileFalse: [
			numMatchesSoFar := numMatchesSoFar + 1.
			((m from) > start) 
				ifTrue: [ result nextPutAll: (aString copyFrom: start to: ((m from) - 1))].
			0 = m match size
				ifTrue: [
					start > aString size ifTrue: [
						result nextPutAll: (aBlock value: m). 
						^result contents].
					result nextPutAll: (aBlock value: m); nextPut: (aString at: start).
					start := start + 1]
				ifFalse: [
					result nextPutAll: (aBlock value: m).
					start := (m to) + 1].
			m := self search: aString from: start to: aString size optCode: anInteger].
	(start <= (aString size))
		ifTrue: [result nextPutAll: (aString copyFrom: start to: (aString size))].
	^(result contents)
]

{ #category : #'global searching' }
RePattern >> search: aString sub: aBlock [

	^self search: aString opt: '' sub: aBlock
]

{ #category : #'global searching' }
RePattern >> search: aString sub: aBlock num: limitInteger [

	^self search: aString opt: '' sub: aBlock num: limitInteger
]
