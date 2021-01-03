" ┌─────────────────────────────────────────┐
" │         functions.vim (Neovim)          │
" ├─────────────────────────────────────────┤
" │   http://www.github.com/cyadehn/.vim    │
" └─────────────────────────────────────────┘
    " ┌─────────────────────────┐
    " │      TODO Command       │
    " └─────────────────────────┘
        command TODO noautocmd vimgrep /TODO\|FIXME/j ** | cw
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
    " │     HighlightEvery      │
    " └─────────────────────────┘
        function HighlightEvery(lineNumber, lineEnd)
            highlight myhighlightpattern ctermbg=darkred guibg=darkred
            let pattern="/"
            let i = 0
            while i < a:lineEnd
                let i += a:lineNumber
                let pattern .= "\\%" . i . "l\\|"
            endwhile
            let pattern .= "\\%0l/"
            let commandToExecute = "match myhighlightpattern ".pattern
            execute commandToExecute
        endfunction
        command -nargs=* Highlightevery call HighlightEvery(<f-args>)
