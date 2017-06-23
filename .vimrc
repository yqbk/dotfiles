"Basic Setup
set cursorline
set clipboard=unnamedplus
set autoindent
set number
syntax enable

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
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
"Plug 'Yggdroot/indentLine'
let g:plug_url_format = 'git@github.com:%s.git'
Plug 'slim-template/vim-slim'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:deoplete#enable_at_startup = 1
"let g:indentLine_enabled = 1

"Color setting
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme gruvbox

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
