" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle

filetype off

set rtp+=$HOME/.vim/bundle/vundle/
"call vundle#begin("$HOME/.vim/bundle")
call vundle#begin()

" let Vundle manage Vundle (required)

Plugin 'VundleVim/Vundle.vim'

" Generic
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'tobyS/vmustache'

" Java
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'vim-scripts/java_getset.vim'
Plugin 'vim-scripts/javaDoc.vim'
"Plugin 'vim-scripts/jcommenter.vim'
Plugin 'derekwyatt/vim-scala'

" PHP
Plugin 'tobyS/pdv'
Plugin 'spf13/PIV'
Plugin 'joonty/vdebug'
Plugin 'tpope/vim-pathogen'

" Track the engine.
Plugin 'SirVer/ultisnips'

"Java
Plugin 'dansomething/vim-eclim'

" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'DavidEGx/ctrlp-smarttabs'
" Bundle 'gmarik/vundle'

call vundle#end()

" Smart tab ctrlp
let g:ctrlp_extensions = ['smarttabs']

"Filetype plugin indent on is required by vundle
filetype plugin indent on
