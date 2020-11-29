" ┌─────────────────────────────────────────┐
" │         functions.vim (Neovim)          │
" ├─────────────────────────────────────────┤
" │   http://www.github.com/cyadehn/.vim    │
" └─────────────────────────────────────────┘
    " ┌─────────────────────────┐
    " │      TODO Command       │
    " └─────────────────────────┘
        command TODO noautocmd vimgrep /TODO\|FIXME/j ** | cw
        "
    " ┌─────────────────────────┐
    " │    /w Close Function    │
    " └─────────────────────────┘
        function! CloseButDont()
            if (len(getbufinfo({'buflisted':1})) > 1)
                :w<CR>:bd<CR>
            else
                NERDTreeToggle<CR>
            endif
        endfunction
    " ┌─────────────────────────┐
    " │     PrettyIndent (?)    │
    " └─────────────────────────┘
        let g:pretty_indent_namespace = nvim_create_namespace('pretty_indent')
        function! PrettyIndent()
            let l:view=winsaveview()
            call cursor(1, 1)
            call nvim_buf_clear_namespace(0, g:pretty_indent_namespace, 1, -1)
            while 1
                let l:match = search('^$', 'W')
                if l:match ==# 0
                    break
                endif
                let l:indent = cindent(l:match)
                if l:indent > 0
                    call nvim_buf_set_virtual_text(
                                \   0,
                                \   g:pretty_indent_namespace,
                                \   l:match - 1,
                                \   [[repeat(repeat(' ', &shiftwidth - 1) . '│', l:indent / &shiftwidth), 'IndentGuide']],
                                \   {}
                                \)
                endif
            endwhile
            call winrestview(l:view)
        endfunction
        augroup PrettyIndent
            autocmd TextChanged * call PrettyIndent()
            autocmd BufEnter * call PrettyIndent()
            autocmd InsertLeave * call PrettyIndent()
        augroup END