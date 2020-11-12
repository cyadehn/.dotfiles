execute pathogen#infect()
call pathogen#helptags()
""" Plugins Installed
" ack.vim
" auto-pairs
" ctrlp.vim
" gruvbox
" nerdcommenter
" nerdtree
" surround
" syntastic
" tlib_vim
" vim-addon-mw-utils
" vim-airline
" vim-airline-themes
" vim-colors-solarized
" vim-dispatch
" vim-indent-guides
" vim-snipmate
" vim-snippets
"""


call plug#begin()
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'sheerun/vim-polyglot'
    "Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

"""
" CoC Settings
"""
    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    nmap <leader>qf  <Plug>(coc-fix-current)

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    highlight link CocErrorSign GruvboxRed

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <leader><space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <leader><space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <leader><space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <leader><space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <leader><space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <leader><space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <leader><space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <leader><space>p  :<C-u>CocListResume<CR>

"""
" Vim-Commentary Settings
"""
    autocmd FileType apache setlocal commentstring=#\ %s

"""
" Rainbow Brackets Settings
"""
    "let g:rainbow_active = 1

"""
" NERDTree Settings
"""
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
    let NERDTreeQuitOnOpen = 1
    let NERDTreeMinimalMenu = 1
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    
"""
" CtrlP
"""
nnoremap <leader>. :CtrlPTag<cr>

"""
" Indext
"""
    " Start indent guides on startup
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_indent_levels = 2
    let g:indent_guides_start_level=1
    let g:indent_guides_guide_size=4
