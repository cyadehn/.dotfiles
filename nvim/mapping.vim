" ┌─────────────────────────────────────────┐
" │          mapping.vim (Neovim)           │
" ├─────────────────────────────────────────┤
" │   http://www.github.com/cyadehn/.vim    │
" └─────────────────────────────────────────┘
    " ┌─────────────────────────┐
    " │         Personal        │
    " └─────────────────────────┘
        "automatic zz on up/down"
        nnoremap j jzz
        nnoremap k kzz
        nnoremap G Gzz
        vnoremap j jzz
        vnoremap k kzz
        "buffer switch with s/x
        noremap s :bp<CR>
        noremap x :bn<CR>
        " set flow mode and shortcut
        nnoremap <silent> <Space> @=(foldlevel('.')?'zazz':"\<Space>")<CR>
        vnoremap <Space> zf
        " Quick jumping between splits
        map <C-J> <C-W>j
        map <C-K> <C-W>k
        map <C-H> <C-W>h
        map <C-L> <C-W>l
        " Open new splits easily
        "map xs <C-W>v
        "map sx <C-W>s
        "map Q  <C-W>q
        " Quick jump to beginning / end of line
        nnoremap H ^
        nnoremap L $
        " remap for easier command entry
        nnoremap ; :
        "Close buffer (without closing window)
        nnoremap <leader>w :bd<CR>
        nnoremap <leader>nw :bd<CR><bar>:NERDTreeToggle<CR>
        nnoremap <leader>W :wqa<CR>
        " Remap escape key ( from "Learn Vimscript the Hard Way" by Steve Losh )
        inoremap jk <esc>
        autocmd VimEnter * inoremap <Esc> <nop>
        " Ctrl-S to Save
        autocmd VimEnter * nnoremap <c-s> :w<CR>
        autocmd VimEnter * inoremap <c-s> <Esc>:w<CR>
        " Map <C-L> (redraw screen) to also turn off search highlighting until the
        " next search
        autocmd VimEnter * nnoremap <C-L> :nohl<CR>
