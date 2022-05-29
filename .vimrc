syntax on

set mouse=a
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set number
set wildmenu
set showcmd

set hlsearch
set incsearch
set ignorecase
set smartcase
exec "nohlsearch"


" ################################################## "
" edit operation
" ################################################## "
noremap W :w<CR>
noremap Q :q<CR>
noremap J 5j
noremap K 5k
noremap H 4h
noremap L 4l
noremap P :noh<CR>
noremap n A<CR><ESC>
noremap <C-n> n
noremap U <C-r>
noremap <C-h> H
noremap <C-l> L


" ################################################## "
" Set split option
" ################################################## "
map sl :set splitright<CR>:vsplit<CR>
map sL :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sJ :set nosplitbelow<CR>:split<CR>
map <SPACE>h <C-w>h
map <SPACE>j <C-w>j
map <SPACE>k <C-w>k
map <SPACE>l <C-w>l


" ################################################## "
" NERDTree Setting
" ################################################## "
map tt :NERDTreeToggle<CR>
let NERDTreeMapCloserDir = "n"


" ################################################## "
" C++ Config
" ################################################## "

" C++ template
autocmd BufNewFile *.cpp 0r /Users/Heyya/CFPG/.template.cpp
autocmd BufNewFile *.cpp exec ":call SetTitle()"
autocmd BufNewFile *.cpp exec ":call Start()"
highlight LineNr ctermfg=grey

" Set .cpp title
func SetTitle()
	call append(0, "/**")
	call append(1, "  *	 author:  Heyya")
	call append(2, "  *	 created: ".strftime("%m.%d.%Y %H:%M"))
	call append(3, "**/")
endfunc

" start type
func Start()
	exec "10"
endfunc


" ################################################## "
" Auto Compiler
" ################################################## "
" Filetype based Mappings----{
" Get current filetype -> :echo &filetype or as variable &filetype
" [ Builds / Compiles / Interpretes  ]

" C Compiler:
autocmd FileType c nnoremap <buffer> E :w<CR> :!gcc % -o a <CR> :q <CR>

" C++ Compiler
autocmd FileType cpp nnoremap <buffer> E :w<CR> :!g++ -std=c++11 % -o a <CR> :q <CR>

" Python Interpreter
" autocmd FileType python nnoremap <buffer> <C-i> :!python % <CR>

" Bash script
" autocmd FileType sh nnoremap <buffer> <C-i> :!sh % <CR>

" Executable
" nnoremap <buffer> <C-i> :!./% <CR>
"nnoremap <buffer> <C-i> :! %:p <CR>

" RCs (Configs)
" autocmd FileType vim,zsh,tmux nnoremap <buffer> <C-i> :source % <CR>

" }


" ################################################## "
" Plug Setting
" ################################################## "
call plug#begin('~/.vim/plugged')


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'

call plug#end()
