"autocmd User CocNvimInit

syntax on

set exrc
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set relativenumber
set hidden
set noerrorbells
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set nohlsearch
set encoding=UTF-8

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=200
 
" More space displaying messages
set cmdheight=2
 
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'simrat39/symbols-outline.nvim'

" Colour
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/seoul256.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb'

" Man pages
Plug 'vim-utils/vim-man'

Plug 'mbbill/undotree'

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Plug 'sbdchd/neoformat'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-commentary'

"Git work-tree
Plug 'ThePrimeagen/git-worktree.nvim'

" SQL
" Plug 'tpope/vim-dadbod'
" Plug 'kristijanhusak/vim-dadbod-ui' 
" Plug 'kristijanhusak/vim-dadbod-completion' 

" nerd tree
Plug 'preservim/nerdtree'


"icons
Plug 'ryanoasis/vim-devicons'


" harpoon
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'

Plug 'gko/vim-coloresque'

" Plug 'lifepillar/pgsql.vim' " PSQL Plugin needs :SQLSetType pgsql.vim
Plug 'ap/vim-css-color' "CSS colour preview

call plug#end()

colorscheme gruvbox
set background=dark

" Y behave like capital letters"
nnoremap Y y$

" Centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" " Skeleton files
" if has ("autocmd")
"     augroup templates
"         autocmd BufNewFile *.* silent! execute '0r ~/.vim/templates/skeleton.'.expand("<afile>:e")
"         autocmd BufNewFile *.java %s/<++>/\=expand("%:t:r") 
"         autocmd BufNewFile *.cpp %s/<++>/\=expand("%:t:r") 
"         autocmd BufNewFile *.h %s/<++>/\=toupper(expand("%:t:r"))
"     augroup END
" endif 

""locallist
"augroup locallist
"    autocmd!
"    " Populate locallist with lsp diagnostics automatically 
"    autocmd User LspDiagnosticsChanged :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
"augroup END

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let mapleader = " "

" git
nnoremap <leader>ga :git fetch --all<cr>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <esc> :noh<return><esc>

nnoremap <leader><tab> :bnext<CR>
nnoremap <leader>\ :bprevious<CR>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

" Window navigation
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>

" autosave
autocmd TextChanged,TextChangedI <buffer> silent write

"close buffers
nnoremap <leader>b :w<bar>%bd<bar>e#<CR>

" { 
" }
inoremap {<CR> {}<esc>i<CR><esc>O
inoremap /**<CR> /**<CR><CR><BS>/<esc>i*<esc>ka<space>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" go down one line
vnoremap <leader>p "_dP

noremap <leader>y "+y
vnoremap <leader>y "+y

" copy all
noremap <leader>Y gg"+yG

" NERDTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Fugative
nnoremap <Leader>gs :G<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>

"Harpoon
nnoremap <leader>i :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-t> :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <C-y> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-h> :lua require("harpoon.ui").nav_file(2)<CR>
"nnoremap <C-n> :lua require("harpoon.ui").nav_file(3)<CR>
"nnoremap <C-m> :lua require("harpoon.ui").nav_file(4)<CR>

"
" nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
" nnoremap <leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
" nnoremap <leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
" nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>

lua require'nvim-treesitter.configs'.setup { indent = { enable = true }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
lua require("telescope").load_extension("git_worktree")

source ~/.config/nvim/cocConfig.vim
source ~/.config/nvim/telescope.vim
source ~/.config/nvim/airline.vim
source ~/.config/nvim/QuickFix.vim

nnoremap <C-O> :CocCommand java.action.organizeImports<CR>

" -- Creates a worktree.  Requires the path, branch name, and the upstream
" -- Example:
" :lua require("git-worktree").create_worktree("feat-69", "master", "origin")

" -- switches to an existing worktree.  Requires the path name
" -- Example:
" :lua require("git-worktree").switch_worktree("feat-69")

" -- deletes to an existing worktree.  Requires the path name
" -- Example:
" :lua require("git-worktree").delete_worktree("feat-69")
"
"
" :lua require('telescope').extensions.git_worktree.git_worktrees()
" -- <Enter> - switches to that worktree
" -- <c-d> - deletes that worktree
" -- <c-D> - force deletes that worktree
"
" :lua require('telescope').extensions.git_worktree.create_git_worktree()
