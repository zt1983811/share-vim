if has("syntax")
  syntax on
endif
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
 set background=dark
 set number
 set expandtab
 set tabstop=4
 set shiftwidth=4
 set autoindent
 set cindent
"  inoremap { {<CR>}<up><end><CR>
set tags=./tags;/
set autochdir
set t_Co=256
set clipboard=unnamedplus
set nocompatible               " be iMproved
set omnifunc=syntaxcomplete#Complete


""" Load plugins
if filereadable(expand("~/.vim/vundle.vim"))
  source ~/.vim/vundle.vim
endif
""" End Load plugins


 syntax on
" filetype plugin indent on
" colorscheme jc
" autocmd vimenter * NERDTree  " auto open dir tab when open files


""" Setup for Create ctags
function CreateTags()
    NERDTree
    let curNodePath = g:NERDTreeFileNode.GetSelected().path.str()
    exec ':!ctags -R --languages=php -f ' . curNodePath . '/tags ' . curNodePath
    NERDTreeClose
endfunction
nmap <silent> <F12> :execute CreateTags()<CR>
""" End setup ctags

" check syntax with Ctrl + L
" autocmd FileType php noremap &lt;C-L&gt; :!/usr/bin/env php -l %&lt;CR&gt;
" autocmd FileType phtml noremap &lt;C-L&gt; :!/usr/bin/env php -l %&lt;CR&gt
set regexpengine=1
syntax on

set go-=T
set wildmenu
set hlsearch
nnoremap <leader>v <C-w>v<C-w>l  
autocmd BufNewFile,BufRead *.html.twig set syntax=htmljinja
autocmd BufNewFile,BufRead *.js.twig set syntax=javascript
autocmd BufNewFile,BufRead *.php set syntax=php


""" Setup up for Ctags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <C-1> :TlistToggle<cr>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
""" END Setup up for Ctags


""" PHP Vdebug debugger with xdebug 
execute pathogen#infect()
call pathogen#helptags()
let g:vdebug_options = {
    \ 'server': 'localhost',
    \ 'port': 10000
\}
""" end For PHP Vdebug


""" Configure Ultisnips
"let g:UltiSnipsExpandTrigger = "<Tab>"
" let g:UltiSnipsListSnippets  = "<M-Tab>"
let g:UltiSnipsExpandTrigger = "<c->"
let g:UltiSnipsListSnippets  = "<c-2>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]
let g:UltiSnipsSnippetDirectories=["ultiSnips"]
""" End for Ultisnips


""" PHP doc generator
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
"nnoremap <buffer> <C-p> :call pdv#DocumentCurrentLine()<CR>
set nofoldenable                " disable code folding
let g:DisableAutoPHPFolding = 1 " disable PIV's folding
nmap <F8> :TagbarToggle<CR>     " for tagBar open
""" End for PHP doc


""" Steup for Java Doccumentation + Java getter and setter
nnoremap <leader>b <Plug>JavagetsetInsertBothGetterSetter
" autocmd FileType java let b:jcommenter_class_author='Tong Zhou (zt1983811@gmail.com)' 
" autocmd FileType java let b:jcommenter_file_author='Tong Zhou (zt1983811@gmail.com)' 
" autocmd FileType java source ~/.vim/bundle/jcommenter.vim/plugin/jcommenter.vim
" autocmd FileType java map <C-l> :call JCommentWriter()<CR> 
""" END Steup for Java Doccumentation


""" Setup for Eclimd JAVA
nnoremap <leader>i :JavaImport<cr>
nnoremap <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <leader>a :JavaGetSet<cr>
nnoremap <leader>c :JavaDocComment<cr>
nnoremap <leader>v :JavaCorrect<cr>
nnoremap <cr> :JavaSearchContext<cr>
let g:EclimCompletionMethod = 'omnifunc'
let g:SuperTabDefaultCompletionType = 'context'
""" End for Eclimd


""" Setup for javacomplete2

autocmd FileType java setlocal omnifunc=javacomplete#Complete
" To enable smart (trying to guess import option) inserting class imports with F4, add:
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

"To enable usual (will ask for import option) inserting class imports with F5, add:
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

"To add all missing imports with F6:
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

"To remove all missing imports with F7:
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

""" End for javacomplete2
