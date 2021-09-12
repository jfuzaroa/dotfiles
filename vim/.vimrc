"@author Jonathan Fuzaro Alencar <jfuzaroa@outlook.com>"
"
"+++Vim-Plug+++"
call plug#begin('~/.vim/plugged')

"+=Core=+"
	Plug 'lifepillar/vim-cheat40' " press '<leader>?' to open up vim cheat sheet
"-=Core=-"

"+=Aesthetics=+"
	Plug 'chiendo97/intellij.vim'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
	Plug 'rakr/vim-one'
    Plug 'tomasiser/vim-code-dark'
	Plug 'vim-airline/vim-airline' " statusline for vim
	Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
"-=Aesthetics=-"

"+=Utilities=+"
	Plug 'ctrlpvim/ctrlp.vim' " fuzzy finder for vim
	Plug 'scrooloose/nerdtree' " file system explorer in vim
	Plug 'scrooloose/nerdcommenter' " quick commenting with <leader>cc
	Plug 'Xuyuanp/nerdtree-git-plugin' " git status flags for nerdtree
	Plug 'tpope/vim-fugitive' " git vim integration
	Plug 'tpope/vim-surround' " shortcuts for editing string surroundings 
"-=Utilities=-"

"+=Language Support=+"
	Plug 'sheerun/vim-polyglot' " syntax support for most languages
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " go support
    Plug 'JuliaEditorSupport/julia-vim' " julia support
"-=Language Support=-"

call plug#end()
"---Vim-Plug---"

" enable syntax processing and file type indentation
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" character encoding as UTF-8
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

" set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5
set fileencoding=utf-8 " save files encoded with UTF-8
set autoread " read files automatically if edited outside of vim session

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" leader is comma
let mapleader = ","
let g:one_allow_italics = 1 " enable italics for one-vim theme

colorscheme codedark

" toggle vim themes
nnoremap <expr> <silent><leader>t g:colors_name == "codedark" ?
			\":colo onehalflight\<CR>:AirlineTheme onehalflight\<CR>" :
            \":colo codedark\<CR>:AirlineTheme codedark\<CR>"

set backspace=indent,eol,start " backspace through anything in insert mode
set autoindent " autoindent when enter/return is pressed
set smartindent " autoindent with respect to file type (e.g. ".c")
set shiftwidth=4 " auto indenting is 4 spaces
set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set smarttab " inserts shiftwidth of spaces per tab

set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set wildmenu " visual autocomplete menu
set mouse=a " enable use of mouse
set ruler " line and collumn position of cursor position in bottom right
set lazyredraw " redraw only when needed
set showmatch " highlight matching [{()}]
set hidden " allows buffer switching without writing
set laststatus=2 " window will always have status line

set ignorecase " ignore search case sensitivity if lowercase
set smartcase " uppercase search sensitive while lowercase isn't
set hlsearch " highlight matches
set incsearch " search as characters are entered

set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level
set colorcolumn=80,120 " highlight column at 80 characters
set timeoutlen=400 " allotted for key code sequence (milliseconds)

" always display one line above/below cursor
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" Return to last edit position when opening files
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END

" space open/closes folds
nmap <space> za

" move vertically by visual line
nmap j gj
nmap k gk

" navigate faster with alt + (j[up] | k[down])
exec "map \ej <A-j>"
exec "map \ek <A-k>"
nnoremap <A-j> 5gj
nnoremap <A-k> 5gk
xnoremap <A-j> 5gj
xnoremap <A-k> 5gk

" create and navigate tabs with alt + (h[left] | l[right])
exec "map \el <A-l>"
exec "map \eh <A-h>"
nnoremap <silent><C-t> :tabnew<CR>
nnoremap <silent><A-l> :tabnext<CR>
nnoremap <silent><A-h> :tabprevious<CR>

" jk is escape
inoremap jk <esc>
inoremap Jk <esc>
inoremap jK <esc>
inoremap JK <esc>
xnoremap Jk <esc>
xnoremap JK <esc>
cnoremap jk <esc>
cnoremap Jk <esc>
cnoremap jK <esc>
cnoremap JK <esc>

" highlight last inserted text
nnoremap gV `[v`]

if maparg('<leader>o', 'n') ==# ''
  nnoremap <silent> <leader>o :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" toggle cursorline highlight
nmap <silent> <leader>lh :set cursorline!<CR>

" edit vimrc/zshrc and load vimrc bindings
nmap <leader>ev :vsp $MYVIMRC<CR>
nmap <leader>ez :vsp ~/.zshrc<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>

" quit session
nnoremap <leader>q :q<CR>
nnoremap <leader><esc> :q!<CR>
" save session
nnoremap <leader>w :w<CR>
" save & quit session
nnoremap <leader>x :x<CR>

" navigate in insert mode
imap <C-k> <up>
imap <C-j> <down>

" move selected lines up/down
xnoremap <C-j> :m'>+<CR>gv=gv
xnoremap <C-k> :m-2<CR>gv=gv

" split window shortcuts
nnoremap <C-j> <C-w>w
nnoremap <C-k> <C-w>W
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <silent> <leader>= <C-w>=
nnoremap <silent> <leader>j :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>k :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <leader>h :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <leader>l :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

"+++vim-airline+++"
	" change tabline as well
"     let g:airline_theme = 'deus'
	let g:airline_theme = 'codedark'
	let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

	" allow use of powerline fonts & glyphs
    let g:airline_powerline_fonts = 1
"---vim-arline---"

"+++ctrlp+++"
	" force ctrlp to open files in tabs instead of buffers (buffers are dumb)
	let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<2-LeftMouse>'],
									\ 'AcceptSelection("t")': ['<cr>'],
									\ }
	let g:ctrlp_cmd = 'CtrlPMixed' " search files, recents, and buffers
	let g:ctrlp_dont_split = 'NERD' " close NERDTree window
"---ctrlp---"

"+++NERDTree+++"
	" close vim if only window left is NERDTree
	autocmd BufEnter * if (winnr("$") == 1 
				\ && exists("b:NERDTree") 
				\ && b:NERDTree.isTabTree()) | q | endif 

	" open NERDTree with <leader>f
	map <leader>f :NERDTreeToggle<CR>
"---NERDTree---"

"+++NERDCommenter+++"
	" comments out whole lines in visual mode
	let NERDCommentWholeLinesInVMode = 1

	" removes spaces around comment delimiters when uncommenting
	let NERDRemoveExtraSpace = 1

	let g:NERDSpaceDelims = 1 " add space after comment delimiters by default

	" align line-wise comment delimiters flush left instead of indentingnone
	let g:NERDDefaultAlign = 'start'
"---NERDCommenter---"
