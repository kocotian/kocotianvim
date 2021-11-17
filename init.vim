"                        _                              __ _
"  _ __   ___  _____   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
" | | | |  __/ (_) \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                            |___/
"
" Copyright (c) by Kocotian (2021)
"

let mapleader=","

call plug#begin('~/.config/nvim/plugged')
	" Beginning of plugins

	" My colorscheme
	Plug 'kocotian/vim-code16'

	" Starting screen
	Plug 'mhinz/vim-startify'

	" Basic vim plugins
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-speeddating'
	Plug 'tpope/vim-repeat'

	" Vimwiki
	Plug 'vimwiki/vimwiki'

	" Airline (a statusbar)
	Plug 'bling/vim-airline'

	" Autoclosing parenthesis, quotes, brackets, etc.
	" Plug 'Raimondi/delimitMate'

	" Indentationé
	Plug 'Yggdroot/indentLine'
	Plug 'lukas-reineke/indent-blankline.nvim'

	" Neomake
	Plug 'neomake/neomake'

	" Bookmarking
	Plug 'MattesGroeger/vim-bookmarks'

	" Choosewin
	Plug 't9md/vim-choosewin'

	" Cursorword
	Plug 'itchyny/vim-cursorword'

	" Expand region
	Plug 'terryma/vim-expand-region'

	" Vim matchup
	Plug 'andymass/vim-matchup'

	" Smooth scrolling
	Plug 'psliwka/vim-smoothie'

	" Wildfire
	Plug 'gcmt/wildfire.vim'

	" Goyo
	Plug 'junegunn/goyo.vim'

	" Emmet
	Plug 'mattn/emmet-vim'

	" Multi cursor mode
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}

	" Autocompletion and snippets
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }
	"Plug 'Shougo/neosnippet-snippets'
	Plug 'honza/vim-snippets'
	Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

	" LaTeX live preview
	Plug 'goballooning/vim-live-latex-preview'

	" End of plugins
call plug#end()

" Basic settings:
	colorscheme code16
	set title
	set clipboard+=unnamedplus
	set nohlsearch
	set noexpandtab
	set noshowmode

	" Normal splitting
	set splitbelow splitright

	" Encoding
	set encoding=utf-8

	" Autocompletion
	set wildmode=longest,full,list

" Basic mappings
	nnoremap j gj
	nnoremap k gk

	" Switch numbers with <leader>sn
	nnoremap <silent><leader>sn :set number! relativenumber!<CR>

" File types syntax
	autocmd BufRead,BufNewFile *.asm set filetype=nasm
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Terminal
	" disable line numbers on terminal
	autocmd TermOpen * setlocal nonumber norelativenumber

	" Triple escape in vim escapes terminal
	tnoremap <Esc><Esc><Esc> <C-\><C-n>

	" Open terminal on ctrl+n
	function! OpenTerminal()
		split term://zsh
		resize 10
	endfunction
	nnoremap <c-t> :call OpenTerminal()<CR>

" netrw configuration:
	let g:netrw_banner = 0
	let g:netrw_liststyle = 3

" vim-smoothie plugin configuration:
	let g:smoothie_experimental_mappings = v:true

" vimwiki plugin configuration:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	let g:vimwiki_list = [{'path': '~/dox/vimwiki', 'syntax': 'default', 'ext': '.wiki'}]

" deoplete plugin configuration:
	let g:deoplete#enable_at_startup = 1

" deoppet plugin configuration:
	call deoppet#initialize()
	call deoppet#custom#option('snippets',
		\ map(globpath(&runtimepath, 'snippets', 1, 1),
		\     { _, val -> { 'path': val } }))

	imap <C-k>  <Plug>(deoppet_expand)
	imap <C-f>  <Plug>(deoppet_jump_forward)
	imap <C-b>  <Plug>(deoppet_jump_backward)
	smap <C-f>  <Plug>(deoppet_jump_forward)
	smap <C-b>  <Plug>(deoppet_jump_backward)
