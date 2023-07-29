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
noremap M n
noremap U <C-r>
noremap <C-h> H
noremap <C-l> L
" copy to system
noremap T :%y+<CR>


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
autocmd BufNewFile *.cpp 0r ~/.template.cpp
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
let g:ale_cpp_cc_options = "-std=c++17 -Wall" " Use c++17 to dense analysis
autocmd FileType cpp nnoremap <buffer> E :w<CR> :!g++ -std=c++17 % -o a <CR> :q <CR>

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

func vim-plug()
	exec ":!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endfunc


" ################################################## "
" Type the following code to get vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Plug Setting
" type :PlugInstall to install
" ################################################## "
call plug#begin('~/.vim/plugged')


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'preservim/nerdcommenter'

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

call plug#end()
