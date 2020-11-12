"map nerdtree to ctrl-n
    nnoremap <C-n> :NERDTreeToggle<CR>

"automatic zz on up/down"
    nnoremap j jzz
    nnoremap k kzz
    nnoremap G Gzz
    vnoremap j jzz
    vnoremap k kzz
    vnoremap G Gzz

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

" Open splits on the right and below
    set splitbelow
    set splitright

nnoremap H ^
nnoremap L $

nnoremap ; :

"Close buffer (without closing window)
    nnoremap <leader>w :bd<CR>
    nnoremap <leader>nw :bd<CR><bar>:NERDTreeToggle<CR>
    nnoremap <leader>W :wqa<CR>

"""
" Remap escape key
"""
    inoremap jk <esc>
    inoremap <esc> <nop>

" Ctrl-S to Save
    nnoremap <c-s> :w<CR>
    inoremap <c-s> <Esc>:w<CR>
