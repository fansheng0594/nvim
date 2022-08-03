set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" 完美从 vim 过渡到 nvim
source ~/.vimrc


" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamedplus
let &t_ut=''
set autochdir

" ===
" === window
" ===
" nnoremap <LEADER>j <C-w>j
" nnoremap <LEADER>h <C-w>h
" nnoremap <LEADER>k <C-w>k
" nnoremap <LEADER>l <C-w>l

" ===
" === keymap include jesarchers
" ===
nnoremap gf :edit <cfile><CR>

" ===
" === language
" ===
" language en_US.UTF-8


" ===
" === snippets
" ===
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ctags
" au BufWritePost *.php silent! !eval '[ -f 
".git/hooks/ctags" ] && .git/hooks/ctags' &

" ===
" === clipboard use system clipboard
" ===
" set clipboard=unnamedplus



" ===
" === welcome
" ===
" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction
" let g:startify_lists = [
"         \ { 'type': 'files',     'header': ['   Recent Files']            },
"         \ { 'type': 'dir',       'header': ['   Dir '. getcwd()] },
"         \ { 'type': 'sessions',  'header': ['   Sessions']       },
"         \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   Bookmarks']      },
"         \ ]

" ===
" === php.vim
" ===
let g:php_version_id = 70408
let php_var_selector_is_identifier = 1

" ===
" === ncm2
" ===
" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <C-C> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" ag
let g:ackprg = 'ag --vimgrep'





" ===
" === plug install
" ===
call plug#begin(stdpath('data') . '/plugged')
    source ~/.config/nvim/plugins/fzf.vim
    source ~/.config/nvim/plugins/dracula.vim
    source ~/.config/nvim/plugins/floaterm.vim
    source ~/.config/nvim/plugins/nerdtree.vim
    source ~/.config/nvim/plugins/polyglot.vim
    source ~/.config/nvim/plugins/coc.vim
    source ~/.config/nvim/plugins/tagbar.vim
    source ~/.config/nvim/plugins/easyclip.vim
    source ~/.config/nvim/plugins/abolish.vim
    source ~/.config/nvim/plugins/airline.vim
    source ~/.config/nvim/plugins/commentary.vim
    source ~/.config/nvim/plugins/editorconfig.vim
    source ~/.config/nvim/plugins/eunch.vim
    source ~/.config/nvim/plugins/exchange.vim
    source ~/.config/nvim/plugins/firenvim.vim
    source ~/.config/nvim/plugins/fugitive.vim

    " Track the engine.
    Plug 'SirVer/ultisnips' | Plug 'phux/vim-snippets'

    " Snippets are separated from the engine. Add this if you want them:
    Plug 'honza/vim-snippets' 



    "
    " Plug 'amiorin/vim-project'

    "
    Plug 'mhinz/vim-startify'

    "
    Plug 'StanAngeloff/php.vim'

    "
    Plug 'stephpy/vim-php-cs-fixer'

     " assuming you're using vim-plug: https://github.com/junegunn/vim-plug
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'

    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

    " ack search  :Ack! 'foo bar' ~/Code/laravel-7
    Plug 'mileszs/ack.vim'

    " neomake
    Plug 'neomake/neomake'

    " refactoring
    Plug 'adoy/vim-php-refactoring-toolbox'



call plug#end()



"----------------Auto-Commands--------------"
""Automatically source the init.vim file on save"
augroup autosourcing
autocmd!
    autocmd BufWritePost init.vim source %
augroup END
