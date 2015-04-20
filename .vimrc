set exrc
set secure

set tabstop=8
set softtabstop=0
set shiftwidth=4
set noexpandtab
set autoindent
set smartindent

syntax on
set colorcolumn=90

highlight ColorColumn ctermbg=darkgray

autocmd VimEnter * wincmd p
set number
let &colorcolumn=&textwidth
highlight ColorColumn ctermbg=darkgray

set ic
set hls
set is

set fileencoding=utf-8

autocmd filetype c,cpp set cin
autocmd filetype make set noexpandtab                                             
autocmd filetype make set nocin

map <c-n> :NERDTreeToggle<cr>
autocmd StdinReadPre * let s:std_in=1                                          
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif  
set splitright

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

let g:syntastic_enable_signs=1

let g:clang_library_path="/usr/lib/llvm/lib" 
let g:clang_snippets=1
let g:clang_periodic_quickfix=1
let g:clang_hl_errors=1
let g:clang_close_preview=1

run macros/clewn_mappings.vim
set previewheight=12

let g:clang_format#style_options = {
	\ "AccessModifierOffset" : -4,
	\ "AllowShortIfStatementsOnASingleLine" : "true",
	\ "AlwaysBreakTemplateDeclarations" : "true",
	\ "Standard" : "C++11"}

let g:clang_format#coding_style = "llvm"

" map to <Leader>cf in C++ code
autocmd FileType c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

