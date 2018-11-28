" Custom vim configurations
" See https://github.com/amix/vimrc for more information
"-------------------------------------------------------

" Set line numbering on
set number 

" Set default indentaion to 2 (instead of 4)
set shiftwidth=2

" Set all indentations to be spaces rather than tabs and use 2 spaces (instead
" of 4)
set expandtab
set tabstop=2

" To toggle paste and nopaste (Vim's autoindentation/formatting feature when
" pasting text)
set pastetoggle=<F2>

" Show commands as they are typed (Shown at the bottom right of the screen)
set showcmd

" Enable omni completion (Used in conjunction with the SuperTab plugin) SuperTab
" plugin maps <Tab> to <C-X><C-O> and adds some other functionality making it
" easier to use
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" Enable defualt completion to start at top of list (instead of at the bottom of
" the list) and set supertab default type to context to let it decide whether to
" use omni completion or not
"let g:SuperTabContextDefaultCompletionType="<c-n>"
"let g:SuperTabDefaultCompletionType="context"

" Re-map keys to insert a new line (above or below cursor) in normal mode
" without switching to insert mode (such as when using o or O) Note that for
" some reason <S-Enter> doesn't seem to work correctly. Disabling this mapping
" as it is provided by the vim-unimpaired plugin
"nmap <S-Enter> O<ESC>
"nmap <Enter> o<ESC>
" nmap <F7> O<ESC>
" nmap <F9> o<ESC>

" multi_cursor Default mapping - Since the custom modification of <C-s> in the
" original config file doesn't work
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'

" Enable neocomplcache (More powerful than the AutoComplPop) Note that
" YouCompleteMe is more powerful than both plugins but couldn't manage to get it
" to work with the installed version of Vim - it requires a more recent version
" let g:neocomplcache_enable_at_startup=1

" Set neocomplcache autocompletion start length to 1 (Default setting by the
" plugin is 2)
" let g:neocomplcache_auto_completion_start_length=1

" Set neocomplcache min-keyword-length autocompletion to 2 (Default setting by
" the plugin is 4) - Note that no keyword is shorter than 2 alphabets
" let g:neocomplcache_min_keyword_length=2

" AutoComplPop like behavior that auto selects the predicted (autocompleted)
" word - For example if there is only a single predicted word left, you dont
" need to press the down arrow key before pressing enter, it automatically
" selects it - Note that this is not the default behaviour in the neocomplcache
" plugin
" let g:neocomplcache_enable_auto_select=1

" Enable tab completion for neocomplcache - Similar functionality to the one
" offered by the Supertab plugin - Note that this breaks the tab key
" autocomplete functionality for the snipMate plugin
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Map a key (shortcut) to toggle the Tagbar window (Uses the Tagbar plugin)
nmap <F8> :TagbarToggle<CR>

" Smart way to move between tabs
map <leader><left> gT
map <leader><right> gt

" For better session management
" Don't save options (Need to do this to avoid syntax highlighting
" problems/issues with vim sessions - syntax highlight doesn't work when loading
" a session if this setting is not set) - Also need to manually handle the
" NERDTree window as it doesn't play well with vim sessions - Use | to insert
" inline comments as Vim interprets the pipe character as a command termination.
" To combine several commands that need to be run on a specific mapping we
" either need to escape the | (pipe) using backslash (\) or use <bar> instead
" Always start vim in project's base directory. The modification of path using
" vimstartdir makes sure that the session file in created in the project's base
" directory (and not in subdirectories where the current buffer is located)
let vimstartdir = getcwd()
nmap <silent> <leader>ms :NERDTreeClose<CR>\|:execute ":mksession! ".vimstartdir."/.session.vim"\|:NERDTree<CR>|    " Close NERDTree window, create session, (re)load NERDTree window 
nmap <silent> <leader>ls :execute ":so ".vimstartdir."/.session.vim"\|:NERDTree<CR>|    " Load NERDTree window after loading the session
set sessionoptions-=options

" To be able to save/write (to) read-only files easily (To use this command,
" type :Sudow) - Note that all custom commands need to start with an uppercase
" letter Also note that % refers to the current file/buffer and >/dev/null
" re-directs the output from tee. Exclamation mark is used after command to
" prevent issues/errors when reloading a .vimrc file (It is used to redefine an
" already existing command)
command! Sudow w !sudo tee % >/dev/null

" Smarter buffer access (Uses the vim-airline plugin) Also note that the default
" plugin is the lightline.vim plugin which is overridden by the vim-airline
" plugin (Use vim-airline instead as it has more features)
let g:airline#extensions#tabline#enabled=1
" Just show the file name (Instead of the full path)
let g:airline#extensions#tabline#fnamemod=':t'

" Always open NERDTree vertical split on the left
let g:NERDTreeWinPos="left"
  
" Smarter status bar with (horizontal) list of (listed) buffers
let g:bufferline_echo=0|   " Don't echo on the command bar
let g:bufferline_show_bufnr=0|    " Don't display buffer numbers
"let g:airline#extensions#bufferline#enabled = 0|   " Bufferline is enabled for
"the airline plugin by default (Uncomment to disable)

" Don't automatically break lines when characters in a line go over a set limit
" (Setting textwidth to 0 disables this) - Setting it to 80 instead to make it
" earier to navigate through files
"set textwidth=0
set textwidth=80

" Change default spell check language to use British English (en_gb) - Note that
" the default spell check language is American English
set spelllang=en_gb

" Set spell check to always on
set spell

" Set spellfile to store custom words
set spellfile=$HOME/.vim_runtime/en.utf-8.add

" Set autochdir option to automatically change directory to which the currently
" opened file/buffer belongs - Using autocmd instead as autochdir breaks
" functionality with the bufferline plugin
"set autochdir
autocmd BufEnter * silent! :lcd %:p:h

" Change mapping for Y to yank from cursor until the end of the line
map Y y$

" Set the tags option to be able to find the tags file created using ctags with
" an upward directory search up to the ~ directory. This is helpful when the
" current directory in vim (i.e. in a vim window) is not where the tags files
" is. Note: Run ctags recursively (with the -R flag) on the project's root
" folder so that it covers all files for the project
set tags=./tags,./TAGS,tags;~,TAGS;~

" Need to call this function as yankstack key bindings clashes with the 'S'
" keymap from the vim-surround plugin
call yankstack#setup()

" Disable smartindent as it is a deprecated option. It's replacement is cindent.
" Also note that smartindent messes with indentation of comments in Python files.
set nosi
set cindent
set cinkeys-=0#
set indentkeys-=0#

" Update formatoptions to include the 'j' flag. It is useful when joining
" commented lines using the J keymap. Also remove t to prevent auto-wrapping
" text using textwidth
set formatoptions+=j
"set formatoptions-=t

" Include alpha in the nrformat option for CTRL-A and CTRL-X to work with an
" alphabetic index/list
set nrformats+=alpha

" Set swapfile option to create swap files for files opened (and being edited)
" in vim
set swapfile

" These work like * and g*, but do not move the cursor and always set hls.
" Refer to: https://superuser.com/questions/255024/highlighting-a-search-term-without-moving-the-cursor
" Note <C-M> is equivalent to <CR> (i.e. a carriage return)
map <Leader>* :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
map <Leader>g* :let @/ = expand('<cword>')\|set hlsearch<C-M>

" Yank visual selection without moving cursor back to start of visual selection
vmap y ygv<Esc>

" Show buffer numbers next to buffer names on the buffer list status line on the
" top portion of the screen
let g:airline#extensions#tabline#buffer_nr_show = 1

" Set cscope to use relative paths. This is particularly useful for projects
" where code is split into multiple subdirectories and vim's current directory
" is changed dynamically with the location of the current buffer. Set option to
" use quickfix list when using cscope
set csre
set cscopequickfix=s-,c-,d-,i-,t-,e-

" Remove the newtab value from the switchbuf option (Useful when using the
" quickfix list as it opens new/existing bufferes in the current tab)
set switchbuf-=newtab

" Functionality for searching using / and ? in visual selection
" Refer to http://vim.wikia.com/wiki/Search_only_over_a_visual_range for more information
function! RangeSearch(direction)
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.
          \ '\%>'.(line("'<")-1).'l'.
          \ '\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
endfunction
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>

" Adds flexibility to visual block mode
set virtualedit=block

" To make YCM work with UtilSnips (and vim-snippets, and supertab)
" Refer to https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
" Make YCM compatible with UltiSnips (using supertab)
" IMPORTANT NOTE: Need to set PYTHONPATH environment variable to the path of
" site-packages so that YCM can find/index packages only available within that
" environment
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_stop_completion = ['<C-y>', '<C-e>']
" let g:ycm_semantic_triggers = {
" 	\   'python': [ 're!\w+' ]
" 	\ }
" let g:ycm_show_diagnostics_ui = 0

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Basic vim-snippets configurations
let g:snips_author="Ashish Tibrewal"
let g:snips_email="ashish.tibrewal@hotmail.com"
let g:snips_github="https://github.com/ashishtibrewal"
let g:tex_flavor = "latex"

" Activate vim-hybrid colorscheme (Also change colour for selected text as the
" default one isn't clearly visible)
set background=dark
colorscheme hybrid
hi Visual ctermbg=105

" Syntastic plugin settings
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map = { 'mode': 'passive'}

" ALE plugin settings
" let g:ale_sign_error = 'a>'
" let g:ale_sign_warning = 'a-'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 1
let g:ale_sign_column_always = 1
let g:ale_list_window_size = 5
" let g:ale_lint_on_enter = 0
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'python': ['autopep8']
" \}
" let g:ale_linters_explicit = 1

" To search for visually selected text
vnoremap // y/<C-R>"<CR>

" Automatically close quickfix and location list buffers when closing the last buffer
" Note that both quickfix and location list buffers/windows have buftype set to quickfix
" Refer to https://stackoverflow.com/questions/7476126/how-to-automatically-close-the-quick-fix-window-when-leaving-a-file
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END
