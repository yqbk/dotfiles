"Basic Setup
"set cursorline
set clipboard=unnamedplus
set autoindent
set number
syntax enable
"syntax on

"Indentation settings
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=2

"Keymapping
nmap <F8> :let &background = (&background == "dark"? "light" : "dark")<CR>
nmap <F7> :set invnumber <CR>
nmap <F2> :Explore <CR>
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

"function for Plug
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

"Plugins
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
"Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'mxw/vim-jsx'
"Plug 'jiangmiao/auto-pairs'
"Plug 'vim-syntastic/syntastic'
"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
"Plug 'Yggdroot/indentLine'
"let g:plug_url_format = 'git@github.com:%s.git'
"Plug 'slim-template/vim-slim'
call plug#end()

let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
let g:onedark_termcolors=256
"let g:deoplete#enable_at_startup = 1
"let g:indentLine_enabled = 1

"Color setting
set background=dark
colorscheme onedark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors"))
  set termguicolors
endif

"persisten undo
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
  endif    

if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-n>
else " no gui
  if has("unix")
    inoremap <Nul> <C-n>
  else
  " I have no idea of the name of Ctrl-Space elsewhere
  endif
endif

" React Settings
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']


" Switch between split screens using alt + arrow
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nnoremap J jzz
nnoremap K kzz

map <F2> :echo 'Current time is ' . strftime('%c')<CR>
