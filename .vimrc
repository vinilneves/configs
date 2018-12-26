:if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plgn')

Plug 'valloric/youcompleteme', { 'do': 'python3 install.py' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install && python3 install.py --clang-completer' } 	    
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-surround'	   
Plug 'eslint/eslint'
Plug 'vim-syntastic/syntastic'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install' }

call plug#end()

" ------ MARKDOWN PREVIEW -----------------------------------------------
" set to 1, the nvim will open the preview window once enter the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will just refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it just can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server only listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" switch browser to open preview page
" default: ''
let g:mkdp_browser = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''


" Prettier ESLint
"autocmd FileType javascript set formatprg=prettier-eslint\ --stdin
"autocmd BufWritePre *.js :normal gggqG

"Cores
colorscheme desertEx-v2

:set tabstop=2
:set shiftwidth=2
:set expandtab
:set autoread
:set autochdir
:set statusline=%F 
:set statusline+=%=%l,%c
:set number
:set nowrap
:set clipboard=unnamedplus

"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'

"NerdTree
map <leader>N :NERDTreeTabsClose<CR>
map <leader>n :NERDTreeFocusToggle<CR>

"CopyPasteClipboard
map <leader>c "+y
map <leader>v "+p

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP' 

"RegEx
set magic

"ESLint
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = '~/.nvm/versions/node/v9.11.2/bin/eslint'
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1

"Folding
set foldmethod=syntax
set foldcolumn=1
let javascript_fold=1
set foldlevelstart=99

"Clear Registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

map <leader>. :tabnext<CR>
map <leader>, :tabprevious<CR>
map <leader>tc :tabclose<CR>

"MAPEAMENTOS DO EASYDEBUGGER
" Debugger startup
nmap <S-R>   <Plug>EasyDebuggerInspect
nmap <S-W>   <Plug>EasyDebuggerWebInspect
" pause
nmap <F7>    <Plug>EasyDebuggerPause
tmap <F7>    <Plug>EasyDebuggerPause
" stepinto
nmap <F8>    <Plug>EasyDebuggerStepIn
tmap <F8>    <Plug>EasyDebuggerStepIn
" stepout
nmap <S-F8>  <Plug>EasyDebuggerStepOut
tmap <S-F8>  <Plug>EasyDebuggerStepOut
" step by step
nmap <F9>    <Plug>EasyDebuggerNext
tmap <F9>    <Plug>EasyDebuggerNext
" Continue
nmap <F10>   <Plug>EasyDebuggerContinue
tmap <F10>   <Plug>EasyDebuggerContinue
" toggle line break points
nmap <C-b>   <Plug>EasyDebuggerSetBreakPoint

map <leader>d :! node --inspect-brk %<CR>
