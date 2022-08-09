" https://github.com/terryma/vim-smooth-scroll
Plug 'terryma/vim-smooth-scroll'

nnoremap <silent> K :call smooth_scroll#up(&scroll, 0, 5)<CR>
nnoremap <silent> J :call smooth_scroll#down(&scroll, 0, 5)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 8)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 8)<CR>
