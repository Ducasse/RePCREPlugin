"
Perl-Style Regular Expressions in Pharo

Documentation

The documentation category of this method contains substantial documentation on the operation of this Class.

	Re aGeneralComment
	Re aGlobalSearchComment
	Re aRegexComment
	Re aRegexGoryDetailsComment
	Re aVersionsComment
	Re anReComment
	Re anReOverviewComment

A	Re aLicenseComment	


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

{ #category : #documentation }
Re >> aGeneralComment [ 

"
I.  Regular Expressions in General

	Regular expressions are a language for specifying text to ease the searching and manipulation of text.  A complete discussion of regular expressions is beyond the scope of this document.  See Jeffrey Friedl, Mastering Regular Expressions, by O'Reilly for a relatively complete.  The regular expressions supported by this package are similar to those presently used in Perl 5.05 and Python, and are based upon Philip Hazel's excellent PCRE libraries (incorporated almost without change, subject to a free license described in Re aLicenseComment.  Thanks are due to Markus Kohler and Stephen Pair for their assistance in the initial ports of early versions of the Plugin.

An explanation of the expressions available in this package are summarized in Re aRegexComment, Re anOptionsComment and Re aGlobalSearchComment.

II. Overview of the 'Package.'

	The following new classes are provided:

		Class					Description of Instances
		----------------------		-------------------------------------------------------------------
		Re						A regular expression matching engine
		ReMatch				Result of a search using Re
		RePattern				Deprecated engine class from earlier plugin versions
		RePlugin				The Plugin 'Glue' to the PCRE Library.

		String					Various new messages were added to String, which are
								the principal means for users to access the package. 

PluginCodeGenerator has been deleted from the packgage.


III. Some Examples.

	A. Simple Matching and Querying of Matches

	To search a string for matches in a regular expression, use String reMatch:

		'just trying to catch some zzz''s before noon' matchRe: 'z+'

which returns true if matched, and false otherwise.  If more information from a positive search result is desired, the method reMatch will return a ReMatch object corresponding to the result.

		'just trying to catch some zzz''s before noon' reMatch: 'z+'

The match object can be queried in various ways.  For example, to obtain details when parenthetical phrases of a regular expression are captured:

		|m|
		m := 'Andy was born on 10/02/1957, and not soon enough!!'
			reMatch: '(\d\d)/(\d\d)/((19|20)?\d\d)'.
		m matches

answers with:
	
		('10' '02' '1957' '19' )

The first message answers a ReMatch m representing the result of a search of the string for matches of re (nil would be returned if no match was found).  The third message answered a collection of the parenthetical subgroups matched, each showing the day, month and year as extracted from the string.

	B. Global Matching and String Substitutions

	You can perform global searches to repeatedly search a string for non-overlapping occurrences of a pattern by using reMatch:collect:  For example,

		'this is a test' collectRe: '\w+'

can be used to gather a collection of all words in the search string, answering:

		OrderedCollection ('this' 'is' 'a' 'test' )

For slightly more complex collections, you can use #reMatch:andCollect:  Additionally, you can perform global searches with text substitutions using reMatch:sub:  For example,

		'this is a test' reMatch: '\w+' andReplace: [:m | '<', (m match), '>']  

can be used to replace every word in the search string with the word enclosed by matching brackets, answering:

		'<this> <is> <a> <test>'

Further examples and documentation can be found in the references above, and in the comments and definitions set forth in ReMatch, RePattern and String."

]

{ #category : #documentation }
Re >> aGlobalSearchComment [ 

" Global Searching

Introduction

	RePattern provides facilities to support global searching and global searching and replacement of search strings with semantics quite similar to that of Perl 5.004.  Global searching means that the search string is repeatedly searched for matches, beginning at the beginning of the string, and subsequently beginning the next match immediately after the preceding match terminated.  For example, if we wanted to find all words in the subject string, we could execute:

	'this is a test' reMatch: '\w+' collect: [:m | m match]

which returns

	OrderedCollection ('this' 'is' 'a' 'test' ).

The collect: keyword directs PCRE to repeat the search for '\w+', and to return a collection of the result of applying each ReMatch to the block.  (In this case, the block simply returns the string that was matched.)  To do global searching and string substitution, we could execute:

	'this is a test' reMatch: '\w+' sub: [:m | '<', m match, '>']

which return

	 '<this> <is> <a> <test>'

The sub: keyword directs PCRE to repeat the search, and to return the original string, but with each matched substring replaced by the result of applying the block to the corresponding ReMatch object.

Global Matching Functions

RePattern convenience functions provide the following general global functions:

	searchString reMatch: pattern [opt: oStr] collect: aBlock [num: anInteger]
	searchString reMatch: pattern [opt: oStr] sub: aBlock [num: anInteger]

Optionally, you may specify search and compile options with oStr, and you may specify a maximum number of searches performed in the global search with anInteger.  If anInteger is less than 0, then as many searches as can be performed, will be performed.

Special Case of the Empty Match

Finally, the definition given above would infinite loop if the pattern matches an empty string.  For example:

	'abcdef' reMatch: 'x*' sub: [:m| '<', m match, '>'] 

will actually match the empty string just before and after each letter of the string, even though there is no x there.  ('x+' would return nil).  Since the string ends where it begins, at the beginning of the string, repeating the search from that point would simply infinite loop.  Accordingly, RePattern gives the pattern a one-character 'bump' after matching an empty string, at which point the block is applied.  For example, the preceding would answer

	'<>a<>b<>c<>d<>e<>f<>'

In the case of global searching (but not replacement), an empty string will not result in the ReMatch being applied to the block if the empty match immediately follows a match that has already been made.  Accordingly,

	'123' reMatch: '\d*' collect: [:m| m match]  

answers

	OrderedCollection ('123' )

and not 
	
	OrderedCollection ('123' '')

However, this last caveat does not apply to substitutions, so

	'123' reMatch: '\d*' sub: [:m| '<', m match, '>']   

answers

	'<123><>'



"
]

{ #category : #documentation }
Re >> aLicenseComment [ 

"PCRE2 LICENCE
-------------

PCRE2 is a library of functions to support regular expressions whose syntax
and semantics are as close as possible to those of the Perl 5 language.

Releases 10.00 and above of PCRE2 are distributed under the terms of the 'BSD'
licence, as specified below, with one exemption for certain binary
redistributions. The documentation for PCRE2, supplied in the 'doc' directory,
is distributed under the same terms as the software itself. The data in the
testdata directory is not copyrighted and is in the public domain.

The basic library functions are written in C and are freestanding. Also
included in the distribution is a just-in-time compiler that can be used to
optimize pattern matching. This is an optional feature that can be omitted when
the library is built.


THE BASIC LIBRARY FUNCTIONS
---------------------------

Written by:       Philip Hazel
Email local part: ph10
Email domain:     cam.ac.uk

University of Cambridge Computing Service,
Cambridge, England.

Copyright (c) 1997-2018 University of Cambridge
All rights reserved.


PCRE2 JUST-IN-TIME COMPILATION SUPPORT
--------------------------------------

Written by:       Zoltan Herczeg
Email local part: hzmester
Email domain:     freemail.hu

Copyright(c) 2010-2018 Zoltan Herczeg
All rights reserved.


STACK-LESS JUST-IN-TIME COMPILER
--------------------------------

Written by:       Zoltan Herczeg
Email local part: hzmester
Email domain:     freemail.hu

Copyright(c) 2009-2018 Zoltan Herczeg
All rights reserved.


THE BSD LICENCE
-----------------

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notices,
      this list of conditions and the following disclaimer.

    * Redistributions in binary form must reproduce the above copyright
      notices, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.

    * Neither the name of the University of Cambridge nor the names of any
      contributors may be used to endorse or promote products derived from this
      software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS'
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.


EXEMPTION FOR BINARY LIBRARY-LIKE PACKAGES
------------------------------------------

The second condition in the BSD licence (covering binary redistributions) does
not apply all the way down a chain of software. If binary package A includes
PCRE2, it must respect the condition, but if package B is software that
includes package A, the condition is not imposed on package B unless it uses
PCRE2 independently.

End
"
]

{ #category : #'as yet unclassified' }
Re >> aRegexComment [


"Basic MetaCharacters

The regular expressions recognized in this package generally track those of Perl 5.05, and are set forth in greater detail in the PCRE documentation accompanying the package.  A summary follows:

	\	General escape character with several uses
	^	Assert start of subjct (or line, in multiline mode)
		Also used to negate class definitions
	$	Assert end of subject (or line, in multiline mode)
	.	match any character but newline (by default)
	[]	class definitions
	|	start of alternative branch
	()	subpattern
	?	extends the meaning of '('  (see below)
		quantifies previous extension (1 or 0 occurrences) (e.g. a?)
		minimizes previous quantifier (e.g.  a*?)
	*	0 or more quantifier
	+	1 or more quantifier
	{}	Min/Max Quantifier  {3} {3,} {3,5}

Inside Character Classes

	\	general escape character
	^	negates the class, if the first character
	-	indicates character range, if not escaped or the last character
	
Special Escape Sequences

	\a	alarm (hex 7)
	\cx	control-x, where x is any character
	\e	escape (hex 1b)
	\f	formfeed (hex 0c)
	\n	newline
	\r	carriage return
	\t	tab
	\xhh	Character with hexcode hh
	\ddd		Character with octal code ddd, or a backreference

	\d	matches decimal digit
	\D	non-decimal digit
	\s	whitespace
	\S	non-whitespace
	\w	any 'word' character
	\W	any non-word character

	\b	asserts a word boundary
	\B	asserts not a non-word boundary
	\A	asserts start of subject (regardless of mode)
	\Z	asserts end of subject (regardless of mode)

Internal Option Setting

	Letters enclosed within a pattern and appearing between '(?' and ')' can be used to change the imsx options.  For example.
(?im-sx) sets caseless and multiline modes, and unsets dotall and extended modes.  See the PCRE documentation for further details.

Non-Grouping Subpatterns

	Groupings can be enclosed by parentheses without text being captured by following the leading parenthesis with a question mark and colon.  for example: 'abc(?:def)*' repeats the 'def', but does not capture matches in a grouping.

Assertions

	An assertion is a test on characters that does not actually consume any characters.  There are two kinds, those that look ahead of the current position, and those that look behind.  Consider the following example:

	\w+(?=;)

which matches a word followed by a semicolon, but doesn't include the semicolon in the match.  Another example:

	(?<!!foo)bar

finds occurences of bar not preceded by foo.  All lookbehind assertions must be of fixed length, but not all alternatives in such an assertion need be of the same length.

Once-Only Subpatterns

	(?>\d+)bar

Once only subpatterns 'lock up' after finding a match, to prevent backtracking in various cases.  Essentially, a subpattern ofthis type matches the string that an identical standalone pattern would match if anchored at the current point in the subject string first encountering the expression.

Conditional Subpatterns

	(?(condition)yes-pattern)
	(?(condition)yes-pattern|no-pattern) 

These permit one of two subpatterns to be matched, depending upon a preceding condition.  There are two kinds of conditions: (1) a sequence of digits, specifying that a numbered subpattern has been matched; and (2) an assertion, either positive, negative, lookahead or lookbehind.

Comments

	(?# This is a comment)

Also, in extended mode, comments may be inserted between a '#' and a newline."

	^ self
]

{ #category : #'as yet unclassified' }
Re >> aRegexGoryDetailsComment [ 

"
Regular Expression Syntax -- the Gory Details

Introduction

The syntax and semantics of the regular expressions supported by PCRE are described below. Regular expressions are also described in the Perl documentation and in a number of other books, some of which have copious examples. Jeffrey Friedl's 'Mastering Regular Expressions', published by O'Reilly (ISBN 1-56592-257-3), covers them in great detail. The description here is intended as reference documentation. 

Regular Expressions

A regular expression is a pattern that is matched against a subject string from left to right. Most characters stand for themselves in a pattern, and match the corresponding characters in the subject. As a trivial example, the pattern 

	The quick brown fox

matches a portion of a subject string that is identical to itself. The power of regular expressions comes from the ability to include alternatives and repetitions in the pattern. These are encoded in the pattern by the use of meta-characters, which do not stand for themselves but instead are interpreted in some special way. 

There are two different sets of meta-characters: those that are recognized anywhere in the pattern except within square brackets, and those that are recognized in square brackets. Outside square brackets, the meta-characters are as follows: 

  \      general escape character with several uses
  ^      assert start of subject (or line, in multiline mode)
  $      assert end of subject (or line, in multiline mode)
  .      match any character except newline (by default)
  [      start character class definition
  |      start of alternative branch
  (      start subpattern
  )      end subpattern
  ?      extends the meaning of (
         also 0 or 1 quantifier
         also quantifier minimizer
  *      0 or more quantifier
  +      1 or more quantifier
  {      start min/max quantifier

Part of a pattern that is in square brackets is called a 'character class'. In a character class the only meta-characters are: 

  \      general escape character
  ^      negate the class, but only if the first character
  -      indicates character range
  ]      terminates the character class

The following sections describe the use of each of the meta-characters. 


BACKSLASH

The backslash character has several uses. Firstly, if it is followed by a non-alphameric character, it takes away any special meaning that character may have. This use of backslash as an escape character applies both inside and outside character classes. 

For example, if you want to match a '*' character, you write '\*' in the pattern. This applies whether or not the following character would otherwise be interpreted as a meta-character, so it is always safe to precede a non-alphameric with '\' to specify that it stands for itself. In particular, if you want to match a backslash, you write '\\'. 

If a pattern is compiled with the 'x' (beExtended) option, whitespace in the pattern (other than in a character class) and characters between a '#' outside a character class and the next newline character are ignored. An escaping backslash can be used to include a whitespace or '#' character as part of the pattern. 

A second use of backslash provides a way of encoding non-printing characters in patterns in a visible manner. There is no restriction on the appearance of non-printing characters, apart from the binary zero that terminates a pattern, but when a pattern is being prepared by text editing, it is usually easier to use one of the following escape sequences than the binary character it represents: 

  \a     alarm, that is, the BEL character (hex 07)
  \cx    'control-x', where x is any character
  \e     escape (hex 1B)
  \f     formfeed (hex 0C)
  \n     newline (hex 0A)
  \r     carriage return (hex 0D)
  \t     tab (hex 09)
  \xhh   character with hex code hh
  \ddd   character with octal code ddd, or backreference

The precise effect of '\cx' is as follows: if 'x' is a lower case letter, it is converted to upper case. Then bit 6 of the character (hex 40) is inverted. Thus '\cz' becomes hex 1A, but '\c{' becomes hex 3B, while '\c;' becomes hex 7B. 

After '\x', up to two hexadecimal digits are read (letters can be in upper or lower case). 

After '\0' up to two further octal digits are read. In both cases, if there are fewer than two digits, just those that are present are used. Thus the sequence '\0\x\07' specifies two binary zeros followed by a BEL character. Make sure you supply two digits after the initial zero if the character that follows is itself an octal digit. 

The handling of a backslash followed by a digit other than 0 is complicated. Outside a character class, PCRE reads it and any following digits as a decimal number. If the number is less than 10, or if there have been at least that many previous capturing left parentheses in the expression, the entire sequence is taken as a back reference. A description of how this works is given later, following the discussion of parenthesized subpatterns. 

Inside a character class, or if the decimal number is greater than 9 and there have not been that many capturing subpatterns, PCRE re-reads up to three octal digits following the backslash, and generates a single byte from the least significant 8 bits of the value. Any subsequent digits stand for themselves. For example: 

  \040   is another way of writing a space
  \40    is the same, provided there are fewer than 40
            previous capturing subpatterns
  \7     is always a back reference
  \11    might be a back reference, or another way of
            writing a tab
  \011   is always a tab
  \0113  is a tab followed by the character '3'
  \113   is the character with octal code 113 (since there
            can be no more than 99 back references)
  \377   is a byte consisting entirely of 1 bits
  \81    is either a back reference, or a binary zero
            followed by the two characters '8' and '1'

Note that octal values of 100 or greater must not be introduced by a leading zero, because no more than three octal digits are ever read. 

All the sequences that define a single byte value can be used both inside and outside character classes. In addition, inside a character class, the sequence '\b' is interpreted as the backspace character (hex 08). Outside a character class it has a different meaning (see below). 

The third use of backslash is for specifying generic character types: 

  \d     any decimal digit
  \D     any character that is not a decimal digit
  \s     any whitespace character
  \S     any character that is not a whitespace character
  \w     any 'word' character
  \W     any 'non-word' character

Each pair of escape sequences partitions the complete set of characters into two disjoint sets. Any given character matches one, and only one, of each pair. 

A 'word' character is any letter or digit or the underscore character, that is, any character which can be part of a Perl 'word'. The definition of letters and digits is controlled by PCRE's character tables, and may vary if locale- specific matching is taking place (see 'Locale support' above). For example, in the 'fr' (French) locale, some character codes greater than 128 are used for accented letters, and these are matched by \w. 

These character type sequences can appear both inside and outside character classes. They each match one character of the appropriate type. If the current matching point is at the end of the subject string, all of them fail, since there is no character to match. 

The fourth use of backslash is for certain simple assertions. An assertion specifies a condition that has to be met at a particular point in a match, without consuming any characters from the subject string. The use of subpatterns for more complicated assertions is described below. The backslashed assertions are 

  \b     word boundary
  \B     not a word boundary
  \A     start of subject (independent of multiline mode)
  \Z     end of subject or newline at end (independent of multiline mode)
  \z     end of subject (independent of multiline mode)

These assertions may not appear in character classes (but note that '\b' has a different meaning, namely the backspace character, inside a character class). 

A word boundary is a position in the subject string where the current character and the previous character do not both match \w or \W (i.e. one matches \w and the other matches \W), or the start or end of the string if the first or last character matches \w, respectively. 

The \A, \Z, and \z assertions differ from the traditional circumflex and dollar (described below) in that they only ever match at the very start and end of the subject string, whatever options are set. They are not affected by the 'B' (beNotBeginningOfLine) or 'Z' (beNotEndOfLine) options. The difference between \Z and \z is that \Z matches before a newline that is the last character of the string as well as at the end of the string, whereas \z matches only at the end. 


CIRCUMFLEX AND DOLLAR

Outside a character class, in the default matching mode, the circumflex character is an assertion which is true only if the current matching point is at the start of the subject string. Inside a character class, circumflex has an entirely different meaning (see below). 

Circumflex need not be the first character of the pattern if a number of alternatives are involved, but it should be the first thing in each alternative in which it appears if the pattern is ever to match that branch. If all possible alternatives start with a circumflex, that is, if the pattern is constrained to match only at the start of the subject, it is said to be an 'anchored' pattern. (There are also other constructs that can cause a pattern to be anchored.) 

A dollar character is an assertion which is true only if the current matching point is at the end of the subject string, or immediately before a newline character that is the last character in the string (by default). Dollar need not be the last character of the pattern if a number of alternatives are involved, but it should be the last item in any branch in which it appears. Dollar has no special meaning in a character class. 

The meaning of dollar can be changed so that it matches only at the very end of the string, by setting the 'E' ('beDollarEndOnly') option at compile or matching time. This does not affect the \Z assertion. 

The meanings of the circumflex and dollar characters are changed if the 'm' (beMultiline) option is set. When this is the case, they match immediately after and immediately before an internal '\n' character, respectively, in addition to matching at the start and end of the subject string. For example, the pattern /^abc$/ matches the subject string 'def\nabc' in multiline mode, but not otherwise. Consequently, patterns that are anchored in single line mode because all branches start with '^' are not anchored in multiline mode. The 'E' (beExtended) option is ignored if 's' is set. 

Note that the sequences \A, \Z, and \z can be used to match the start and end of the subject in both modes, and if all branches of a pattern start with \A is it always anchored, whether 's' (beDotIncludesNewline) is set or not. 


PERIOD, DOT

Outside a character class, a dot in the pattern matches any one character in the subject, including a non-printing character, but not (by default) newline. If the 's' (beDotIncludesNewline) option is set, then dots match newlines as well. The handling of dot is entirely independent of the handling of circumflex and dollar, the only relationship being that they both involve newline characters. Dot has no special meaning in a character class. 


SQUARE BRACKETS

An opening square bracket introduces a character class, terminated by a closing square bracket. A closing square bracket on its own is not special. If a closing square bracket is required as a member of the class, it should be the first data character in the class (after an initial circumflex, if present) or escaped with a backslash. 

A character class matches a single character in the subject; the character must be in the set of characters defined by the class, unless the first character in the class is a circumflex, in which case the subject character must not be in the set defined by the class. If a circumflex is actually required as a member of the class, ensure it is not the first character, or escape it with a backslash. 

For example, the character class [aeiou] matches any lower case vowel, while [^aeiou] matches any character that is not a lower case vowel. Note that a circumflex is just a convenient notation for specifying the characters which are in the class by enumerating those that are not. It is not an assertion: it still consumes a character from the subject string, and fails if the current pointer is at the end of the string. 

When caseless matching is set, any letters in a class represent both their upper case and lower case versions, so for example, a caseless [aeiou] matches 'A' as well as 'a', and a caseless [^aeiou] does not match 'A', whereas a caseful version would. 

The newline character is never treated in any special way in character classes, whatever the setting of the 's' (beDotIncludesNewline) or 'm' (beMultiline) options is. A class such as [^a] will always match a newline. 

The minus (hyphen) character can be used to specify a range of characters in a character class. For example, [d-m] matches any letter between d and m, inclusive. If a minus character is required in a class, it must be escaped with a backslash or appear in a position where it cannot be interpreted as indicating a range, typically as the first or last character in the class. 

It is not possible to have the literal character ']' as the end character of a range. A pattern such as [W-]46] is interpreted as a class of two characters ('W' and '-') followed by a literal string '46]', so it would match 'W46]' or '-46]'. However, if the ']' is escaped with a backslash it is interpreted as the end of range, so [W-\]46] is interpreted as a single class containing a range followed by two separate characters. The octal or hexadecimal representation of ']' can also be used to end a range. 

Ranges operate in ASCII collating sequence. They can also be used for characters specified numerically, for example [\000-\037]. If a range that includes letters is used when caseless matching is set, it matches the letters in either case. For example, [W-c] is equivalent to [][\^_`wxyzabc], matched caselessly, and if character tables for the 'fr' locale are in use, [\xc8-\xcb] matches accented E characters in both cases. 

The character types \d, \D, \s, \S, \w, and \W may also appear in a character class, and add the characters that they match to the class. For example, [\dABCDEF] matches any hexadecimal digit. A circumflex can conveniently be used with the upper case character types to specify a more restricted set of characters than the matching lower case type. For example, the class [^\W_] matches any letter or digit, but not underscore. 

All non-alphameric characters other than \, -, ^ (at the start) and the terminating ] are non-special in character classes, but it does no harm if they are escaped. 


VERTICAL BAR

Vertical bar characters are used to separate alternative patterns. For example, the pattern 

  gilbert|sullivan

matches either 'gilbert' or 'sullivan'. Any number of alternatives may appear, and an empty alternative is permitted (matching the empty string). The matching process tries each alternative in turn, from left to right, and the first one that succeeds is used. If the alternatives are within a subpattern (defined below), 'succeeds' means matching the rest of the main pattern as well as the alternative in the subpattern. 


INTERNAL OPTION SETTING

The settings of caseless, multiline, dotall and extended options can be changed from within the pattern by a sequence of Perl option letters enclosed between '(?' and ')'. The option letters are 

  i  for Caseless Matching Mode
  m  for Multiline Mode
  s  for Dotall Mode (Dot matches newlines)
  x  for Extended Mode (whitespace not meaningful, comments permitted)

For example, (?im) sets caseless, multiline matching. It is also possible to unset these options by preceding the letter with a hyphen, and a combined setting and unsetting such as (?im-sx), which sets caseless and multiline while unsetting dotall and extended, is also permitted. If a letter appears both before and after the hyphen, the option is unset. 

The scope of these option changes depends on where in the pattern the setting occurs. For settings that are outside any subpattern (defined below), the effect is the same as if the options were set or unset at the start of matching. The following patterns all behave in exactly the same way: 

  (?i)abc
  a(?i)bc
  ab(?i)c
  abc(?i)

which in turn is the same as compiling the pattern abc with 'i' set. In other words, such 'top level' settings apply to the whole pattern (unless there are other changes inside subpatterns). If there is more than one setting of the same option at top level, the rightmost setting is used. 

If an option change occurs inside a subpattern, the effect is different. This is a change of behaviour in Perl 5.005. An option change inside a subpattern affects only that part of the subpattern that follows it, so 

  (a(?i)b)c

matches abc and aBc and no other strings (assuming 'i' is not used). By this means, options can be made to have different settings in different parts of the pattern. Any changes made in one alternative do carry on into subsequent branches within the same subpattern. For example, 

  (a(?i)b|c)

matches 'ab', 'aB', 'c', and 'C', even though when matching 'C' the first branch is abandoned before the option setting. This is because the effects of option settings happen at compile time. There would be some very weird behaviour otherwise. 

The PCRE-specific options 'U' and 'X' can be changed in the same way as the Perl-compatible options. The (?X) flag setting is special in that it must always occur earlier in the pattern than any of the additional features it turns on, even when it is at top level. It is best put at the start. 


SUBPATTERNS

Subpatterns are delimited by parentheses (round brackets), which can be nested. Marking part of a pattern as a subpattern does two things: 

1. It localizes a set of alternatives. For example, the pattern 

  cat(aract|erpillar|)

matches one of the words 'cat', 'cataract', or 'caterpillar'. Without the parentheses, it would match 'cataract', 'erpillar' or the empty string. 

2. It sets up the subpattern as a capturing subpattern (as defined above). When the whole pattern matches, that portion of the subject string that matchedOpening parentheses are counted from left to right (starting from 1) to obtain the numbers of the capturing subpatterns. 

For example, if the string 'the red king' is matched against the pattern 

  the ((red|white) (king|queen))

the captured substrings are 'red king', 'red', and 'king', and are numbered 1, 2, and 3. 

The fact that plain parentheses fulfil two functions is not always helpful. There are often times when a grouping subpattern is required without a capturing requirement. If an opening parenthesis is followed by '?:', the subpattern does not do any capturing, and is not counted when computing the number of any subsequent capturing subpatterns. For example, if the string 'the white queen' is matched against the pattern 

  the ((?:red|white) (king|queen))

the captured substrings are 'white queen' and 'queen', and are numbered 1 and 2. The maximum number of captured substrings is 99, and the maximum number of all subpatterns, both capturing and non-capturing, is 200. 

As a convenient shorthand, if any option settings are required at the start of a non-capturing subpattern, the option letters may appear between the '?' and the ':'. Thus the two patterns 

  (?i:saturday|sunday)
  (?:(?i)saturday|sunday)
match exactly the same set of strings. Because alternative branches are tried from left to right, and options are not reset until the end of the subpattern is reached, an option setting in one branch does affect subsequent branches, so the above patterns match 'SUNDAY' as well as 'Saturday'. 


REPETITION

Repetition is specified by quantifiers, which can follow any of the following items: 

  a single character, possibly escaped
  the . metacharacter
  a character class
  a back reference (see next section)
  a parenthesized subpattern (unless it is an assertion - see below)

The general repetition quantifier specifies a minimum and maximum number of permitted matches, by giving the two numbers in curly brackets (braces), separated by a comma. The numbers must be less than 65536, and the first must be less than or equal to the second. For example: 

  z{2,4}

matches 'zz', 'zzz', or 'zzzz'. A closing brace on its own is not a special character. If the second number is omitted, but the comma is present, there is no upper limit; if the second number and the comma are both omitted, the quantifier specifies an exact number of required matches. Thus 

  [aeiou]{3,}

matches at least 3 successive vowels, but may match many more, while 

  \d{8}

matches exactly 8 digits. An opening curly bracket that appears in a position where a quantifier is not allowed, or one that does not match the syntax of a quantifier, is taken as a literal character. For example, {,6} is not a quantifier, but a literal string of four characters. 

The quantifier {0} is permitted, causing the expression to behave as if the previous item and the quantifier were not present. 

For convenience (and historical compatibility) the three most common quantifiers have single-character abbreviations: 

  *    is equivalent to {0,}
  +    is equivalent to {1,}
  ?    is equivalent to {0,1}

It is possible to construct infinite loops by following a subpattern that can match no characters with a quantifier that has no upper limit, for example: 

  (a?)*

Earlier versions of Perl and PCRE used to give an error at compile time for such patterns. However, because there are cases where this can be useful, such patterns are now accepted, but if any repetition of the subpattern does in fact match no characters, the loop is forcibly broken. 

By default, the quantifiers are 'greedy', that is, they match as much as possible (up to the maximum number of permitted times), without causing the rest of the pattern to fail. The classic example of where this gives problems is in trying to match comments in C programs. These appear between the sequences /* and */ and within the sequence, individual * and / characters may appear. An attempt to match C comments by applying the pattern 

  /\*.*\*/
to the string 

  /* first command */  not comment  /* second comment */

fails, because it matches the entire string due to the greediness of the .* item. 

However, if a quantifier is followed by a question mark, then it ceases to be greedy, and instead matches the minimum number of times possible, so the pattern 

  /\*.*?\*/

does the right thing with the C comments. The meaning of the various quantifiers is not otherwise changed, just the preferred number of matches. Do not confuse this use of question mark with its use as a quantifier in its own right. Because it has two uses, it can sometimes appear doubled, as in 

  \d??\d

which matches one digit by preference, but can match two if that is the only way the rest of the pattern matches. 

If the 'U' option is set (an option which is not available in Perl) then the quantifiers are not greedy by default, but individual ones can be made greedy by following them with a question mark. In other words, it inverts the default behaviour. 

When a parenthesized subpattern is quantified with a minimum repeat count that is greater than 1 or with a limited maximum, more store is required for the compiled pattern, in proportion to the size of the minimum or maximum. 

If a pattern starts with .* then it is implicitly anchored, since whatever follows will be tried against every character position in the subject string. PCRE treats this as though it were preceded by \A. 

When a capturing subpattern is repeated, the value captured is the substring that matched the final iteration. For example, after 

  (tweedle[dume]{3}\s*)+

has matched 'tweedledum tweedledee' the value of the captured substring is 'tweedledee'. However, if there are nested capturing subpatterns, the corresponding captured values may have been set in previous iterations. For example, after 

  /(a|(b))+/

matches 'aba' the value of the second captured substring is 'b'. 

BACK REFERENCES

Outside a character class, a backslash followed by a digit greater than 0 (and possibly further digits) is a back reference to a capturing subpattern earlier (i.e. to its left) in the pattern, provided there have been that many previous capturing left parentheses. 

However, if the decimal number following the backslash is less than 10, it is always taken as a back reference, and causes an error only if there are not that many capturing left parentheses in the entire pattern. In other words, the parentheses that are referenced need not be to the left of the reference for numbers less than 10. See the section entitled 'Backslash' above for further details of the handling of digits following a backslash. 

A back reference matches whatever actually matched the capturing subpattern in the current subject string, rather than anything matching the subpattern itself. So the pattern 

  (sens|respons)e and \1ibility

matches 'sense and sensibility' and 'response and responsibility', but not 'sense and responsibility'. If caseful matching is in force at the time of the back reference, then the case of letters is relevant. For example, 

  ((?i)rah)\s+\1

matches 'rah rah' and 'RAH RAH', but not 'RAH rah', even though the original capturing subpattern is matched caselessly. 

There may be more than one back reference to the same subpattern. If a subpattern has not actually been used in a particular match, then any back references to it always fail. For example, the pattern 

  (a|(bc))\2

always fails if it starts to match 'a' rather than 'bc'. Because there may be up to 99 back references, all digits following the backslash are taken as part of a potential back reference number. If the pattern continues with a digit character, then some delimiter must be used to terminate the back reference. If the 'x' (beExteded) option is set, this can be whitespace. Otherwise an empty comment can be used. 

A back reference that occurs inside the parentheses to which it refers fails when the subpattern is first used, so, for example, (a\1) never matches. However, such references can be useful inside repeated subpatterns. For example, the pattern 

  (a|b\1)+

matches any number of 'a's and also 'aba', 'ababaa' etc. At each iteration of the subpattern, the back reference matches the character string corresponding to the previous iteration. In order for this to work, the pattern must be such that the first iteration does not need to match the back reference. This can be done using alternation, as in the example above, or by a quantifier with a minimum of zero. 


ASSERTIONS

An assertion is a test on the characters following or preceding the current matching point that does not actually consume any characters. The simple assertions coded as \b, \B, \A, \Z, \z, ^ and $ are described above. More complicated assertions are coded as subpatterns. There are two kinds: those that look ahead of the current position in the subject string, and those that look behind it. 

An assertion subpattern is matched in the normal way, except that it does not cause the current matching position to be changed. Lookahead assertions start with (?= for positive assertions and (?!! for negative assertions. For example, 

  \w+(?=;)

matches a word followed by a semicolon, but does not include the semicolon in the match, and 

  foo(?!!bar)

matches any occurrence of 'foo' that is not followed by 'bar'. Note that the apparently similar pattern 

  (?!!foo)bar

does not find an occurrence of 'bar' that is preceded by something other than 'foo'; it finds any occurrence of 'bar' whatsoever, because the assertion (?!!foo) is always true when the next three characters are 'bar'. A lookbehind assertion is needed to achieve this effect. 

Lookbehind assertions start with (?<= for positive assertions and (?&lt!! for negative assertions. For example, 

  (?<!!foo)bar

does find an occurrence of 'bar' that is not preceded by 'foo'. The contents of a lookbehind assertion are restricted such that all the strings it matches must have a fixed length. However, if there are several alternatives, they do not all have to have the same fixed length. Thus 

  (?<=bullock|donkey)
is permitted, but 

  (?<!!dogs?|cats?)

causes an error at compile time. Branches that match different length strings are permitted only at the top level of a lookbehind assertion. This is an extension compared with Perl 5.005, which requires all branches to match the same length of string. An assertion such as 

  (?=ab(c|de))

is not permitted, because its single top-level branch can match two different lengths, but it is acceptable if rewritten to use two top-level branches: 

  (?=abc|abde)

The implementation of lookbehind assertions is, for each alternative, to temporarily move the current position back by the fixed width and then try to match. If there are insufficient characters before the current position, the match is deemed to fail. Lookbehinds in conjunction with once-only subpatterns can be particularly useful for matching at the ends of strings; an example is given at the end of the section on once-only subpatterns. Several assertions (of any sort) may occur in succession. For example, 

  (?=\d{3})(?<!!999)foo

matches 'foo' preceded by three digits that are not '999'. Furthermore, assertions can be nested in any combination. For example, 

  (?=(?<!!foo)bar)baz

matches an occurrence of 'baz' that is preceded by 'bar' which in turn is not preceded by 'foo'. 

Assertion subpatterns are not capturing subpatterns, and may not be repeated, because it makes no sense to assert the same thing several times. If an assertion contains capturing subpatterns within it, these are always counted for the purposes of numbering the capturing subpatterns in the whole pattern. Substring capturing is carried out for positive assertions, but it does not make sense for negative assertions. 

Assertions count towards the maximum of 200 parenthesized subpatterns. 


ONCE-ONLY SUBPATTERNS

With both maximizing and minimizing repetition, failure of what follows normally causes the repeated item to be re-evaluated to see if a different number of repeats allows the rest of the pattern to match. Sometimes it is useful to prevent this, either to change the nature of the match, or to cause it fail earlier than it otherwise might, when the author of the pattern knows there is no point in carrying on. 

Consider, for example, the pattern \d+foo when applied to the subject line 

  123456bar

After matching all 6 digits and then failing to match 'foo', the normal action of the matcher is to try again with only 5 digits matching the \d+ item, and then with 4, and so on, before ultimately failing. Once-only subpatterns provide the means for specifying that once a portion of the pattern has matched, it is not to be re-evaluated in this way, so the matcher would give up immediately on failing to match 'foo' the first time. The notation is another kind of special parenthesis, starting with (?> as in this example: 

  (?>\d+)bar

This kind of parenthesis 'locks up' the part of the pattern it contains once it has matched, and a failure further into the pattern is prevented from backtracking into it. Backtracking past it to previous items, however, works as normal. 

An alternative description is that a subpattern of this type matches the string of characters that an identical standalone pattern would match, if anchored at the current point in the subject string. 

Once-only subpatterns are not capturing subpatterns. Simple cases such as the above example can be thought of as a maximizing repeat that must swallow everything it can. So, while both \d+ and \d+? are prepared to adjust the number of digits they match in order to make the rest of the pattern match, (?>\d+) can only match an entire sequence of digits. 

This construction can of course contain arbitrarily complicated subpatterns, and it can be nested. 

Once-only subpatterns can be used in conjunction with lookbehind assertions to specify efficient matching at the end of the subject string. Consider a simple pattern such as 

  abcd$

when applied to a long string which does not match it. Because matching proceeds from left to right, PCRE will look for each 'a' in the subject and then see if what follows matches the rest of the pattern. If the pattern is specified as 

  .*abcd$

then the initial .* matches the entire string at first, but when this fails, it backtracks to match all but the last character, then all but the last two characters, and so on. Once again the search for 'a' covers the entire string, from right to left, so we are no better off. However, if the pattern is written as 

  (?>.*)(?=abcd)

then there can be no backtracking for the .* item; it can match only the entire string. The subsequent lookbehind assertion does a single test on the last four characters. If it fails, the match fails immediately. For long strings, this approach makes a significant difference to the processing time. 


CONDITIONAL SUBPATTERNS

It is possible to cause the matching process to obey a subpattern conditionally or to choose between two alternative subpatterns, depending on the result of an assertion, or whether a previous capturing subpattern matched or not. The two possible forms of conditional subpattern are 

  (?(condition)yes-pattern)
  (?(condition)yes-pattern|no-pattern)

If the condition is satisfied, the yes-pattern is used; otherwise the no-pattern (if present) is used. If there are more than two alternatives in the subpattern, a compile-time error occurs. 

There are two kinds of condition. If the text between the parentheses consists of a sequence of digits, then the condition is satisfied if the capturing subpattern of that number has previously matched. Consider the following pattern, which contains non-significant white space to make it more readable (assume the 'x' (beExtended) option) and to divide it into three parts for ease of discussion: 

  ( \( )?    [^()]+    (?(1) \) )

The first part matches an optional opening parenthesis, and if that character is present, sets it as the first captured substring. The second part matches one or more characters that are not parentheses. The third part is a conditional subpattern that tests whether the first set of parentheses matched or not. If they did, that is, if subject started with an opening parenthesis, the condition is true, and so the yes-pattern is executed and a closing parenthesis is required. Otherwise, since no-pattern is not present, the subpattern matches nothing. In other words, this pattern matches a sequence of non-parentheses, optionally enclosed in parentheses. 

If the condition is not a sequence of digits, it must be an assertion. This may be a positive or negative lookahead or lookbehind assertion. Consider this pattern, again containing non-significant white space, and with the two alternatives on the second line: 

  (?(?=[^a-z]*[a-z])
  \d{2}[a-z]{3}-\d{2}  |  \d{2}-\d{2}-\d{2} )

The condition is a positive lookahead assertion that matches an optional sequence of non-letters followed by a letter. In other words, it tests for the presence of at least one letter in the subject. If a letter is found, the subject is matched against the first alternative; otherwise it is matched against the second. This pattern matches strings in one of the two forms dd-aaa-dd or dd-dd-dd, where aaa are letters and dd are digits. 


COMMENTS

The sequence (?# marks the start of a comment which continues up to the next closing parenthesis. Nested parentheses are not permitted. The characters that make up a comment play no part in the pattern matching at all. 

If the 'x' (beExtended) option is set, an unescaped # character outside a character class introduces a comment that continues up to the next newline character in the pattern."
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

{ #category : #'as yet unclassified' }
Re >> anReComment [ "

Re -- The RePlugin Pattern Matching Engine

I.	Introduction

RePlugin is a Plugin providing modern regular expression matching operations similar to those found in Perl. It was written by Andrew C. Greenberg (werdna@gate.net), with contributions by Markus Kohler, Stephen Pair and others. RePlugin 3.2 (and 'the Gory Details' portion of this document) is directly taken from Version 2.04 of the excellent PCRE library by Philip Hazel with only minor modifications.  A table of Re public methods and String convenience methods is available in Re anReMethodsComment.

II.	Creating a Pattern Matching Engine Object

A pattern matcher for a pattern string may be created as follows:

	Re on: '\w+'

or by using the convenient String conversion method:

	'\w+' asRe

III.	Using the Pattern Matching Engine Object

	A.	Simple Searching.  A number of methods are provided for evaluating a target string with an engine.  To search a string:

	'\w+' asRe search: 'this will select the first word from me'.

which will return nil if not matched, or a ReMatch object corresponding to the match result information.  A substring can be searched with the following message:

	'\w+' asRe 
		search: 'this will select the second word' 
		from: 5 
		to: 10

	B.	Global Searching.  Methods are provided for collecting non-overlapping matches in a string.

	'\w+' asRe searchAndCollect: 'this will give a collection of my words'

or for doing a global search with more complex matching

	'\w+' asRe 
		search: 'makes a list of words in brackets' 
		andCollect: [:m | '<', m match, '>']

	C.	Global Replacement.  Methods are provided to globally search and substitute into a string.

	'\w+' asRe 
		search: 'makes a string with words in brackets' 
		andReplace: [:m | '<', m match, '>']

There is a special case in the instance where the empty string is matched, because the 'next' match would begin in the same place, thereby creating an infinite loop. This case is handled as in Perl 5.004, where an empty string is replaced with the result of calling the block, and the next search begins after 'bumping' the string to the next character. Accordingly, 

	'Thanks Markus and Steve for all your help' reMatch: 'x*' andReplace: [:m | '!!' ].

will answer: 

	'!!T!!h!!a!!n!!k!!s!! !!M!!a!!r!!k!!u!!s!! !!a!!n!!d!! !!S!!t!!e!!v!!e!! !!f!!o!!r!! !!a!!l!!l!! !!y!!o!!u!!r!! !!h!!e!!l!!p!!'

IV.	Search Engine Options

The pattern matching engine can be modified to match in a variety of different ways.  Re anOptionsComment describes those options in greater detail. Options may be set or reset using #be... and #beNot... messages.

	'a.*y' asRe
		beNotCaseSensitive;
		beDotIncludesNewline;
		search: 'CANDY IS ', Character cr asString, 
			'DANDY, BUT LIQUOR IS QUICKER'

or by using Perl-style option characters

	'a.*y' asRe
		opt: 'is';
		search: 'CANDY IS ', Character cr asString, 
			'DANDY, BUT LIQUOR IS QUICKER'

"
]

{ #category : #documentation }
Re >> anReOverviewComment [ "

RePlugin -- A Regular Expressions Plugin

Introduction

RePlugin is a plugin providing modern regular expression matching operations similar to those found in Perl. It was written by Andrew C. Greenberg (werdna@gate.net), with contributions by Markus Kohler, Stephen Pair and others. RePlugin 3.2 (and 'the Gory Details' portion of this document) is directly taken from Version 2.04 of the excellent PCRE library by Philip Hazel with only minor modifications.

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

	an Re('\w+')

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
Matches if ... matches next, but doesn't consume any of the string. This is called a lookahead assertion. For example, Isaac (?=Asimov) will match 'Isaac' only if it's followed by 'Asimov'. 

(?!...) 
Matches if ... doesn't match next. This is a negative lookahead assertion. For example, Isaac (?!Asimov) will match 'Isaac' only if it's not followed by 'Asimov'. 

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
