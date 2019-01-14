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
