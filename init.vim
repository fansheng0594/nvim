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


" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <C-C> <ESC>





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
    source ~/.config/nvim/plugins/lastplace.vim
    source ~/.config/nvim/plugins/lion.vim
    source ~/.config/nvim/plugins/markdown-preview.vim
    source ~/.config/nvim/plugins/peekaboo.vim
    source ~/.config/nvim/plugins/phpactor.vim
    source ~/.config/nvim/plugins/projectionist.vim
    source ~/.config/nvim/plugins/quickscope.vim
    source ~/.config/nvim/plugins/repeat.vim
    " source ~/.config/nvim/plugins/rooter.vim
    source ~/.config/nvim/plugins/smooth-scroll.vim
    source ~/.config/nvim/plugins/splitjoin.vim
    source ~/.config/nvim/plugins/targets.vim
    source ~/.config/nvim/plugins/textobj-xmlattr.vim
    source ~/.config/nvim/plugins/unimpaired.vim
    source ~/.config/nvim/plugins/visual-star-search.vim
    source ~/.config/nvim/plugins/which-key.vim

    " Track the engine.
    Plug 'SirVer/ultisnips' | Plug 'phux/vim-snippets'

    " Snippets are separated from the engine. Add this if you want them:
    Plug 'honza/vim-snippets' 

call plug#end()



"----------------Auto-Commands--------------"
""Automatically source the init.vim file on save"
augroup autosourcing
autocmd!
    autocmd BufWritePost init.vim source %
augroup END
