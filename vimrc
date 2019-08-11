"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This vimrc is adapted from a much older copy I used with 
" Vim 6 and Vim 7 years ago. Now returning after several years
" away (Spacemacs) I thought it best to rework my old vimrc
"
" This revision also sees me using Neovim for the first time, 
" and while I might be interested to work with that editors 
" configuration ~/.config/nvim/init.vim separately, puting things
" in this file may help it apply to all 3 editors I am currently
" using Vim, Neovim and VSCode (with Neovim)
"
" Also switching from pathogen to vim-plug for package management
"
" As always, thanks to amix for the outstanding vimrc example
" and reference.
"    https://github.com/amix/vimrc
"
" My old vimrc can be found here: 
"   https://github.com/shakerlxxv/vim-config/blob/master/vimrc
"
" Revisions:
"   0.0.0: initial version
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MySys()
    if has("win32")
        return "windows"
    elseif has("mac") || has("macunix")
        return "mac"
    else
        return "linux"
    endif
endfunction

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/bshaver/', "~/", "g")
    return curdir
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" Sets how many lines of history VIM has to remember
" also affects how many search and commands will be stored in 
" viminfo file.
set history=700
" Enable filetype plugins
filetype plugin on
filetype indent on
" Set to auto read when a file is changed from the outside
set autoread
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>
" Not sure why command warrants a try/catch block
try
    lang en_US
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'fholgado/minibufexpl.vim'
Plug 'vim-scripts/mru.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7
"Always show current position
set ruler
" Height of the command bar
set cmdheight=2
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch 
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
" set mat=2<Paste> " this command does not appear to be supported anymore
" No annoying sound on errors
set visualbell
" helps with odd delay after ESC before visualbell
"   from: https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000
set ttimeoutlen=5
" if you want no bells at all, the following 4 lines will disable all the
" bells I typically see
"set noerrorbells
"set t_vb=
"set tm=500
" Do not wring the bell when I hit ESC in Normal mode
"set belloff=esc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
" Set font according to system
if has("gui_vimr")
  " vimR is giving an error whenever guifont is set, so skip it for now
  set shell=/bin/bash
elseif has("mac") || has("macunix")
  set guifont=SourceCodePro-Medium:h13,IBMPlexMono-Medium:h13,Hack:h13,Menlo-Regular:h14
  set shell=/bin/bash
elseif has("win16") || has("win32")
  set guifont=SourceCodePro-Medium:h13,IBMPlexMono-Medium:h13,Hack:h13,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("linux") || has("gui_gtk2")
  set guifont=Monospace\ 10
  set shell=/bin/bash
endif
" Set extra options when running in GUI mode
if has("gui_vimr")
  " vimR seems will set its own colorscheme, but it comes out like crap unless
  " I also set a colorscheme here, not sure why.
  colorscheme slate
  set nu
  set guitablabel=%M\ %t
elseif has("gui_running")
  " set guioptions-=T " remove the toolbar
  set guioptions+=!e
  set t_Co=256
  set background=dark
  colorscheme solarized
  set nu
  set guitablabel=%M\ %t
else
  set t_Co=256
  colorscheme elflord
  set background=dark
  set nonu
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
" set nobackup " don't keep backup files after saving a new file
" set nowb " don't keep a backup file while writing a file
" set noswapfile " don't keep a swap file to manage, not good for big files

"Persistent undo available since VIM 7.3
try
    if has("win16") || has("win32")
      set undodir=C:\Windows\Temp
    else
      set undodir=~/.vim/undodir " requires amix install dirs
    endif
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" vnoremap <silent> * :call VisualSelection('f')<CR>
" vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Many shells allow editing in "Emacs Style".
" Although I love Vi, I am quite used to this kind of editing now.
" So here it is - command line editing commands in emacs style:
" Note:  More info about this is in the helptexts:  :help emacs-keys
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f     <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
" map j gj
" map k gk
" Disable highlight when <leader><cr> is pressed
" map <silent> <leader><cr> :noh<cr>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Close the current buffer
map <leader>bd :Bclose<cr>
" Close all the buffers
map <leader>ba :1,1000 bd!<cr>
" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
"  '100 --> remembering marks for 100 previous files
"  "500 --> store contents of registers up to 500 lines
set viminfo='100,\"500

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
"map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if MySys() == "mac"
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" Quickly open a buffer for scripbble
"1map <leader>q :e ~/buffer<cr>
" au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
map <leader>bb :cd ..<cr>
" Quick insertion of an empty line:
nmap <CR> o<ESC>
" wraps current word with parenthesis
map <F6> viw"xc()h"xp
" inserts a ; in column 0 of the current line
map <F7> gI;j
" quick way to move between buffers using a list
map <F5> :buffers<CR>:buffer<Space>
" Use "bc" to evaluate the arithmetic expression on the current line
" with a precision of '6' digits after the comma.
" It is assumed that the current line contains only the expression.
" The rsult is read in after the current line.
map #BC ^y$:r!echo 'scale=6; <c-r>"'\|bc<cr>
" Add all numbers in the current visual selection.
vmap ,add !awk '{total += $1 ; print} ; END {print total}'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => bufExplorer plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:bufExplorerDefaultHelp')
    let g:bufExplorerDefaultHelp=0
    let g:bufExplorerShowRelativePath=1
    map <leader>o :BufExplorer<cr>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Minibuffer plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:miniBufExplModSelTarget')
    let g:miniBufExplModSelTarget = 1
    let g:miniBufExplorerMoreThanOne = 2
    let g:miniBufExplModSelTarget = 0
    let g:miniBufExplUseSingleClick = 1
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplVSplit = 25
    let g:miniBufExplSplitBelow=1
    let g:bufExplorerSortBy = "name"
    autocmd BufRead,BufNew :call UMiniBufExplorer
    map <leader>u :TMiniBufExplorer<cr>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => snipMate plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" reload all snippets
if exists(':ReloadAllSnippets')
    map <leader>sm :call ReloadAllSnippets()<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent
au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi
au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ruby Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,haml,cucumber,coffee set ai sw=2 sts=2 et
augroup END

" see :help rails for more information about the various commands below
" set for the rails.vim plugin
if !exists("browser_command_defined")
    let browser_command_defined = 1
    if MySys() == "mac"
		:command -bar -nargs=1 OpenURL :!open <args>
    elseif MySys() == "windows"
		:command -bar -nargs=1 OpenURL :!start cmd /cstart /b <args>
    elseif MySys() == "linux"
        :command -bar -nargs=1 OpenURL :!google-chrome <args>
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MRU plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('MRU')
    let MRU_Max_Entries = 400
    map <leader>f :MRU<CR>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command-T
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('ruby')
    let g:CommandTMaxHeight = 15
    set wildignore+=*.o,*.obj,.git,*.pyc
    noremap <leader>j :CommandT<cr>
    noremap <leader>y :CommandTFlush<cr>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = '.git RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rspec.vim mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!cd `pwd`; DOMAIN=dev rspec {spec}"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SyntaxComplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
        \	if &omnifunc == "" |
        \		setlocal omnifunc=syntaxcomplete#Complete |
        \	endif
endif
