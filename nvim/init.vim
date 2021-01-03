" ┌─────────────────────────────────────────┐
" │             init.vim (Neovim)           │
" ├─────────────────────────────────────────┤
" │   http://www.github.com/cyadehn/.vim    │
" └─────────────────────────────────────────┘
"
" URL: http://vim.wikia.com/wiki/Example_vimrc
    " Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
    " ┌─────────────────────────┐
    " │ Basic Features          │
        set nocompatible
        filetype indent plugin on
        syntax on
        set showmatch
        hi MatchParen ctermbg=none ctermfg=magenta cterm=bold 
        " Allow buffers to switch without write, confirm on close 
        set hidden
        set confirm
        " Command-line completion, partial commands in the last line of the screen
        set wildmenu
        set hlsearch
    " ┌─────────────────────────┐
    " │ Usability               │
        " Use case insensitive search, except when using capital letters
        set ignorecase
        set smartcase
        " Same indent as the line you're currently on
        set autoindent
        " Stop certain movements from always going to the first character of a line.
        set nostartofline
        " Set the command window height to 2 lines, to avoid many cases of having to
        " "press <Enter> to continue"
        set cmdheight=2
        " Display line numbers on the left
        set relativenumber
        set number
        " Quickly time out on keycodes, but never time out on mappings
        set notimeout ttimeout ttimeoutlen=200
        " Use <F11> to toggle between 'paste' and 'nopaste'
        set pastetoggle=<F11>
        " Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
        " which is the default
        map Y y$

" VictorMours Dotfile https://github.com/victormours/dotfiles/blob/master/vim/vimrc
    " Mostly stolen from Yan Pritzer's most excellent Yadr (github.com/skwp/dotfiles)
    " Use Vim settings, rather then Vi settings (much better!).
    " ┌─────────────────────────┐
    " │ General Config          │
        set history=1000                "Store lots of :cmdline history
        set showcmd                     "Show incomplete cmds down the bottom
        "set showmode                    "Show current mode down the bottom
        "set gcr=a:blinkon0              "Disable cursor blink
        set visualbell                  "No sounds
        set t_vb=                       "No visualbell either
        set autoread                    "Reload files changd outside vim
        " Copy the relative path of the current file to the clipboard
        "nmap <Leader>cf :silent !echo -n % \| pbcopy<Enter>
        " Only wrap at special characters
        set wrap       "Don't wrap lines
        set linebreak    "Wrap lines at convenient points
        "autocmd TextChangedI * silent! wa " Automatically save file
        autocmd VimResized * wincmd = " Automatically resize splits when resizing window
    " ┌─────────────────────────┐
    " │ Swap Files              │
        set noswapfile
        set nobackup
        set nowb
    " ┌─────────────────────────┐
    " │ Persistent Undo         │
        " Keep undo history across sessions, by storing in file.
        " Only works all the time.
        if has('persistent_undo')
            silent !mkdir ~/.vim/backups > /dev/null 2>&1
            set undodir=~/.vim/backups
            set undofile
        endif
    " ┌─────────────────────────┐
    " │ Indentation             │
        set autoindent
        set smartindent
        set smarttab
        set shiftwidth=4
        set softtabstop=4
        set tabstop=4
        set expandtab
        " Auto indent pasted text
        "nnoremap p p=`]<C-o>
        "nnoremap P P=`]<C-o>
        " Indentation settings for using 4 spaces instead of tabs.
        " Do not change 'tabstop' from its default value of 8 with this setup.
        "set shiftwidth=4
        "set softtabstop=4
        "set tabstop=4
        "set expandtab

" Cyadehn Dotfile Settings https://github.com/victormours/dotfiles/blob/master/vim/vimrc
    " ┌─────────────────────────┐
    " │ source .vimfiles        │
        source ~/.dotfiles/nvim/plugin-settings.vim
        source ~/.dotfiles/nvim/mapping.vim
        source ~/.dotfiles/nvim/functions.vim
        source ~/.dotfiles/nvim/abbrev.vim
    " ┌─────────────────────────┐
    " │ behavior settings       │
        set backspace=indent,eol,start
        set autochdir
        set foldmethod=indent
        " block,hor,mark,percent,quickfix,search,tag and undo. 
        set foldopen=hor,search
        set foldnestmax=2
        set foldcolumn=4
        set foldlevel=1
        " Open splits on the right and below
        set splitbelow
        set splitright
        autocmd VimEnter * :redraw!
    " ┌─────────────────────────┐
    " │ appearance settings     │
        " Powerline settings
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#buffer_nr_show = 1
        set termguicolors
        set cursorline
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h15
        " Theme settings
        set t_Co=256
        "set background=light
        "highlight Folded guibg=White guifg=Red
        "autocmd BufEnter * Highlightevery 150 300
