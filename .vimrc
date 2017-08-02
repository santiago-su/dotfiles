execute pathogen#infect()

set nocompatible
set backspace=indent,eol,start
set backup		" keep a backup file (restore to previous version)
set backupdir=~/.vim/backupfiles
set et
set hidden
set history=50		" keep 50 lines of command line history
set incsearch		" do incremental searching
set ignorecase
set laststatus=2
set relativenumber
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set smartcase "Override 'ignorecase' when search contains upper case chars.
set sw=2 sts=2
set title
set undofile		" keep an undo file (undo changes after closing)
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set visualbell
set wildmenu
set wildmode=full


" UltiSnips and YouCompleteMe tab autocompletion
" via http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme/22253548#22253548

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_global_ycm_extra_conf ='.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:SuperTabCrMapping                = 0
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" vCoolor mapping
let g:vcoolor_map = '<C-c>'

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Stop highlighting
nnoremap <leader><space> :noh<cr>

" Open files in the same directory as the current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%


" Search with Ack
vmap <leader>vg "vy:Ack <C-R>v app lib config spec

set mouse=a

syntax on
set hlsearch

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" Use Solarized with dark theme
set background=dark " or light
color solarized

