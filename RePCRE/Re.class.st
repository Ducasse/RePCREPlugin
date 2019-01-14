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

{ #category : #documentation }
Re >> anReOverviewComment [ "

RePlugin -- A Regular Expressions Plugin for Squeak

Introduction

RePlugin is a Squeak Plugin providing modern regular expression matching operations similar to those found in Perl. It was written by Andrew C. Greenberg (werdna@gate.net), with contributions by Markus Kohler, Stephen Pair and others. RePlugin 3.2 (and 'the Gory Details' portion of this document) is directly taken from Version 2.04 of the excellent PCRE library by Philip Hazel with only minor modifications.

RePlugin, an Overview

While the primary functionality (and documentation) for RePlugin is found in new classes RePattern and ReMatch and the operations set forth therein, a comprehensive set of convenience functions are provided in the String class for ease of use. 

A Simple Example to Get You Started

After installing RePlugin, you can execute the following in a workspace: 

	'Candy is dandy, but liquor is quicker.'  reMatch: 'a.*y'

This reMatch: message directs RePlugin to search the longer string for the leftmost occurrence of the letter 'a', followed by the longest string that can be collected thereafter comprising any characters, but ending in a 'y.' The message answers: 

	 a ReMatch('andy is dandy')

(*blush*) which is an object of type ReMatch. As you shall see later, ReMatch objects can be saved to obtain a wide range of information about the match result. When printed, as here, it conveniently identifies the substring that was actually matched, which can also be obtained from the ReMatch instance by sending it the message match. (Note that the longer string 'andy is dandy' was matched, and not the shorter 'andy'.) If there was no match of the string, for example if the subject string were 

	'You got 'y', but only after the 'a''

then the message would answer nil.  A common use of regular expression matching is simply to determine as a boolean result whether the pattern has been matched (similar to the #match method).  Accordingly, a convenience function is provided:

	('Candy is dandy, but liquor is quicker.' matchRe: 'a.*y') ifTrue: ['matched'] ifFalse: ['not matched']

Global Searching and Replacing

It is sometimes convenient to ask ReMatch to repeatedly search for non-overlapping matches of a regular expression, and to report a collection of information with respect to each of the matches found. For example, the message: 

	'Stupid is as stupid does.' reMatch: 'stupid' andCollect: [:m | m match ].

This message looks for occurrences of the regular expression 'stupid' in the subject string. Each time a match is found, the corresponding match object is passed to the block associated with the collect: keyword, and the results of those computations are returned in an OrderedCollection. Since the first occurrence begins with a capital, only one match is found. (You could collect all occurrences either by using a character class or the i modifier, for example, using the reMatch:opt:collect: message.) In this case, however, the answer will be: 

	OrderedCollection ('stupid' )

As a somewhat more useful example, 

	'Stupid is as stupid does.' reMatch: '\w+' andCollect: [:m | m match ].

can be used to collect an ordered collection of all non-whitespace phrases in the string, in this case: 

 	OrderedCollection ('Stupid' 'is' 'as' 'stupid' 'does' )

This particular form (collecting matches) is used with such frequency that a convenience function is provided:

	'Stupid is as stupid does.' collectRe: '\w+'
 
Sometimes you will want to substitute text for the matched text, which you can accomplish with the reMatch:collect: message and some fancy footwork, or which you can do quite easily, for example, as follows: 

	'Stupid is as stupid does.' reMatch: 'stupid' opt: 'i' sub: [:m | 'Andy' ].

which answers a string replacing all occurrences of stupid (because of the opt: 'i', the search is done without regard to case) with 'Andy', yielding: 

	'Andy is as Andy does.'

You can also 'capture' text by surrounding regular expression subexpressions with parentheses. For example, consider the following expression: 

	'    line has leading spaces' reMatch: '^\W+(.*)'

which answers 

	a ReMatch('     line has leading spaces')

This would have little utility, since it merely copies the line of text entirely. But since RePlugin keeps track of which text is 'captured' by which parenthetical group, which is numbered in the order the left parenthesis appears in the string. These group matches can be seperately obtained by sending the resulting match object the message 'matchAt:,' for example: 

	('    line has leading spaces' reMatch: '^\W+(.*)') matchAt: 1

which answers 

	'line has leading spaces'

That is, the line without the leading white space. Indeed, RePlugin remembers these parenthetical captures during the match, so that you can check for double words as follows: 

	'this line has has a double word' reMatch: '(\w+)\W+\1'

which matches 

	a ReMatch('has has')

These and other regular expression operations are discussed in substantially greater detail below. 


Matching With RePlugin

The Principal Messages

You may call RePlugin in any of the following ways: 

	subjectString reMatch: pattern [from: from] [to: to] [opt: optionString]
	subjectString reMatch: [opt: optionString] sub: aBlock [num: maxMatches]
	subjectString reMatch: [opt: optionString] collect: aBlock [num: maxMatches]

The keywords in square brackets are optional, in the sense that messages are available with every combination of keywords shown, with and without the optional keywords. 

The first message performs a single search on the substring of subjectString from from to to, using the modifiers set forth in optionString. If from: is not specified, then 1 is used, if to: is not specified, then subjectString size is used, and if opt: is not specified, then the empty string is used. 
It should be noted that everywhere a pattern is permitted in these operations, either a string or compiled pattern object (an Re) may be used. If a string is used, then RePlugin will first search to see if the object was recently compiled, and if so, use that object, or if not, compiles the expression and remembers it for later reuse. If a compiled pattern object (an Re) is used, then that compiled object will be used, thereby avoiding recompilations and table lookups. 

The second message performs repeated searches of subjectString for nonoverlapping matches of pattern, using compile and matching options optionString until no more matches are present or maxMatches have been found. (If maxMatches is less than zero, the number of matches will be limited only by the number of matches in the string.) Then, for each match found, replace the matched substring with the result of applying the corresponding match object to aBlock. If opt: is not specified, then the empty string is used, and if num: is not specified, then the equivalent of -1 is used. 

There is a special case in the instance where the empty string is matched, because the 'next' match would begin in the same place, thereby creating an infinite loop. This case is handled as in Perl 5.004, where an empty string is replaced with the result of calling the block, and the next search begins after 'bumping' the string to the next character. Accordingly, 

	'Thanks Markus and Steve for all your help' reMatch: 'x*' sub: [:m | '!' ].  

will answer: 

	'!T!h!a!n!k!s! !M!a!r!k!u!s! !a!n!d! !S!t!e!v!e! !f!o!r! !a!l!l! !y!o!u!r! !h!e!l!p!'

Finally, the third message performs repeated searches of subjectString for nonoverlapping matches of pattern, using compile and matching options optionString until no more matches are present or maxMatches have been found. (If maxMatches is less than zero, the number of matches will be limited only by the number of matches in the string.) Then, for each match found, evalute aBlock with the corresponding matchObject, and maintain and then answer an ordered collection of the results in the order they were computed. If opt: is not specified, then the empty string is used, and if num: is not specified, then the equivalent of -1 is used. 

reMatch:collect: handles empty string in the same manner as reMatch:sub:, with the added proviso that an empty match will not be counted if it immediately follows a non-empty match. Accordingly 

	'123' reMatch: '\d*' collect: [:m | m match]

answers 

	OrderedCollection ('123' )

and not 'OrderedCollection ('123' ''),' although 

	'123' reMatch: '\d*' sub: [:m | '<', m match, '>']

will answer 

	 '<123><>'

These null match rules mirror the semantics of Perl 5's m/.../g and s/.../g operators. 

Using ReMatch to Obtain Principal Match Information

The substring of the substring matched by re is given by: 

	m match

The beginning and end of the substring in searchString is given by the messages from and to, respectively, so that the substring matched (the result of m match could be obtained with: 

 	m searchString
		copyFrom: (m from)
		to: (m to)


Using ReMatch to Obtain Captured Groups (and Collections of Captured Groups)

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


Efficient Regular Expression Matching

RePattern tests for regular expression matching in three stages: 

1. Compiles the regular expression into a convenient internal form. 
2. Searches an object string or substring for matches. 
3. Produces results of queries on a match object. 

If you intend to repeatedly matching a single regular expression against many different strings, for example each line of a file or element of a collection, then repeating Step 1, the compilation, would be wasteful and inefficient. RePattern avoids recompilation by keeping track of the last dozen or so compiled regular expressions, avoiding the costly process of recompilation. Unfortunately, this adds the (less inefficient) cost of a table lookup with each regular expression match. 

Accordingly, RePattern permits you to generate and keep 'compiled pattern objects,' for repeated matching against subsequent strings without recompiling or searching the compilation cache. You can create an compiled pattern object with the asRePattern message: 

	'\w+' asRePattern

which answers 

	an Re('\w+ ')

and the resulting pattern can be used wherever a pattern string can be used, except that no recompilation or table lookup occurs. The following: 

	re := '\w+' asRePattern
	myCollection do: [:i|
		Transcript show: ((i reMatch: re) match); cr]

will be substantially faster than 

	myCollection do: [:i|
		Transcript show: ((i reMatch: '\w+') match); cr]

Regular Expression Syntax Summary

A regular expression (or regexp) specifies a set of strings that matches it. Regular expressions can be concatenated to form new regular expressions; if A and B are both regular expressions, then AB is also an regular expression. If a string p matches A and another string q matches B, the string pq will match AB. Thus, complex expressions are easily constructed from simpler primitive expressions. 

Regular expressions can contain both special and ordinary characters. Most ordinary characters, like 'A', 'a', or '0', are the simplest regular expressions; they simply match themselves. You can concatenate ordinary characters, so last matches the string 'last'. 

Some characters, like '|' or '(', are special. Special characters either stand for classes of ordinary characters, or affect how the regular expressions around them are interpreted. 

The special characters are: 

'.' 
(Dot.) In the default mode, this matches any character except a newline. If the 's' option has been specified, dot matches any character at all, including a newline. 

'^' 
(Caret.) Matches the start of the string, and if the 'm' option has been specified, then this also matches immediately after each newline. 

'$' 
Matches the end of the string, and if the 'm' option has been specified, then this also matches before a newline. foo matches both 'foo' and 'foobar', while the regular expression foo$ matches only 'foo'. 

'*' 
Causes the resulting regexp to match 0 or more repetitions of the preceding regexp, as many repetitions as are possible. ab* will match 'a', 'ab', or 'a' followed by any number of 'b's. 

'+' 
Causes the resulting regexp to match 1 or more repetitions of the preceding regexp. ab+ will match 'a' followed by any non-zero number of 'b's; it will not match just 'a'. 

'?' 
Causes the resulting regexp to match 0 or 1 repetitions of the preceding regexp. ab? will match either 'a' or 'ab'. 

*?, +?, ?? 
The '*', '+', and '?' qualifiers are all greedy; they match as much text as possible. Sometimes this behaviour isn't desired; if the regexp <.*> is matched against '<H1>title</H1>', it will match the entire string, and not just '<H1>'. Adding '?' after the qualifier makes it perform the match in non-greedy or minimal fashion; as few characters as possible will be matched. Using .*? in the previous expression will match only '<H1>'. 

{m,n} 
Causes the resulting regexp to match from m to n repetitions of the preceding regexp, attempting to match as many repetitions as possible. For example, a{3,5} will match from 3 to 5 'a' characters. Omitting n specifies an infinite upper bound; you can't omit m. 

{m,n}? 
Causes the resulting regexp to match from m to n repetitions of the preceding regexp, attempting to match as few repetitions as possible. This is the non-greedy version of the previous qualifier. For example, on the 6-character string 'aaaaaa', a{3,5} will match 5 'a' characters, while a{3,5}? will only match 3 characters. 

'\' 
Either escapes special characters (permitting you to match characters like '*', '?', and so forth), or signals a special sequence; special sequences are discussed below. 

[] 
Used to indicate a set of characters. Characters can be listed individually, or a range of characters can be indicated by giving two characters and separating them by a '-'. Special characters are not active inside sets. For example, [akm$] will match any of the characters 'a', 'k', 'm', or '$'; [a-z] will match any lowercase letter, and [a-zA-Z0-9] matches any letter or digit. Character classes such as \w or \S(defined below) are also acceptable inside a range. If you want to include a ']' or a '-' inside a set, precede it with a backslash, or place it as the first character. The pattern []] will match ']', for example. 

You can match the characters not within a range by complementing the set. This is indicated by including a '^' as the first character of the set; '^' elsewhere will simply match the '^' character. For example, [^5] will match any character except '5'. 

'|' 
A|B, where A and B can be arbitrary regexps, creates a regular expression that will match either A or B. This can be used inside groups (see below) as well. To match a literal '|', use \|, or enclose it inside a character class, as in [|]. 

(...) 
Matches whatever regular expression is inside the parentheses, and indicates the start and end of a group; the contents of a group can be retrieved after a match has been performed, and can be matched later in the string with the \number special sequence, described below. To match the literals '(' or '')', use \( or \), or enclose them inside a character class: [(] [)]. 

(?...) 
This is an extension notation (a '?' following a '(' is not meaningful otherwise). The first character after the '?' determines what the meaning and further syntax of the construct is. Following are the currently supported extensions: 

(?imsx[-imsx]) 
(One or more letters from the set 'i', 'm', 's', 'x'.) The group matches the empty string and set (or unset if the letters follow a '-') corresponding options for the regular expression or subexpression in which it is contained. 

(?:...) 
A non-grouping version of regular parentheses. Matches whatever regular expression is inside the parentheses, but the substring matched by the group cannot be retrieved after performing a match or referenced later in the pattern. 

(?#...) 
A comment; the contents of the parentheses are simply ignored. 

(?=...) 
Matches if ... matches next, but doesn't consume any of the string. This is called a lookahead assertion. For example, Isaac (?=Asimov) will match 'Isaac ' only if it's followed by 'Asimov'. 

(?!...) 
Matches if ... doesn't match next. This is a negative lookahead assertion. For example, Isaac (?!Asimov) will match 'Isaac ' only if it's not followed by 'Asimov'. 

(?<=...) 
Matches if ... matches, but doesn't consume any of the string. This is called a lookbehind assertion. For example, (?<=foo|fooey)bar will match 'bar' only if it's preceded by 'foo' or 'fooey'. All lookbehinds must have some fixed length, although alternatives need not be of the same length, as in the example. 

(?<!...) 
Matches if ... doesn't match, and doesn't consume any of the string. This is called a negative lookbehind assertion. For example, (?<=foo|fooey)bar will match 'bar' only if it's not preceded by 'foo' or 'fooey'. 

(?(condition)yes-pattern) 
Matches if condition is false or if condition is true and yes-pattern matches. 

(?(condition)yes-pattern|no-pattern) 
Matches if condition is true and yes-pattern matches, or if condition is false and no-pattern matches. 

The special sequences consist of '\' and a character from the list below. If the ordinary character is not on the list, then the resulting regexp will match the second character. For example, \$ matches the character '$'. 

\number 
Matches the contents of the group of the same number. Groups are numbered starting from 1. For example, (.+) \1 matches 'the the' or '55 55', but not 'the end' (note the space after the group). This special sequence can only be used to match one of the first 99 groups. If the first digit of number is 0, or number is 3 octal digits long, it will not be interpreted as a group match, but as the character with octal value number. Inside the '[' and ']' of a character class, all numeric escapes are treated as characters. 
\A 
Matches only at the start of the string. 
\b 
Matches the empty string, but only at the beginning or end of a word. A word is defined as a sequence of alphanumeric characters, so the end of a word is indicated by whitespace or a non-alphanumeric character. 
\B 
Matches the empty string, but only when it is not at the beginning or end of a word. 
\d 
Matches any decimal digit; this is equivalent to the set [0-9]. 
\D 
Matches any non-digit character; this is equivalent to the set [^0-9]. 
\s 
Matches any whitespace character; this is equivalent to the set [ \t\n\r\f\v]. 
\S 
Matches any non-whitespace character; this is equivalent to the set [^ \t\n\r\f\v]. 
\w 
Matches any alphanumeric character; this is equivalent to the set [a-zA-Z0-9_]. 
\W 
Matches any non-alphanumeric character; this is equivalent to the set [^a-zA-Z0-9_]. 

\Z 
Matches only at the end of the string. 

\\ 
Matches a literal backslash. 


Compiler and Matching Option Modes Summary

  i  for Caseless Matching Mode
  m  for Multiline Mode
  s  for Dotall Mode (Dot matches newlines)
  x  for Extended Mode (whitespace not meaningful, comments permitted)
  A  for Anchored mode
  B  for NOTBOL mode (see below)
  E  for 'Dollar end only' mode (see below)
  U  for Ungreedy mode -- greediness of operators is reversed
  X  for PCRE 'Extra' mode (see below)
  Z  for NOTEOL mode (see below)

Options B and Z are available only when matching. Option A is available for both matching and compiling. The remaining options are available only for compiling patterns. "

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
