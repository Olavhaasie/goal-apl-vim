" Vim syntax file
" Language: GOAL agent programming
" Maintainer: Olav de Haas
" Created: 29 april 2017
" Latest Change: 1 may 2017
" Files: .mod2g, .mas2g, .act2g, .test2g

if exists("b:current_syntax")
    finish
endif

"""""""""""""""""
" GOAL Keywords
"""""""""""""""""
syntax keyword goalStatementKeywords    pre in post
syntax keyword goalStatementKeywords    launchpolicy module
syntax keyword goalStatementKeywords    contained forall do if then when type launch
syntax keyword goalBaseKeywords         contained percept bel goal not
syntax keyword goalActionKeywords       contained adopt drop insert delete
syntax keyword goalActionKeywords       contained send sent allother all someother some
syntax keyword goalActionKeywords       contained subscribe unsubscribe
syntax keyword goalTestKeywords         contained eventually leadsto never always until done
syntax keyword goalBoolean              containedin=goalBraceBlock true false
syntax keyword goalPreProcKeywords      order exit focus test timeout define use as with
syntax keyword goalPreProcKeywords      actionspec knowledge goals mas
syntax keyword goalPreProcKeywords      never nogoals select
syntax keyword goalPreProcKeywords      linear linearrandom linearall linearallrandom random randomall

syntax keyword goalCommentKeywords      contained TODO FIXME NOTE NB

" Some Prolog keywords
syntax keyword goalPrologPredicates     contained member findall bagof setof count length
syntax keyword goalPrologPredicates     contained select nth0 append permutation aggregate_all



"""""""""""""""""
" GOAL Matchings
"""""""""""""""""
syntax match goalBaseKeywords "a-goal" contained
syntax match goalBaseKeywords "goal-a" contained
syntax match goalComment "\v\%.*$" containedin=goalBraceBlock contains=goalCommentKeywords

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
syntax match goalVariable "\v<(_|\u)\w*>" contained

" Errornous characters
syntax match goalErrorChar "\v[@`]"
syntax region goalErrorTerm start="\v<(_|\u)\w*>\(" end=")"


"""""""""""""""""
" GOAL Clusters
"""""""""""""""""
syntax cluster goalModuleContent contains=goalStatementKeywords,goalBaseKeywords,goalActionKeywords,goalPrologPredicates,goalVariable,goalPrologPredicates,goalTestKeywords,goalErrorVariable,goalErrorTerm


"""""""""""""""""
" GOAL Regions
"""""""""""""""""
syntax region goalString start='\v"' skip="\v\\." end='\v"' containedin=goalBraceBlock
syntax region goalString start="\v'" skip="\v\\." end="\v'" containedin=goalBraceBlock

syntax region goalBraceBlock start="{" end="}" fold transparent contains=@goalModuleContent


"""""""""""""""""
" Higlighting
"""""""""""""""""
hi def link goalStatementKeywords   Statement
hi def link goalBaseKeywords        Statement
hi def link goalActionKeywords      Statement
hi def link goalTestKeywords        Statement
hi def link goalPrologPredicates    Keyword
hi def link goalBoolean             Constant
hi def link goalPreProcKeywords     PreProc
hi def link goalOperator            Operator
hi def link goalNumber              Number
hi def link goalVariable            Identifier
hi def link goalComment             Comment
hi def link goalCommentKeywords     Todo
hi def link goalString              String
hi def link goalErrorChar           Error
hi def link goalErrorTerm           Error


syntax sync fromstart

" the syntax is called goal :)
let b:current_syntax="goal"

