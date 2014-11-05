syntax on
colorscheme jeff
set fileencodings=utf-8,iso-2022-jp,euc-jp,default
set foldmethod=marker
set autoindent
set incsearch  "incremental search
set ignorecase "大文字小文字関係なく検索
set smartcase  "大文字を混ぜて検索した場合だけ大文字/小文字を区別する
set nowrapscan "検索時にファイルの最後まで行ったら最初に戻らないようにする
set hlsearch   "hilight searched result
set showcmd
set list
set listchars=tab:>\ ,extends:<
set showmatch   "対応括弧表示
set shiftwidth=4
set expandtab
set tabstop=4 "タブ幅
set softtabstop=4
set wildmenu  "コマンドライン補完するときに補完候補を表示する
set backspace=indent,eol,start  "backspaceキー有効化
" not working : set clipboard=unnamed   "システムクリップボードへコピー
set statusline=%F%m%r%h%w\%=[ENCODING=%{&fileencoding}]\[R:%04l,C:%04v][%p%%]\ [LEN=%L]
set number "行番号表示
set laststatus=2 "常にステータス表示

" neocomplcache
"startup enable
let g:neocomplcache_enable_at_startup = 1  
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


"----------------------------------------------------
" キーマップ
"----------------------------------------------------
" Insert Mode via H button, other imaps
noremap h i
noremap H I
inoremap <C-h> <Esc><Right>

" Insert Mode
inoremap u <BS>
inoremap o <Del>
inoremap w <C-o>w
inoremap b <C-o>b

" 上に移動
noremap i <Up>
noremap I H
noremap <C-i> <C-U><C-U>
inoremap i <Up>
noremap <C-w>i <C-w><Up>

" 下に移動
noremap k <Down>
noremap K L
noremap <C-k> <C-D><C-D>
inoremap k <Down>
noremap <C-w>k <C-w><Down>

" 左に移動
noremap j <Left>
noremap J 0
noremap <C-j> gg
inoremap j <Left>

" 右に移動
noremap L $
noremap <C-l> G
inoremap l <Right>

" Folds
noremap zh zi
noremap zi zk
noremap zk zj

" Tags
noremap <F3> <C-]>
noremap \<F3> <C-t>
noremap <F4> <C-w>]
noremap \<F4> <C-w>c

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=white guibg=grey gui=none ctermfg=white ctermbg=darkblue cterm=none'

if has('syntax')
    syntax on
    augroup InsertHook
"autocmd    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
    if a:mode == 'Enter'
        silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
        silent exec g:hi_insert
    else
        highlight clear StatusLine
        silent exec s:slhlcmd
    endif
endfunction

function! s:GetHighlight(hi)
    redir => hl
    exec 'highlight '.a:hi
    redir END
    let hl = substitute(hl, '[\r\n]', '', 'g')
    let hl = substitute(hl, 'xxx', '', '')
    return hl
 endfunction

autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
