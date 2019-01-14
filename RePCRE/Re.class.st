"
Perl-Style Regular Expressions in Smalltalk

Documentation

The documentation category of this method contains substantial documentation on the operation of this Class.

	Re aGeneralComment
	Re aGlobalSearchComment
	Re aRegexComment
	Re aRegexGoryDetailsComment
	Re aVersionsComment
	Re anReComment
	Re anReOverviewComment

	Re aLicenseComment	


Examples:

	(Re on: 'a.*y') search: 'Candy is dandy.'
	'a.*y' asRe search: 'Candy is dandy.'
	'Candy is dandy' reMatch: 'a.*y'

	(Re on: '\w+') searchAndCollect: 'Candy is dandy.'
	'\w+' asRe searchAndCollect: 'Candy is dandy.'
	'Candy is dandy.' reMatch: '\w+' andCollect: [:m | m match]

Structure:
 pattern 		String -- the string with the regular expression source code
 compiledPattern RePlugin representing a compiled pattern
 isAnchored		Boolean -- representing an option setting
 is ...			Booleans -- for the other options below

List ofcommon public methods:

#opt:

	sets options using Perl-style string

#beAnchored 			#beNotAnchored				#isAnchored			#isAnchored:
#beBeginningOfLine 	#beNotBeginningOfLine 		#isBeginningOfLine	#isBeginningOfLine:
#beCaseSensitive 		#beNotCaseSensitive 			#isCaseSensitive		#isCaseSensitive:
#beDollarEndOnly 		#beNotDollarEndOnly 		#isDollarEndOnly	#isDollarEndOnly:
#beDotIncludesNewline 	#beNotDotIncludesNewline 	#isDotIncludesNewLine #isDotIncludesNewline:
#beEndOfLine 			#beNotEndOfLine 			#isEndOfLine		#isEndOfLine:
#beExtended 			#beNotExtended 				#isExtended			#isExtended:
#beExtra 				#beNotExtra 				#isExtra				#isNotExtra:
#beGreedy 				#beNotGreedy 				#isGreedy			#isGreedy:
#beMultiline 			#beNotMultiline 			#isMultiline			#isMultiline:

	Getters and setters for options in traditional Smalltalk style

search: aTargetString
search aTargetString from: startInteger to: endInteger

	Compiling the pattern, if necessary, search a string (or substring) using the pattern.  Answers nil if no match.  

searchAndCollect: aTargetString
search: aTargetString andCollect: aBlock
search: aTargetString andCollect: aBlock matchCount: anInteger

	Compiling the pattern, if necessary, gather all (or, if specified, the first anInteger) non-overlapping matches to me in aTargetString. Answer a collection of the results of applying aBlock to each ReMatch result.

search: aTargetString andReplace: aBlock
search: aTargetString andReplace: aBlock matchCount: anInteger

	Compiling the pattern, if necessary, find all (or, if specified, the first anInteger) non-overlapping matches to me in aTargetString.  Answer a new string, created by substituting the results of applying aBlock to each ReMatch result for the matched substring.

	
(44 16 109 1 1 18 2 23 2 16 2 27 2 19 2 14 2 22 3 1 19 1 12 280 11 236 30 1 6 40 687 66 8 13 8 13 7 12 5 10 1 118 18 13 9 13 13 6 9 13 13 6 13 9 1 217 8 13 13 6 9 13 13 6 13 9 1 266)bf3,bf1,f1,bf1,f1,f1LRe aGeneralComment;,f1,f1LRe aGlobalSearchComment;,f1,f1LRe aRegexComment;,f1,f1LRe aRegexGoryDetailsComment;,f1,f1LRe aVersionsComment;,f1,f1LRe anReComment;,f1,f1LRe anReOverviewComment;,bf1,f1,f1LRe aLicenseComment;,f1,bf1,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1,f1b,f1
"
Class {
	#name : #Re,
	#superclass : #Object,
	#instVars : [
		'pattern',
		'compiledPattern',
		'isAnchored',
		'isCaseSensitive',
		'isDollarEndOnly',
		'isDotIncludesNewline',
		'isExtended',
		'isExtra',
		'isMultiline',
		'isBeginningOfLine',
		'isEndOfLine',
		'isGreedy'
	],
	#category : #RePCRE
}

{ #category : #'as yet unclassified' }
Re class >> new [

	^super new initialize
]

{ #category : #'as yet unclassified' }
Re class >> on: aPattern [

	^self new on: aPattern
]

{ #category : #'as yet unclassified' }
Re class >> on: aPattern search: aString [

	^(self on: aPattern)
		search: aString
		from: 1
		to: aString size
]

{ #category : #'as yet unclassified' }
Re class >> status [

	| code |
	^String streamContents: [:s |
		s nextPutAll: 'RePlugin Statuts:'; cr.
		s nextPutAll: '===================='; cr.
		s nextPutAll: 'Plugin version: '; cr.
		#( '\n' '\r' '\cj' ) do: [:eachCode |
			code := 0.
			[code <=255 and: [(eachCode asRe search: code asCharacter asString) isNil]]
				whileTrue: [code := code + 1].
			s nextPutAll: eachCode, ' = ', code hex; cr]]
]

{ #category : #constants }
Re >> PCREANCHORED [

	^16
]

{ #category : #constants }
Re >> PCRECASELESS [

	^1


]

{ #category : #constants }
Re >> PCREDOLLARENDONLY [

	^32

]

{ #category : #constants }
Re >> PCREDOTALL [

	^4
]

{ #category : #constants }
Re >> PCREEXTENDED [

	^8
]

{ #category : #constants }
Re >> PCREEXTRA [

	^64

]

{ #category : #constants }
Re >> PCREMULTILINE [

	^2
]

{ #category : #constants }
Re >> PCRENOTBOL [

	^128
]

{ #category : #constants }
Re >> PCRENOTEOL [

	^256
]

{ #category : #constants }
Re >> PCREUNGREEDY [

	^512
]

{ #category : #accessing }
Re >> action [

	^action
]

{ #category : #accessing }
Re >> action: aBlock [

	action := aBlock
]

{ #category : #documentation }
Re >> anOptionsComment [ "

Compilation and Matching Options

Message Name			Code	Explanation

beCaseSensitive			-i		Case sensitive matching
beNotCaseSensitive		i		Ignore case during matching
beNotMultiline			-m		Anchor chars don't match line ending
beMultiline				m		Anchor chars match on line ending
beNotDotIncludesNewline	-s		'.' does not match line ending
beDotIncludesNewline	s		'.' matches line endings
beNotExtended			-x		extended mode off (see below)
beExtended				x		extended mode on (see below)
beNotDollarEndOnly		-E		$ matches \n before end of line
beDollarEndOnly			E		$ does not match \n before end of line
beGreedy				-U		quantifiers have ordinary meaning
beNotGreedy				U		reverses meaning of * and :*, also + and :+
beNotExtra				-X		PCRE Extra mode off (see below)		
beExtra					X		PCRE Extra mode on (see below)
beNotAnchored			-A		Matches may begin anywhere
beAnchored				A		Matches must start with first character
beBeginningOfLine		-B		subject starts at beginning of a line
beNotBeginningOfLine	B		subject start not at beginning of a line
beEndOfLine				-Z		subject end may be at end of line
beNotEndOfLine			Z		subject end may not be at end of a line

In extended mode (beExtended), whitespace are ignored unless escaped, and # precedes comment to next newline.  PCRE Extra mode is described in detail in the accompanying documention.  Options may be changed at any time, but a pattern recompile occurs after changing the value any option other than anchored (A), beginning of line (B) or end of line (Z).

Options may be specified using messages or by Perl-style option codes:

'a.*y' asRe
	beNotCaseSensitive;
	beDotIncludesNewline;
	search: 'CANDY IS ', Character cr asString, 'DANDY, BUT LIQUOR IS QUICKER'

'a.*y' asRe
	opt: 'is';
	search: 'CANDY IS ', Character cr asString, 'DANDY, BUT LIQUOR IS QUICKER'

"
]

{ #category : #accessing }
Re >> asRe [

	^self
]

{ #category : #compiling }
Re >> assureCompiledPattern [

	compiledPattern ifNil: [self compile].
	^compiledPattern
]

{ #category : #'accessing options' }
Re >> beAnchored [ 

	self isAnchored: true
]

{ #category : #'accessing options' }
Re >> beBeginningOfLine [

	self isBeginningOfLine: true
]

{ #category : #'accessing options' }
Re >> beCaseSensitive [

	self isCaseSensitive: true
]

{ #category : #'accessing options' }
Re >> beDollarEndOnly [

	self isDollarEndOnly: true
]

{ #category : #'accessing options' }
Re >> beDotIncludesNewline [

	self isDotIncludesNewline: true
]

{ #category : #'accessing options' }
Re >> beEndOfLine [

	self isEndOfLine: true
]

{ #category : #'accessing options' }
Re >> beExtended [
	
	self isExtended: true
]

{ #category : #'accessing options' }
Re >> beExtra [ 

	self isExtra: true
]

{ #category : #'accessing options' }
Re >> beGreedy [

	self isGreedy: true
]

{ #category : #'accessing options' }
Re >> beMultiline [

	self isMultiline: true
]

{ #category : #'accessing options' }
Re >> beNotAnchored [ 

	self isAnchored: false
]

{ #category : #'accessing options' }
Re >> beNotBeginningOfLine [

	self isBeginningOfLine: false
]

{ #category : #'accessing options' }
Re >> beNotCaseSensitive [

	self isCaseSensitive: false
]

{ #category : #'accessing options' }
Re >> beNotDollarEndOnly [

	self isDollarEndOnly: false
]

{ #category : #'accessing options' }
Re >> beNotDotIncludesNewline [

	self isDotIncludesNewline: false
]

{ #category : #'accessing options' }
Re >> beNotEndOfLine [

	self isEndOfLine: false
]

{ #category : #'accessing options' }
Re >> beNotExtended [
	
	self isExtended: false
]

{ #category : #'accessing options' }
Re >> beNotExtra [

	self isExtra: false
]

{ #category : #'accessing options' }
Re >> beNotGreedy [

	self isGreedy: false
]

{ #category : #'accessing options' }
Re >> beNotMultiline [

	self isMultiline: false
]

{ #category : #private }
Re >> beStrangeOption [
]

{ #category : #constants }
Re >> codedOptionsForCompile [

	| optionCode |

	optionCode := 0.
	isAnchored ifTrue: [optionCode := optionCode bitOr: self PCREANCHORED].

	isCaseSensitive ifFalse: [optionCode := optionCode bitOr: self PCRECASELESS].
	isMultiline ifTrue: [optionCode := optionCode bitOr: self PCREMULTILINE].
	isDotIncludesNewline ifTrue: [optionCode := optionCode bitOr: self PCREDOTALL].
	isExtended ifTrue: [optionCode := optionCode bitOr: self PCREEXTENDED].
	isDollarEndOnly ifTrue: [optionCode := optionCode bitOr: self PCREDOLLARENDONLY].
	isExtra ifTrue: [optionCode := optionCode bitOr: self PCREEXTRA].
	isGreedy ifFalse: [optionCode := optionCode bitOr: self PCREUNGREEDY].

	^optionCode

]

{ #category : #constants }
Re >> codedOptionsForMatch [

	| optionCode |

	optionCode := 0.

	isAnchored ifTrue: [optionCode := optionCode bitOr: self PCREANCHORED].

	isBeginningOfLine ifFalse: [optionCode := optionCode bitOr: self PCRENOTBOL].
	isEndOfLine ifFalse: [optionCode := optionCode bitOr: self PCRENOTEOL].

	^optionCode
]

{ #category : #searching }
Re >> collectFrom: aString [

	^self search: aString andCollect: [:m | m match]
]

{ #category : #compiling }
Re >> compile [

	compiledPattern := RePattern new 
		compile: pattern 
		optCode: self codedOptionsForCompile 
		onErrorRun: [:x :y :errorString | Error signal: errorString].
]

{ #category : #accessing }
Re >> compiledPattern [

	^compiledPattern
]

{ #category : #accessing }
Re >> compiledPattern: anRePattern [

	^compiledPattern := anRePattern
]

{ #category : #searching }
Re >> grepFrom: inStream [

	^String streamContents: [:s | self grepFrom: inStream to: s]
]

{ #category : #searching }
Re >> grepFrom: inStream to: outStream [

	"String streamContents: [:s |
		'a' asRe
			grepFrom: (ReadStream on: 'this is a test
of the emergency
broadcast system')
			to: s]"

	self grepFrom: inStream
		to: outStream
		onMatch: [:s :m | s nextPutAll: m searchString; cr]
		onNonMatch: [:s :l | ]
]

{ #category : #searching }
Re >> grepFrom: inStream to: outStream onMatch: matchBlock onNonMatch: nonMatchBlock [

	| m line |
	[inStream atEnd] whileFalse:
		[(m := self search: (line := inStream nextLine))
			ifNil: [nonMatchBlock value: outStream value: line]
			ifNotNil: [matchBlock value: outStream value: m]]
]

{ #category : #private }
Re >> initialize [

	pattern := nil.
	self
		beNotAnchored;
		beCaseSensitive;
		beNotDollarEndOnly;
		beNotDotIncludesNewline;
		beNotExtended;
		beNotExtra;
		beNotMultiline;
		beBeginningOfLine;
		beEndOfLine;
		beGreedy.
	action := [:m | m match].
]

{ #category : #'accessing options' }
Re >> isAnchored [ 

	^isAnchored
]

{ #category : #'accessing options' }
Re >> isAnchored: aBoolean [

	isAnchored := aBoolean
]

{ #category : #'accessing options' }
Re >> isBeginningOfLine [

	^isBeginningOfLine
]

{ #category : #'accessing options' }
Re >> isBeginningOfLine: aBoolean [

	isBeginningOfLine == aBoolean 
		ifFalse:[compiledPattern := nil].
	isBeginningOfLine := aBoolean
]

{ #category : #'accessing options' }
Re >> isCaseSensitive [

	^isCaseSensitive
]

{ #category : #'accessing options' }
Re >> isCaseSensitive: aBoolean [

	isCaseSensitive == aBoolean 
		ifFalse:[compiledPattern := nil].
	isCaseSensitive := aBoolean
]

{ #category : #'accessing options' }
Re >> isDollarEndOnly [ 

	^isDollarEndOnly
]

{ #category : #'accessing options' }
Re >> isDollarEndOnly: aBoolean [

	isDollarEndOnly == aBoolean 
		ifFalse:[compiledPattern := nil].
	isDollarEndOnly := aBoolean
]

{ #category : #'accessing options' }
Re >> isDotIncludesNewline [

	^isDotIncludesNewline
]

{ #category : #'accessing options' }
Re >> isDotIncludesNewline: aBoolean [

	isDotIncludesNewline == aBoolean 
		ifFalse:[compiledPattern := nil].
	isDotIncludesNewline := aBoolean
]

{ #category : #'accessing options' }
Re >> isEndOfLine [

	^isEndOfLine
]

{ #category : #'accessing options' }
Re >> isEndOfLine: aBoolean [

	isEndOfLine := aBoolean
]

{ #category : #'accessing options' }
Re >> isExtended [ 

	^isExtended
]

{ #category : #'accessing options' }
Re >> isExtended: aBoolean [

	isExtended == aBoolean 
		ifFalse:[compiledPattern := nil].
	isExtended := aBoolean
]

{ #category : #'accessing options' }
Re >> isExtra [ 

	^isExtra
]

{ #category : #'accessing options' }
Re >> isExtra: aBoolean [

	isExtra == aBoolean 
		ifFalse:[compiledPattern := nil].
	isExtra := aBoolean
]

{ #category : #'accessing options' }
Re >> isGreedy [

	^isGreedy
]

{ #category : #'accessing options' }
Re >> isGreedy: aBoolean [

	isGreedy == aBoolean 
		ifFalse:[compiledPattern := nil].
	isGreedy := aBoolean
]

{ #category : #'accessing options' }
Re >> isMultiline [

	^isMultiline
]

{ #category : #'accessing options' }
Re >> isMultiline: aBoolean [

	isMultiline == aBoolean 
		ifFalse:[compiledPattern := nil].
	isMultiline := aBoolean
]

{ #category : #accessing }
Re >> on: aPattern [

	self pattern: aPattern
]

{ #category : #'accessing options' }
Re >> opt: aString [

	| setOrReset |
	setOrReset := true.
	aString do: [:ch |
		ch = $-
			ifTrue: [setOrReset := setOrReset not]
			ifFalse: [self setOptionForPCRECharacter: ch to: setOrReset]]
]

{ #category : #accessing }
Re >> pattern [

	compiledPattern := nil.
	^pattern
]

{ #category : #accessing }
Re >> pattern: aString [

	compiledPattern := nil.
	pattern := aString
]

{ #category : #printing }
Re >> printBoolean: aBoolean named: aString on: aStream [

	aStream nextPut:$ .
	aBoolean ifFalse: [aStream nextPutAll: 'NOT '].
	aStream nextPutAll: aString.
	aStream nextPut:$.
]

{ #category : #printing }
Re >> printOn: aStream [

	aStream nextPutAll: 'an Re'.
	pattern ifNotNil:
		[aStream nextPutAll: ' for '''.
		aStream nextPutAll: pattern.
		aStream nextPutAll: ''''].
	aStream nextPut: $(.
	self printBoolean: isAnchored named: 'anchored' on: aStream.
	aStream nextPut: $/.
	self printBoolean: isCaseSensitive named: 'case sensitive' on: aStream.
	self printBoolean: isDollarEndOnly named: 'dollar end only' on: aStream.
	self printBoolean: isDotIncludesNewline named: 'dot includes newline' on: aStream.
	self printBoolean: isExtended named: 'extended' on: aStream.
	self printBoolean: isExtra named: 'extra' on: aStream.
	self printBoolean: isGreedy named: 'greedy' on: aStream.
	self printBoolean: isMultiline named: 'multiline' on: aStream.
	aStream nextPut: $/.
	self printBoolean: isBeginningOfLine named: 'beginning of line' on: aStream.
	self printBoolean: isEndOfLine named: 'end of line' on: aStream.
	compiledPattern ifNil: [aStream nextPutAll: ' NOT'].
	aStream nextPutAll: ' compiled'.	
	aStream nextPut: $).
]

{ #category : #searching }
Re >> search: aString [

	^(self assureCompiledPattern)
		search: aString 
		from: 1 
		to: aString size 
		optCode: self codedOptionsForMatch
]

{ #category : #searching }
Re >> search: aString andCollect: aBlock [

	^(self assureCompiledPattern)
		search: aString
		optCode: self codedOptionsForMatch
		collect: aBlock
]

{ #category : #searching }
Re >> search: aString andCollect: aBlock matchCount: anInteger [

	^(self assureCompiledPattern)
		search: aString
		optCode: self codedOptionsForMatch
		collect: aBlock
		num: anInteger
]

{ #category : #searching }
Re >> search: aString andReplace: aBlock [

	^(self assureCompiledPattern)
		search: aString
		optCode: self codedOptionsForMatch
		sub: aBlock

]

{ #category : #searching }
Re >> search: aString andReplace: aBlock matchCount: anInteger [

	^(self assureCompiledPattern)
		search: searchString
		optCode: self codedOptionsForMatch
		sub: action
		num: anInteger
	

]

{ #category : #searching }
Re >> search: aString from: fromInteger to: toInteger [

	^(self assureCompiledPattern)
		search: aString 
		from: fromInteger 
		to: toInteger 
		optCode: self codedOptionsForMatch
]

{ #category : #searching }
Re >> searchAndCollect: aString [

	^self search: aString andCollect: [:m | m match]
]

{ #category : #accessing }
Re >> searchLimit [

	^searchLimit
]

{ #category : #accessing }
Re >> searchLimit: anInteger [

	searchLimit := anInteger
]

{ #category : #accessing }
Re >> searchString [

	^searchString
]

{ #category : #accessing }
Re >> searchString: aString [

	searchString := aString.
]

{ #category : #'accessing options' }
Re >> setOptionForPCRECharacter: aCharacter to: aBoolean [

	aCharacter = $i ifTrue: [^self isCaseSensitive: aBoolean not].
	aCharacter = $m ifTrue:[^self isMultiline: aBoolean].
	aCharacter = $s ifTrue:[^self isDotIncludesNewline: aBoolean].
	aCharacter = $x ifTrue:[^self isExtended: aBoolean].
	aCharacter = $E ifTrue:[^self isDollarEndOnly: aBoolean].
	aCharacter = $U ifTrue:[^self isGreedy: aBoolean not].
	aCharacter = $X ifTrue:[^self isExtra: aBoolean].
	aCharacter = $A ifTrue:[^self isAnchored: aBoolean].
	aCharacter = $B ifTrue:[^self isBeginningOfLine: aBoolean not].
	aCharacter = $Z ifTrue:[^self isEndOfLine: aBoolean not].
	Error signal: '$', aCharacter asString, ' is not a PCRE option character.'

]
