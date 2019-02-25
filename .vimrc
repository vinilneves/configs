" ----------------------------------------------------------------------
" | General Settings                                                   |
" ----------------------------------------------------------------------
set autochdir

set nocompatible               " Don't make vim vi-compatibile

syntax on                      " Enable syntax highlighting

if has('autocmd')
    filetype plugin indent on
    "           │     │    └──── Enable file type detection
    "           │     └───────── Enable loading of indent file
    "           └─────────────── Enable loading of plugin files
endif

set autoindent                 " Copy indent to the new line

set backspace=indent           " ┐
set backspace+=eol             " │ Allow `backspace`
set backspace+=start           " ┘ in insert mode

set backupdir=~/.vim/backups   " Set directory for backup files

set backupskip=/tmp/*          " ┐ Don't create backups
set backupskip+=/private/tmp/* " ┘ for certain files

set clipboard=unnamed          " ┐
                               " │ Use the system clipboard
if has('unnamedplus')          " │ as the default register
    set clipboard+=unnamedplus " │
endif                          " ┘

set cpoptions+=$               " When making a change, don't
                               " redisplay the line, and instead,
                               " put a `$` sign at the end of
                               " the changed text

set colorcolumn=73             " Highlight certain column(s)
set cursorline                 " Highlight the current line
set directory=~/.vim/swaps     " Set directory for swap files
set encoding=utf-8 nobomb      " Use UTF-8 without BOM
set history=5000               " Increase command line history
set hlsearch                   " Enable search highlighting
set ignorecase                 " Ignore case in search patterns

set incsearch                  " Highlight search pattern as
                               " it is being typed

set laststatus=2               " Always show the status line

set lazyredraw                 " Do not redraw the screen while
                               " executing macros, registers
                               " and other commands that have
                               " not been typed

set listchars=tab:▸\           " ┐
set listchars+=trail:·         " │ Use custom symbols to
set listchars+=eol:↴           " │ represent invisible characters
set listchars+=nbsp:_          " ┘

set magic                      " Enable extended regexp
set mousehide                  " Hide mouse pointer while typing
set noerrorbells               " Disable error bells

set nojoinspaces               " When using the join command,
                               " only insert a single space
                               " after a `.`, `?`, or `!`

set nostartofline              " Kept the cursor on the same column
set number                     " Show line number

set numberwidth=5              " Increase the minimal number of
                               " columns used for the `line number`

set report=0                   " Report the number of lines changed
set ruler                      " Show cursor position

set scrolloff=5                " When scrolling, keep the cursor
                               " 5 lines below the top and 5 lines
                               " above the bottom of the screen

set shortmess=aAItW            " Avoid all the hit-enter prompts
set showcmd                    " Show the command being typed
set showmode                   " Show current mode
set spelllang=en_us            " Set the spellchecking language

set smartcase                  " Override `ignorecase` option
                               " if the search pattern contains
                               " uppercase characters

set synmaxcol=2500             " Limit syntax highlighting (this
                               " avoids the very slow redrawing
                               " when files contain long lines)

set tabstop=2                  " ┐
set softtabstop=2              " │ Set global <TAB> settings
set shiftwidth=2               " │ http://vimcasts.org/e/2
set expandtab                  " ┘

set ttyfast                    " Enable fast terminal connection
set undodir=~/.vim/undos       " Set directory for undo files
set undofile                   " Automatically save undo history
"set virtualedit=all            " Allow cursor to be anywhere

set visualbell                 " ┐
set noerrorbells               " │ Disable beeping and window flashing
set t_vb=                      " ┘ https://vim.wikia.com/wiki/Disable_beeping

set wildmenu                   " Enable enhanced command-line
                               " completion (by hitting <TAB> in
                               " command mode, Vim will show the
                               " possible matches just above the
                               " command line with the first
                               " match highlighted)

set winminheight=0             " Allow windows to be squashed

" ----------------------------------------------------------------------
" | Plugins                                                            |
" ----------------------------------------------------------------------

" Use Vundle to manage the vim plugins
" https://github.com/gmarik/Vundle.vim

" Disable file type detection
" (required by Vundle)
" filetype off

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Set the runtime path to include Vundle
" set runtimepath+=~/.vim/plugins/Vundle.vim

" Initialize Vundle and specify the path
" where the plugins should be installed
" call vundle#begin('~/.vim/plugins')
call plug#begin('~/.vim/plugged')

    " Let Vundle manage Vundle (this is important!)
    " Plug 'gmarik/Vundle.vim'

    Plug 'joshdick/onedark.vim'

    Plug 'altercation/vim-colors-solarized'
    Plug 'ap/vim-css-color'
    Plug 'chrisbra/unicode.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'godlygeek/tabular'
    Plug 'kien/ctrlp.vim'
    " Plug 'marijnh/tern_for_vim'
    Plug 'mattn/emmet-vim'
    Plug 'mattn/webapi-vim'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'othree/html5.vim'
    Plug 'plasticboy/vim-markdown'
    Plug 'raimondi/delimitmate'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/syntastic'
    Plug 'Shougo/neocomplcache'
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'shutnik/jshint2.vim'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    " Plug 'wakatime/vim-wakatime'
    Plug 'wavded/vim-stylus'
    Plug 'digitaltoad/vim-jade'
    Plug 'pangloss/vim-javascript'
    Plug 'guns/vim-clojure-static'
    Plug 'mxw/vim-jsx'
    Plug 'itchyny/lightline.vim'
    Plug 'neovimhaskell/haskell-vim'

    Plug 'jparise/vim-graphql'
    Plug 'isRuslan/vim-es6'
    Plug 'leafgarland/typescript-vim'

    " Plugins do gordim
    Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --ts-completer' }

call plug#end()
" call vundle#end()

filetype on

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'modified'] ]
      \ }
      \ }

" ----------------------------------------------------------------------
" | Plugins - Emmet                                                    |
" ----------------------------------------------------------------------

" Redefine trigger key for Emmet
" http://docs.emmet.io/cheat-sheet/

let g:user_emmet_leader_key='<C-Y>'

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" ----------------------------------------------------------------------
" | Plugins - Snippets
" ----------------------------------------------------------------------


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Load custom Emmet snippets
" http://docs.emmet.io/customization/snippets/

" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/snippets/emmet.json')), "\n"))


" ----------------------------------------------------------------------
" | Plugins - Indent Guides                                            |
" ----------------------------------------------------------------------

" Set custom indent colors
" https://github.com/nathanaelkane/vim-indent-guides#setting-custom-indent-colors

let g:indent_guides_auto_colors = 0

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd
        \ guibg=#00323D
        \ ctermbg=Magenta

autocmd VimEnter,Colorscheme * :hi IndentGuidesEven
        \ guibg=#073642
        \ ctermbg=DarkMagenta

let g:ycm_max_diagnostics_to_display=0

" ----------------------------------------------------------------------
" | Plugins - Markdown                                                 |
" ----------------------------------------------------------------------

" Disable Folding
" https://github.com/plasticboy/vim-markdown#disable-folding

let g:vim_markdown_folding_disabled=1


" ----------------------------------------------------------------------
" | Plugins - NeoComplCache                                            |
" ----------------------------------------------------------------------

" Enable `neocomplcache` by default
" https://github.com/Shougo/neocomplcache.vim#installation

let g:neocomplcache_enable_at_startup=1
let g:neocomplete#enable_fuzzy_completion=1

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python =
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Make `<TAB>` autocomplete

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


" ----------------------------------------------------------------------
" | Plugins - Syntastic                                                |
" ----------------------------------------------------------------------

" Inform Syntastic which checkers to use based on file types
" https://github.com/scrooloose/syntastic#3-faq

let g:syntastic_html_checkers = [ 'jshint' ]
let g:syntastic_javascript_checkers = [ 'jshint', 'eslint' ]
let g:syntastic_javascript_eslint_exe='npx eslint'
let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1

" Disable syntax checking by default
let g:syntastic_mode_map = {
    \ 'active_filetypes': [],
    \ 'passive_filetypes': []
\}


" ----------------------------------------------------------------------
" | Helper Functions                                                   |
" ----------------------------------------------------------------------

function! GetGitBranchName()

    let branchName = ''

    if exists('g:loaded_fugitive')
        let branchName = '[' . fugitive#head() . ']'
    endif

    return branchName

endfunction

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! StripTrailingWhitespaces()

    " Save last search and cursor position
    let searchHistory = @/
    let cursorLine = line('.')
    let cursorColumn = col('.')

    " Strip trailing whitespaces
    %s/\s\+$//e

    " Restore previous search history and cursor position
    let @/ = searchHistory
    call cursor(cursorLine, cursorColumn)

endfunction

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! ToggleLimits()

    " [51,73]
    "   - git commit message
    "     http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
    " [81]
    "   - general use

    if ( &colorcolumn == '73' )
        set colorcolumn+=51,81
    else
        set colorcolumn-=51,81
    endif

endfunction

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! ToggleRelativeLineNumbers()

    if ( &relativenumber == 1 )
        set norelativenumber
    else
        set relativenumber
    endif

endfunction


" ----------------------------------------------------------------------
" | Automatic Commands                                                 |
" ----------------------------------------------------------------------

if has('autocmd')

    " Autocommand Groups
    " http://learnvimscriptthehardway.stevelosh.com/chapters/14.html

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Automatically reload the configurations from the
    " `~/.vimrc` and `~/.gvimrc` files whenever they are changed

    augroup auto_reload_vim_configs

        autocmd!
        autocmd BufWritePost vimrc source $MYVIMRC

        if has('gui_running')
            autocmd BufWritePost gvimrc source $MYGVIMRC
        endif

    augroup END

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Automatically strip the trailing whitespaces when files are saved

    augroup strip_trailing_whitespaces

        " List of file types that use the trailing whitespaces:
        "
        "  * Markdown
        "    https://daringfireball.net/projects/markdown/syntax#block

        let excludedFileTypes = [ 'mkd.markdown' ]

        " Only strip the trailing whitespaces if the file type is
        " not in the excluded file types list

        autocmd!
        autocmd BufWritePre * if index(excludedFileTypes, &ft) < 0 | :call StripTrailingWhitespaces()

    augroup END

endif


" ----------------------------------------------------------------------
" | Color Scheme                                                       |
" ----------------------------------------------------------------------

set t_Co=256                   " Enable full-color support

set background=dark            " Use colors that look good
                               " on a dark background

" Set custom configurations for when the
" Solarized theme is used from vim's Terminal mode
" http://ethanschoonover.com/solarized/vim-colors-solarized#advanced-configuration

if !has('gui_running')
    let g:solarized_contrast = 'high'
    let g:solarized_termcolors = 256
    let g:solarized_termtrans = 1
    let g:solarized_visibility = 'high'
endif

" colorscheme solarized          " Use custom color scheme

set splitright
set splitbelow

" ----------------------------------------------------------------------
" | Key Mappings                                                       |
" ----------------------------------------------------------------------

" Use a different mapleader (default is '\')
let mapleader = ','

imap <C-s> <Plug>(neosnippet_expand_or_jump)
nmap <leader>d :YcmCompleter GoTo<CR>
nmap <leader>l :last<CR>
"" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,* ] Search and replace the word under the cursor
nmap <leader>* :%s/\<<C-r><C-w>\>//<Left>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,cc] Toggle code comments
" https://github.com/tomtom/tcomment_vim
map <leader>cc :TComment<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,cr] Calculate result
" http://vimcasts.org/e/56
nmap <leader>cr 0yt=A<C-r>=<C-r>"<CR><Esc>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,cs] Clear search
map <leader>cs <Esc>:noh<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,h ] JSHint the code
" https://github.com/Shutnik/jshint2.vim
nmap <leader>h :JSHint<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,l ] Toggle `set list`
" nmap <leader>l :set list!<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,n ] Toggle `set relativenumber`
nmap <leader>n :call ToggleRelativeLineNumbers()<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,ss] Strip trailing whitespace
nmap <leader>ss :call StripTrailingWhitespaces()<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,t ] Toggle NERDTree
map <leader>t :NERDTreeToggle<CR>

nnoremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> <ESC>:NERDTreeToggle<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,ti] Toggle indent
nmap <leader>ti <Plug>IndentGuidesToggle

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,tl] Toggle show limits
nmap <leader>tl :call ToggleLimits()<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,ts] Toggle Syntastic
nmap <leader>ts :SyntasticToggleMode<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,v ] Make the opening of the `.vimrc` file easier
nmap <leader>v :vsp $MYVIMRC<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,W ] Sudo write
map <leader>W :w !sudo tee %<CR>,


" ----------------------------------------------------------------------
" | Status Line                                                        |
" ----------------------------------------------------------------------

" Terminal types:
"
"   1) term  (normal terminals, e.g.: vt100, xterm)
"   2) cterm (color terminals, e.g.: MS-DOS console, color-xterm)
"   3) gui   (GUIs)

highlight ColorColumn
    \ term=NONE
    \ cterm=NONE  ctermbg=237    ctermfg=NONE
    \ gui=NONE    guibg=#073642  guifg=NONE

highlight CursorLine
    \ term=NONE
    \ cterm=NONE  ctermbg=235  ctermfg=NONE
    \ gui=NONE    guibg=#073642  guifg=NONE

highlight CursorLineNr
    \ term=bold
    \ cterm=bold  ctermbg=NONE   ctermfg=178
    \ gui=bold    guibg=#073642  guifg=Orange

highlight LineNr
    \ term=NONE
    \ cterm=NONE  ctermfg=241    ctermbg=NONE
    \ gui=NONE    guifg=#839497  guibg=#073642

highlight User1
    \ term=NONE
    \ cterm=NONE  ctermbg=237    ctermfg=Grey
    \ gui=NONE    guibg=#073642  guifg=#839496

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" set statusline=
" set statusline+=%1*            " User1 highlight
" set statusline+=\ [%n]         " Buffer number
" set statusline+=\ %{GetGitBranchName()} " Git branch name
" set statusline+=\ [%F]         " Path to the file
" set statusline+=%m             " Modified flag
" set statusline+=%r             " Readonly flag
" set statusline+=%h             " Help file flag
" set statusline+=%w             " Preview window flag
" set statusline+=%y             " File type
" set statusline+=[
" set statusline+=%{&ff}         " File format
" set statusline+=:
" set statusline+=%{strlen(&fenc)?&fenc:'none'} " File encoding
" set statusline+=]
" set statusline+=%=             " Left/Right separator
" set statusline+=%c             " File encoding
" set statusline+=,
" set statusline+=%l             " Current line number
" set statusline+=/
" set statusline+=%L             " Total number of lines
" set statusline+=\ (%P)\        " Percent through file

" Example result:
"
"  [1] [master] [vim/vimrc][vim][unix:utf-8]            17,238/381 (59%)


" ----------------------------------------------------------------------
" | Personal Settings                                                  |
" ----------------------------------------------------------------------
com! Formatjson %!python -m json.tool
com! Formatxml !xmllint --format -

set list
set nowrap
set backupcopy=yes

colorscheme onedark

" EJS
au BufNewFile,BufRead *.{ejs,mjml} set filetype=html


" ----------------------------------------------------------------------
" | Local Settings                                                     |
" ----------------------------------------------------------------------

" Load local settings if they exist
"
" Note: The following needs to be included last in order to allow
"       any of the above settings to be overwritten by local ones

if filereadable(glob('~/.vimrc.local'))
    source ~/.vimrc.local
endif

" Haskell configuration
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_classic_highlighting = 1

let g:jsx_ext_required = 0

" Open file using `gf` in a vertical tab
nnoremap gf :vertical wincmd f<CR>

