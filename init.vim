" ┌─────────────────────────────────────────┐
" │             init.vim (Neovim)           │
" ├─────────────────────────────────────────┤
" │   http://www.github.com/cyadehn/.vim    │
" └─────────────────────────────────────────┘
"
" URL: http://vim.wikia.com/wiki/Example_vimrc
    " Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
    " ┌─────────────────────────┐
    " │     Basic Features      │
    " └─────────────────────────┘
        " Set 'nocompatible' to ward off unexpected things that your distro might
        " have made, as well as sanely reset options when re-sourcing .vimrc
        set nocompatible
        " Attempt to determine the type of a file based on its name and possibly its
        " contents. Use this to allow intelligent auto-indenting for each filetype,
        " and for plugins that are filetype specific.
        filetype indent plugin on
        " Enable syntax highlighting
        syntax on
        " Enable bracket match highlighting
        set showmatch
        hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
    " ┌─────────────────────────┐
    " │       Must-haves        │
    " └─────────────────────────┘
        " 1. Allow buffers to switch without write
        " 2. Confirm on abandoning buffers whether to save
        set hidden
        set confirm
        " Better command-line completion
        set wildmenu
        " Show partial commands in the last line of the screen
        set showcmd
        " Highlight searches (use <C-L> to temporarily turn off highlighting; see the
        " mapping of <C-L> below)
        set hlsearch
    " ┌─────────────────────────┐
    " │        Usability        │
    " └─────────────────────────┘
        " Use case insensitive search, except when using capital letters
        set ignorecase
        set smartcase
        " Allow backspacing over autoindent, line breaks and start of insert action
        set backspace=indent,eol,start
        " When opening a new line and no filetype-specific indenting is enabled, keep
        " the same indent as the line you're currently on. Useful for READMEs, etc.
        set autoindent
        " Stop certain movements from always going to the first character of a line.
        " While this behaviour deviates from that of Vi, it does what most users
        " coming from other editors would expect.
        set nostartofline
        " Display the cursor position on the last line of the screen or in the status
        " line of a window
        set ruler
        " Always display the status line, even if only one window is displayed
        set laststatus=2
        " Instead of failing a command because of unsaved changes, instead raise a
        " dialogue asking if you wish to save changed files.
        set confirm
        " Use visual bell instead of beeping when doing something wrong
        set visualbell
        " And reset the terminal code for the visual bell. If visualbell is set, and
        " this line is also included, vim will neither flash nor beep. If visualbell
        " is unset, this does nothing.
        set t_vb=
        " Enable use of the mouse for all modes
        "set mouse=a
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
    " ┌─────────────────────────┐
    " │       Indentation       │
    " └─────────────────────────┘
        " Indentation settings for using 4 spaces instead of tabs.
        " Do not change 'tabstop' from its default value of 8 with this setup.
        set shiftwidth=4
        set softtabstop=4
        set tabstop=4
        set expandtab
    " ┌─────────────────────────┐
    " │     Useful Mappings     │
    " └─────────────────────────┘
        " Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
        " which is the default
        map Y y$
        " Map <C-L> (redraw screen) to also turn off search highlighting until the
        " next search
        "autocmd VimEnter * nnoremap <C-L> :nohl<CR>

" VictorMours Dotfile https://github.com/victormours/dotfiles/blob/master/vim/vimrc
    " Mostly stolen from Yan Pritzer's most excellent Yadr (github.com/skwp/dotfiles)
    " Use Vim settings, rather then Vi settings (much better!).
    " ┌─────────────────────────┐
    " │     General Config      │
    " └─────────────────────────┘
        "set number                      "Line numbers are good
        "set backspace=indent,eol,start  "Allow backspace in insert mode
        set history=1000                "Store lots of :cmdline history
        set showcmd                     "Show incomplete cmds down the bottom
        "set showmode                    "Show current mode down the bottom
        set gcr=a:blinkon0              "Disable cursor blink
        "set visualbell                  "No sounds
        set autoread                    "Reload files changd outside vim
        " Copy the relative path of the current file to the clipboard
        nmap <Leader>cf :silent !echo -n % \| pbcopy<Enter>
        " Only wrap at special characters
        set wrap       "Don't wrap lines
        set linebreak    "Wrap lines at convenient points
        "autocmd TextChangedI * silent! wa " Automatically save file
        autocmd VimResized * wincmd = " Automatically resize splits when resizing window
    " ┌─────────────────────────┐
    " │       Swap Files        │
    " └─────────────────────────┘
        set noswapfile
        set nobackup
        set nowb
    " ┌─────────────────────────┐
    " │     Persistent Undo     │
    " └─────────────────────────┘
        " Keep undo history across sessions, by storing in file.
        " Only works all the time.
        if has('persistent_undo')
            silent !mkdir ~/.vim/backups > /dev/null 2>&1
            set undodir=~/.vim/backups
            set undofile
        endif
    " ┌─────────────────────────┐
    " │      Indentation        │
    " └─────────────────────────┘
        set autoindent
        set smartindent
        set smarttab
        "set shiftwidth=2
        "set softtabstop=2
        "set tabstop=2
        "set expandtab
        " Auto indent pasted text
        "nnoremap p p=`]<C-o>
        "nnoremap P P=`]<C-o>
    " ┌─────────────────────────┐
    " │         Plugins         │
    " └─────────────────────────┘
        "call plug#begin('~/.vim/plugged')
        "
        "" Cool plugins
        "Plug 'scrooloose/nerdtree'
        "Plug 'Xuyuanp/nerdtree-git-plugin'
        "Plug 'yegappan/mru'
        "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
        "Plug 'junegunn/fzf.vim'
        "Plug 'ctrlpvim/ctrlp.vim'
        "Plug 'mg979/vim-visual-multi', {'branch': 'master'}
        "
        "Plug 'Shougo/neocomplete.vim'
        "Plug 'tommcdo/vim-exchange'
        "Plug 'ntpeters/vim-better-whitespace'
        "Plug 'tpope/vim-surround'
        "Plug 'tpope/vim-repeat'
        "Plug 'jiangmiao/auto-pairs'
        "Plug 'vim-scripts/CursorLineCurrentWindow'
        "Plug 'victormours/better-writing.vim'
        "Plug 'janko-m/vim-test'
        "Plug 'skywind3000/asyncrun.vim'
        "Plug 'dense-analysis/ale'
        "
        "" Search
        "Plug 'henrik/vim-indexed-search'
        "Plug 'nixprime/cpsm'
        "Plug 'mileszs/ack.vim'
        "
        "" Git
        "Plug 'tpope/vim-fugitive'
        "
        "" Tmux
        "Plug 'tmux-plugins/vim-tmux'
        "Plug 'christoomey/vim-tmux-navigator'
        "
        "" Visuals
        "Plug 'altercation/vim-colors-solarized'
        "
        "" Commenting
        "Plug 'tomtom/tlib_vim'
        "Plug 'tomtom/tcomment_vim'
        "
        "" HTML
        "Plug 'mattn/emmet-vim'
        "Plug 'slim-template/vim-slim'
        "Plug 'mustache/vim-mustache-handlebars'
        "
        "" Javascript
        "Plug 'pangloss/vim-javascript'
        "Plug 'mxw/vim-jsx'
        "Plug 'othree/yajs.vim'
        "Plug 'othree/javascript-libraries-syntax.vim'
        "Plug 'claco/jasmine.vim'
        "Plug 'kchmck/vim-coffee-script'
        "Plug 'lfilho/cosco.vim'
        "
        "" Ruby
        "Plug 'Keithbsmiley/rspec.vim'
        "Plug 'tpope/vim-rails'
        "Plug 'tpope/vim-endwise'
        "Plug 'victormours/vim-ruby-refactoring'
        "Plug 'vim-ruby/vim-ruby'
        "Plug 'emilsoman/spec-outline.vim'
        "Plug 'victormours/vim-rspec'
        "Plug 'nelstrom/vim-textobj-rubyblock'
        "Plug 'kana/vim-textobj-user'
        "Plug 'jgdavey/vim-blockle'
        "Plug 'KurtPreston/vim-autoformat-rails'
        "Plug 'ngmy/vim-rubocop'
        "Plug 'victormours/ruby-memoize.vim'
        "
        "" Elixir
        "Plug 'elixir-lang/vim-elixir'
        "
        "" Elm
        "Plug 'lambdatoast/elm.vim'
        "
        "" Terraform
        "Plug 'hashivim/vim-terraform'
        "
        "
        "call plug#end()
        "
    " ┌─────────────────────────┐
    " │      Grep Settings      │
    " └─────────────────────────┘
        " grep word under cursor
        nnoremap <Leader>g :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>
    " ┌─────────────────────────┐
    " │     Unused Settings     │
    " └─────────────────────────┘
        "syntax enable
        "
        "" Solarized theme
        "let g:solarized_termtrans = 1
        "set background=light
        "colorscheme solarized
        "
        "if has("gui_running")
        ""tell the term has 256 colors
        "set t_Co=256
        "endnowrap
        "
        "source ~/.dotfiles/vim/splits.vim
        "source ~/.dotfiles/vim/tabs.vim
        "source ~/.dotfiles/vim/font.vim
        "source ~/.dotfiles/vim/ruby.vim
        "source ~/.dotfiles/vim/javascript.vim
        "
        " Better search
        "set hlsearch
        "set incsearch
        "
        "
        "if executable('rg')
        "set grepprg=rg\ --vimgrep\ --no-heading
        "set grepformat=%f:%l:%m
        "endif
        "
        "nnoremap <Leader>a :Ack!<Space>
        "
        "
        "set nowrap       "Don't wrap lines
        "
        "" Move normally between wrapped lines
        "nmap j gj
        "nmap k gk
        "vmap j gj
        "vmap k gk
        "
        "autocmd BufReadPre,FileReadPre *.md :set wrap
        "
        "" Enable filetype plugins for vim-textobj-rubyblock
        "if has("autocmd")
        "filetype indent plugin on
        "endif
        "set scrolloff=5 " Keep 5 lines below and above the cursor
        "
        "set cursorline
        "
        "function! GetBranchName(_) abort
        "let b:branch_name = systemlist("git rev-parse --abbrev-ref HEAD 2> /dev/null || echo ''")[0]
        "endfunction
        "call timer_start(1000, function('GetBranchName'), {'repeat': -1})
        "
        "autocmd BufEnter,BufWritePost * call GetBranchName("")
        "
        "set laststatus=2
        "set statusline=%f " tail of the filename
        "set statusline+=\ c:%c " column number
        "set statusline+=%= " switching to right side
        "set statusline+=%(%{b:branch_name}%)
        "
        "command FormatJSON %!python -m json.tool
        "
        "lazy js. Append ; at the end of the line
        "nnoremap <Leader>; m`A;<Esc>``
        "
        "if has("gui_running")
        "set fullscreen
        "end
        "
        "" Set vertical bar as cursor in insert mode
        "if exists('$TMUX')
        "let &t_SI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=1\x7\<esc>\\"
        "let &t_EI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=0\x7\<esc>\\"
        "else
        "let &t_SI = "\<esc>]50;CursorShape=1\x7"
        "let &t_EI = "\<esc>]50;CursorShape=0\x7"
        "endif
        "
        "nmap <Leader>s :write<Enter>
        "nmap <Leader>r :redraw!<Enter>
        "
        "let g:VM_maps = {}
        "let g:VM_maps['Find Under']         = 'zz'           " replace C-n
        "let g:VM_maps['Find Subword Under'] = 'zz'e
        "let mapleader = "\<Space>"
        "nmap <Leader>rxm :ExtractMethod<Enter>

" Cyadehn Dotfile Settings https://github.com/victormours/dotfiles/blob/master/vim/vimrc
    " ┌─────────────────────────┐
    " │     source .vimfiles    │
    " └─────────────────────────┘
        source ~/.vim/plugins.vim
        source ~/.vim/mapping.vim
        source ~/.vim/functions.vim
        source ~/.vim/abbrev.vim
    " ┌─────────────────────────┐
    " │    behavior settings    │
    " └─────────────────────────┘
        set backspace=indent,eol,start
        set autochdir
        "disable auto commenting
        "autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
        set foldmethod=indent
        " block,hor,mark,percent,quickfix,search,tag and undo. 
        set foldopen=hor,search
        set foldnestmax=2
        set foldcolumn=4
        set foldlevel=1
        "set foldclose=hor
    " ┌─────────────────────────┐
    " │   appearance settings   │
    " └─────────────────────────┘
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h15
        " Powerline settings
        let g:airline_theme='papercolor'
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#buffer_nr_show = 1
        set termguicolors
        " Theme settings
        set t_Co=256
        set background=dark
        highlight Folded ctermbg=White ctermfg=Red
        autocmd VimEnter * let g:gruvbox_italic = '1'
        autocmd vimenter * ++nested colorscheme gruvbox
        autocmd VimEnter * hi CursorLine   cterm=NONE ctermbg=darkgrey guibg=Grey7 
        autocmd VimEnter * hi CursorColumn cterm=NONE ctermbg=darkgrey guibg=Grey7 
        "autocmd VimEnter hi CursorLine term=bold cterm=bold guibg=Grey40
        set cursorline
