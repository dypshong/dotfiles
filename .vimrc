set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

Plugin 'mgechev/vim-jsx'

call vundle#end()            " required
filetype plugin indent on    " required


"lsp
nnoremap <leader>lf :LspDocumentFormat<CR>



let g:jsx_ext_required = 0


set ci


"layout
set nu

"highlight search
set hls
set incsearch

"styling
set ts=2
set sw=2
set expandtab

"menu mode
set wildmode=list:longest

"write buffers automatically when necessary
set autowrite

"highlight current line
"set cursorline

"tcsh-style cnoremap
cnoremap <C-A> <Home>
cnoremap <C-D> <Del>
cnoremap <C-K> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <ESC>b <S-Left>
cnoremap <ESC>f <S-Right>

cnoremap <c-k> <c-\>egetcmdline()[:max([0, getcmdpos()-1])]<CR><Del>


"cscope
if has("cscope")
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  set csverb
endif
nnoremap gsa :cscope find f <C-R>=expand("<cword>")<CR><CR>
nnoremap gsc :cscope find c <C-R>=expand("<cword>")<CR><CR>
nnoremap gsd :cscope find d <C-R>=expand("<cword>")<CR><CR>
nnoremap gse :cscope find e <C-R>=expand("<cword>")<CR><CR>
nnoremap gsf :cscope find f <C-R>=expand("<cword>")<CR><CR>
nnoremap gsg :cscope find g <C-R>=expand("<cword>")<CR><CR>
nnoremap gsi :cscope find i <C-R>=expand("<cword>")<CR><CR>
nnoremap gss :cscope find s <C-R>=expand("<cword>")<CR><CR>
nnoremap gst :cscope find t <C-R>=expand("<cword>")<CR><CR>

let g:jsx_ext_required = 0
