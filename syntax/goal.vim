" Vim syntax file
" Language: GOAL agent programming
" Maintainer: Olav de Haas
" Latest Revision: 29 april 2017

if exists("b:current_syntax")
    finish
endif

"""""""""""""""""
" GOAL Keywords
"""""""""""""""""
syntax keyword goalStatementKeywords    pre in post
syntax keyword goalStatementKeywords    contained forall do if then
syntax keyword goalBaseKeywords         contained percept bel goal a-goal goal-a not
syntax keyword goalActionKeywords       contained adopt drop insert delete
syntax keyword goalActionKeywords       contained send sent allother all someother some
syntax keyword goalBoolean              containedin=goalBraceBlock true false
syntax keyword goalPreProcKeywords      order exit focus test define use as with
syntax keyword goalPreProcKeywords      actionspec knowledge goals module mas
syntax keyword goalPreProcKeywords      never nogoals select
syntax keyword goalPreProcKeywords      linear linearrandom linearall linearallrandom random randomall

syntax keyword goalCommentKeywords      contained TODO FIXME NOTE

" Some Prolog keywords
syntax keyword goalPrologPredicates     contained member findall bagof setof count length
syntax keyword goalPrologPredicates     contained select nth0 append permutation



"""""""""""""""""
" GOAL Matchings
"""""""""""""""""
syntax match goalComment "\v\%.*$" containedin=goalBraceBlock contains=commentKeywords

" GOAL Operators
syntax match goalOperator "\v\+" containedin=goalBraceBlock
syntax match goalOperator "\v-" containedin=goalBraceBlock
syntax match goalOperator "\v/" containedin=goalBraceBlock
syntax match goalOperator "\v\*" containedin=goalBraceBlock
syntax match goalOperator "\v\=" containedin=goalBraceBlock
syntax match goalOperator "\v\\\=" containedin=goalBraceBlock
syntax match goalOperator "\v is " containedin=goalBraceBlock

syntax match goalOperator "\v\<" containedin=goalBraceBlock
syntax match goalOperator "\v\>" containedin=goalBraceBlock
syntax match goalOperator "\v\<\=" containedin=goalBraceBlock
syntax match goalOperator "\v\>\=" containedin=goalBraceBlock

" numbers
syntax match goalNumber "\v\d" containedin=goalBraceBlock
syntax match goalNumber "\v[+-]\d" containedin=goalBraceBlock

" variables
syntax match goalVariable "\v<[A-Z][a-zA-Z0-9]*>" contained
syntax match goalAnonymousVariable "\v<_>" contained



"""""""""""""""""
" GOAL Regions
"""""""""""""""""
syntax region goalString start='\v"' skip="\v\\." end='\v"'
syntax region goalString start="\v'" skip="\v\\." end="\v'"

syntax region goalBraceBlock start="{" end="}" contains=goalStatementKeywords,goalBaseKeywords,goalActionKeywords,goalPrologPredicates, goalVariable,goalAnonymousVariable,goalPrologPredicates

"""""""""""""""""
" Higlighting
"""""""""""""""""
hi def link goalStatementKeywords   Statement
hi def link goalBaseKeywords        Statement
hi def link goalActionKeywords      Statement
hi def link goalBoolean             Constant
hi def link goalPreProcKeywords     PreProc
hi def link goalOperator            Operator
hi def link goalNumber              Number
hi def link goalVariable            Type
hi def link goalAnonymousVariable   Constant
hi def link goalComment             Comment
hi def link goalCommentKeywords     Todo
hi def link goalString              String


" the syntax is called goal :)
let b:current_syntax="goal"

