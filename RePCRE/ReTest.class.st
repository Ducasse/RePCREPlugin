Class {
	#name : #ReTest,
	#superclass : #TestCase,
	#category : #RePCRE
}

{ #category : #newTestSuite4 }
ReTest >> testNewSuit4test1 [
	| re re2 |
	re := Re on: '^[\w]+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'École') isNil.

]

{ #category : #newTestSuite4 }
ReTest >> testNewSuit4test10 [
	| re re2 |
	re := Re on: '(.+)\b(.+)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'École') isNil not.

]

{ #category : #newTestSuite4 }
ReTest >> testNewSuit4test12 [
	| re re2 |
	re := Re on: 'École'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'École') isNil not.
	self assert: (re search: 'école') isNil.

]

{ #category : #newTestSuite4 }
ReTest >> testNewSuit4test18 [
	| re re2 |
	re := Re on: ' End of testinput4 '.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite4 }
ReTest >> testNewSuit4test3 [
	| re re2 |
	re := Re on: '^[\w]+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'École') isNil.

]

{ #category : #newTestSuite4 }
ReTest >> testNewSuit4test4 [
	| re re2 |
	re := Re on: '^[\W]+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'École') isNil not.

]

{ #category : #newTestSuite4 }
ReTest >> testNewSuit4test6 [
	| re |
	re := Re on: '[\b]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (16r08 asCharacter asString) isNil not.
	self assert: (re search: 'a') isNil.

]

{ #category : #newTestSuite4 }
ReTest >> testNewSuit4test8 [
	| re re2 |
	re := Re on: '^\w+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'École') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test1 [
	| re |
	re := Re on: 'the quick brown fox'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'the quick brown fox') isNil not.
	self assert: (re search: 'The quick brown FOX') isNil.
	self assert: (re search: 'What do you know about the quick brown fox?') isNil not.
	self assert: (re search: 'What do you know about THE QUICK BROWN FOX?') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test10 [
	| re re2 |
	re := Re on: '^(ba|b*){1,2}?bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'babc') isNil not.
	self assert: (re search: 'bbabc') isNil not.
	self assert: (re search: 'bababc') isNil not.
	self assert: (re search: 'bababbc') isNil.
	self assert: (re search: 'babababc') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test100 [
	| re re2 |
	re := Re on: '[az-]+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'za-') isNil not.
	self assert: (re search: 'b') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test101 [
	| re re2 |
	re := Re on: '[a\-z]+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a-z') isNil not.
	self assert: (re search: 'b') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test102 [
	| re re2 |
	re := Re on: '[a-z]+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcdxyz') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test103 [
	| re re2 |
	re := Re on: '[\d-]+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '12-34') isNil not.
	self assert: (re search: 'aaa') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test104 [
	| re re2 |
	re := Re on: '[\d-z]+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '12-34z') isNil not.
	self assert: (re search: 'aaa') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test105 [
	| re |
	re := Re on: '\x5c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '\') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test106 [
	| re re2 |
	re := Re on: '\x20Z'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'the Zoo') isNil not.
	self assert: (re search: 'Zulu') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test107 [
	| re re2 |
	re := Re on: '(abc)\1'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcabc') isNil not.
	self assert: (re search: 'ABCabc') isNil not.
	self assert: (re search: 'abcABC') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test108 [
	| re re2 |
	re := Re on: 'ab{3cd'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab{3cd') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test109 [
	| re re2 |
	re := Re on: 'ab{3,cd'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab{3,cd') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test11 [
	| re re2 |
	re := Re on: '^\ca\cA\c[\c{\c:'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPut: 16r01 asCharacter;
		nextPut: 16r01 asCharacter;
		nextPut: Character escape;
		nextPutAll: ';z'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test110 [
	| re re2 |
	re := Re on: 'ab{3,4a}cd'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab{3,4a}cd') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test111 [
	| re re2 |
	re := Re on: '{4,5a}bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '{4,5a}bc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test112 [
	| re re2 |
	re := Re on: '^a.b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character linefeed;
		nextPutAll: 'b'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b'])) isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test113 [
	| re re2 |
	re := Re on: 'abc$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'def'])) isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test114 [
	| re re2 |
	re := Re on: '(abc)\123'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 16r53 asCharacter])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test115 [
	| re re2 |
	re := Re on: '(abc)\223'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 16r93 asCharacter])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test116 [
	| re re2 |
	re := Re on: '(abc)\323'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 16rD3 asCharacter])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test117 [
	| re re2 |
	re := Re on: '(abc)\500'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 16r40 asCharacter])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 8r100 asCharacter])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test118 [
	| re re2 |
	re := Re on: '(abc)\5000'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 16r40 asCharacter;
		nextPutAll: '0'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 16r40 asCharacter;
		nextPut: 16r30 asCharacter])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 8r100 asCharacter;
		nextPutAll: '0'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 8r100 asCharacter;
		nextPut: 16r30 asCharacter])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 8r100 asCharacter;
		nextPut: 8r060 asCharacter])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 8r100 asCharacter;
		nextPut: 8r60 asCharacter])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test119 [
	| re re2 |
	re := Re on: 'abc\81'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 8r0 asCharacter;
		nextPutAll: '81'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 8r0 asCharacter;
		nextPut: 16r38 asCharacter;
		nextPut: 16r31 asCharacter])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test12 [
	| re re2 |
	re := Re on: '^[ab\]cde]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'athing') isNil not.
	self assert: (re search: 'bthing') isNil not.
	self assert: (re search: ']thing') isNil not.
	self assert: (re search: 'cthing') isNil not.
	self assert: (re search: 'dthing') isNil not.
	self assert: (re search: 'ething') isNil not.
	self assert: (re search: 'fthing') isNil.
	self assert: (re search: '[thing') isNil.
	self assert: (re search: '\\thing') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test120 [
	| re re2 |
	re := Re on: 'abc\91'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 8r0 asCharacter;
		nextPutAll: '91'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 8r0 asCharacter;
		nextPut: 16r39 asCharacter;
		nextPut: 16r31 asCharacter])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test121 [
	| re re2 |
	re := Re on: '(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)(k)(l)\12\123'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcdefghijkllS') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test122 [
	| re re2 |
	re := Re on: '(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)(k)\12\123'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcdefghijk';
		nextPut: 8r12 asCharacter;
		nextPutAll: 'S'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test123 [
	| re re2 |
	re := Re on: 'ab\gdef'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abgdef') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test124 [
	| re re2 |
	re := Re on: 'a{0}bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test125 [
	| re re2 |
	re := Re on: '(a|(bc)){0,0}?xyz'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'xyz') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test126 [
	| re re2 |
	re := Re on: 'abc[\10]de'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 8r010 asCharacter;
		nextPutAll: 'de'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test127 [
	| re re2 |
	re := Re on: 'abc[\1]de'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 8r1 asCharacter;
		nextPutAll: 'de'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test128 [
	| re re2 |
	re := Re on: '(abc)[\1]de'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 8r1 asCharacter;
		nextPutAll: 'de'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test129 [
	| re re2 |
	re := Re on: 'a.b(?s)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test13 [
	| re re2 |
	re := Re on: '^[]cde]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: ']thing') isNil not.
	self assert: (re search: 'cthing') isNil not.
	self assert: (re search: 'dthing') isNil not.
	self assert: (re search: 'ething') isNil not.
	self assert: (re search: 'athing') isNil.
	self assert: (re search: 'fthing') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test130 [
	| re re2 |
	re := Re on: '^([^a])([^\b])([^c]*)([^d]{3,4})'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'baNOTccccd') isNil not.
	self assert: (re search: 'baNOTcccd') isNil not.
	self assert: (re search: 'baNOTccd') isNil not.
	self assert: (re search: 'bacccd') isNil not.
	self assert: (re search: 'anything') isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'b';
		nextPut: Character backspace;
		nextPutAll: 'c'])) isNil.
	self assert: (re search: 'baccd') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test131 [
	| re re2 |
	re := Re on: '[^a]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Abc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test132 [
	| re re2 |
	re := Re on: '[^a]'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Abc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test133 [
	| re re2 |
	re := Re on: '[^a]+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AAAaAbc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test134 [
	| re re2 |
	re := Re on: '[^a]+'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AAAaAbc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test135 [
	| re re2 |
	re := Re on: '[^a]+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'bbb';
		nextPut: Character cr;
		nextPutAll: 'ccc'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test136 [
	| re re2 |
	re := Re on: '[^k]$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'abk') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test137 [
	| re re2 |
	re := Re on: '[^k]{2,3}$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'kbc') isNil not.
	self assert: (re search: 'kabc') isNil not.
	self assert: (re search: 'abk') isNil.
	self assert: (re search: 'akb') isNil.
	self assert: (re search: 'akk') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test138 [
	| re |
	re := Re on: '^\d{8,}\@.+[^k]$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: '12345678@a.b.c.d'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: '123456789@x.y.z'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: '12345678@x.y.uk'])) isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: '1234567@a.b.c.d'])) isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test139 [
	| re re2 |
	re := Re on: '(a)\1{8,}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaaaaaaaa') isNil not.
	self assert: (re search: 'aaaaaaaaaa') isNil not.
	self assert: (re search: 'aaaaaaa') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test14 [
	| re re2 |
	re := Re on: '^[^ab\]cde]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'fthing') isNil not.
	self assert: (re search: '[thing') isNil not.
	self assert: (re search: '\\thing') isNil not.
	self assert: (re search: 'athing') isNil.
	self assert: (re search: 'bthing') isNil.
	self assert: (re search: ']thing') isNil.
	self assert: (re search: 'cthing') isNil.
	self assert: (re search: 'dthing') isNil.
	self assert: (re search: 'ething') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test140 [
	| re re2 |
	re := Re on: '[^a]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaaabcd') isNil not.
	self assert: (re search: 'aaAabcd') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test141 [
	| re re2 |
	re := Re on: '[^a]'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaaabcd') isNil not.
	self assert: (re search: 'aaAabcd') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test142 [
	| re re2 |
	re := Re on: '[^az]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaaabcd') isNil not.
	self assert: (re search: 'aaAabcd') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test143 [
	| re re2 |
	re := Re on: '[^az]'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaaabcd') isNil not.
	self assert: (re search: 'aaAabcd') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test144 [
	| re |
	re := Re on: '\000\001\002\003\004\005\006\007\010\011\012\013\014\015\016\017\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037\040\041\042\043\044\045\046\047\050\051\052\053\054\055\056\057\060\061\062\063\064\065\066\067\070\071\072\073\074\075\076\077\100\101\102\103\104\105\106\107\110\111\112\113\114\115\116\117\120\121\122\123\124\125\126\127\130\131\132\133\134\135\136\137\140\141\142\143\144\145\146\147\150\151\152\153\154\155\156\157\160\161\162\163\164\165\166\167\170\171\172\173\174\175\176\177\200\201\202\203\204\205\206\207\210\211\212\213\214\215\216\217\220\221\222\223\224\225\226\227\230\231\232\233\234\235\236\237\240\241\242\243\244\245\246\247\250\251\252\253\254\255\256\257\260\261\262\263\264\265\266\267\270\271\272\273\274\275\276\277\300\301\302\303\304\305\306\307\310\311\312\313\314\315\316\317\320\321\322\323\324\325\326\327\330\331\332\333\334\335\336\337\340\341\342\343\344\345\346\347\350\351\352\353\354\355\356\357\360\361\362\363\364\365\366\367\370\371\372\373\374\375\376\377'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 
		(String streamContents: [:s | 0 to: 255 do: [:each | s nextPut: each asCharacter]])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test145 [
	| re re2 |
	re := Re on: 'P[^*]TAIRE[^*]{1,6}?LL'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'xxxxxxxxxxxPSTAIREISLLxxxxxxxxx') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test146 [
	| re re2 |
	re := Re on: 'P[^*]TAIRE[^*]{1,}?LL'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'xxxxxxxxxxxPSTAIREISLLxxxxxxxxx') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test147 [
	| re re2 |
	re := Re on: '(\.\d\d[1-9]?)\d+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '1.230003938') isNil not.
	self assert: (re search: '1.875000282') isNil not.
	self assert: (re search: '1.235') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test148 [
	| re re2 |
	re := Re on: '(\.\d\d((?=0)|\d(?=\d)))'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '1.230003938') isNil not.
	self assert: (re search: '1.875000282') isNil not.
	self assert: (re search: '1.235') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test149 [
	| re re2 |
	re := Re on: 'a(?)b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test15 [
	| re re2 |
	re := Re on: '^[^]cde]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'athing') isNil not.
	self assert: (re search: 'fthing') isNil not.
	self assert: (re search: ']thing') isNil.
	self assert: (re search: 'cthing') isNil.
	self assert: (re search: 'dthing') isNil.
	self assert: (re search: 'ething') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test150 [
	| re re2 |
	re := Re on: '\b(foo)\s+(\w+)'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Food is on the foo table') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test151 [
	| re re2 |
	re := Re on: 'foo(.*)bar'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'The food is under the bar in the barn.') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test152 [
	| re re2 |
	re := Re on: 'foo(.*?)bar'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'The food is under the bar in the barn.') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test153 [
	| re re2 |
	re := Re on: '(.*)(\d*)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'I have 2 numbers: 53147') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test154 [
	| re re2 |
	re := Re on: '(.*)(\d+)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'I have 2 numbers: 53147') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test155 [
	| re re2 |
	re := Re on: '(.*?)(\d*)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'I have 2 numbers: 53147') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test156 [
	| re re2 |
	re := Re on: '(.*?)(\d+)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'I have 2 numbers: 53147') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test157 [
	| re re2 |
	re := Re on: '(.*)(\d+)$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'I have 2 numbers: 53147') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test158 [
	| re re2 |
	re := Re on: '(.*?)(\d+)$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'I have 2 numbers: 53147') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test159 [
	| re re2 |
	re := Re on: '(.*)\b(\d+)$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'I have 2 numbers: 53147') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test16 [
	| re re2 |
	re := Re on: '^\'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test160 [
	| re re2 |
	re := Re on: '(.*\D)(\d+)$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'I have 2 numbers: 53147') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test161 [
	| re re2 |
	re := Re on: '^\D*(?!123)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC123') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test162 [
	| re re2 |
	re := Re on: '^(\D*)(?=\d)(?!123)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC445') isNil not.
	self assert: (re search: 'ABC123') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test163 [
	| re re2 |
	re := Re on: '^[W-]46]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'W46]789') isNil not.
	self assert: (re search: '-46]789') isNil not.
	self assert: (re search: 'Wall') isNil.
	self assert: (re search: 'Zebra') isNil.
	self assert: (re search: '42') isNil.
	self assert: (re search: '[abcd]') isNil.
	self assert: (re search: ']abcd[') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test164 [
	| re re2 |
	re := Re on: '^[W-\]46]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'W46]789') isNil not.
	self assert: (re search: 'Wall') isNil not.
	self assert: (re search: 'Zebra') isNil not.
	self assert: (re search: 'Xylophone') isNil not.
	self assert: (re search: '42') isNil not.
	self assert: (re search: '[abcd]') isNil not.
	self assert: (re search: ']abcd[') isNil not.
	self assert: (re search: '\\backslash') isNil not.
	self assert: (re search: '-46]789') isNil.
	self assert: (re search: 'well') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test165 [
	| re re2 |
	re := Re on: '\d\d/\d\d\/\d\d\d\d'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '01/01/2000') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test166 [
	| re |
	re := Re on: 'word (?:[a-zA-Z0-9]+ ){0,10}otherword'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'word cat dog elephant mussel cow horse canary baboon snake shark otherword') isNil not.
	self assert: (re search: 'word cat dog elephant mussel cow horse canary baboon snake shark') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test167 [
	| re |
	re := Re on: 'word (?:[a-zA-Z0-9]+ ){0,300}otherword'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'word cat dog elephant mussel cow horse canary baboon snake shark the quick brown fox and the lazy dog and several other words getting close to thirty by now I hope otherword') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test168 [
	| re re2 |
	re := Re on: '^(a){0,0}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bcd') isNil not.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'aab') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test169 [
	| re re2 |
	re := Re on: '^(a){0,1}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bcd') isNil not.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'aab') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test17 [
	| re re2 |
	re := Re on: '^ÿ'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ÿ') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test170 [
	| re re2 |
	re := Re on: '^(a){0,2}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bcd') isNil not.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'aab') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test171 [
	| re re2 |
	re := Re on: '^(a){0,3}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bcd') isNil not.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'aab') isNil not.
	self assert: (re search: 'aaa') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test172 [
	| re re2 |
	re := Re on: '^(a){0,}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bcd') isNil not.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'aab') isNil not.
	self assert: (re search: 'aaa') isNil not.
	self assert: (re search: 'aaaaaaaa') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test173 [
	| re |
	re := Re on: '^(a){1,1}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bcd') isNil.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'aab') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test174 [
	| re |
	re := Re on: '^(a){1,2}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bcd') isNil.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'aab') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test175 [
	| re |
	re := Re on: '^(a){1,3}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bcd') isNil.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'aab') isNil not.
	self assert: (re search: 'aaa') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test176 [
	| re |
	re := Re on: '^(a){1,}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bcd') isNil.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'aab') isNil not.
	self assert: (re search: 'aaa') isNil not.
	self assert: (re search: 'aaaaaaaa') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test177 [
	| re re2 |
	re := Re on: '.*\.gif'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'borfle';
		nextPut: Character cr;
		nextPutAll: 'bib.gif';
		nextPut: Character cr;
		nextPutAll: 'no'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test178 [
	| re re2 |
	re := Re on: '.{0,}\.gif'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'borfle';
		nextPut: Character cr;
		nextPutAll: 'bib.gif';
		nextPut: Character cr;
		nextPutAll: 'no'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test179 [
	| re re2 |
	re := Re on: '.*\.gif'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'borfle';
		nextPut: Character cr;
		nextPutAll: 'bib.gif';
		nextPut: Character cr;
		nextPutAll: 'no'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test18 [
	| re re2 |
	re := Re on: '^[0-9]+$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '0') isNil not.
	self assert: (re search: '1') isNil not.
	self assert: (re search: '2') isNil not.
	self assert: (re search: '3') isNil not.
	self assert: (re search: '4') isNil not.
	self assert: (re search: '5') isNil not.
	self assert: (re search: '6') isNil not.
	self assert: (re search: '7') isNil not.
	self assert: (re search: '8') isNil not.
	self assert: (re search: '9') isNil not.
	self assert: (re search: '10') isNil not.
	self assert: (re search: '100') isNil not.
	self assert: (re search: 'abc') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test180 [
	| re re2 |
	re := Re on: '.*\.gif'.
	re
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'borfle';
		nextPut: Character cr;
		nextPutAll: 'bib.gif';
		nextPut: Character cr;
		nextPutAll: 'no'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test181 [
	| re re2 |
	re := Re on: '.*\.gif'.
	re
		beMultiline;
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'borfle';
		nextPut: Character cr;
		nextPutAll: 'bib.gif';
		nextPut: Character cr;
		nextPutAll: 'no'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test182 [
	| re re2 |
	re := Re on: '.*$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'borfle';
		nextPut: Character cr;
		nextPutAll: 'bib.gif';
		nextPut: Character cr;
		nextPutAll: 'no'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test183 [
	| re re2 |
	re := Re on: '.*$'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'borfle';
		nextPut: Character cr;
		nextPutAll: 'bib.gif';
		nextPut: Character cr;
		nextPutAll: 'no'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test184 [
	| re re2 |
	re := Re on: '.*$'.
	re
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'borfle';
		nextPut: Character cr;
		nextPutAll: 'bib.gif';
		nextPut: Character cr;
		nextPutAll: 'no'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test185 [
	| re re2 |
	re := Re on: '.*$'.
	re
		beMultiline;
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'borfle';
		nextPut: Character cr;
		nextPutAll: 'bib.gif';
		nextPut: Character cr;
		nextPutAll: 'no'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test186 [
	| re re2 |
	re := Re on: '.*$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'borfle';
		nextPut: Character cr;
		nextPutAll: 'bib.gif';
		nextPut: Character cr;
		nextPutAll: 'no';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test187 [
	| re re2 |
	re := Re on: '.*$'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'borfle';
		nextPut: Character cr;
		nextPutAll: 'bib.gif';
		nextPut: Character cr;
		nextPutAll: 'no';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test188 [
	| re re2 |
	re := Re on: '.*$'.
	re
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'borfle';
		nextPut: Character cr;
		nextPutAll: 'bib.gif';
		nextPut: Character cr;
		nextPutAll: 'no';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test189 [
	| re re2 |
	re := Re on: '.*$'.
	re
		beMultiline;
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'borfle';
		nextPut: Character cr;
		nextPutAll: 'bib.gif';
		nextPut: Character cr;
		nextPutAll: 'no';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test19 [
	| re re2 |
	re := Re on: '^.*nter'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'enter') isNil not.
	self assert: (re search: 'inter') isNil not.
	self assert: (re search: 'uponter') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test190 [
	| re re2 |
	re := Re on: '(.*X|^B)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcde';
		nextPut: Character cr;
		nextPutAll: '1234Xyz'])) isNil not.
	self assert: (re search: 'BarFoo') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcde';
		nextPut: Character cr;
		nextPutAll: 'Bar'])) isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test191 [
	| re re2 |
	re := Re on: '(.*X|^B)'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcde';
		nextPut: Character cr;
		nextPutAll: '1234Xyz'])) isNil not.
	self assert: (re search: 'BarFoo') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcde';
		nextPut: Character cr;
		nextPutAll: 'Bar'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test192 [
	| re re2 |
	re := Re on: '(.*X|^B)'.
	re
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcde';
		nextPut: Character cr;
		nextPutAll: '1234Xyz'])) isNil not.
	self assert: (re search: 'BarFoo') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcde';
		nextPut: Character cr;
		nextPutAll: 'Bar'])) isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test193 [
	| re re2 |
	re := Re on: '(.*X|^B)'.
	re
		beMultiline;
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcde';
		nextPut: Character cr;
		nextPutAll: '1234Xyz'])) isNil not.
	self assert: (re search: 'BarFoo') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcde';
		nextPut: Character cr;
		nextPutAll: 'Bar'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test194 [
	| re re2 |
	re := Re on: '(?s)(.*X|^B)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcde';
		nextPut: Character cr;
		nextPutAll: '1234Xyz'])) isNil not.
	self assert: (re search: 'BarFoo') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcde';
		nextPut: Character cr;
		nextPutAll: 'Bar'])) isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test195 [
	| re re2 |
	re := Re on: '(?s:.*X|^B)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcde';
		nextPut: Character cr;
		nextPutAll: '1234Xyz'])) isNil not.
	self assert: (re search: 'BarFoo') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcde';
		nextPut: Character cr;
		nextPutAll: 'Bar'])) isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test196 [
	| re re2 |
	re := Re on: '^.*B'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'B'])) isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test197 [
	| re re2 |
	re := Re on: '(?s)^.*B'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'B'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test198 [
	| re re2 |
	re := Re on: '(?m)^.*B'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'B'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test199 [
	| re re2 |
	re := Re on: '(?ms)^.*B'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'B'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test2 [
	| re re2 |
	re := Re on: 'The quick brown fox'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'the quick brown fox') isNil not.
	self assert: (re search: 'The quick brown FOX') isNil not.
	self assert: (re search: 'What do you know about the quick brown fox?') isNil not.
	self assert: (re search: 'What do you know about THE QUICK BROWN FOX?') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test20 [
	| re re2 |
	re := Re on: '^xxx[0-9]+$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'xxx0') isNil not.
	self assert: (re search: 'xxx1234') isNil not.
	self assert: (re search: 'xxx') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test200 [
	| re re2 |
	re := Re on: '(?ms)^B'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'B'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test201 [
	| re re2 |
	re := Re on: '(?s)B$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'B';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test202 [
	| re re2 |
	re := Re on: '^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '123456654321') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test203 [
	| re re2 |
	re := Re on: '^\d\d\d\d\d\d\d\d\d\d\d\d'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '123456654321') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test204 [
	| re re2 |
	re := Re on: '^[\d][\d][\d][\d][\d][\d][\d][\d][\d][\d][\d][\d]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '123456654321') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test205 [
	| re re2 |
	re := Re on: '^[abc]{12}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcabcabcabc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test206 [
	| re re2 |
	re := Re on: '^[a-c]{12}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcabcabcabc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test207 [
	| re re2 |
	re := Re on: '^(a|b|c){12}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcabcabcabc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test208 [
	| re re2 |
	re := Re on: '^[abcdefghijklmnopqrstuvwxy0123456789]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'n') isNil not.
	self assert: (re search: 'z') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test209 [
	| re re2 |
	re := Re on: 'abcde{0,0}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.
	self assert: (re search: 'abce') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test21 [
	| re |
	re := Re on: '^.+[0-9][0-9][0-9]$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'x123') isNil not.
	self assert: (re search: 'xx123') isNil not.
	self assert: (re search: '123456') isNil not.
	self assert: (re search: '123') isNil.
	self assert: (re search: 'x1234') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test210 [
	| re re2 |
	re := Re on: 'ab[cd]{0,0}e'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abe') isNil not.
	self assert: (re search: 'abcde') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test211 [
	| re re2 |
	re := Re on: 'ab(c){0,0}d'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abd') isNil not.
	self assert: (re search: 'abcd') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test212 [
	| re re2 |
	re := Re on: 'a(b*)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.
	self assert: (re search: 'ab') isNil not.
	self assert: (re search: 'abbbb') isNil not.
	self assert: (re search: 'bbbbb') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test213 [
	| re re2 |
	re := Re on: 'ab\d{0}e'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abe') isNil not.
	self assert: (re search: 'ab1e') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test214 [
	| re |
	re := Re on: '"([^\\"]+|\\.)*"'.
	self shouldnt: [re compile] raise: Error.
	self assert: ('the \"quick\" brown fox') isNil not.
	self assert: ('\"the \\\"quick\\\" brown fox\"') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test215 [
	| re re2 |
	re := Re on: '.*?'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test216 [
	| re re2 |
	re := Re on: '\b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test217 [
	| re re2 |
	re := Re on: '\b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test218 [
	| re re2 |
	re := Re on: ''.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test219 [
	| re re2 |
	re := Re on: '<tr([\w\W\s\d][^<>]{0,})><TD([\w\W\s\d][^<>]{0,})>([\d]{0,}\.)(.*)((<BR>([\w\W\s\d][^<>]{0,})|[\s]{0,}))</a></TD><TD([\w\W\s\d][^<>]{0,})>([\w\W\s\d][^<>]{0,})</TD><TD([\w\W\s\d][^<>]{0,})>([\w\W\s\d][^<>]{0,})</TD></TR>'.
	re
		beNotCaseSensitive;
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '<TR BGCOLOR=''#DBE9E9''><TD align=left valign=top>43.<a href=''joblist.cfm?JobID=94 6735&Keyword=''>Word Processor<BR>(N-1286)</a></TD><TD align=left valign=top>Lega lstaff.com</TD><TD align=left valign=top>CA - Statewide</TD></TR>') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test22 [
	| re |
	re := Re on: '^.+?[0-9][0-9][0-9]$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'x123') isNil not.
	self assert: (re search: 'xx123') isNil not.
	self assert: (re search: '123456') isNil not.
	self assert: (re search: '123') isNil.
	self assert: (re search: 'x1234') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test220 [
	| re re2 |
	re := Re on: 'a[^a]b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'acb') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test221 [
	| re re2 |
	re := Re on: 'a.b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'acb') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b'])) isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test222 [
	| re re2 |
	re := Re on: 'a[^a]b'.
	re
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'acb') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test223 [
	| re re2 |
	re := Re on: 'a.b'.
	re
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'acb') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test224 [
	| re re2 |
	re := Re on: '^(b+?|a){1,2}?c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bac') isNil not.
	self assert: (re search: 'bbac') isNil not.
	self assert: (re search: 'bbbac') isNil not.
	self assert: (re search: 'bbbbac') isNil not.
	self assert: (re search: 'bbbbbac') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test225 [
	| re re2 |
	re := Re on: '^(b+|a){1,2}?c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bac') isNil not.
	self assert: (re search: 'bbac') isNil not.
	self assert: (re search: 'bbbac') isNil not.
	self assert: (re search: 'bbbbac') isNil not.
	self assert: (re search: 'bbbbbac') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test226 [
	| re |
	re := Re on: '(?!\A)x'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'x';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr])) isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character backspace;
		nextPutAll: 'x';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test227 [
	| re re2 |
	re := Re on: '\x0{ab}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPut: 8r0 asCharacter;
		nextPutAll: '{ab}'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test228 [
	| re re2 |
	re := Re on: '(A|B)*?CD'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'CD') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test229 [
	| re re2 |
	re := Re on: '(A|B)*CD'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'CD') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test23 [
	| re re2 |
	re := Re on: '^([^!]+)!(.+)=apquxz\.ixr\.zzz\.ac\.uk$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc!pqr=apquxz.ixr.zzz.ac.uk') isNil not.
	self assert: (re search: '!pqr=apquxz.ixr.zzz.ac.uk') isNil.
	self assert: (re search: 'abc!=apquxz.ixr.zzz.ac.uk') isNil.
	self assert: (re search: 'abc!pqr=apquxz:ixr.zzz.ac.uk') isNil.
	self assert: (re search: 'abc!pqr=apquxz.ixr.zzz.ac.ukk') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test230 [
	| re re2 |
	re := Re on: '(AB)*?\1'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABABAB') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test231 [
	| re re2 |
	re := Re on: '(AB)*\1'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABABAB') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test232 [
	| re re2 |
	re := Re on: ' End of testinput1 '.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test24 [
	| re re2 |
	re := Re on: ':'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Well, we need a colon: somewhere') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test25 [
	| re re2 |
	re := Re on: '([\da-f:]+)$'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '0abc') isNil not.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'fed') isNil not.
	self assert: (re search: 'E') isNil not.
	self assert: (re search: '::') isNil not.
	self assert: (re search: '5f03:12C0::932e') isNil not.
	self assert: (re search: 'fed def') isNil not.
	self assert: (re search: 'Any old stuff') isNil not.
	self assert: (re search: '0zzz') isNil.
	self assert: (re search: 'gzzz') isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'fed';
		nextPut: 16r20 asCharacter])) isNil.
	self assert: (re search: 'Any old rubbish') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test26 [
	| re re2 |
	re := Re on: '^.*\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '.1.2.3') isNil not.
	self assert: (re search: 'A.12.123.0') isNil not.
	self assert: (re search: '.1.2.3333') isNil.
	self assert: (re search: '1.2.3') isNil.
	self assert: (re search: '1234.2.3') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test27 [
	| re re2 |
	re := Re on: '^(\d+)\s+IN\s+SOA\s+(\S+)\s+(\S+)\s*\(\s*$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '1 IN SOA non-sp1 non-sp2(') isNil not.
	self assert: (re search: '1    IN    SOA    non-sp1    non-sp2   (') isNil not.
	self assert: (re search: '1IN SOA non-sp1 non-sp2(') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test28 [
	| re re2 |
	re := Re on: '^[a-zA-Z\d][a-zA-Z\d\-]*(\.[a-zA-Z\d][a-zA-z\d\-]*)*\.$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a.') isNil not.
	self assert: (re search: 'Z.') isNil not.
	self assert: (re search: '2.') isNil not.
	self assert: (re search: 'ab-c.pq-r.') isNil not.
	self assert: (re search: 'sxk.zzz.ac.uk.') isNil not.
	self assert: (re search: 'x-.y-.') isNil not.
	self assert: (re search: '-abc.peq.') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test29 [
	| re re2 |
	re := Re on: '^\*\.[a-z]([a-z\-\d]*[a-z\d]+)?(\.[a-z]([a-z\-\d]*[a-z\d]+)?)*$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '*.a') isNil not.
	self assert: (re search: '*.b0-a') isNil not.
	self assert: (re search: '*.c3-b.c') isNil not.
	self assert: (re search: '*.c-a.b-c') isNil not.
	self assert: (re search: '*.0') isNil.
	self assert: (re search: '*.a-') isNil.
	self assert: (re search: '*.a-b.c-') isNil.
	self assert: (re search: '*.c-a.0-c') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test3 [
	| re |
	re := Re on: 'abcd\t\n\r\f\a\e\071\x3b\$\\\?caxyz'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcd';
		nextPut: Character tab;
		nextPut: Character cr;
		nextPut: Character cr;
		nextPut: Character newPage;
		nextPut: 7 asCharacter;
		nextPut: Character escape;
		nextPut: 8r071 asCharacter;
		nextPut: 16r3B asCharacter;
		nextPutAll: '$\?caxyz'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test30 [
	| re re2 |
	re := Re on: '^(?=ab(de))(abd)(e)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abde') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test31 [
	| re re2 |
	re := Re on: '^(?!(ab)de|x)(abd)(f)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abdf') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test32 [
	| re re2 |
	re := Re on: '^(?=(ab(cd)))(ab)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test33 [
	| re re2 |
	re := Re on: '^[\da-f](\.[\da-f])*$'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a.b.c.d') isNil not.
	self assert: (re search: 'A.B.C.D') isNil not.
	self assert: (re search: 'a.b.c.1.2.3.C') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test34 [
	| re |
	re := Re on: '^\".*\"\s*(;.*)?$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '"1234"') isNil not.
	self assert: (re search: '"abcd" ;') isNil not.
	self assert: (re search: '"" ; rhubarb') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: '1234';
		nextPutAll: ' : things'])) isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test35 [
	| re re2 |
	re := Re on: '^$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test36 [
	| re re2 |
	re := Re on: '   ^    a   (?# begins with a)  b\sc (?# then b c) $ (?# then end)'.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab c') isNil not.
	self assert: (re search: 'abc') isNil.
	self assert: (re search: 'ab cde') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test37 [
	| re re2 |
	re := Re on: '(?x)   ^    a   (?# begins with a)  b\sc (?# then b c) $ (?# then end)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab c') isNil not.
	self assert: (re search: 'abc') isNil.
	self assert: (re search: 'ab cde') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test38 [
	| re re2 |
	re := Re on: '^   a\ b[c ]d       $'.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a bcd') isNil not.
	self assert: (re search: 'a b d') isNil not.
	self assert: (re search: 'abcd') isNil.
	self assert: (re search: 'ab d') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test39 [
	| re re2 |
	re := Re on: '^(a(b(c)))(d(e(f)))(h(i(j)))(k(l(m)))$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcdefhijklm') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test4 [
	| re re2 |
	re := Re on: 'a*abc?xyz+pqr{3}ab{2,}xy{4,5}pq{0,6}AB{0,}zz'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abxyzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'abxyzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'aabxyzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'aaabxyzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'aaaabxyzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'abcxyzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'aabcxyzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'aaabcxyzpqrrrabbxyyyypAzz') isNil not.
	self assert: (re search: 'aaabcxyzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'aaabcxyzpqrrrabbxyyyypqqAzz') isNil not.
	self assert: (re search: 'aaabcxyzpqrrrabbxyyyypqqqAzz') isNil not.
	self assert: (re search: 'aaabcxyzpqrrrabbxyyyypqqqqAzz') isNil not.
	self assert: (re search: 'aaabcxyzpqrrrabbxyyyypqqqqqAzz') isNil not.
	self assert: (re search: 'aaabcxyzpqrrrabbxyyyypqqqqqqAzz') isNil not.
	self assert: (re search: 'aaaabcxyzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'abxyzzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'aabxyzzzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'aaabxyzzzzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'aaaabxyzzzzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'abcxyzzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'aabcxyzzzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'aaabcxyzzzzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'aaaabcxyzzzzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'aaaabcxyzzzzpqrrrabbbxyyyypqAzz') isNil not.
	self assert: (re search: 'aaaabcxyzzzzpqrrrabbbxyyyyypqAzz') isNil not.
	self assert: (re search: 'aaabcxyzpqrrrabbxyyyypABzz') isNil not.
	self assert: (re search: 'aaabcxyzpqrrrabbxyyyypABBzz') isNil not.
	self assert: (re search: '>>>aaabxyzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: '>aaaabxyzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: '>>>>abcxyzpqrrrabbxyyyypqAzz') isNil not.
	self assert: (re search: 'abxyzpqrrabbxyyyypqAzz') isNil.
	self assert: (re search: 'abxyzpqrrrrabbxyyyypqAzz') isNil.
	self assert: (re search: 'abxyzpqrrrabxyyyypqAzz') isNil.
	self assert: (re search: 'aaaabcxyzzzzpqrrrabbbxyyyyyypqAzz') isNil.
	self assert: (re search: 'aaaabcxyzzzzpqrrrabbbxyyypqAzz') isNil.
	self assert: (re search: 'aaabcxyzpqrrrabbxyyyypqqqqqqqAzz') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test40 [
	| re re2 |
	re := Re on: '^(?:a(b(c)))(?:d(e(f)))(?:h(i(j)))(?:k(l(m)))$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcdefhijklm') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test41 [
	| re re2 |
	re := Re on: '^[\w][\W][\s][\S][\d][\D][\b][\n][\c]][\022]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a+ Z0+';
		nextPut: 16r08 asCharacter;
		nextPut: Character cr;
		nextPut: 16r1D asCharacter;
		nextPut: 16r12 asCharacter])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test42 [
	| re re2 |
	re := Re on: '^[.^$|()*+?{,}]+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: '.^';
		nextPutAll: '(*+)|{?,?}'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test43 [
	| re re2 |
	re := Re on: '^a*\w'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'z') isNil not.
	self assert: (re search: 'az') isNil not.
	self assert: (re search: 'aaaz') isNil not.
	self assert: (re search: 'a') isNil not.
	self assert: (re search: 'aa') isNil not.
	self assert: (re search: 'aaaa') isNil not.
	self assert: (re search: 'a+') isNil not.
	self assert: (re search: 'aa+') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test44 [
	| re re2 |
	re := Re on: '^a*?\w'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'z') isNil not.
	self assert: (re search: 'az') isNil not.
	self assert: (re search: 'aaaz') isNil not.
	self assert: (re search: 'a') isNil not.
	self assert: (re search: 'aa') isNil not.
	self assert: (re search: 'aaaa') isNil not.
	self assert: (re search: 'a+') isNil not.
	self assert: (re search: 'aa+') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test45 [
	| re re2 |
	re := Re on: '^a+\w'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'az') isNil not.
	self assert: (re search: 'aaaz') isNil not.
	self assert: (re search: 'aa') isNil not.
	self assert: (re search: 'aaaa') isNil not.
	self assert: (re search: 'aa+') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test46 [
	| re re2 |
	re := Re on: '^a+?\w'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'az') isNil not.
	self assert: (re search: 'aaaz') isNil not.
	self assert: (re search: 'aa') isNil not.
	self assert: (re search: 'aaaa') isNil not.
	self assert: (re search: 'aa+') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test47 [
	| re re2 |
	re := Re on: '^\d{8}\w{2,}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '1234567890') isNil not.
	self assert: (re search: '12345678ab') isNil not.
	self assert: (re search: '12345678__') isNil not.
	self assert: (re search: '1234567') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test48 [
	| re re2 |
	re := Re on: '^[aeiou\d]{4,5}$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'uoie') isNil not.
	self assert: (re search: '1234') isNil not.
	self assert: (re search: '12345') isNil not.
	self assert: (re search: 'aaaaa') isNil not.
	self assert: (re search: '123456') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test49 [
	| re re2 |
	re := Re on: '^[aeiou\d]{4,5}?'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'uoie') isNil not.
	self assert: (re search: '1234') isNil not.
	self assert: (re search: '12345') isNil not.
	self assert: (re search: 'aaaaa') isNil not.
	self assert: (re search: '123456') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test5 [
	| re re2 |
	re := Re on: '^(abc){1,2}zz'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abczz') isNil not.
	self assert: (re search: 'abcabczz') isNil not.
	self assert: (re search: 'zz') isNil.
	self assert: (re search: 'abcabcabczz') isNil.
	self assert: (re search: '>>abczz') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test50 [
	| re re2 |
	re := Re on: '\A(abc|def)=(\1){2,3}\Z'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc=abcabc') isNil not.
	self assert: (re search: 'def=defdefdef') isNil not.
	self assert: (re search: 'abc=defdef') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test51 [
	| re re2 |
	re := Re on: '^(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)(k)\11*(\3\4)\1(?#)2$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcdefghijkcda2') isNil not.
	self assert: (re search: 'abcdefghijkkkkcda2') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test52 [
	| re re2 |
	re := Re on: '(cat(a(ract|tonic)|erpillar)) \1()2(3)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'cataract cataract23') isNil not.
	self assert: (re search: 'catatonic catatonic23') isNil not.
	self assert: (re search: 'caterpillar caterpillar23') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test54 [
	| re re2 |
	re := Re on: '^From\s+\S+\s+([a-zA-Z]{3}\s+){2}\d{1,2}\s+\d\d:\d\d'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'From abcd  Mon Sep 01 12:33:02 1997') isNil not.
	self assert: (re search: 'From abcd  Mon Sep  1 12:33:02 1997') isNil not.
	self assert: (re search: 'From abcd  Sep 01 12:33:02 1997') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test55 [
	| re re2 |
	re := Re on: '^12.34'.
	re
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: '12';
		nextPut: Character cr;
		nextPutAll: '34'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: '12';
		nextPut: Character linefeed;
		nextPutAll: '34'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test56 [
	| re re2 |
	re := Re on: '\w+(?=\t)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'the quick brown';
		nextPut: Character tab;
		nextPutAll: ' fox'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test57 [
	| re re2 |
	re := Re on: 'foo(?!bar)(.*)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'foobar is foolish see?') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test58 [
	| re re2 |
	re := Re on: '(?:(?!foo)...|^.{0,2})bar(.*)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'foobar crowbar etc') isNil not.
	self assert: (re search: 'barrel') isNil not.
	self assert: (re search: '2barrel') isNil not.
	self assert: (re search: 'A barrel') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test59 [
	| re re2 |
	re := Re on: '^(\D*)(?=\d)(?!123)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc456') isNil not.
	self assert: (re search: 'abc123') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test6 [
	| re re2 |
	re := Re on: '^(b+?|a){1,2}?c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bc') isNil not.
	self assert: (re search: 'bbc') isNil not.
	self assert: (re search: 'bbbc') isNil not.
	self assert: (re search: 'bac') isNil not.
	self assert: (re search: 'bbac') isNil not.
	self assert: (re search: 'aac') isNil not.
	self assert: (re search: 'abbbbbbbbbbbc') isNil not.
	self assert: (re search: 'bbbbbbbbbbbac') isNil not.
	self assert: (re search: 'aaac') isNil.
	self assert: (re search: 'abbbbbbbbbbbac') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test60 [
	| re re2 |
	re := Re on: '^1234(?# test newlines
  inside)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '1234') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test61 [
	| re re2 |
	re := Re on: '^1234 #comment in extended re
  '.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '1234') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test62 [
	| re re2 |
	re := Re on: '#rhubarb
  abcd'.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test63 [
	| re re2 |
	re := Re on: '^abcd#rhubarb'.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test64 [
	| re re2 |
	re := Re on: '^(a)\1{2,3}(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaab') isNil not.
	self assert: (re search: 'aaaab') isNil not.
	self assert: (re search: 'aaaaab') isNil not.
	self assert: (re search: 'aaaaaab') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test65 [
	| re re2 |
	re := Re on: '(?!^)abc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'the abc') isNil not.
	self assert: (re search: 'abc') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test66 [
	| re re2 |
	re := Re on: '(?=^)abc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'the abc') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test67 [
	| re re2 |
	re := Re on: '^[ab]{1,3}(ab*|b)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aabbbbb') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test68 [
	| re re2 |
	re := Re on: '^[ab]{1,3}?(ab*|b)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aabbbbb') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test69 [
	| re re2 |
	re := Re on: '^[ab]{1,3}?(ab*?|b)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aabbbbb') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test7 [
	| re re2 |
	re := Re on: '^(b+|a){1,2}c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bc') isNil not.
	self assert: (re search: 'bbc') isNil not.
	self assert: (re search: 'bbbc') isNil not.
	self assert: (re search: 'bac') isNil not.
	self assert: (re search: 'bbac') isNil not.
	self assert: (re search: 'aac') isNil not.
	self assert: (re search: 'abbbbbbbbbbbc') isNil not.
	self assert: (re search: 'bbbbbbbbbbbac') isNil not.
	self assert: (re search: 'aaac') isNil.
	self assert: (re search: 'abbbbbbbbbbbac') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test70 [
	| re re2 |
	re := Re on: '^[ab]{1,3}(ab*?|b)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aabbbbb') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test73 [
	| re re2 |
	re := Re on: 'abc\0def\00pqr\000xyz\0000AB'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 8r0 asCharacter;
		nextPutAll: 'def';
		nextPut: 8r00 asCharacter;
		nextPutAll: 'pqr';
		nextPut: 8r000 asCharacter;
		nextPutAll: 'xyz';
		nextPut: 8r000 asCharacter;
		nextPutAll: '0AB'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc456 abc';
		nextPut: 8r0 asCharacter;
		nextPutAll: 'def';
		nextPut: 8r00 asCharacter;
		nextPutAll: 'pqr';
		nextPut: 8r000 asCharacter;
		nextPutAll: 'xyz';
		nextPut: 8r000 asCharacter;
		nextPutAll: '0ABCDE'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test74 [
	| re re2 |
	re := Re on: 'abc\x0def\x00pqr\x000xyz\x0000AB'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 16r0D asCharacter;
		nextPutAll: 'ef';
		nextPut: 16r00 asCharacter;
		nextPutAll: 'pqr';
		nextPut: 16r00 asCharacter;
		nextPutAll: '0xyz';
		nextPut: 16r00 asCharacter;
		nextPutAll: '00AB'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc456 abc';
		nextPut: 16r0D asCharacter;
		nextPutAll: 'ef';
		nextPut: 16r00 asCharacter;
		nextPutAll: 'pqr';
		nextPut: 16r00 asCharacter;
		nextPutAll: '0xyz';
		nextPut: 16r00 asCharacter;
		nextPutAll: '00ABCDE'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test75 [
	| re re2 |
	re := Re on: '^[\000-\037]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPut: 8r0 asCharacter;
		nextPutAll: 'A'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPut: 8r01 asCharacter;
		nextPutAll: 'B'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPut: 8r037 asCharacter;
		nextPutAll: 'C'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test76 [
	| re re2 |
	re := Re on: '\0*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPut: 8r0 asCharacter;
		nextPut: 8r0 asCharacter;
		nextPut: 8r0 asCharacter;
		nextPut: 8r0 asCharacter])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test77 [
	| re re2 |
	re := Re on: 'A\x0{2,3}Z'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'The A';
		nextPut: 16r0 asCharacter;
		nextPut: 16r0 asCharacter;
		nextPutAll: 'Z'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'An A';
		nextPut: 8r0 asCharacter;
		nextPut: 16r0 asCharacter;
		nextPut: 8r0 asCharacter;
		nextPutAll: 'Z'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'A';
		nextPut: 8r0 asCharacter;
		nextPutAll: 'Z'])) isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'A';
		nextPut: 8r0 asCharacter;
		nextPut: 16r0 asCharacter;
		nextPut: 8r0 asCharacter;
		nextPut: 16r0 asCharacter;
		nextPutAll: 'Z'])) isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test78 [
	| re re2 |
	re := Re on: '^(cow|)\1(bell)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'cowcowbell') isNil not.
	self assert: (re search: 'bell') isNil not.
	self assert: (re search: 'cowbell') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test79 [
	| re re2 |
	re := Re on: '^\s'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPut: 8r040 asCharacter;
		nextPutAll: 'abc'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPut: 16r0C asCharacter;
		nextPutAll: 'abc'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPut: Character cr;
		nextPutAll: 'abc'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPut: Character linefeed;
		nextPutAll: 'abc'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPut: Character tab;
		nextPutAll: 'abc'])) isNil not.
	self assert: (re search: 'abc') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test8 [
	| re re2 |
	re := Re on: '^(b+|a){1,2}?bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bbc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test80 [
	| re re2 |
	re := Re on: '^a	b
  
    c'.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test81 [
	| re re2 |
	re := Re on: '^(a|)\1*b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.
	self assert: (re search: 'aaaab') isNil not.
	self assert: (re search: 'b') isNil not.
	self assert: (re search: 'acb') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test82 [
	| re re2 |
	re := Re on: '^(a|)\1+b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aab') isNil not.
	self assert: (re search: 'aaaab') isNil not.
	self assert: (re search: 'b') isNil not.
	self assert: (re search: 'ab') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test83 [
	| re re2 |
	re := Re on: '^(a|)\1?b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.
	self assert: (re search: 'aab') isNil not.
	self assert: (re search: 'b') isNil not.
	self assert: (re search: 'acb') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test84 [
	| re re2 |
	re := Re on: '^(a|)\1{2}b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaab') isNil not.
	self assert: (re search: 'b') isNil not.
	self assert: (re search: 'ab') isNil.
	self assert: (re search: 'aab') isNil.
	self assert: (re search: 'aaaab') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test85 [
	| re re2 |
	re := Re on: '^(a|)\1{2,3}b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaab') isNil not.
	self assert: (re search: 'aaaab') isNil not.
	self assert: (re search: 'b') isNil not.
	self assert: (re search: 'ab') isNil.
	self assert: (re search: 'aab') isNil.
	self assert: (re search: 'aaaaab') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test86 [
	| re re2 |
	re := Re on: 'ab{1,3}bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abbbbc') isNil not.
	self assert: (re search: 'abbbc') isNil not.
	self assert: (re search: 'abbc') isNil not.
	self assert: (re search: 'abc') isNil.
	self assert: (re search: 'abbbbbc') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test87 [
	| re re2 |
	re := Re on: '([^.]*)\.([^:]*):[T ]+(.*)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'track1.title:TBlah blah blah') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test88 [
	| re re2 |
	re := Re on: '([^.]*)\.([^:]*):[T ]+(.*)'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'track1.title:TBlah blah blah') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test89 [
	| re re2 |
	re := Re on: '([^.]*)\.([^:]*):[t ]+(.*)'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'track1.title:TBlah blah blah') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test9 [
	| re re2 |
	re := Re on: '^(b*|ba){1,2}?bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'babc') isNil not.
	self assert: (re search: 'bbabc') isNil not.
	self assert: (re search: 'bababc') isNil not.
	self assert: (re search: 'bababbc') isNil.
	self assert: (re search: 'babababc') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test90 [
	| re re2 |
	re := Re on: '^[W-c]+$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'WXY_^abc') isNil not.
	self assert: (re search: 'wxy') isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test91 [
	| re re2 |
	re := Re on: '^[W-c]+$'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'WXY_^abc') isNil not.
	self assert: (re search: 'wxy_^ABC') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test92 [
	| re re2 |
	re := Re on: '^[\x3f-\x5F]+$'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'WXY_^abc') isNil not.
	self assert: (re search: 'wxy_^ABC') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test93 [
	| re re2 |
	re := Re on: '^abc$'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'qqq';
		nextPut: Character cr;
		nextPutAll: 'abc'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'zzz'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'qqq';
		nextPut: Character cr;
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'zzz'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test94 [
	| re re2 |
	re := Re on: '^abc$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'qqq';
		nextPut: Character cr;
		nextPutAll: 'abc'])) isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'zzz'])) isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'qqq';
		nextPut: Character cr;
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'zzz'])) isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test95 [
	| re re2 |
	re := Re on: '\Aabc\Z'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'qqq';
		nextPut: Character cr;
		nextPutAll: 'abc'])) isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'zzz'])) isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'qqq';
		nextPut: Character cr;
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'zzz'])) isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test96 [
	| re re2 |
	re := Re on: '\A(.)*\Z'.
	re
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'def'])) isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test97 [
	| re re2 |
	re := Re on: '\A(.)*\Z'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'def'])) isNil.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test98 [
	| re re2 |
	re := Re on: '(?:b)|(?::+)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'b::c') isNil not.
	self assert: (re search: 'c::b') isNil not.

]

{ #category : #newTestSuite1 }
ReTest >> testNewSuite1test99 [
	| re re2 |
	re := Re on: '[-az]+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'az-') isNil not.
	self assert: (re search: 'b') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test1 [
	| re re2 |
	re := Re on: '(a)b|'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test10 [
	| re |
	re := Re on: '(?X)ab\gdef'.
	re
		beExtra.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test100 [
	| re re2 |
	re := Re on: '(?<!(foo)a)bar'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bar') isNil not.
	self assert: (re search: 'foobbar') isNil not.
	self assert: (re search: 'fooabar') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test101 [
	| re re2 |
	re := Re on: '^(a)?(?(1)a|b)+$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test102 [
	| re re2 |
	re := Re on: '^(a\1?){4}$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaaaaa') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test103 [
	| re |
	re := Re on: 'a[b-a]'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test104 [
	| re |
	re := Re on: 'a[]b'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test105 [
	| re |
	re := Re on: 'a['.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test106 [
	| re |
	re := Re on: '*a'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test107 [
	| re |
	re := Re on: '(*)b'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test108 [
	| re |
	re := Re on: 'abc)'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test109 [
	| re |
	re := Re on: '(abc'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test11 [
	| re |
	re := Re on: 'x{5,4}'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test110 [
	| re |
	re := Re on: 'a**'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test111 [
	| re |
	re := Re on: ')('.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test112 [
	| re |
	re := Re on: '\1'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test113 [
	| re |
	re := Re on: '\2'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test114 [
	| re |
	re := Re on: '(a)|\2'.
	self should: [re compile] raise: Error.
]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test115 [
	| re |
	re := Re on: 'a[b-a]'.
	re
		beNotCaseSensitive.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test116 [
	| re |
	re := Re on: 'a[]b'.
	re
		beNotCaseSensitive.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test117 [
	| re |
	re := Re on: 'a['.
	re
		beNotCaseSensitive.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test118 [
	| re |
	re := Re on: '*a'.
	re
		beNotCaseSensitive.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test119 [
	| re |
	re := Re on: '(*)b'.
	re
		beNotCaseSensitive.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test12 [
	| re |
	re := Re on: 'z{65536}'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test120 [
	| re |
	re := Re on: 'abc)'.
	re
		beNotCaseSensitive.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test121 [
	| re |
	re := Re on: '(abc'.
	re
		beNotCaseSensitive.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test122 [
	| re |
	re := Re on: 'a**'.
	re
		beNotCaseSensitive.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test123 [
	| re |
	re := Re on: ')('.
	re
		beNotCaseSensitive.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test124 [
	| re |
	re := Re on: ':(?:'.
	self should: [re compile] raise: Error.
]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test125 [
	| re |
	re := Re on: '(?<%)b'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test126 [
	| re |
	re := Re on: 'a(?{)b'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test127 [
	| re |
	re := Re on: 'a(?{{})b'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test128 [
	| re |
	re := Re on: 'a(?{}})b'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test129 [
	| re |
	re := Re on: 'a(?{"{"})b'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test13 [
	| re |
	re := Re on: '[abcd'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test130 [
	| re |
	re := Re on: 'a(?{"{"}})b'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test131 [
	| re |
	re := Re on: '(?(1?)a|b)'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test132 [
	| re |
	re := Re on: '(?(1)a|b|c)'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test133 [
	| re |
	re := Re on: '[a[:xyz:'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test134 [
	| re |
	re := Re on: '(?<=x+)y'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test135 [
	| re |
	re := Re on: 'a{37,17}'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test136 [
	| re re2 |
	re := Re on: 'abc'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test137 [
	| re re2 |
	re := Re on: 'abc'.
	re
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test138 [
	| re re2 |
	re := Re on: 'abc'.
	re
		beStrangeOption;
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test139 [
	| re re2 |
	re := Re on: '(a)bc(d)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcd';
		nextPutAll: '2'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcd';
		nextPutAll: '5'])) isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test14 [
	| re |
	re := Re on: '[\B]'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test140 [
	| re re2 |
	re := Re on: '(.{20})'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcdefghijklmnopqrstuvwxyz') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcdefghijklmnopqrstuvwxyz';
		nextPutAll: '1'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcdefghijklmnopqrstuvwxyz';
		nextPutAll: '1'])) isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test141 [
	| re re2 |
	re := Re on: '(.{15})'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcdefghijklmnopqrstuvwxyz') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcdefghijklmnopqrstuvwxyz';
		nextPutAll: '1';
		nextPutAll: '1'])) isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test142 [
	| re re2 |
	re := Re on: '(.{16})'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcdefghijklmnopqrstuvwxyz') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abcdefghijklmnopqrstuvwxyz';
		nextPutAll: '1';
		nextPutAll: '1'])) isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test143 [
	| re re2 |
	re := Re on: '^(a|(bc))de(f)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'adef';
		nextPutAll: '1';
		nextPutAll: '2';
		nextPutAll: '3';
		nextPutAll: '4'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'bcdef';
		nextPutAll: '1';
		nextPutAll: '2';
		nextPutAll: '3';
		nextPutAll: '4'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'adefghijk';
		nextPutAll: '0'])) isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test144 [
	| re re2 |
	re := Re on: '^abc\00def'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: 8r00 asCharacter;
		nextPutAll: 'def';
		nextPutAll: '0'])) isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test145 [
	| re re2 |
	re := Re on: 'word ((?:[a-zA-Z0-9]+ )((?:[a-zA-Z0-9]+ )((?:[a-zA-Z0-9]+ )((?:[a-zA-Z0-9]+ 
)((?:[a-zA-Z0-9]+ )((?:[a-zA-Z0-9]+ )((?:[a-zA-Z0-9]+ )((?:[a-zA-Z0-9]+ 
)?)?)?)?)?)?)?)?)?otherword'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test146 [
	| re re2 |
	re := Re on: '.*X'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test147 [
	| re re2 |
	re := Re on: '.*X'.
	re
		beStrangeOption;
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test148 [
	| re re2 |
	re := Re on: '(.*X|^B)'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test149 [
	| re re2 |
	re := Re on: '(.*X|^B)'.
	re
		beStrangeOption;
		beDotIncludesNewline.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test15 [
	| re |
	re := Re on: '[z-a]'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test150 [
	| re re2 |
	re := Re on: '(?s)(.*X|^B)'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test151 [
	| re re2 |
	re := Re on: '(?s:.*X|^B)'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test152 [
	| re re2 |
	re := Re on: '\Biss\B'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Mississippi') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test153 [
	| re re2 |
	re := Re on: '\Biss\B'.
	re
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Mississippi') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test154 [
	| re re2 |
	re := Re on: 'iss'.
	re
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Mississippi') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test155 [
	| re re2 |
	re := Re on: '\Biss\B'.
	re
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Mississippi') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test156 [
	| re re2 |
	re := Re on: '\Biss\B'.
	re
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Mississippi') isNil not.
	re2 := re copy beAnchored.
	self assert: (re2 search: 'Mississippi') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test157 [
	| re re2 |
	re := Re on: '(?<=[Ms])iss'.
	re
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Mississippi') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test158 [
	| re re2 |
	re := Re on: '(?<=[Ms])iss'.
	re
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Mississippi') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test159 [
	| re re2 |
	re := Re on: '^iss'.
	re
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ississippi') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test16 [
	| re |
	re := Re on: '^*'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test160 [
	| re re2 |
	re := Re on: '.*iss'.
	re
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abciss';
		nextPut: Character cr;
		nextPutAll: 'xyzisspqr'])) isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test161 [
	| re re2 |
	re := Re on: '.i.'.
	re
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Mississippi') isNil not.
	re2 := re copy beAnchored.
	self assert: (re2 search: 'Mississippi') isNil not.
	self assert: (re search: 'Missouri river') isNil not.
	re2 := re copy beAnchored.
	self assert: (re2 search: 'Missouri river') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test162 [
	| re re2 |
	re := Re on: '^.is'.
	re
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Mississippi') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test163 [
	| re re2 |
	re := Re on: '^ab\n'.
	re
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'ab';
		nextPut: Character cr;
		nextPutAll: 'ab';
		nextPut: Character cr;
		nextPutAll: 'cd'])) isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test164 [
	| re re2 |
	re := Re on: '^ab\n'.
	re
		beMultiline;
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'ab';
		nextPut: Character cr;
		nextPutAll: 'ab';
		nextPut: Character cr;
		nextPutAll: 'cd'])) isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test165 [
	| re re2 |
	re := Re on: 'abc'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test166 [
	| re re2 |
	re := Re on: 'abc|bac'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test167 [
	| re re2 |
	re := Re on: '(abc|bac)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test168 [
	| re re2 |
	re := Re on: '(abc|(c|dc))'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test169 [
	| re re2 |
	re := Re on: '(abc|(d|de)c)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test17 [
	| re |
	re := Re on: '(abc'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test170 [
	| re re2 |
	re := Re on: 'a*'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test171 [
	| re re2 |
	re := Re on: 'a+'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test172 [
	| re re2 |
	re := Re on: '(baa|a+)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test173 [
	| re re2 |
	re := Re on: 'a{0,3}'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test174 [
	| re re2 |
	re := Re on: 'baa{3,}'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test175 [
	| re re2 |
	re := Re on: '"([^\\"]+|\\.)*"'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test176 [
	| re re2 |
	re := Re on: '(abc|ab[cd])'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test177 [
	| re re2 |
	re := Re on: '(a|.)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test178 [
	| re re2 |
	re := Re on: 'a|ba|\w'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test179 [
	| re re2 |
	re := Re on: 'abc(?=pqr)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test18 [
	| re |
	re := Re on: '(?# abc'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test180 [
	| re re2 |
	re := Re on: '...(?<=abc)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test181 [
	| re re2 |
	re := Re on: 'abc(?!pqr)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test182 [
	| re re2 |
	re := Re on: 'ab.'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test183 [
	| re re2 |
	re := Re on: 'ab[xyz]'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test184 [
	| re re2 |
	re := Re on: 'abc*'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test185 [
	| re re2 |
	re := Re on: 'ab.c*'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test186 [
	| re re2 |
	re := Re on: 'a.c*'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test187 [
	| re re2 |
	re := Re on: '.c*'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test188 [
	| re re2 |
	re := Re on: 'ac*'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test189 [
	| re re2 |
	re := Re on: '(a.c*|b.c*)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test19 [
	| re |
	re := Re on: '(?z)abc'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test190 [
	| re re2 |
	re := Re on: 'a.c*|aba'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test191 [
	| re re2 |
	re := Re on: '.+a'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test192 [
	| re re2 |
	re := Re on: '(?=abcda)a.*'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test193 [
	| re re2 |
	re := Re on: '(?=a)a.*'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test194 [
	| re re2 |
	re := Re on: 'a(b)*'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test195 [
	| re re2 |
	re := Re on: 'a\d*'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test196 [
	| re re2 |
	re := Re on: 'ab\d*'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test197 [
	| re re2 |
	re := Re on: 'a(\d)*'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test198 [
	| re re2 |
	re := Re on: 'abcde{0,0}'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test199 [
	| re re2 |
	re := Re on: 'ab\d+'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test2 [
	| re re2 |
	re := Re on: 'abc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'defabc') isNil not.
	re2 := re copy beAnchored.
	self assert: (re2 search: 'abc') isNil not.
	re2 := re copy beAnchored.
	self assert: (re2 search: 'defabc') isNil.
	self assert: (re search: 'ABC') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test20 [
	| re re2 |
	re := Re on: '.*b'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test200 [
	| re re2 |
	re := Re on: 'a(?(1)b)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test201 [
	| re re2 |
	re := Re on: 'a(?(1)bag|big)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test202 [
	| re re2 |
	re := Re on: 'a(?(1)bag|big)*'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test203 [
	| re re2 |
	re := Re on: 'a(?(1)bag|big)+'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test204 [
	| re re2 |
	re := Re on: 'a(?(1)b..|b..)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test205 [
	| re re2 |
	re := Re on: 'ab\d{0}e'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test206 [
	| re |
	re := Re on: 'a?b?'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.
	self assert: (re search: 'b') isNil not.
	self assert: (re search: 'ab') isNil not.
	self assert: (re search: '\') isNil not.
	self assert: (re search: 'xy') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test207 [
	| re |
	re := Re on: '|-'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.
	self assert: (re search: '-abc') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test208 [
	| re |
	re := Re on: 'a*(b+)(z)(z)'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaaabbbbzzzz') isNil not.
]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test209 [
	| re re2 |
	re := Re on: '^.?abcd'.
	re
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test21 [
	| re re2 |
	re := Re on: '.*?b'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test210 [
	| re re2 |
	re := Re on: '\(             # ( at start
  (?:           # Non-capturing bracket
  (?>[^()]+)    # Either a sequence of non-brackets (no backtracking)
  |             # Or
  (?R)          # Recurse - i.e. nested bracketed string
  )*            # Zero or more contents
  \)            # Closing )
  '.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(abcd)') isNil not.
	self assert: (re search: '(abcd)xyz') isNil not.
	self assert: (re search: 'xyz(abcd)') isNil not.
	self assert: (re search: '(ab(xy)cd)pqr') isNil not.
	self assert: (re search: '(ab(xycd)pqr') isNil not.
	self assert: (re search: '() abc ()') isNil not.
	self assert: (re search: '12(abcde(fsh)xyz(foo(bar))lmno)89') isNil not.
	self assert: (re search: 'abcd') isNil.
	self assert: (re search: 'abcd)') isNil.
	self assert: (re search: '(abcd') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test211 [
	| re re2 |
	re := Re on: '\(  ( (?>[^()]+) | (?R) )* \) '.
	re
		beExtended;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(ab(xy)cd)pqr') isNil not.
	self assert: (re search: '1(abcd)(x(y)z)pqr') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test212 [
	| re re2 |
	re := Re on: '\(  (?: (?>[^()]+) | (?R) ) \) '.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(abcd)') isNil not.
	self assert: (re search: '(ab(xy)cd)') isNil not.
	self assert: (re search: '(a(b(c)d)e)') isNil not.
	self assert: (re search: '((ab))') isNil not.
	self assert: (re search: '()') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test213 [
	| re re2 |
	re := Re on: '\(  (?: (?>[^()]+) | (?R) )? \) '.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '()') isNil not.
	self assert: (re search: '12(abcde(fsh)xyz(foo(bar))lmno)89') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test214 [
	| re re2 |
	re := Re on: '\(  ( (?>[^()]+) | (?R) )* \) '.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(ab(xy)cd)') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test215 [
	| re re2 |
	re := Re on: '\( ( ( (?>[^()]+) | (?R) )* ) \) '.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(ab(xy)cd)') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test216 [
	| re re2 |
	re := Re on: '\( (123)? ( ( (?>[^()]+) | (?R) )* ) \) '.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(ab(xy)cd)') isNil not.
	self assert: (re search: '(123ab(xy)cd)') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test217 [
	| re re2 |
	re := Re on: '\( ( (123)? ( (?>[^()]+) | (?R) )* ) \) '.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(ab(xy)cd)') isNil not.
	self assert: (re search: '(123ab(xy)cd)') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test218 [
	| re re2 |
	re := Re on: '\( (((((((((( ( (?>[^()]+) | (?R) )* )))))))))) \) '.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(ab(xy)cd)') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test219 [
	| re re2 |
	re := Re on: '\( ( ( (?>[^()<>]+) | ((?>[^()]+)) | (?R) )* ) \) '.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(abcd(xyz<p>qrs)123)') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test22 [
	| re re2 |
	re := Re on: 'cat|dog|elephant'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'this sentence eventually mentions a cat') isNil not.
	self assert: (re search: 'this sentences rambles on and on for a while and then reaches elephant') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test220 [
	| re re2 |
	re := Re on: '\( ( ( (?>[^()]+) | ((?R)) )* ) \) '.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(ab(cd)ef)') isNil not.
	self assert: (re search: '(ab(cd(ef)gh)ij)') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test221 [
	| re re2 |
	re := Re on: '^[[:alnum:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test222 [
	| re re2 |
	re := Re on: '^[[:alpha:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test223 [
	| re re2 |
	re := Re on: '^[[:ascii:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test224 [
	| re re2 |
	re := Re on: '^[[:cntrl:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test225 [
	| re re2 |
	re := Re on: '^[[:digit:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test226 [
	| re re2 |
	re := Re on: '^[[:graph:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test227 [
	| re re2 |
	re := Re on: '^[[:lower:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test228 [
	| re re2 |
	re := Re on: '^[[:print:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test229 [
	| re re2 |
	re := Re on: '^[[:punct:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test23 [
	| re re2 |
	re := Re on: 'cat|dog|elephant'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'this sentence eventually mentions a cat') isNil not.
	self assert: (re search: 'this sentences rambles on and on for a while and then reaches elephant') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test230 [
	| re re2 |
	re := Re on: '^[[:space:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test231 [
	| re re2 |
	re := Re on: '^[[:upper:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test232 [
	| re re2 |
	re := Re on: '^[[:xdigit:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test233 [
	| re re2 |
	re := Re on: '^[[:word:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test234 [
	| re re2 |
	re := Re on: '^[[:^cntrl:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test235 [
	| re re2 |
	re := Re on: '^[12[:^digit:]]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test236 [
	| re re2 |
	re := Re on: '[01[:alpha:]%]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test237 [
	| re |
	re := Re on: '[[.ch.]]'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test238 [
	| re |
	re := Re on: '[[=ch=]]'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test239 [
	| re |
	re := Re on: '[[:rhubarb:]]'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test24 [
	| re re2 |
	re := Re on: 'cat|dog|elephant'.
	re
		beNotCaseSensitive;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'this sentence eventually mentions a CAT cat') isNil not.
	self assert: (re search: 'this sentences rambles on and on for a while to elephant ElePhant') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test240 [
	| re re2 |
	re := Re on: '[[:upper:]]'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'A') isNil not.
	self assert: (re search: 'a') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test241 [
	| re re2 |
	re := Re on: '[[:lower:]]'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'A') isNil not.
	self assert: (re search: 'a') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test242 [
	| re re2 |
	re := Re on: '((?-i)[[:lower:]])[[:lower:]]'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.
	self assert: (re search: 'aB') isNil not.
	self assert: (re search: 'Ab') isNil.
	self assert: (re search: 'AB') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test243 [
	| re |
	re := Re on: '[\200-\410]'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test244 [
	| re |
	re := Re on: '^(?(0)f|b)oo'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test245 [
	| re re2 |
	re := Re on: '(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\w+)\s+(\270)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '\O900 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255 256 257 258 259 260 261 262 263 264 265 266 267 268 269 ABC ABC') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test246 [
	| re re2 |
	re := Re on: '(main(O)?)+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'mainmain') isNil not.
	self assert: (re search: 'mainOmain') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test247 [
	| re re2 |
	re := Re on: ' End of testinput2 '.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test248 [
	| re |
	re := Re on: 'This one''s here because of the large output vector needed.'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test249 [
	| re |
	re := Re on: '(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\d+(?:\s|$))(\w+)\s+(\270)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '\O900 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255 256 257 258 259 260 261 262 263 264 265 266 267 268 269 ABC ABC') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test25 [
	| re re2 |
	re := Re on: 'a|[bcd]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test250 [
	| re |
	re := Re on: 'This one''s here because Perl does this differently and PCRE can''t at present'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test251 [
	| re |
	re := Re on: '(main(O)?)+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'mainmain') isNil not.
	self assert: (re search: 'mainOmain') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test252 [
	| re |
	re := Re on: ' End of testinput2 '.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test26 [
	| re re2 |
	re := Re on: '(a|[^\dZ])'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test27 [
	| re re2 |
	re := Re on: '(a|b)*[\s]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test28 [
	| re |
	re := Re on: '(ab\2)'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test29 [
	| re |
	re := Re on: '{4,5}abc'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test3 [
	| re re2 |
	re := Re on: '^abc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	re2 := re copy beAnchored.
	self assert: (re2 search: 'abc') isNil not.
	self assert: (re search: 'defabc') isNil.
	re2 := re copy beAnchored.
	self assert: (re2 search: 'defabc') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test30 [
	| re re2 |
	re := Re on: '(a)(b)(c)\2'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcb') isNil not.
	self assert: (re search: '\O0abcb') isNil not.
	self assert: (re search: '\O3abcb') isNil not.
	self assert: (re search: '\O6abcb') isNil not.
	self assert: (re search: '\O9abcb') isNil not.
	self assert: (re search: '\O12abcb') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test31 [
	| re re2 |
	re := Re on: '(a)bc|(a)(b)\2'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: '\O0abc') isNil not.
	self assert: (re search: '\O3abc') isNil not.
	self assert: (re search: '\O6abc') isNil not.
	self assert: (re search: 'aba') isNil not.
	self assert: (re search: '\O0aba') isNil not.
	self assert: (re search: '\O3aba') isNil not.
	self assert: (re search: '\O6aba') isNil not.
	self assert: (re search: '\O9aba') isNil not.
	self assert: (re search: '\O12aba') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test32 [
	| re re2 |
	re := Re on: 'abc$'.
	re
		beDollarEndOnly.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr])) isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'def'])) isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test33 [
	| re |
	re := Re on: '(a)(b)(c)(d)(e)\6'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test34 [
	| re re2 |
	re := Re on: 'the quick brown fox'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'the quick brown fox') isNil not.
	self assert: (re search: 'this is a line with the quick brown fox') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test35 [
	| re re2 |
	re := Re on: 'the quick brown fox'.
	re
		beAnchored.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'the quick brown fox') isNil not.
	self assert: (re search: 'this is a line with the quick brown fox') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test36 [
	| re |
	re := Re on: 'ab(?z)cd'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test37 [
	| re re2 |
	re := Re on: '^abc|def'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcdef') isNil not.
	re2 := re copy beNotBeginningOfLine.
	self assert: (re2 search: 'abcdef') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test38 [
	| re re2 |
	re := Re on: '.*((abc)$|(def))'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'defabc') isNil not.
	re2 := re copy beNotEndOfLine.
	self assert: (re2 search: 'defabc') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test39 [
	| re re2 |
	re := Re on: 'abc'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test4 [
	| re re2 |
	re := Re on: 'a+bc'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test40 [
	| re re2 |
	re := Re on: '^abc|def'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcdef') isNil not.
	re2 := re copy beNotBeginningOfLine.
	self assert: (re2 search: 'abcdef') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test41 [
	| re re2 |
	re := Re on: '.*((abc)$|(def))'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'defabc') isNil not.
	re2 := re copy beNotEndOfLine.
	self assert: (re2 search: 'defabc') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test42 [
	| re re2 |
	re := Re on: 'the quick brown fox'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'the quick brown fox') isNil not.
	self assert: (re search: 'The Quick Brown Fox') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test43 [
	| re re2 |
	re := Re on: 'the quick brown fox'.
	re
		beStrangeOption;
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'the quick brown fox') isNil not.
	self assert: (re search: 'The Quick Brown Fox') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test44 [
	| re re2 |
	re := Re on: 'abc.def'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'def'])) isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test45 [
	| re re2 |
	re := Re on: 'abc$'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test46 [
	| re |
	re := Re on: '(abc)\2'.
	re
		beStrangeOption.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test47 [
	| re |
	re := Re on: '(abc\1)'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test48 [
	| re |
	re := Re on: ')'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test49 [
	| re |
	re := Re on: 'a[]b'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test5 [
	| re re2 |
	re := Re on: 'a*bc'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test50 [
	| re re2 |
	re := Re on: '[^aeiou ]{3,}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'co-processors, and for') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test51 [
	| re re2 |
	re := Re on: '<.*>'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc<def>ghi<klm>nop') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test52 [
	| re re2 |
	re := Re on: '<.*?>'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc<def>ghi<klm>nop') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test53 [
	| re re2 |
	re := Re on: '<.*>'.
	re
		beNotGreedy.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc<def>ghi<klm>nop') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test54 [
	| re re2 |
	re := Re on: '<.*>(?U)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc<def>ghi<klm>nop') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test55 [
	| re re2 |
	re := Re on: '<.*?>'.
	re
		beNotGreedy.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc<def>ghi<klm>nop') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test56 [
	| re re2 |
	re := Re on: '={3,}'.
	re
		beNotGreedy.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc========def') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test57 [
	| re re2 |
	re := Re on: '(?U)={3,}?'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc========def') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test58 [
	| re re2 |
	re := Re on: '(?<!bar|cattle)foo'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'foo') isNil not.
	self assert: (re search: 'catfoo') isNil not.
	self assert: (re search: 'the barfoo') isNil.
	self assert: (re search: 'and cattlefoo') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test59 [
	| re |
	re := Re on: '(?<=a+)b'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test6 [
	| re re2 |
	re := Re on: 'a{3}bc'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test60 [
	| re |
	re := Re on: '(?<=aaa|b{0,3})b'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test61 [
	| re |
	re := Re on: '(?<!(foo)a\1)bar'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test62 [
	| re re2 |
	re := Re on: '(?i)abc'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test63 [
	| re re2 |
	re := Re on: '(a|(?m)a)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test64 [
	| re re2 |
	re := Re on: '(?i)^1234'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test65 [
	| re re2 |
	re := Re on: '(^b|(?i)^d)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test66 [
	| re re2 |
	re := Re on: '(?s).*'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test67 [
	| re re2 |
	re := Re on: '[abcd]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test68 [
	| re re2 |
	re := Re on: '(?i)[abcd]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test69 [
	| re re2 |
	re := Re on: '(?m)[xy]|(b|c)'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test7 [
	| re re2 |
	re := Re on: '(abc|a+z)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test70 [
	| re re2 |
	re := Re on: '(^a|^b)'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test71 [
	| re re2 |
	re := Re on: '(?i)(^a|^b)'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test72 [
	| re |
	re := Re on: '(a)(?(1)a|b|c)'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test73 [
	| re |
	re := Re on: '(?(?=a)a|b|c)'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test74 [
	| re |
	re := Re on: '(?(1a)'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test75 [
	| re |
	re := Re on: '(?(?i))'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test76 [
	| re |
	re := Re on: '(?(abc))'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test77 [
	| re |
	re := Re on: '(?(?<ab))'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test78 [
	| re re2 |
	re := Re on: '((?s)blah)\s+\1'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test79 [
	| re re2 |
	re := Re on: '((?i)blah)\s+\1'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test8 [
	| re re2 |
	re := Re on: '^abc$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'def';
		nextPut: Character cr;
		nextPutAll: 'abc'])) isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test80 [
	| re re2 |
	re := Re on: '((?i)b)'.
	re
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test81 [
	| re re2 |
	re := Re on: '(a*b|(?i:c*(?-i)d))'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test82 [
	| re re2 |
	re := Re on: 'a$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr])) isNil not.
	re2 := re copy beNotEndOfLine.
	self assert: (re2 search: 'a') isNil.
	re2 := re copy beNotEndOfLine.
	self assert: (re2 search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr])) isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test83 [
	| re re2 |
	re := Re on: 'a$'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr])) isNil not.
	re2 := re copy beNotEndOfLine.
	self assert: (re2 search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr])) isNil not.
	re2 := re copy beNotEndOfLine.
	self assert: (re2 search: 'a') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test84 [
	| re re2 |
	re := Re on: '\Aabc'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test85 [
	| re re2 |
	re := Re on: '^abc'.
	re
		beMultiline;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test86 [
	| re re2 |
	re := Re on: '^((a+)(?U)([ab]+)(?-U)([bc]+)(\w*))'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaaaabbbbbcccccdef') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test87 [
	| re re2 |
	re := Re on: '(?<=foo)[ab]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test88 [
	| re re2 |
	re := Re on: '(?<!foo)(alpha|omega)'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test89 [
	| re re2 |
	re := Re on: '(?!alphabet)[ab]'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test9 [
	| re |
	re := Re on: 'ab\gdef'.
	re
		beExtra.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test90 [
	| re re2 |
	re := Re on: '(?<=foo\n)^bar'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test91 [
	| re re2 |
	re := Re on: '(?>^abc)'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'def';
		nextPut: Character cr;
		nextPutAll: 'abc'])) isNil not.
	self assert: (re search: 'defabc') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test92 [
	| re |
	re := Re on: '(?<=ab(c+)d)ef'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test93 [
	| re |
	re := Re on: '(?<=ab(?<=c+)d)ef'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test94 [
	| re |
	re := Re on: '(?<=ab(c|de)f)g'.
	self should: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test95 [
	| re re2 |
	re := Re on: 'The next three are in testinput2 because they have variable length branches'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test96 [
	| re re2 |
	re := Re on: '(?<=bullock|donkey)-cart'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'the bullock-cart') isNil not.
	self assert: (re search: 'a donkey-cart race') isNil not.
	self assert: (re search: 'cart') isNil.
	self assert: (re search: 'horse-and-cart') isNil.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test97 [
	| re re2 |
	re := Re on: '(?<=ab(?i)x|y|z)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test98 [
	| re re2 |
	re := Re on: '(?>.*)(?<=(abcd)|(xyz))'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'alphabetabcd') isNil not.
	self assert: (re search: 'endingxyz') isNil not.

]

{ #category : #newTestSuite2 }
ReTest >> testNewSuite2test99 [
	| re re2 |
	re := Re on: '(?<=ab(?i)x(?-i)y|(?i)z|b)ZZ'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abxyZZ') isNil not.
	self assert: (re search: 'abXyZZ') isNil not.
	self assert: (re search: 'ZZZ') isNil not.
	self assert: (re search: 'zZZ') isNil not.
	self assert: (re search: 'bZZ') isNil not.
	self assert: (re search: 'BZZ') isNil not.
	self assert: (re search: 'ZZ') isNil.
	self assert: (re search: 'abXYZZ') isNil.
	self assert: (re search: 'zzz') isNil.
	self assert: (re search: 'bzz') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test1 [
	| re re2 |
	re := Re on: '(?<!bar)foo'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'foo') isNil not.
	self assert: (re search: 'catfood') isNil not.
	self assert: (re search: 'arfootle') isNil not.
	self assert: (re search: 'rfoosh') isNil not.
	self assert: (re search: 'barfoo') isNil.
	self assert: (re search: 'towbarfoo') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test10 [
	| re re2 |
	re := Re on: '((?>\d+))(\w)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '12345a') isNil not.
	self assert: (re search: '12345+') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test100 [
	| re re2 |
	re := Re on: 'a[^-b]c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'adc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test101 [
	| re |
	re := Re on: 'a[^]b]c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'adc') isNil not.
	self assert: (re search: 'a-c') isNil not.
	self assert: (re search: 'a]c') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test102 [
	| re re2 |
	re := Re on: '\ba\b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a-') isNil not.
	self assert: (re search: '-a') isNil not.
	self assert: (re search: '-a-') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test103 [
	| re re2 |
	re := Re on: '\by\b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'xy') isNil.
	self assert: (re search: 'yz') isNil.
	self assert: (re search: 'xyz') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test104 [
	| re re2 |
	re := Re on: '\Ba\B'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a-') isNil.
	self assert: (re search: '-a') isNil.
	self assert: (re search: '-a-') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test105 [
	| re re2 |
	re := Re on: '\By\b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'xy') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test106 [
	| re re2 |
	re := Re on: '\by\B'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'yz') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test107 [
	| re re2 |
	re := Re on: '\By\B'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'xyz') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test108 [
	| re re2 |
	re := Re on: '\w'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test109 [
	| re |
	re := Re on: '\W'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '-') isNil not.
	self assert: (re search: 'a') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test11 [
	| re re2 |
	re := Re on: '(?>a+)b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test110 [
	| re re2 |
	re := Re on: 'a\sb'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a b') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test111 [
	| re |
	re := Re on: 'a\Sb'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a-b') isNil not.
	self assert: (re search: 'a b') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test112 [
	| re re2 |
	re := Re on: '\d'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '1') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test113 [
	| re |
	re := Re on: '\D'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '-') isNil not.
	self assert: (re search: '1') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test114 [
	| re re2 |
	re := Re on: '[\w]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test115 [
	| re |
	re := Re on: '[\W]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '-') isNil not.
	self assert: (re search: 'a') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test116 [
	| re re2 |
	re := Re on: 'a[\s]b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a b') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test117 [
	| re |
	re := Re on: 'a[\S]b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a-b') isNil not.
	self assert: (re search: 'a b') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test118 [
	| re re2 |
	re := Re on: '[\d]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '1') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test119 [
	| re |
	re := Re on: '[\D]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '-') isNil not.
	self assert: (re search: '1') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test12 [
	| re re2 |
	re := Re on: '((?>a+)b)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test120 [
	| re re2 |
	re := Re on: 'ab|cd'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'abcd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test121 [
	| re re2 |
	re := Re on: '()ef'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'def') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test122 [
	| re re2 |
	re := Re on: '$b'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test123 [
	| re re2 |
	re := Re on: 'a\(b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a(b') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test124 [
	| re re2 |
	re := Re on: 'a\(*b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.
	self assert: (re search: 'a((b') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test125 [
	| re |
	re := Re on: 'a\\b'.
	self shouldnt: [re compile] raise: Error.
	self assert: ('a\b') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test126 [
	| re re2 |
	re := Re on: '((a))'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test127 [
	| re re2 |
	re := Re on: '(a)b(c)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test128 [
	| re re2 |
	re := Re on: 'a+b+c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aabbabc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test129 [
	| re re2 |
	re := Re on: 'a{1,}b{1,}c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aabbabc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test13 [
	| re re2 |
	re := Re on: '(?>(a+))b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test130 [
	| re re2 |
	re := Re on: 'a.+?c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcabc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test131 [
	| re re2 |
	re := Re on: '(a+|b)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test132 [
	| re re2 |
	re := Re on: '(a+|b){0,}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test133 [
	| re re2 |
	re := Re on: '(a+|b)+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test134 [
	| re re2 |
	re := Re on: '(a+|b){1,}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test135 [
	| re re2 |
	re := Re on: '(a+|b)?'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test136 [
	| re re2 |
	re := Re on: '(a+|b){0,1}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test137 [
	| re re2 |
	re := Re on: '[^ab]*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'cde') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test138 [
	| re re2 |
	re := Re on: 'abc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'b') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test139 [
	| re re2 |
	re := Re on: '/a*/'.
	re
		beStrangeOption;
		beStrangeOption;
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test14 [
	| re re2 |
	re := Re on: '(?>b)+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaabbbccc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test140 [
	| re re2 |
	re := Re on: '([abc])*d'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abbbcd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test141 [
	| re re2 |
	re := Re on: '([abc])*bcd'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test142 [
	| re re2 |
	re := Re on: 'a|b|c|d|e'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'e') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test143 [
	| re re2 |
	re := Re on: '(a|b|c|d|e)f'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ef') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test144 [
	| re re2 |
	re := Re on: 'abcd*efg'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcdefg') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test145 [
	| re re2 |
	re := Re on: 'ab*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'xabyabbbz') isNil not.
	self assert: (re search: 'xayabbbz') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test146 [
	| re re2 |
	re := Re on: '(ab|cd)e'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcde') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test147 [
	| re re2 |
	re := Re on: '[abhgefdc]ij'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'hij') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test148 [
	| re re2 |
	re := Re on: '^(ab|cd)e'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test149 [
	| re re2 |
	re := Re on: '(abc|)ef'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcdef') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test15 [
	| re re2 |
	re := Re on: '(?>a+|b+|c+)*c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaabbbbccccd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test150 [
	| re re2 |
	re := Re on: '(a|b)c*d'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test151 [
	| re re2 |
	re := Re on: '(ab|ab*)bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test152 [
	| re re2 |
	re := Re on: 'a([bc]*)c*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test153 [
	| re re2 |
	re := Re on: 'a([bc]*)(c*d)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test154 [
	| re re2 |
	re := Re on: 'a([bc]+)(c*d)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test155 [
	| re re2 |
	re := Re on: 'a([bc]*)(c+d)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test156 [
	| re re2 |
	re := Re on: 'a[bcd]*dcdcde'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'adcdcde') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test157 [
	| re re2 |
	re := Re on: 'a[bcd]+dcdcde'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcde') isNil.
	self assert: (re search: 'adcdcde') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test158 [
	| re re2 |
	re := Re on: '(ab|a)b*c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test159 [
	| re re2 |
	re := Re on: '((a)(b)c)(d)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test16 [
	| re re2 |
	re := Re on: '((?>[^()]+)|\([^()]*\))+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '((abc(ade)ufh()()x') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test160 [
	| re re2 |
	re := Re on: '[a-zA-Z_][a-zA-Z0-9_]*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'alpha') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test161 [
	| re re2 |
	re := Re on: '^a(bc+|b[eh])g|.h$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abh') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test162 [
	| re re2 |
	re := Re on: '(bc+d$|ef*g.|h?i(j|k))'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'effgz') isNil not.
	self assert: (re search: 'ij') isNil not.
	self assert: (re search: 'reffgz') isNil not.
	self assert: (re search: 'effg') isNil.
	self assert: (re search: 'bcdd') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test163 [
	| re re2 |
	re := Re on: '((((((((((a))))))))))'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test164 [
	| re re2 |
	re := Re on: '((((((((((a))))))))))\10'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aa') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test165 [
	| re re2 |
	re := Re on: '(((((((((a)))))))))'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test166 [
	| re re2 |
	re := Re on: 'multiple words of text'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aa') isNil.
	self assert: (re search: 'uh-uh') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test167 [
	| re re2 |
	re := Re on: 'multiple words'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'multiple words, yeah') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test168 [
	| re re2 |
	re := Re on: '(.*)c(.*)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcde') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test169 [
	| re re2 |
	re := Re on: '\((.*), (.*)\)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(a, b)') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test17 [
	| re re2 |
	re := Re on: '\(((?>[^()]+)|\([^()]+\))+\)'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(abc)') isNil not.
	self assert: (re search: '(abc(def)xyz)') isNil not.
	self assert: (re search: '((()aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test170 [
	| re re2 |
	re := Re on: '[k]'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test171 [
	| re re2 |
	re := Re on: 'abcd'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test172 [
	| re re2 |
	re := Re on: 'a(bc)d'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test173 [
	| re re2 |
	re := Re on: 'a[-]?c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ac') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test174 [
	| re re2 |
	re := Re on: '(abc)\1'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcabc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test175 [
	| re re2 |
	re := Re on: '([a-c]*)\1'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcabc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test176 [
	| re |
	re := Re on: '(a)|\1'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.
	self assert: (re search: 'ab') isNil not.
	self assert: (re search: 'x') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test177 [
	| re re2 |
	re := Re on: '(([a-c])b*?\2)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ababbbcbc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test178 [
	| re re2 |
	re := Re on: '(([a-c])b*?\2){3}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ababbbcbc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test179 [
	| re re2 |
	re := Re on: '((\3|b)\2(a)x)+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaaxabaxbaaxbbax') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test18 [
	| re re2 |
	re := Re on: 'a(?-i)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.
	self assert: (re search: 'Ab') isNil.
	self assert: (re search: 'aB') isNil.
	self assert: (re search: 'AB') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test180 [
	| re re2 |
	re := Re on: '((\3|b)\2(a)){2,}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'bbaababbabaaaaabbaaaabba') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test181 [
	| re re2 |
	re := Re on: 'abc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.
	self assert: (re search: 'XABCY') isNil not.
	self assert: (re search: 'ABABC') isNil not.
	self assert: (re search: 'aaxabxbaxbbx') isNil.
	self assert: (re search: 'XBC') isNil.
	self assert: (re search: 'AXC') isNil.
	self assert: (re search: 'ABX') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test182 [
	| re re2 |
	re := Re on: 'ab*c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test183 [
	| re re2 |
	re := Re on: 'ab*bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.
	self assert: (re search: 'ABBC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test184 [
	| re re2 |
	re := Re on: 'ab*?bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABBBBC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test185 [
	| re re2 |
	re := Re on: 'ab{0,}?bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABBBBC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test186 [
	| re re2 |
	re := Re on: 'ab+?bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABBC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test187 [
	| re re2 |
	re := Re on: 'ab+bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil.
	self assert: (re search: 'ABQ') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test188 [
	| re re2 |
	re := Re on: 'ab{1,}bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test189 [
	| re re2 |
	re := Re on: 'ab+bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABBBBC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test19 [
	| re re2 |
	re := Re on: '(a (?x)b c)d e'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a bcd e') isNil not.
	self assert: (re search: 'a b cd e') isNil.
	self assert: (re search: 'abcd e') isNil.
	self assert: (re search: 'a bcde') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test190 [
	| re re2 |
	re := Re on: 'ab{1,}?bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABBBBC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test191 [
	| re re2 |
	re := Re on: 'ab{1,3}?bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABBBBC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test192 [
	| re re2 |
	re := Re on: 'ab{3,4}?bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABBBBC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test193 [
	| re re2 |
	re := Re on: 'ab{4,5}?bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABQ') isNil.
	self assert: (re search: 'ABBBBC') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test194 [
	| re re2 |
	re := Re on: 'ab??bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABBC') isNil not.
	self assert: (re search: 'ABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test195 [
	| re re2 |
	re := Re on: 'ab{0,1}?bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test196 [
	| re re2 |
	re := Re on: 'ab??bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test197 [
	| re re2 |
	re := Re on: 'ab??c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test198 [
	| re re2 |
	re := Re on: 'ab{0,1}?c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test199 [
	| re re2 |
	re := Re on: '^abc$'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.
	self assert: (re search: 'ABBBBC') isNil.
	self assert: (re search: 'ABCC') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test2 [
	| re re2 |
	re := Re on: '\w{3}(?<!bar)foo'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'catfood') isNil not.
	self assert: (re search: 'foo') isNil.
	self assert: (re search: 'barfoo') isNil.
	self assert: (re search: 'towbarfoo') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test20 [
	| re re2 |
	re := Re on: '(a b(?x)c d (?-x)e f)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a bcde f') isNil not.
	self assert: (re search: 'abcdef') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test200 [
	| re re2 |
	re := Re on: '^abc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test201 [
	| re re2 |
	re := Re on: '^abc$'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test202 [
	| re re2 |
	re := Re on: 'abc$'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test203 [
	| re re2 |
	re := Re on: '^'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test204 [
	| re re2 |
	re := Re on: '$'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test205 [
	| re re2 |
	re := Re on: 'a.c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.
	self assert: (re search: 'AXC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test206 [
	| re re2 |
	re := Re on: 'a.*?c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AXYZC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test207 [
	| re |
	re := Re on: 'a.*c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AABC') isNil not.
	self assert: (re search: 'AXYZD') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test208 [
	| re re2 |
	re := Re on: 'a[bc]d'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABD') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test209 [
	| re re2 |
	re := Re on: 'a[b-d]e'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ACE') isNil not.
	self assert: (re search: 'ABC') isNil.
	self assert: (re search: 'ABD') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test21 [
	| re re2 |
	re := Re on: '(a(?i)b)c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'aBc') isNil not.
	self assert: (re search: 'abC') isNil.
	self assert: (re search: 'aBC') isNil.
	self assert: (re search: 'Abc') isNil.
	self assert: (re search: 'ABc') isNil.
	self assert: (re search: 'ABC') isNil.
	self assert: (re search: 'AbC') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test210 [
	| re re2 |
	re := Re on: 'a[b-d]'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AAC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test211 [
	| re re2 |
	re := Re on: 'a[-b]'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'A-') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test212 [
	| re re2 |
	re := Re on: 'a[b-]'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'A-') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test213 [
	| re re2 |
	re := Re on: 'a]'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'A]') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test214 [
	| re re2 |
	re := Re on: 'a[]]b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'A]B') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test215 [
	| re re2 |
	re := Re on: 'a[^bc]d'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AED') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test216 [
	| re re2 |
	re := Re on: 'a[^-b]c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ADC') isNil not.
	self assert: (re search: 'ABD') isNil.
	self assert: (re search: 'A-C') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test217 [
	| re re2 |
	re := Re on: 'a[^]b]c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ADC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test218 [
	| re re2 |
	re := Re on: 'ab|cd'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.
	self assert: (re search: 'ABCD') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test219 [
	| re re2 |
	re := Re on: '()ef'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'DEF') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test22 [
	| re re2 |
	re := Re on: 'a(?i:b)c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'aBc') isNil not.
	self assert: (re search: 'ABC') isNil.
	self assert: (re search: 'abC') isNil.
	self assert: (re search: 'aBC') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test220 [
	| re re2 |
	re := Re on: '$b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'A]C') isNil.
	self assert: (re search: 'B') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test221 [
	| re re2 |
	re := Re on: 'a\(b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'A(B') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test222 [
	| re re2 |
	re := Re on: 'a\(*b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AB') isNil not.
	self assert: (re search: 'A((B') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test223 [
	| re re2 |
	re := Re on: 'a\\b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	re2 := re copy beNotBeginningOfLine.
	self assert: (re2 search: 'A') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test224 [
	| re re2 |
	re := Re on: '((a))'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test225 [
	| re re2 |
	re := Re on: '(a)b(c)'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test226 [
	| re re2 |
	re := Re on: 'a+b+c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AABBABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test227 [
	| re re2 |
	re := Re on: 'a{1,}b{1,}c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AABBABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test228 [
	| re re2 |
	re := Re on: 'a.+?c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test229 [
	| re re2 |
	re := Re on: 'a.*?c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test23 [
	| re re2 |
	re := Re on: 'a(?i:b)*c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aBc') isNil not.
	self assert: (re search: 'aBBc') isNil not.
	self assert: (re search: 'aBC') isNil.
	self assert: (re search: 'aBBC') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test230 [
	| re re2 |
	re := Re on: 'a.{0,5}?c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test231 [
	| re re2 |
	re := Re on: '(a+|b)*'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test232 [
	| re re2 |
	re := Re on: '(a+|b){0,}'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test233 [
	| re re2 |
	re := Re on: '(a+|b)+'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test234 [
	| re re2 |
	re := Re on: '(a+|b){1,}'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test235 [
	| re re2 |
	re := Re on: '(a+|b)?'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test236 [
	| re re2 |
	re := Re on: '(a+|b){0,1}'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test237 [
	| re re2 |
	re := Re on: '(a+|b){0,1}?'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test238 [
	| re re2 |
	re := Re on: '[^ab]*'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'CDE') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test239 [
	| re re2 |
	re := Re on: 'abc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test24 [
	| re re2 |
	re := Re on: 'a(?=b(?i)c)\w\wd'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.
	self assert: (re search: 'abCd') isNil not.
	self assert: (re search: 'aBCd') isNil.
	self assert: (re search: 'abcD') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test240 [
	| re re2 |
	re := Re on: 'a*'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test241 [
	| re re2 |
	re := Re on: '([abc])*d'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABBBCD') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test242 [
	| re re2 |
	re := Re on: '([abc])*bcd'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCD') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test243 [
	| re re2 |
	re := Re on: 'a|b|c|d|e'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'E') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test244 [
	| re re2 |
	re := Re on: '(a|b|c|d|e)f'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'EF') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test245 [
	| re re2 |
	re := Re on: 'abcd*efg'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCDEFG') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test246 [
	| re re2 |
	re := Re on: 'ab*'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'XABYABBBZ') isNil not.
	self assert: (re search: 'XAYABBBZ') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test247 [
	| re re2 |
	re := Re on: '(ab|cd)e'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCDE') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test248 [
	| re re2 |
	re := Re on: '[abhgefdc]ij'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'HIJ') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test249 [
	| re |
	re := Re on: '^(ab|cd)e'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCDE') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test25 [
	| re re2 |
	re := Re on: '(?s-i:more.*than).*million'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'more than million') isNil not.
	self assert: (re search: 'more than MILLION') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'more ';
		nextPut: Character cr;
		nextPutAll: ' than Million'])) isNil not.
	self assert: (re search: 'MORE THAN MILLION') isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'more ';
		nextPut: Character cr;
		nextPutAll: ' than ';
		nextPut: Character cr;
		nextPutAll: ' million'])) isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test250 [
	| re re2 |
	re := Re on: '(abc|)ef'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCDEF') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test251 [
	| re re2 |
	re := Re on: '(a|b)c*d'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCD') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test252 [
	| re re2 |
	re := Re on: '(ab|ab*)bc'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test253 [
	| re re2 |
	re := Re on: 'a([bc]*)c*'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test254 [
	| re re2 |
	re := Re on: 'a([bc]*)(c*d)'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCD') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test255 [
	| re re2 |
	re := Re on: 'a([bc]+)(c*d)'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCD') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test256 [
	| re re2 |
	re := Re on: 'a([bc]*)(c+d)'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCD') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test257 [
	| re re2 |
	re := Re on: 'a[bcd]*dcdcde'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ADCDCDE') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test258 [
	| re re2 |
	re := Re on: 'a[bcd]+dcdcde'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test259 [
	| re re2 |
	re := Re on: '(ab|a)b*c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test26 [
	| re re2 |
	re := Re on: '(?:(?s-i)more.*than).*million'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'more than million') isNil not.
	self assert: (re search: 'more than MILLION') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'more ';
		nextPut: Character cr;
		nextPutAll: ' than Million'])) isNil not.
	self assert: (re search: 'MORE THAN MILLION') isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'more ';
		nextPut: Character cr;
		nextPutAll: ' than ';
		nextPut: Character cr;
		nextPutAll: ' million'])) isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test260 [
	| re re2 |
	re := Re on: '((a)(b)c)(d)'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCD') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test261 [
	| re re2 |
	re := Re on: '[a-zA-Z_][a-zA-Z0-9_]*'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ALPHA') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test262 [
	| re re2 |
	re := Re on: '^a(bc+|b[eh])g|.h$'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABH') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test263 [
	| re re2 |
	re := Re on: '(bc+d$|ef*g.|h?i(j|k))'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'EFFGZ') isNil not.
	self assert: (re search: 'IJ') isNil not.
	self assert: (re search: 'REFFGZ') isNil not.
	self assert: (re search: 'ADCDCDE') isNil.
	self assert: (re search: 'EFFG') isNil.
	self assert: (re search: 'BCDD') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test264 [
	| re re2 |
	re := Re on: '((((((((((a))))))))))'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'A') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test265 [
	| re re2 |
	re := Re on: '((((((((((a))))))))))\10'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AA') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test266 [
	| re re2 |
	re := Re on: '(((((((((a)))))))))'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'A') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test267 [
	| re re2 |
	re := Re on: '(?:(?:(?:(?:(?:(?:(?:(?:(?:(a))))))))))'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'A') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test268 [
	| re re2 |
	re := Re on: '(?:(?:(?:(?:(?:(?:(?:(?:(?:(a|b|c))))))))))'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'C') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test269 [
	| re re2 |
	re := Re on: 'multiple words of text'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AA') isNil.
	self assert: (re search: 'UH-UH') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test27 [
	| re re2 |
	re := Re on: '(?>a(?i)b+)+c'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'aBbc') isNil not.
	self assert: (re search: 'aBBc') isNil not.
	self assert: (re search: 'Abc') isNil.
	self assert: (re search: 'abAb') isNil.
	self assert: (re search: 'abbC') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test270 [
	| re re2 |
	re := Re on: 'multiple words'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'MULTIPLE WORDS, YEAH') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test271 [
	| re re2 |
	re := Re on: '(.*)c(.*)'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCDE') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test272 [
	| re re2 |
	re := Re on: '\((.*), (.*)\)'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(A, B)') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test273 [
	| re re2 |
	re := Re on: '[k]'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test274 [
	| re re2 |
	re := Re on: 'abcd'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCD') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test275 [
	| re re2 |
	re := Re on: 'a(bc)d'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCD') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test276 [
	| re re2 |
	re := Re on: 'a[-]?c'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test277 [
	| re re2 |
	re := Re on: '(abc)\1'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test278 [
	| re re2 |
	re := Re on: '([a-c]*)\1'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ABCABC') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test279 [
	| re re2 |
	re := Re on: 'a(?!b).'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abad') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test28 [
	| re re2 |
	re := Re on: '(?=a(?i)b)\w\wc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'aBc') isNil not.
	self assert: (re search: 'Ab') isNil.
	self assert: (re search: 'abC') isNil.
	self assert: (re search: 'aBC') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test280 [
	| re re2 |
	re := Re on: 'a(?=d).'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abad') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test281 [
	| re re2 |
	re := Re on: 'a(?=c|d).'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abad') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test282 [
	| re re2 |
	re := Re on: 'a(?:b|c|d)(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ace') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test283 [
	| re re2 |
	re := Re on: 'a(?:b|c|d)*(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ace') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test284 [
	| re re2 |
	re := Re on: 'a(?:b|c|d)+?(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ace') isNil not.
	self assert: (re search: 'acdbcdbe') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test285 [
	| re re2 |
	re := Re on: 'a(?:b|c|d)+(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'acdbcdbe') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test286 [
	| re re2 |
	re := Re on: 'a(?:b|c|d){2}(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'acdbcdbe') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test287 [
	| re re2 |
	re := Re on: 'a(?:b|c|d){4,5}(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'acdbcdbe') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test288 [
	| re re2 |
	re := Re on: 'a(?:b|c|d){4,5}?(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'acdbcdbe') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test289 [
	| re re2 |
	re := Re on: '((foo)|(bar))*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'foobar') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test29 [
	| re re2 |
	re := Re on: '(?<=a(?i)b)(\w\w)c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abxxc') isNil not.
	self assert: (re search: 'aBxxc') isNil not.
	self assert: (re search: 'Abxxc') isNil.
	self assert: (re search: 'ABxxc') isNil.
	self assert: (re search: 'abxxC') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test290 [
	| re re2 |
	re := Re on: 'a(?:b|c|d){6,7}(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'acdbcdbe') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test291 [
	| re re2 |
	re := Re on: 'a(?:b|c|d){6,7}?(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'acdbcdbe') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test292 [
	| re re2 |
	re := Re on: 'a(?:b|c|d){5,6}(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'acdbcdbe') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test293 [
	| re re2 |
	re := Re on: 'a(?:b|c|d){5,6}?(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'acdbcdbe') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test294 [
	| re re2 |
	re := Re on: 'a(?:b|c|d){5,7}(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'acdbcdbe') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test295 [
	| re re2 |
	re := Re on: 'a(?:b|c|d){5,7}?(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'acdbcdbe') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test296 [
	| re re2 |
	re := Re on: 'a(?:b|(c|e){1,2}?|d)+?(.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ace') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test297 [
	| re re2 |
	re := Re on: '^(.+)?B'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test298 [
	| re re2 |
	re := Re on: '^([^a-z])|(\^)$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '.') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test299 [
	| re re2 |
	re := Re on: '^[<>]&'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '<&OUT') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test3 [
	| re re2 |
	re := Re on: '(?<=(foo)a)bar'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'fooabar') isNil not.
	self assert: (re search: 'bar') isNil.
	self assert: (re search: 'foobbar') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test30 [
	| re re2 |
	re := Re on: '(?:(a)|b)(?(1)A|B)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aA') isNil not.
	self assert: (re search: 'bB') isNil not.
	self assert: (re search: 'aB') isNil.
	self assert: (re search: 'bA') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test300 [
	| re re2 |
	re := Re on: '^(a\1?){4}$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaaaaaaaaa') isNil not.
	self assert: (re search: 'AB') isNil.
	self assert: (re search: 'aaaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaaaa') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test301 [
	| re re2 |
	re := Re on: '^(a(?(1)\1)){4}$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaaaaaaaaa') isNil not.
	self assert: (re search: 'aaaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaaaa') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test302 [
	| re re2 |
	re := Re on: '(?:(f)(o)(o)|(b)(a)(r))*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'foobar') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test303 [
	| re re2 |
	re := Re on: '(?<=a)b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.
	self assert: (re search: 'cb') isNil.
	self assert: (re search: 'b') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test304 [
	| re re2 |
	re := Re on: '(?<!c)b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.
	self assert: (re search: 'b') isNil not.
	self assert: (re search: 'b') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test305 [
	| re re2 |
	re := Re on: '(?:..)*a'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aba') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test306 [
	| re re2 |
	re := Re on: '(?:..)*?a'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aba') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test307 [
	| re re2 |
	re := Re on: '^(?:b|a(?=(.)))*\1'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test308 [
	| re re2 |
	re := Re on: '^(){3,5}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test309 [
	| re re2 |
	re := Re on: '^(a+)*ax'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aax') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test31 [
	| re re2 |
	re := Re on: '^(a)?(?(1)a|b)+$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aa') isNil not.
	self assert: (re search: 'b') isNil not.
	self assert: (re search: 'bb') isNil not.
	self assert: (re search: 'ab') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test310 [
	| re re2 |
	re := Re on: '^((a|b)+)*ax'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aax') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test311 [
	| re re2 |
	re := Re on: '^((a|bc)+)*ax'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aax') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test312 [
	| re re2 |
	re := Re on: '(a|x)*ab'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'cab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test313 [
	| re re2 |
	re := Re on: '(a)*ab'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'cab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test314 [
	| re re2 |
	re := Re on: '(?:(?i)a)b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test315 [
	| re re2 |
	re := Re on: '((?i)a)b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test316 [
	| re re2 |
	re := Re on: '(?:(?i)a)b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test317 [
	| re re2 |
	re := Re on: '((?i)a)b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test318 [
	| re re2 |
	re := Re on: '(?:(?i)a)b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'cb') isNil.
	self assert: (re search: 'aB') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test319 [
	| re re2 |
	re := Re on: '((?i)a)b'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test32 [
	| re re2 |
	re := Re on: '^(?(?=abc)\w{3}:|\d\d)$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc:') isNil not.
	self assert: (re search: '12') isNil not.
	self assert: (re search: '123') isNil.
	self assert: (re search: 'xyz') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test320 [
	| re re2 |
	re := Re on: '(?i:a)b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test321 [
	| re re2 |
	re := Re on: '((?i:a))b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test322 [
	| re re2 |
	re := Re on: '(?i:a)b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test323 [
	| re re2 |
	re := Re on: '((?i:a))b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test324 [
	| re re2 |
	re := Re on: '(?i:a)b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aB') isNil.
	self assert: (re search: 'aB') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test325 [
	| re re2 |
	re := Re on: '((?i:a))b'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test326 [
	| re re2 |
	re := Re on: '(?:(?-i)a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test327 [
	| re re2 |
	re := Re on: '((?-i)a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test328 [
	| re re2 |
	re := Re on: '(?:(?-i)a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test329 [
	| re re2 |
	re := Re on: '((?-i)a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test33 [
	| re re2 |
	re := Re on: '^(?(?!abc)\d\d|\w{3}:)$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc:') isNil not.
	self assert: (re search: '12') isNil not.
	self assert: (re search: '123') isNil.
	self assert: (re search: 'xyz') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test330 [
	| re |
	re := Re on: '(?:(?-i)a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aB') isNil not.
	self assert: (re search: 'Ab') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test331 [
	| re re2 |
	re := Re on: '((?-i)a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test332 [
	| re re2 |
	re := Re on: '(?:(?-i)a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test333 [
	| re re2 |
	re := Re on: '((?-i)a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test334 [
	| re re2 |
	re := Re on: '(?:(?-i)a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Ab') isNil.
	self assert: (re search: 'AB') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test335 [
	| re re2 |
	re := Re on: '((?-i)a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test336 [
	| re re2 |
	re := Re on: '(?-i:a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test337 [
	| re re2 |
	re := Re on: '((?-i:a))b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test338 [
	| re re2 |
	re := Re on: '(?-i:a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test339 [
	| re re2 |
	re := Re on: '((?-i:a))b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test34 [
	| re re2 |
	re := Re on: '(?(?<=foo)bar|cat)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'foobar') isNil not.
	self assert: (re search: 'cat') isNil not.
	self assert: (re search: 'fcat') isNil not.
	self assert: (re search: 'focat') isNil not.
	self assert: (re search: 'foocat') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test340 [
	| re re2 |
	re := Re on: '(?-i:a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AB') isNil.
	self assert: (re search: 'Ab') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test341 [
	| re re2 |
	re := Re on: '((?-i:a))b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test342 [
	| re re2 |
	re := Re on: '(?-i:a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test343 [
	| re re2 |
	re := Re on: '((?-i:a))b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aB') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test344 [
	| re re2 |
	re := Re on: '(?-i:a)b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Ab') isNil.
	self assert: (re search: 'AB') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test345 [
	| re re2 |
	re := Re on: '((?-i:a))b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test346 [
	| re re2 |
	re := Re on: '((?-i:a.))b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'AB') isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'B'])) isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test347 [
	| re re2 |
	re := Re on: '((?s-i:a.))b'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'B'])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test348 [
	| re re2 |
	re := Re on: '(?:c|d)(?:)(?:a(?:)(?:b)(?:b(?:))(?:b(?:)(?:b)))'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'cabbbb') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test349 [
	| re re2 |
	re := Re on: '(?:c|d)(?:)(?:aaaaaaaa(?:)(?:bbbbbbbb)(?:bbbbbbbb(?:))(?:bbbbbbbb(?:)(?:bbbbbbbb)))'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'caaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test35 [
	| re re2 |
	re := Re on: '(?(?<!foo)cat|bar)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'foobar') isNil not.
	self assert: (re search: 'cat') isNil not.
	self assert: (re search: 'fcat') isNil not.
	self assert: (re search: 'focat') isNil not.
	self assert: (re search: 'foocat') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test350 [
	| re re2 |
	re := Re on: '(ab)\d\1'.
	re
		beNotCaseSensitive.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'Ab4ab') isNil not.
	self assert: (re search: 'ab4Ab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test351 [
	| re re2 |
	re := Re on: 'foo\w*\d{4}baz'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'foobar1234baz') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test352 [
	| re re2 |
	re := Re on: 'x(~~)*(?:(?:F)?)?'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'x~~') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test353 [
	| re re2 |
	re := Re on: '^a(?#xxx){3}c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaac') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test354 [
	| re re2 |
	re := Re on: '^a (?#xxx) (?#yyy) {3}c'.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaac') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test355 [
	| re re2 |
	re := Re on: '(?<![cd])b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'B';
		nextPut: Character cr;
		nextPutAll: 'B'])) isNil.
	self assert: (re search: 'dbcb') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test356 [
	| re re2 |
	re := Re on: '(?<![cd])[ab]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'dbaacb') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test357 [
	| re re2 |
	re := Re on: '(?<!(c|d))b'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test358 [
	| re re2 |
	re := Re on: '(?<!(c|d))[ab]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'dbaacb') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test359 [
	| re re2 |
	re := Re on: '(?<!cd)[ab]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'cdaccb') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test36 [
	| re re2 |
	re := Re on: '( \( )? [^()]+ (?(1) \) |) '.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.
	self assert: (re search: '(abcd)') isNil not.
	self assert: (re search: 'the quick (abcd) fox') isNil not.
	self assert: (re search: '(abcd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test360 [
	| re re2 |
	re := Re on: '^(?:a?b?)*$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'dbcb') isNil.
	self assert: (re search: 'a--') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test361 [
	| re re2 |
	re := Re on: '((?s)^a(.))((?m)^b$)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr;
		nextPutAll: 'c';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test362 [
	| re re2 |
	re := Re on: '((?m)^b$)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr;
		nextPutAll: 'c';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test363 [
	| re re2 |
	re := Re on: '(?m)^b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test364 [
	| re re2 |
	re := Re on: '(?m)^(b)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test365 [
	| re re2 |
	re := Re on: '((?m)^b)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test366 [
	| re re2 |
	re := Re on: '\n((?m)^b)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test367 [
	| re re2 |
	re := Re on: '((?s).)c(?!.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr;
		nextPutAll: 'c';
		nextPut: Character cr])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr;
		nextPutAll: 'c';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test368 [
	| re re2 |
	re := Re on: '((?s)b.)c(?!.)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr;
		nextPutAll: 'c';
		nextPut: Character cr])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr;
		nextPutAll: 'c';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test369 [
	| re re2 |
	re := Re on: '^b'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test37 [
	| re re2 |
	re := Re on: '( \( )? [^()]+ (?(1) \) ) '.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.
	self assert: (re search: '(abcd)') isNil not.
	self assert: (re search: 'the quick (abcd) fox') isNil not.
	self assert: (re search: '(abcd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test370 [
	| re re2 |
	re := Re on: '()^b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr;
		nextPutAll: 'c';
		nextPut: Character cr])) isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr;
		nextPutAll: 'c';
		nextPut: Character cr])) isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test371 [
	| re re2 |
	re := Re on: '((?m)^b)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr;
		nextPutAll: 'c';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test372 [
	| re re2 |
	re := Re on: '(?(1)a|b)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test373 [
	| re re2 |
	re := Re on: '(?(1)b|a)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test374 [
	| re re2 |
	re := Re on: '(x)?(?(1)a|b)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil.
	self assert: (re search: 'a') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test375 [
	| re re2 |
	re := Re on: '(x)?(?(1)b|a)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test376 [
	| re re2 |
	re := Re on: '()?(?(1)b|a)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test377 [
	| re re2 |
	re := Re on: '()(?(1)b|a)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test378 [
	| re re2 |
	re := Re on: '()?(?(1)a|b)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test379 [
	| re re2 |
	re := Re on: '^(\()?blah(?(1)(\)))$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(blah)') isNil not.
	self assert: (re search: 'blah') isNil not.
	self assert: (re search: 'a') isNil.
	self assert: (re search: 'blah)') isNil.
	self assert: (re search: '(blah') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test38 [
	| re re2 |
	re := Re on: '^(?(2)a|(1)(2))+$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '12') isNil not.
	self assert: (re search: '12a') isNil not.
	self assert: (re search: '12aa') isNil not.
	self assert: (re search: '1234') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test380 [
	| re re2 |
	re := Re on: '^(\(+)?blah(?(1)(\)))$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '(blah)') isNil not.
	self assert: (re search: 'blah') isNil not.
	self assert: (re search: 'blah)') isNil.
	self assert: (re search: '(blah') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test381 [
	| re re2 |
	re := Re on: '(?(?!a)a|b)'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test382 [
	| re re2 |
	re := Re on: '(?(?!a)b|a)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test383 [
	| re re2 |
	re := Re on: '(?(?=a)b|a)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil.
	self assert: (re search: 'a') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test384 [
	| re re2 |
	re := Re on: '(?(?=a)a|b)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test385 [
	| re re2 |
	re := Re on: '(?=(a+?))(\1ab)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test386 [
	| re re2 |
	re := Re on: '^(?=(a+?))\1ab'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test387 [
	| re re2 |
	re := Re on: '(\w+:)+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'one:') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test388 [
	| re re2 |
	re := Re on: '$(?<=^(a))'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test389 [
	| re re2 |
	re := Re on: '(?=(a+?))(\1ab)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test39 [
	| re re2 |
	re := Re on: '((?i)blah)\s+\1'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'blah blah') isNil not.
	self assert: (re search: 'BLAH BLAH') isNil not.
	self assert: (re search: 'Blah Blah') isNil not.
	self assert: (re search: 'blaH blaH') isNil not.
	self assert: (re search: 'blah BLAH') isNil.
	self assert: (re search: 'Blah blah') isNil.
	self assert: (re search: 'blaH blah') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test390 [
	| re re2 |
	re := Re on: '^(?=(a+?))\1ab'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaab') isNil.
	self assert: (re search: 'aaab') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test391 [
	| re re2 |
	re := Re on: '([\w:]+::)?(\w+)$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.
	self assert: (re search: 'xy:z:::abcd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test392 [
	| re re2 |
	re := Re on: '^[^bcd]*(c+)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aexycd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test393 [
	| re re2 |
	re := Re on: '(a*)b+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'caab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test394 [
	| re re2 |
	re := Re on: '([\w:]+::)?(\w+)$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcd') isNil not.
	self assert: (re search: 'xy:z:::abcd') isNil not.
	self assert: (re search: 'abcd:') isNil.
	self assert: (re search: 'abcd:') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test395 [
	| re re2 |
	re := Re on: '^[^bcd]*(c+)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aexycd') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test396 [
	| re re2 |
	re := Re on: '(>a+)ab'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test397 [
	| re re2 |
	re := Re on: '(?>a+)b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test398 [
	| re re2 |
	re := Re on: '([[:]+)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a:[b]:') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test399 [
	| re re2 |
	re := Re on: '([[=]+)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a=[b]=') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test4 [
	| re re2 |
	re := Re on: '\Aabc\z'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr])) isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'qqq';
		nextPut: Character cr;
		nextPutAll: 'abc'])) isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'zzz'])) isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'qqq';
		nextPut: Character cr;
		nextPutAll: 'abc';
		nextPut: Character cr;
		nextPutAll: 'zzz'])) isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test40 [
	| re re2 |
	re := Re on: '((?i)blah)\s+(?i:\1)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'blah blah') isNil not.
	self assert: (re search: 'BLAH BLAH') isNil not.
	self assert: (re search: 'Blah Blah') isNil not.
	self assert: (re search: 'blaH blaH') isNil not.
	self assert: (re search: 'blah BLAH') isNil not.
	self assert: (re search: 'Blah blah') isNil not.
	self assert: (re search: 'blaH blah') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test400 [
	| re re2 |
	re := Re on: '([[.]+)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a.[b].') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test401 [
	| re re2 |
	re := Re on: '((?>a+)b)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test402 [
	| re re2 |
	re := Re on: '(?>(a+))b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test403 [
	| re re2 |
	re := Re on: '((?>[^()]+)|\([^()]*\))+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '((abc(ade)ufh()()x') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test404 [
	| re re2 |
	re := Re on: 'a\Z'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaab') isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr])) isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test405 [
	| re re2 |
	re := Re on: 'b\Z'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b';
		nextPut: Character cr])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test406 [
	| re re2 |
	re := Re on: 'b\z'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test407 [
	| re re2 |
	re := Re on: 'b\Z'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b'])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test408 [
	| re re2 |
	re := Re on: 'b\z'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'a';
		nextPut: Character cr;
		nextPutAll: 'b'])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test409 [
	| re re2 |
	re := Re on: '^(?>(?(1)\.|())[^\W_](?>[a-z0-9-]*[^\W_])?)+$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'a-b') isNil not.
	self assert: (re search: '0-9') isNil not.
	self assert: (re search: 'a.b') isNil not.
	self assert: (re search: '5.6.7') isNil not.
	self assert: (re search: 'the.quick.brown.fox') isNil not.
	self assert: (re search: 'a100.b200.300c') isNil not.
	self assert: (re search: '12-ab.1245') isNil not.
	self assert: (re search: (String streamContents: [:s | s])) isNil.
	self assert: (re search: '.a') isNil.
	self assert: (re search: '-a') isNil.
	self assert: (re search: 'a-') isNil.
	self assert: (re search: 'a.') isNil.
	self assert: (re search: 'a_b') isNil.
	self assert: (re search: 'a.-') isNil.
	self assert: (re search: 'a..') isNil.
	self assert: (re search: 'ab..bc') isNil.
	self assert: (re search: 'the.quick.brown.fox-') isNil.
	self assert: (re search: 'the.quick.brown.fox.') isNil.
	self assert: (re search: 'the.quick.brown.fox_') isNil.
	self assert: (re search: 'the.quick.brown.fox+') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test41 [
	| re re2 |
	re := Re on: '(?>a*)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.
	self assert: (re search: 'aa') isNil not.
	self assert: (re search: 'aaaa') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test410 [
	| re re2 |
	re := Re on: '(?>.*)(?<=(abcd|wxyz))'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'alphabetabcd') isNil not.
	self assert: (re search: 'endingwxyz') isNil not.
	self assert: (re search: 'a rather long string that doesn''t end with one of them') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test411 [
	| re |
	re := Re on: 'word (?>(?:(?!otherword)[a-zA-Z0-9]+ ){0,30})otherword'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'word cat dog elephant mussel cow horse canary baboon snake shark otherword') isNil not.
	self assert: (re search: 'word cat dog elephant mussel cow horse canary baboon snake shark') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test412 [
	| re |
	re := Re on: 'word (?>[a-zA-Z0-9]+ ){0,30}otherword'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'word cat dog elephant mussel cow horse canary baboon snake shark the quick brown fox and the lazy dog and several other words getting close to thirty by now I hope otherword') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test413 [
	| re re2 |
	re := Re on: '(?<=\d{3}(?!999))foo'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '999foo') isNil not.
	self assert: (re search: '123999foo') isNil not.
	self assert: (re search: '123abcfoo') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test414 [
	| re re2 |
	re := Re on: '(?<=(?!...999)\d{3})foo'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '999foo') isNil not.
	self assert: (re search: '123999foo') isNil not.
	self assert: (re search: '123abcfoo') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test415 [
	| re re2 |
	re := Re on: '(?<=\d{3}(?!999)...)foo'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '123abcfoo') isNil not.
	self assert: (re search: '123456foo') isNil not.
	self assert: (re search: '123999foo') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test416 [
	| re re2 |
	re := Re on: '(?<=\d{3}...)(?<!999)foo'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '123abcfoo') isNil not.
	self assert: (re search: '123456foo') isNil not.
	self assert: (re search: '123999foo') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test417 [
	| re re2 |
	re := Re on: '<a[\s]+href[\s]*=[\s]*          # find <a href=
 ([\"\''])?                       # find single or double quote
 (?(1) (.*?)\1 | ([^\s]+))       # if quote found, match up to next matching
                                 # quote, otherwise match up to next space
'.
	re
		beNotCaseSensitive;
		beDotIncludesNewline;
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '<a href=abcd xyz') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: '<a href=';
		nextPutAll: 'abcd xyz pqr';
		nextPutAll: ' cats'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: '<a href=';
		nextPutAll: 'abcd xyz pqr';
		nextPutAll: ' cats'])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test418 [
	| re re2 |
	re := Re on: '<a\s+href\s*=\s*                # find <a href=
 (["''])?                         # find single or double quote
 (?(1) (.*?)\1 | (\S+))          # if quote found, match up to next matching
                                 # quote, otherwise match up to next space
'.
	re
		beNotCaseSensitive;
		beDotIncludesNewline;
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '<a href=abcd xyz') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: '<a href=';
		nextPutAll: 'abcd xyz pqr';
		nextPutAll: ' cats'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: '<a href       =       ';
		nextPutAll: 'abcd xyz pqr';
		nextPutAll: ' cats'])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test419 [
	| re re2 |
	re := Re on: '<a\s+href(?>\s*)=(?>\s*)        # find <a href=
 (["''])?                         # find single or double quote
 (?(1) (.*?)\1 | (\S+))          # if quote found, match up to next matching
                                 # quote, otherwise match up to next space
'.
	re
		beNotCaseSensitive;
		beDotIncludesNewline;
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '<a href=abcd xyz') isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: '<a href=';
		nextPutAll: 'abcd xyz pqr';
		nextPutAll: ' cats'])) isNil not.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: '<a href       =       ';
		nextPutAll: 'abcd xyz pqr';
		nextPutAll: ' cats'])) isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test42 [
	| re re2 |
	re := Re on: '(abc|)+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'abcabc') isNil not.
	self assert: (re search: 'abcabcabc') isNil not.
	self assert: (re search: 'xyz') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test420 [
	| re re2 |
	re := Re on: '((Z)+|A)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ZABCDEFG') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test421 [
	| re re2 |
	re := Re on: '(Z()|A)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ZABCDEFG') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test422 [
	| re re2 |
	re := Re on: '(Z(())|A)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ZABCDEFG') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test423 [
	| re re2 |
	re := Re on: '((?>Z)+|A)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ZABCDEFG') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test424 [
	| re re2 |
	re := Re on: '((?>)+|A)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ZABCDEFG') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test425 [
	| re re2 |
	re := Re on: 'a*'.
	re
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abbab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test426 [
	| re re2 |
	re := Re on: '^[a-\d]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcde') isNil not.
	self assert: (re search: '-things') isNil not.
	self assert: (re search: '0digit') isNil not.
	self assert: (re search: 'bcdef') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test427 [
	| re re2 |
	re := Re on: '^[\d-a]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcde') isNil not.
	self assert: (re search: '-things') isNil not.
	self assert: (re search: '0digit') isNil not.
	self assert: (re search: 'bcdef') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test428 [
	| re re2 |
	re := Re on: ' End of testinput3 '.
	re
		beStrangeOption;
		beStrangeOption;
		beStrangeOption;
		beStrangeOption;
		beStrangeOption;
		beStrangeOption;
		beStrangeOption.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test43 [
	| re re2 |
	re := Re on: '([a]*)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.
	self assert: (re search: 'aaaaa') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test44 [
	| re re2 |
	re := Re on: '([ab]*)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.
	self assert: (re search: 'b') isNil not.
	self assert: (re search: 'ababab') isNil not.
	self assert: (re search: 'aaaabcde') isNil not.
	self assert: (re search: 'bbbb') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test45 [
	| re re2 |
	re := Re on: '([^a]*)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'b') isNil not.
	self assert: (re search: 'bbbb') isNil not.
	self assert: (re search: 'aaa') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test46 [
	| re re2 |
	re := Re on: '([^ab]*)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'cccc') isNil not.
	self assert: (re search: 'abab') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test47 [
	| re re2 |
	re := Re on: '([a]*?)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.
	self assert: (re search: 'aaaa') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test48 [
	| re re2 |
	re := Re on: '([ab]*?)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.
	self assert: (re search: 'b') isNil not.
	self assert: (re search: 'abab') isNil not.
	self assert: (re search: 'baba') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test49 [
	| re re2 |
	re := Re on: '([^a]*?)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'b') isNil not.
	self assert: (re search: 'bbbb') isNil not.
	self assert: (re search: 'aaa') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test5 [
	| re |
	re := Re on: '(?>.*/)foo'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '/this/is/a/very/long/line/in/deed/with/very/many/slashes/in/it/you/see/foo') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test50 [
	| re re2 |
	re := Re on: '([^ab]*?)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'c') isNil not.
	self assert: (re search: 'cccc') isNil not.
	self assert: (re search: 'baba') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test51 [
	| re re2 |
	re := Re on: '(?>a*)*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil not.
	self assert: (re search: 'aaabcde') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test52 [
	| re re2 |
	re := Re on: '((?>a*))*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaaaa') isNil not.
	self assert: (re search: 'aabbaa') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test53 [
	| re re2 |
	re := Re on: '((?>a*?))*'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aaaaa') isNil not.
	self assert: (re search: 'aabbaa') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test54 [
	| re re2 |
	re := Re on: '(?(?=[^a-z]+[a-z])  \d{2}-[a-z]{3}-\d{2}  |  \d{2}-\d{2}-\d{2} ) '.
	re
		beExtended.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '12-sep-98') isNil not.
	self assert: (re search: '12-09-98') isNil not.
	self assert: (re search: 'sep-12-98') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test55 [
	| re re2 |
	re := Re on: '(?<=(foo))bar\1'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'foobarfoo') isNil not.
	self assert: (re search: 'foobarfootling') isNil not.
	self assert: (re search: 'foobar') isNil.
	self assert: (re search: 'barfoo') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test56 [
	| re re2 |
	re := Re on: '(?i:saturday|sunday)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'saturday') isNil not.
	self assert: (re search: 'sunday') isNil not.
	self assert: (re search: 'Saturday') isNil not.
	self assert: (re search: 'Sunday') isNil not.
	self assert: (re search: 'SATURDAY') isNil not.
	self assert: (re search: 'SUNDAY') isNil not.
	self assert: (re search: 'SunDay') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test57 [
	| re re2 |
	re := Re on: '(a(?i)bc|BB)x'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcx') isNil not.
	self assert: (re search: 'aBCx') isNil not.
	self assert: (re search: 'bbx') isNil not.
	self assert: (re search: 'BBx') isNil not.
	self assert: (re search: 'abcX') isNil.
	self assert: (re search: 'aBCX') isNil.
	self assert: (re search: 'bbX') isNil.
	self assert: (re search: 'BBX') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test58 [
	| re re2 |
	re := Re on: '^([ab](?i)[cd]|[ef])'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ac') isNil not.
	self assert: (re search: 'aC') isNil not.
	self assert: (re search: 'bD') isNil not.
	self assert: (re search: 'elephant') isNil not.
	self assert: (re search: 'Europe') isNil not.
	self assert: (re search: 'frog') isNil not.
	self assert: (re search: 'France') isNil not.
	self assert: (re search: 'Africa') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test59 [
	| re re2 |
	re := Re on: '^(ab|a(?i)[b-c](?m-i)d|x(?i)y|z)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ab') isNil not.
	self assert: (re search: 'aBd') isNil not.
	self assert: (re search: 'xy') isNil not.
	self assert: (re search: 'xY') isNil not.
	self assert: (re search: 'zebra') isNil not.
	self assert: (re search: 'Zambesi') isNil not.
	self assert: (re search: 'aCD') isNil.
	self assert: (re search: 'XY') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test6 [
	| re re2 |
	re := Re on: '(?>.*/)foo'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '/this/is/a/very/long/line/in/deed/with/very/many/slashes/in/and/foo') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test60 [
	| re re2 |
	re := Re on: '(?<=foo\n)^bar'.
	re
		beMultiline.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'foo';
		nextPut: Character cr;
		nextPutAll: 'bar'])) isNil not.
	self assert: (re search: 'bar') isNil.
	self assert: (re search: (String streamContents: [:s | s
		nextPutAll: 'baz';
		nextPut: Character cr;
		nextPutAll: 'bar'])) isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test61 [
	| re re2 |
	re := Re on: '(?<=(?<!foo)bar)baz'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'barbaz') isNil not.
	self assert: (re search: 'barbarbaz') isNil not.
	self assert: (re search: 'koobarbaz') isNil not.
	self assert: (re search: 'baz') isNil.
	self assert: (re search: 'foobarbaz') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test62 [
	| re |
	re := Re on: 'The case of aaaaaa is missed out below because I think Perl 5.005_02 gets'.
	self shouldnt: [re compile] raise: Error.
]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test63 [
	| re |
	re := Re on: '^(a\1?){4}$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil.
	self assert: (re search: 'aa') isNil.
	self assert: (re search: 'aaa') isNil.
	self assert: (re search: 'aaaa') isNil not.
	self assert: (re search: 'aaaaa') isNil not.
	self assert: (re search: 'aaaaaaa') isNil not.
	self assert: (re search: 'aaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaaa') isNil not.
	self assert: (re search: 'aaaaaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaaaaaaaaa') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test64 [
	| re |
	re := Re on: '^(a\1?)(a\1?)(a\2?)(a\3?)$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a') isNil.
	self assert: (re search: 'aa') isNil.
	self assert: (re search: 'aaa') isNil.
	self assert: (re search: 'aaaa') isNil not.
	self assert: (re search: 'aaaaa') isNil not.
	self assert: (re search: 'aaaaaa') isNil not.
	self assert: (re search: 'aaaaaaa') isNil not.
	self assert: (re search: 'aaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaaa') isNil not.
	self assert: (re search: 'aaaaaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaaaaaaaa') isNil.
	self assert: (re search: 'aaaaaaaaaaaaaaaa') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test65 [
	| re |
	re := Re on: 'The following tests are taken from the Perl 5.005 test suite; some of them'.
	self shouldnt: [re compile] raise: Error.
]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test66 [
	| re re2 |
	re := Re on: 'abc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'xabcy') isNil not.
	self assert: (re search: 'ababc') isNil not.
	self assert: (re search: 'xbc') isNil.
	self assert: (re search: 'axc') isNil.
	self assert: (re search: 'abx') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test67 [
	| re re2 |
	re := Re on: 'ab*c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test68 [
	| re re2 |
	re := Re on: 'ab*bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'abbc') isNil not.
	self assert: (re search: 'abbbbc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test69 [
	| re re2 |
	re := Re on: '.{1}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abbbbc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test7 [
	| re re2 |
	re := Re on: '(?>(\.\d\d[1-9]?))\d+'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '1.230003938') isNil not.
	self assert: (re search: '1.875000282') isNil not.
	self assert: (re search: '1.235') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test70 [
	| re re2 |
	re := Re on: '.{3,4}'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abbbbc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test71 [
	| re re2 |
	re := Re on: 'ab{0,}bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abbbbc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test72 [
	| re re2 |
	re := Re on: 'ab+bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abbc') isNil not.
	self assert: (re search: 'abc') isNil.
	self assert: (re search: 'abq') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test73 [
	| re re2 |
	re := Re on: 'ab{1,}bc'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test74 [
	| re re2 |
	re := Re on: 'ab+bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abbbbc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test75 [
	| re re2 |
	re := Re on: 'ab{1,}bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abbbbc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test76 [
	| re re2 |
	re := Re on: 'ab{1,3}bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abbbbc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test77 [
	| re re2 |
	re := Re on: 'ab{3,4}bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abbbbc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test78 [
	| re re2 |
	re := Re on: 'ab{4,5}bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abq') isNil.
	self assert: (re search: 'abbbbc') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test79 [
	| re re2 |
	re := Re on: 'ab?bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abbc') isNil not.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test8 [
	| re re2 |
	re := Re on: '^((?>\w+)|(?>\s+))*$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'now is the time for all good men to come to the aid of the party') isNil not.
	self assert: (re search: 'this is not a line with only words and spaces!') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test80 [
	| re re2 |
	re := Re on: 'ab{0,1}bc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test81 [
	| re re2 |
	re := Re on: 'ab?bc'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test82 [
	| re re2 |
	re := Re on: 'ab?c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test83 [
	| re re2 |
	re := Re on: 'ab{0,1}c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test84 [
	| re re2 |
	re := Re on: '^abc$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'abbbbc') isNil.
	self assert: (re search: 'abcc') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test85 [
	| re re2 |
	re := Re on: '^abc'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abcc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test86 [
	| re re2 |
	re := Re on: '^abc$'.
	self shouldnt: [re compile] raise: Error.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test87 [
	| re |
	re := Re on: 'abc$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aabc') isNil not.
	self assert: (re search: 'aabc') isNil not.
	self assert: (re search: 'aabcd') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test88 [
	| re re2 |
	re := Re on: '^'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test89 [
	| re re2 |
	re := Re on: '$'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test9 [
	| re re2 |
	re := Re on: '(\d+)(\w)'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: '12345a') isNil not.
	self assert: (re search: '12345+') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test90 [
	| re re2 |
	re := Re on: 'a.c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abc') isNil not.
	self assert: (re search: 'axc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test91 [
	| re re2 |
	re := Re on: 'a.*c'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'axyzc') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test92 [
	| re re2 |
	re := Re on: 'a[bc]d'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'abd') isNil not.
	self assert: (re search: 'axyzd') isNil.
	self assert: (re search: 'abc') isNil.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test93 [
	| re re2 |
	re := Re on: 'a[b-d]e'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'ace') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test94 [
	| re re2 |
	re := Re on: 'a[b-d]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aac') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test95 [
	| re re2 |
	re := Re on: 'a[-b]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a-') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test96 [
	| re re2 |
	re := Re on: 'a[b-]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a-') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test97 [
	| re re2 |
	re := Re on: 'a]'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a]') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test98 [
	| re re2 |
	re := Re on: 'a[]]b'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'a]b') isNil not.

]

{ #category : #newTestSuite3 }
ReTest >> testNewSuite3test99 [
	| re re2 |
	re := Re on: 'a[^bc]d'.
	self shouldnt: [re compile] raise: Error.
	self assert: (re search: 'aed') isNil not.
	self assert: (re search: 'abd') isNil.
	self assert: (re search: 'abd') isNil.

]
