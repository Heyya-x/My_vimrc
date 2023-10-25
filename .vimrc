" ################################################## "
" Heyya's vim config
" https://github.com/Heyya-x/My_vimrc
" ################################################## "



" ################################################## "
" !!!ONLY FOR MACOS!!!
" macOS keylayout switch
" ################################################## "
let zh_CN = 'com.apple.inputmethod.SCIM.ITABC'
let en = 'com.apple.keylayout.ABC'
func SetCN()
	call system("im-select com.apple.inputmethod.SCIM.ITABC &")
endfunc

func SetEN()
	call system("im-select com.apple.keylayout.ABC &")
endfunc

autocmd InsertLeave * call SetEN()

" noremap <C-m> :call SetCN()<CR>
noremap <C-m> :call SetEN()<CR>i$$<Esc>F$a



" ################################################## "
" NERDTree Setting
" ################################################## "
map tt :NERDTreeToggle<CR>
let NERDTreeMapCloserDir = "n"



" ################################################## "
" VimTeX Setting
" ################################################## "
filetype plugin indent on
let g:tex_flavor = 'xelatex'
let g:vimtes_quickfix_mode = 0



" call deoplete#custom#var('omni', 'input_patterns', {
"      \ 'tex': g:vimtex#re#deoplete
"      \})



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
" Filetype based Mappings----
" Get current filetype -> :echo &filetype or as variable &filetype
" [ Builds / Compiles / Interpretes  ]

" C Compiler:
autocmd FileType c nnoremap <buffer> E :w<CR> :!gcc % -o a<CR> :q <CR>

" C++ Compiler
autocmd FileType cpp nnoremap <buffer> E :w<CR> :!g++ -std=gnu++17 % -o a <CR> :q <CR>

" Python Interpreter
" autocmd FileType python nnoremap <buffer> <C-i> :!python % <CR>

" Bash script
" autocmd FileType sh nnoremap <buffer> <C-i> :!sh % <CR>

" Executable
" nnoremap <buffer> <C-i> :!./% <CR>
"nnoremap <buffer> <C-i> :! %:p <CR>

" RCs (Configs)
" autocmd FileType vim,zsh,tmux nnoremap <buffer> <C-i> :source % <CR>

" LaTeX Compiler:
" autocmd FileType tex nnoremap <buffer> E :w<CR> :!xelatex -pdf % <CR> :!open %:r.pdf<CR>
autocmd FileType tex nnoremap <buffer> E :w<CR> :!latexmk %:r -xelatex -outdir=%:r %<CR> :!open ./%:r/%:r.pdf<CR>



" ################################################## "
" Plug Setting
" Install Plugin: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" type :PlugInstall to install
" ################################################## "
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'preservim/nerdcommenter'

"Plug 'ybian/smartim'

" This plug maybe require you do the following operation:
" cp ~/.vim/plugged/smartim/plugin/im-select /usr/local/bin/im-select


"" Plug(xkbswitch) on macOS
"" 1. Download require file from:
""   https://github.com/myshov/xkbswitch-macosx.git 
"" 2. Copy file:
""   cp ~/Download/xkbswitch-macosx/bin/xkbswitch /usr/local/bin
"" More detail see: https://github.com/myshov/xkbswitch-macosx

Plug 'lervag/vimtex'

" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" let g:deoplete#enable_at_startup = 1

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()



" ################################################## "
" Basic setting
" ################################################## "
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
" Edit operation
" ################################################## "
noremap S :source $MYVIMRC<CR>
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
nnoremap T :%y+<CR>

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


