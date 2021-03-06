" Vim syntax file
" Language:	SQL, PL/SQL (Oracle 8i)
" Maintainer:	Paul Moore <pf_moore AT yahoo.co.uk>
" Last Change:	2005 Dec 23

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" The SQL reserved words, defined as keywords.

syn keyword sqlSpecial  false null true

syn keyword sqlKeyword	access add as asc begin by case check cluster column
syn keyword sqlKeyword	compress connect current cursor decimal default desc
syn keyword sqlKeyword	else elsif end exception exclusive file for from
syn keyword sqlKeyword	function group having identified if immediate increment
syn keyword sqlKeyword	index initial into is level loop maxextents mode modify
syn keyword sqlKeyword	nocompress nowait of offline on online start
syn keyword sqlKeyword	successful synonym table then to trigger uid
syn keyword sqlKeyword	unique validate values view when whenever
syn keyword sqlKeyword	where with option order limit pctfree privileges procedure
syn keyword sqlKeyword	public resource return row rowlabel rownum rows
syn keyword sqlKeyword	session share size smallint type using
syn keyword sqlKeyword	full inner outer cross join left right interval partition unbounded preceding
syn keyword sqlKeyword	sortkey distkey encode

syn keyword sqlOperator	not and or xor
syn keyword sqlOperator	in any some all between exists
syn keyword sqlOperator	like escape
syn keyword sqlOperator union intersect minus
syn keyword sqlOperator prior distinct
syn keyword sqlOperator	sysdate out

syn keyword sqlFunction count nvl abs avg sum round to_char convert_timezone coalesce datediff date_trunc to_date date_part
syn keyword sqlFunction nullif ifnull min max upper lower first_value over greatest least replace
syn keyword sqlFunction concat substring cast

syn keyword sqlStatement alter analyze audit comment commit create
syn keyword sqlStatement delete drop execute explain grant insert lock noaudit
syn keyword sqlStatement rename revoke rollback savepoint select set vacuum
syn keyword sqlStatement truncate update

syn keyword sqlType	boolean char character date float double precision integer long timestamp timestamptz timestamp_ntz dateadd
syn keyword sqlType	mlslabel number raw rowid varchar varchar2 varray bigint text

" Strings and characters:
syn region sqlString		start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region sqlString		start=+'+  skip=+\\\\\|\\'+  end=+'+

" Numbers:
syn match sqlNumber		"-\=\<\d*\.\=[0-9_]\>"

" Comments:
syn region sqlComment    start="/\*"  end="\*/" contains=sqlTodo
syn match sqlComment	"--.*$" contains=sqlTodo

syn sync ccomment sqlComment

" Todo.
syn keyword sqlTodo contained TODO FIXME XXX DEBUG NOTE

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sql_syn_inits")
  if version < 508
    let did_sql_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink sqlStatement	Identifier
  HiLink sqlComment	Comment
  HiLink sqlKeyword	sqlSpecial
  HiLink sqlNumber	Number
  HiLink sqlOperator	Statement
  HiLink sqlSpecial	Special
  HiLink sqlFunction	Function
  HiLink sqlString	String
  HiLink sqlType	Type
  HiLink sqlTodo	Todo

  delcommand HiLink
endif

let b:current_syntax = "sql"

" vim: ts=8
