Plug 'dracula/vim', { 'as': 'dracula' }

packadd! dracula
colorscheme dracula

augroup DraculaOverrides
    autocmd!
    autocmd ColorScheme dracula highlight DraculaBoundary guibg=none
    autocmd ColorScheme dracula highlight DraculaDiffDelete ctermbg=none guibg=none
    autocmd ColorScheme dracula highlight DraculaComment cterm=bold gui=bold
    autocmd User PlugLoaded ++nested colorscheme dracula
augroup end

