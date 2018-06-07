" ========== vim-plug  ==========
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

call plug#end()



" ========== Some General Settings ==========
syntax on
set nocompatible " no vi-compatible

" Automatic reloading of .vimrc
autocmd bufwritepost .vimrc source %

" autocmd Tmuxline

" Enable true color
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" Set theme to gruvbox
colorscheme gruvbox
set background=dark
let g:gruvbox_italic=1

" Add airline font
let g:airline_powerline_fonts=1


" ========== Enhancing Editing Experience ==========
" Better copy & paste
set clipboard=unnamed "in MacOS
set clipboard=unnamedplus " in Ubuntu

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Enable mouse
set mouse=a

" Enable indentation
set autoindent
set smartindent

" Soft tab
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" Imporove search experience
set hlsearch    " Highlight search results
set incsearch   " Makes search act like search in modern browsers
set ignorecase  " Make search case insensitive
set smartcase   " Make search smart about cases
nnoremap <leader><space> :nohlsearch<CR>  " Turn off search highlight

" Show matching brackets when text indicator is over them
set showmatch

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
" set splitbelow
" set splitright

" System clipboard copy & paste support
" set pastetoggle=<F2> "F2 before pasting to preserve indentation

" ========== Appearance ==========
" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Disable text wrap and enable long line warning 
set nowrap  " don not automatically wrap on load
set formatoptions-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Show relative line number by default
if !exists('g:noshowlinenumber')
    set number relativenumber
else
    set nonumber norelativenumber
endif

" Use absolute linenum in Insert mode; relative linenum in Normal mode
autocmd FocusLost,InsertEnter * :call UseAbsNum()
autocmd FocusGained,InsertLeave * :call UseRelNum()

function! UseAbsNum()
    if exists('g:noshowlinenumber') || exists('#goyo')
        set nonumber norelativenumber
    else
        set number norelativenumber
    endif
endfunction

function! UseRelNum()
    if exists('g:noshowlinenumber') || exists('#goyo')
        set nonumber norelativenumber
    else
        set number relativenumber
    endif
endfunction

" Make cursor always on the center of the screen
if !exists('noalwayscenter')
    " Calculate proper scrolloff
    autocmd VimEnter,WinEnter,VimResized,InsertLeave * :let &scrolloff = float2nr(floor(winheight(0)/2)+1)
    autocmd InsertEnter * :let &scrolloff = float2nr(floor(winheight(0)/2))
    " Use <Enter> to keep center in insert mode, need proper scrolloff
    inoremap <CR> <CR><C-o>zz
endif


" ========== Key Remapping ==========
" Map jk to exit edit mode
imap jk <Esc>

" Map leader key to
" let mapleader=","     " leader is comma, default is \

" Use tab to jump between blocks, because it's easier
" nnoremap <tab> %
" vnoremap <tab> %

" Move up and down based on visual lines
" nnoremap j gj
" nnoremap k gk

" Indentation shortcuts
" vnoremap < <gv        " better indentation
" vnoremap > >gv        " better indentation 

" move to beginning/end of line
" nnoremap B ^
" nnoremap E $
" $/^ doesn't do anything
" nnoremap $ <nop>
" nnoremap ^ <nop>

" C-T for new tab
" nnoremap <C-t> :tabnew<cr>


" ========== Key Remapping ==========
" inoremap <Space><Space> <Esc>/<++><Enter>"_c4l "insert certain tags
" autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i " move to tags
