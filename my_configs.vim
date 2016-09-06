" Custom vim configurations
" See https://github.com/amix/vimrc for more information
"-------------------------------------------------------

" Set line numbering on
set number 

" Set default indentaion to 2 (instead of 4)
set shiftwidth=2

" Set all indentations to be spaces rather than tabs and use 2 spaces (instead of 4)
set expandtab
set tabstop=2

" To toggle paste and nopaste (Vim's autoindentation/formatting feature when pasting text)
set pastetoggle=<F2>

" Show commands as they are typed (Shown at the bottom right of the screen)
set showcmd

" Enable omni completion (Used in conjunction with the SuperTab plugin)
" SuperTab plugin maps <Tab> to <C-X><C-O> and adds some other functionality making it easier to use
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" Enable defualt completion to start at top of list (instead of at the bottom of the list) and set supertab default type
" to context to let it decide whether to use omni completion or not
"let g:SuperTabContextDefaultCompletionType="<c-n>"
"let g:SuperTabDefaultCompletionType="context"

" Re-map keys to insert a new line (above or below cursor) in normal mode without switching to insert mode (such as when using o or O)
" Note that for some reason <S-Enter> doesn't seem to work correctly
"nmap <S-Enter> O<ESC>
"nmap <Enter> o<ESC>
nmap <F7> O<ESC>
nmap <F9> o<ESC>

" multi_cursor
" Default mapping - Since the custom modification of <C-s> in the original config file doesn't work
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'

" Enable neocomplcache (More powerful than the AutoComplPop)
" Note that YouCompleteMe is more powerful than both plugins but couldn't manage to get it to work with the installed version of Vim - it requires a more recent version
let g:neocomplcache_enable_at_startup=1

" Set neocomplcache autocompletion start length to 1 (Default setting by the plugin is 2)
let g:neocomplcache_auto_completion_start_length=1

" Set neocomplcache min-keyword-length autocompletion to 2 (Default setting by the plugin is 4) - Note that no keyword is shorter than 2 alphabets
let g:neocomplcache_min_keyword_length=2

" AutoComplPop like behavior that auto selects the predicted (autocompleted) word - For example if there is only a single predicted word left, you dont need to press the down arrow key before pressing enter, it automatically selects it - Note that this is not the default behaviour in the neocomplcache plugin
let g:neocomplcache_enable_auto_select = 1

" Enable tab completion for neocomplcache - Similar functionality to the one offered by the Supertab plugin - Note that this breaks the tab key autocomplete functionality for the snipMate plugin
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Map a key (shortcut) to toggle the Tagbar window (Uses the Tagbar plugin)
nmap <F8> :TagbarToggle<CR>

" Smart way to move between tabs
map <leader><left> gT
map <leader><right> gt

" For better session management
" Don't save options (Need to do this to avoid syntax highlighting problems/issues with vim sessions - syntax highlight doesn't work when loading a session if this setting is not set)
nmap <leader>ms :mksession! ./.session.vim<CR>
nmap <leader>ls :so ./.session.vim<CR>
set sessionoptions-=options

" To be able to save/write (to) read-only files easily (To use this command, type :Sudow) - Note that all custom commands need to start with an uppercase letter
" Also note that % refers to the current file/buffer and >/dev/null re-directs the output from tee
" Exclamation mark is used after command to prevent issues/errors when reloading a .vimrc file
command! Sudow w !sudo tee % >/dev/null

" Smarter buffer access (Uses the vim-airline plugin)
" Also note that the default plugin is the lightline.vim plugin which is overridden by the vim-airline plugin (Use vim-airline instead as it has more features)
let g:airline#extensions#tabline#enabled = 1
" Just show the file name (Instead of the full path)
let g:airline#extensions#tabline#fnamemod = ':t'

" Always open NERDTree vertical split on the left
let g:NERDTreeWinPos = "left"
  
" Smarter status bar with (horizontal) list of (listed) buffers
let g:bufferline_echo = 0   " Don't echo on the command bar
"let g:airline#extensions#bufferline#enabled = 0    " Bufferline is enabled for the airline plugin by default (Uncomment to disable)
