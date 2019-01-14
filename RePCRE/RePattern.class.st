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
