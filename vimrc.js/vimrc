language en_US
set nocompatible

" === Plugins ===
call plug#begin()

try
  source ~/.vimrc.js/vimrc.plugs
  source ~/.vimrc.js/vimrc.plugs.local
catch
endtry

call plug#end()

syntax enable

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

" let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
" let g:eslint_path = StrTrim(system('PATH=$(npm bin):$PATH && which eslint'))
" let g:stylelint_path = StrTrim(system('PATH=$(npm bin):$PATH && which stylelint'))

" === Plugin settings ===

if has('nvim')
  " == Shougo/deoplete.nvim ==
  " == carlitux/deoplete-ternjs ==
  let g:deoplete#enable_at_startup = 1
  let g:SuperTabDefaultCompletionType = "<c-n>"
  let g:nvim_typescript#javascript_support = 1
  " let g:deoplete#sources#flow#flow_bin = g:flow_path
  let g:tern_request_timeout = 1
  let g:tern_show_signature_in_pum = 0
  set completeopt-=preview

  " == neomake/neomake ==
  let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
  let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }
  let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_jsx_enabled_makers = ['eslint']
  let g:neomake_scss_enabled_makers = ['stylelint']
  let g:neomake_css_enabled_makers = ['stylelint']
  let g:neomake_less_enabled_makers = ['stylelint']
  let g:neomake_open_list = 0

  " let g:neomake_javascript_flow_exe = g:flow_path
  " let g:neomake_jsx_flow_exe = g:flow_path
  " let g:neomake_stylelint_exe = g:stylelint_path

  autocmd! BufWritePost * Neomake

  " neoformat
  let g:neoformat_enabled_javascript = ['prettiereslint']
  let g:neoformat_enabled_jsx = ['prettiereslint']
  let g:neoformat_basic_format_align = 1
  let g:neoformat_basic_format_trim = 1
  let g:neoformat_run_all_formatters = 1
  let g:neoformat_only_msg_on_error = 1
else
  " == scrooloose/syntastic ==
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 0
  let g:syntastic_auto_jump = 0
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 1
  let g:syntastic_javascript_checkers = ['eslint']
endif

" == mxw/vim-jsx ==
let g:jsx_ext_required = 0



try
  source ~/.vimrc.js/vimrc.local
catch
endtry


" Settings
set backupdir=~/.vimfiles/backup/
set directory=~/.vimfiles/backup/
set backupcopy=yes
set fileencoding=utf-8
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set nu
set splitright
set mouse=
let loaded_matchparen = 1

filetype plugin indent on

" Visual
syntax on
set completeopt=menu
set gcr=a:blinkon1
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set visualbell
set t_Co=256
colorscheme molokai
highlight ColorColumn ctermbg=darkgrey

" Powerline
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2

" Bindings
map <F2> :ProjectRootExe Ack
map <F3> :ProjectRootExe NERDTreeToggle<CR>
set pastetoggle=<F4>
nmap <F5> :%w !pbcopy<Return>
nmap <F6> :r !pbpaste<Return>
nmap <F7> :Neoformat<Return>
nmap <F8> <leader>cc
nmap <F9> :exec "!git blame ".(expand('%:p'))." -L".(line("."))." \| head -n20"<cr>
nmap <Tab> :b#<CR>
nmap <C-n> :lnext<Return>
inoremap <F10> <C-O>za
nnoremap <F10> za
onoremap <F10> <C-C>za
vnoremap <F10> zf
nnoremap <silent> <C-f> :exe 'CtrlP' projectroot#guess("'F")<cr>
nnoremap <silent> <C-p> :exe 'CtrlP' projectroot#guess()<cr>

" Identation and Spaces
autocmd FileType typescript,html,htmldjango,css,scss,less,sass,stylus,json,javascript,coffee setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=80
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=80
autocmd FileType javascript set formatprg=prettier-eslint\ --stdin

" Filetypes
autocmd BufRead,BufNewFile *.ejs,*.flow set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd BufRead,BufNewFile *.ts set filetype=typescript
autocmd BufRead,BufNewFile *.md,markdown,*.mkd setlocal syntax=markdown
autocmd BufRead,BufNewFile *.json,.eslintrc set filetype=json
autocmd BufNewFile,BufRead *.blade.php set ft=html
autocmd! BufWritePost *.js,*.jsx Neoformat

" Autoreload file
set autoread
au CursorMoved,CursorHold,FocusGained,BufEnter,InsertEnter * :checkt

" Autochange currdir
" autocmd BufEnter * silent! lcd %:p:h
set autochdir

" ctrlp
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|meteor)$|node_modules'
let g:ctrlp_max_height=25
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ackprg = 'ag --nogroup --nocolor --column'

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

" Emmet
let g:user_emmet_install_global = 1
autocmd FileType html,htmldjango,css,scss,sass,styl,javascript EmmetInstall

" Better Whitespace
" autocmd FileType typescript,css,sass,less,scss,coffee,python,html,javascript,javascript.jsx,blade,htmldjango,markdown autocmd BufWritePre <buffer> StripWhitespace

" Autocomplete with tern
set omnifunc=syntaxcomplete#Complete
let g:tern_map_keys=1
let g:tern_show_argument_hints="on_hold"

" Vim Markdown Preview
let vim_markdown_preview_hotkey='<C-m>'

" CSSComb

" autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb
"
" nnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
" vnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
"function Multiple_cursors_before()
"  let g:deoplete#disable_auto_complete = 1
"endfunction
"function Multiple_cursors_after()
"  let g:deoplete#disable_auto_complete = 0
"endfunction
"

" Elm
let g:elm_format_autosave=1

" CScope
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" autocmd FileType javascript autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd FileType javascript autocmd QuickFixCmdPost    l* nested lwindow

let g:neomake_logfile = '/tmp/neomake.log'

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightLineFilename',
      \ }
      \ }
function! LightLineFilename()
  return expand('%:p:h:t').'/'.expand('%:r').'.'.expand('%:e')
endfunction

" Prettier
let g:prettier#config#parser = 'typescript'
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0

set updatetime=300
set shortmess+=c
set re=0
let g:deoplete#enable_debug = 1
call deoplete#enable_logging('DEBUG', '/tmp/deoplete.log')
let $NVIM_NODE_LOG_FILE='/tmp/nvim-node.log'
let $NVIM_NODE_LOG_LEVEL='warn'
