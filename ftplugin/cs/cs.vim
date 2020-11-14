" ┌─────────────────────────────────────────┐
" │       ftplugins/cs/cs.vim (Neovim)      │
" ├─────────────────────────────────────────┤
" │   http://www.github.com/cyadehn/.vim    │
" └─────────────────────────────────────────┘
    " ┌─────────────────────────┐
    " │    Folding Functions    │
    " └─────────────────────────┘
        function! GetFold(lnum)
            let thisLine = getline(v:lnum)  
            let nextLine = getline(v:lnum + 1)
            let lastLine = getline(v:lnum - 1)

            if match(thisLine, '^\s*$') >=0
                return "-1"
            endif
            " Match closing brackets
            if thisLine =~ '.*{.*}.*'
                if lastLine =~ '.*{.*},.*'
                    return "="
                elseif lastLine =~ '.*{.*'
                    if nextLine =~ '.*};.*'
                        return "="
                    elseif thisLine =~ '.*;.*'
                        return "="
                    else
                        return "a1"
                    endif
                endif
            endif
            if thisLine =~ '.*}.*'
                if lastLine =~ '.*{.*}.*'
                    return "s1"
                elseif thisLine =~ '.*};.*'
                    return "="
                else
                    return "s1"
                endif
            endif
            if nextLine =~ '.*{.*'
                if nextLine =~ '.*{.*}.*'
                    return "="
                else
                    return "a1"
                endif
            endif
            if thisLine =~ '.*{.*'
                return "="
            endif
            if lastLine =~ '.*}.*'
                if thisLine =~ '.*}.*'
                    if thisLine =~ '.*};.*'
                        return "s1"
                    else
                        return "a1"
                    endif
                elseif lastLine =~ '.*};.*'
                    return "s1"
                else
                    return "="
                endif
            endif
            return "="
        endfunction
        "
        function! CSharpFoldText(add)
            let line = getline(v:foldstart + a:add)
            let sub = substitute(line, '#region\s', '', 'i')
            let ts = &tabstop
            let text = ""
            while (l:ts > 0)
                let text = text . v:folddashes[0]
                let ts = ts - 1
            endwhile
            return substitute(sub, "\t", text, "g")
        endfunction
    " ┌─────────────────────────┐
    " │     Folding Settings    │
    " └─────────────────────────┘
        setlocal foldmethod=expr
        setlocal foldtext=CSharpFoldText(0)
        set foldexpr=GetFold(v:lnum)
    " ┌─────────────────────────┐
    " │         Unused          │
    " └─────────────────────────┘
        "set foldmethod=indent
        "set foldmarker={,}
        "set foldmethod=marker
        ""set foldexpr=getline(v:lnum)=~#'^{}'?'>1':'='
        ""set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
        "set foldtext=MyFoldText()
        "fu! MyFoldText()
        "let lineNr = v:foldstart
        "let text = ""
        "while (strlen(text) < winwidth(0) - v:foldlevel - 2) && lineNr <= v:foldend
        "let text .= getline(lineNr).' '
        "let lineNr += 1
        "endwhile
        "let text = v:folddashes . text
        "if strlen(text) > winwidth(0) - 5 
        "let text = strpart(text, 0, winwidth(0) - 5).' … }'
        "endif
        "return text
        "endfu
        "function! CFold()
        "let this_line = getline(v:lnum)
        "" Matching of braces
        "if match(this_line, '}') >= 0
        "return 's1'
        "elseif match(this_line, '{$') >= 0
        "return 'a1'
        "" Matching of comments
        "elseif match(this_line, '/\*') >= 0
        "if match(this_line, '\*/$') == -1
        "return 'a1'
        "" Matching custom folding
        "elseif match(this_line, '>>>') >= 0
        "return 'a1'
        "elseif match(this_line, '<<<') >= 0
        "return 's1'
        "endif
        "elseif match(this_line, '\*/$') >= 0
        "return 's1'
        "endif
        "return '='
        "endfunction
