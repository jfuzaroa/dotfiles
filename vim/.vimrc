"@author Jonathan Alencar <jonfalencar@gmail.com>"

" enable syntax processing and file type indentation
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

colorscheme aperture " set colorscheme

" character encoding as UTF-8
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif
set fileencoding=utf-8 " save files encoded with UTF-8
set autoread " read files automatically if edited outside of vim session

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
set lazyredraw " redraw only when we need to
set showmatch " highlight matching [{()}]
set hidden " allows buffer switching without writing (saving)
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

"**Commands**"
" open program in hex
" command Hex execute "%!xxd -c19"

" Return to source from hex
" command Src execute "%!xxd -c19 -r"

"**Mappings**" 
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

" highlight last inserted text
nnoremap gV `[v`]

" leader is comma
let mapleader = ","

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
nnoremap <silent> <leader>j :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>k :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <leader>h :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <leader>l :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

"+++Vim-Plug+++"
call plug#begin('~/.vim/plugged')

"+=Core=+"
	Plug 'lifepillar/vim-cheat40' " press '<leader>?' to open up vim cheat sheet
"     Plug 'Valloric/YouCompleteMe' " using the AUR version atm
"-=Core=-"

"+=Utilities=+"
	Plug 'vim-airline/vim-airline' " statusline for vim
	Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
	Plug 'ctrlpvim/ctrlp.vim' " fuzzy finder for vim
	Plug 'scrooloose/nerdtree' " file system explorer in vim
	Plug 'scrooloose/nerdcommenter' " quick commenting with <leader>cc
	Plug 'Xuyuanp/nerdtree-git-plugin' " git status flags for nerdtree
	Plug 'sjl/gundo.vim' " visualize vim undo tree
	Plug 'tpope/vim-fugitive' " git vim integration
	Plug 'tpope/vim-surround' " shortcuts for editing string surroundings 
"-=Utilities=-"

"+=Language Support=+"
	Plug 'sheerun/vim-polyglot' " syntax support for most languages

	"+Rust+"
	Plug 'rust-lang/rust.vim' " Rust language support
	"-Rust-"
"-=Language Support=-"

call plug#end()
"---Vim-Plug---"
"+++vim-airline+++"
	" change tabline as well
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

	" allow use of powerline fonts & glyphs
	let g:airline_powerline_fonts = 1
	let g:airline_theme = 'deus'
"---vim-arline---"

"+++ctrlp+++"
	" force ctrlp to open files in tabs instead of buffers (buffers are dumb)
	let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }
	" search files, recents, as well as buffers
	let g:ctrlp_cmd = 'CtrlPMixed'
	" close NERDTree window
	let g:ctrlp_dont_split = 'NERD'
"---ctrlp---"
"
"+++NERDTree+++"
	" close vim if only window left is NERDTree
	autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 

	" open NERDTree with <leader>f
	map <leader>f :NERDTreeToggle<CR>
"---NERDTree---"

"+++NERDCommenter+++"
	" comments out whole lines in visual mode
	let NERDCommentWholeLinesInVMode = 1

	" removes spaces around comment delimiters when uncommenting
	let NERDRemoveExtraSpace = 1

	" add space after comment delimiters by default
	let g:NERDSpaceDelims = 1

	" align line-wise comment delimiters flush left instead of indentingnone
	let g:NERDDefaultAlign = 'start'
"---NERDCommenter---"

"+++Polyglot+++"
	let g:polyglot_disabled = ['rust']
"---Polyglot---"

"+++rust.vim+++"
	let g:rustfmt_autosave = 1
"---rust.vim---"
