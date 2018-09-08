set termguicolors

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'vim-scripts/camelcasemotion'
Plug 'easymotion/vim-easymotion'

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

Plug 'airblade/vim-gitgutter'
Plug 'mhartington/oceanic-next' "Theme

Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'ctrlpvim/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'godlygeek/tabular'

Plug 'brooth/far.vim'

Plug 'KabbAmine/zeavim.vim'
Plug 'derekwyatt/vim-fswitch'

Plug 'tikhomirov/vim-glsl'

"Plug 'neomake/neomake'
"Plug 'vim-syntastic/syntastic'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-clang'
"Plug 'cyansprite/deoplete-omnisharp' , {'do': './install.sh'}

Plug 'Valloric/YouCompleteMe' , {'do': './install.py --system-libclang --clang-completer --cs-completer'}

Plug 'ryanoasis/vim-devicons'
call plug#end()

filetype indent on
filetype plugin indent on


set nobackup
set nowb
set noswapfile

"reads the file automatically if it has been changed outside
set autoread
"hide buffers
set hidden

" Ignore case when searching
set ignorecase
set smartcase

set hlsearch

" Use Unix as the standard file type
set ffs=unix,dos,mac

set ai "Auto indent
set si "Smart indent

set encoding=utf8
"set guifont=DroidSansMono\ Nerd\ Font\ 11
"let g:airline_powerline_fonts = 1


set relativenumber      " show relative line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu
set showmatch           " higlight matching parenthesis

""""""""""""""""""""
" => Folding 
""""""""""""""""""""
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of 1

set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4

"============================
"=========< Theme >==========
"============================

syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
let g:airline_theme='oceanicnext'


"============================
"=====< Plugin Tweaks >======
"============================

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

"let g:deoplete#enable_camel_case = 1
let g:deoplete#auto_refresh_delay = 10 
let g:deoplete#auto_complete_delay = 10

let g:gitgutter_map_keys = 0
set signcolumn=yes

let g:bufferline_show_bufnr = 1

let g:airline#extensions#tabline#enabled = 1

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cs'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['unity'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['fbx'] = ''



"============================
"======< Key Mapping >=======
"============================

let mapleader="\<Space>"
inoremap jk <ESC>
map 0 ^
nnoremap <Leader>w :w<CR>

" Window Management
map <C-h> <C-w>h		
map <C-j> <C-w>j	
map <C-k> <C-w>k	
map <C-l> <C-w>l

" Buffer Control
nnoremap <Leader>l :bn<cr>
nnoremap <Leader>h :bp<cr>
nnoremap <Leader>c :bd<cr>

" Copy & Paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Move a line of text using ALT+[jk] or Cmd+[jk]
nnoremap <Leader>j mz:m+<cr>`z
nnoremap <Leader>k mz:m-2<cr>`z

vnoremap <Leader>j :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <Leader>k :m'<-2<cr>`>my`<mzgv`yo`z 

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif


" Plugin 
nnoremap <F7> :NERDTreeToggle<CR>

nnoremap <Leader><Leader>t :Tabularize /
vnoremap <Leader><Leader>t :Tabularize /

" YCM
let g:ycm_confirm_extra_conf = 0 
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

nnoremap <Leader><Leader>g :YcmCompleter GoTo<cr>
nnoremap <Leader><Leader>f :YcmCompleter FixIt<cr>
vnoremap <Leader><Leader>f :YcmCompleter FixIt<cr>

":YcmCompleter GetType
":YcmCompleter GoToDeclaration
":YcmCompleter GoToDefinition

"FSHERE
nnoremap <Leader>t :FSHere<cr>
nnoremap <Leader><S-t> :FSSplitRight<cr>



" Zeal
" Steals focus currently... use with <leader> z
let g:zv_file_types = {
	\   'cs'                      : 'unity_3d',
	\   'sh'                      : 'bash',
	\   'vim'                     : 'vim',
	\   '.vimrc'                  : 'vim',
	\   'cmakelist.txt'           : 'cmake',
	\   'cmake'                   : 'cmake',
	\   '\v^(cpp|hpp)$'           : 'c,cpp',
	\   '\v^(c|h)$'               : 'c',
	\   '\v^(glsl|vs|fs)$'        : 'opengl_4',
	\   '\v^(md|mdown|mkd|mkdn)$' : 'markdown',
\ }


""CUSTOM MAKE
function Make(app)
    execute 'vsplit term://cd $(git rev-parse --show-toplevel) && cd bin && cmake .. && make -j && ./' . a:app
endfunction
nnoremap <F5> :call Make("Tool")<cr>
inoremap <F5> :call Make("Tool")<cr>

