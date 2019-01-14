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
