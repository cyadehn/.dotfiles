" ┌─────────────────────────────────────────┐
" │      plugin-settings.vim (Neovim)       │
" ├─────────────────────────────────────────┤
" │   http://www.github.com/cyadehn/.vim    │
" └─────────────────────────────────────────┘
    " ┌─────────────────────────┐
    " │     Plugin Managers     │
    " └─────────────────────────┘
        " ┌─────────────────────────┐
        " │        Pathogen         │
        " └─────────────────────────┘
            "execute pathogen#infect()
            "call pathogen#helptags()
        " ┌─────────────────────────┐
        " │          Plug           │
        " └─────────────────────────┘
            call plug#begin()
                "Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
                Plug 'OmniSharp/omnisharp-vim'
                Plug 'Shougo/deoplete.nvim'
                Plug 'dense-analysis/ale'
                Plug 'sheerun/vim-polyglot'
                Plug 'jiangmiao/auto-pairs'
                Plug 'morhetz/gruvbox'
                Plug 'preservim/nerdcommenter'
                Plug 'scrooloose/nerdtree'
                Plug 'tpope/vim-surround'
                Plug 'scrooloose/syntastic'
                Plug 'nathanaelkane/vim-indent-guides'
                Plug 'tpope/vim-dispatch'
                Plug 'vim-airline/vim-airline'
                Plug 'vim-airline/vim-airline-themes'
                Plug 'altercation/vim-colors-solarized'
                "Plug 'mg979/vim-visual-multi', {'branch': 'master'}
            call plug#end()
    " ┌─────────────────────────┐
    " │     Plugin Settings     │
    " └─────────────────────────┘
        " ┌─────────────────────────┐
        " │  Auto-completion (CoC)  │
        " └─────────────────────────┘
            " Use tab for trigger completion with characters ahead and navigate.
            " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
            " other plugin before putting this into your config.
                "inoremap <silent><expr> <TAB>
                  "\ pumvisible() ? "\<C-n>" :
                  "\ <SID>check_back_space() ? "\<TAB>" :
                  "\ coc#refresh()
                "inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
                "nmap <leader>qf  <Plug>(coc-fix-current)
                "function! s:check_back_space() abort
                  "let col = col('.') - 1
                  "return !col || getline('.')[col - 1]  =~# '\s'
                "endfunction
            " Change highlight box color
                "highlight link CocErrorSign GruvboxRed
            " GoTo code navigation.
                "nmap <silent> gd <Plug>(coc-definition)
                "nmap <silent> gy <Plug>(coc-type-definition)
                "nmap <silent> gi <Plug>(coc-implementation)
                "nmap <silent> gr <Plug>(coc-references)
            " Mappings for CoCList
                "" Show all diagnostics.
                "nnoremap <silent><nowait> <leader><space>a  :<C-u>CocList diagnostics<cr>
                "" Manage extensions.
                "nnoremap <silent><nowait> <leader><space>e  :<C-u>CocList extensions<cr>
                "" Show commands.
                "nnoremap <silent><nowait> <leader><space>c  :<C-u>CocList commands<cr>
                "" Find symbol of current document.
                "nnoremap <silent><nowait> <leader><space>o  :<C-u>CocList outline<cr>
                "" Search workspace symbols.
                "nnoremap <silent><nowait> <leader><space>s  :<C-u>CocList -I symbols<cr>
                "" Do default action for next item.
                "nnoremap <silent><nowait> <leader><space>j  :<C-u>CocNext<CR>
                "" Do default action for previous item.
                "nnoremap <silent><nowait> <leader><space>k  :<C-u>CocPrev<CR>
                "" Resume latest coc list.
                "nnoremap <silent><nowait> <leader><space>p  :<C-u>CocListResume<CR>
        " ┌─────────────────────────┐
        " │   Deoplete / Omnisharp  │
        " └─────────────────────────┘
            if has('nvim')
              Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
            else
              Plug 'Shougo/deoplete.nvim'
              Plug 'roxma/nvim-yarp'
              Plug 'roxma/vim-hug-neovim-rpc'
            endif
            let g:deoplete#enable_at_startup = 1
            function SetCSSettings()
                " Use deoplete.
                call deoplete#enable()
                " Use smartcase.
                call deoplete#custom#option('smart_case', v:true)
                " Use OmniSharp-vim omnifunc 
                call deoplete#custom#source('omni', 'functions', { 'cs':  'OmniSharp#Complete' })
                " Set how Deoplete filters omnifunc output.
                call deoplete#custom#var('omni', 'input_patterns', {
                    \ 'cs': '[^. *\t]\.\w*',
                    \})
                " ... then goes your mappings for :OmniSharp* functions, see its doc
                " Recommended key-mappings.
                " <CR>: close popup and save indent.
                inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
                function! s:my_cr_function()
                  "return neocomplete#close_popup() . "\<CR>"
                  " For no inserting <CR> key.
                  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
                endfunction
                " <TAB>: completion.
                inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
                inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
                " <C-h>, <BS>: close popup and delete backword char.
                inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
                inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
                inoremap <expr><C-y>  neocomplete#close_popup()
                inoremap <expr><C-e>  neocomplete#cancel_popup()
                " Enable heavy omni completion.
                call deoplete#custom#source('_', 'sorters', [])
                if !exists('g:deoplete#sources')
                        let g:deoplete#sources = {}
                endif
                if !exists('g:deoplete#sources#omni#input_patterns')
                  let g:deoplete#sources#omni#input_patterns = {}
                endif
                let g:deoplete#sources#omni#input_patterns.cs = '.*[^=\);]'
                let g:deoplete#sources.cs = ['omni']
                let g:deoplete#enable_refresh_always = 0
                let g:echodoc_enable_at_startup = 1
                let g:deoplete#enable_insert_char_pre = 1
            endfunction
            augroup csharp_commands
                autocmd!
                " Use smartcase.
                " call deoplete#custom#option('smart_case', v:true) 
                autocmd FileType cs call SetCSSettings()
            augroup END
            " Prevent ALE from using MCS/other linters to avoid 'using' errors
            " in .cs files
            let g:ale_linters = {
                        \ 'cs': ['OmniSharp']
                        \}
        " ┌─────────────────────────┐
        " │      Vim-Commentary     │
        " └─────────────────────────┘
            autocmd FileType apache setlocal commentstring=#\ %s
            "
        " ┌─────────────────────────┐
        " │         NERDTree        │
        " └─────────────────────────┘
            "map nerdtree to ctrl-n
            nnoremap <C-n> :NERDTreeToggle<CR>
            let NERDTreeMinimalUI = 1
            let NERDTreeDirArrows = 1
            let NERDTreeQuitOnOpen = 1
            let NERDTreeMinimalMenu = 1
            autocmd StdinReadPre * let s:std_in=1
            "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
        " ┌─────────────────────────┐
        " │          CtrlP          │
        " └─────────────────────────┘
            nnoremap <leader>. :CtrlPTag<cr>
            "
        " ┌─────────────────────────┐
        " │          Indext         │
        " └─────────────────────────┘
            " Start indent guides on startup
            let g:indent_guides_enable_on_vim_startup = 1
            let g:indent_guides_indent_levels = 2
            let g:indent_guides_start_level=1
            let g:indent_guides_guide_size=4
