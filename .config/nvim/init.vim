lua require 'bobrossrtx'
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/autoload/plug.vim

au BufRead,BufNewFile *.fountain set filetype=fountain

" General Settings
set encoding=UTF-8 nobackup nowritebackup nocursorline
set splitright splitbelow
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab nowrap
set backspace=indent,eol,start
set mouse=a
set guicursor=
set exrc
set relativenumber
set number
set hidden
set ruler
set noerrorbells
set noswapfile
set undodir=~/.vim/undodir undofile
set lazyredraw
set nohlsearch
set incsearch
set smartcase
set ignorecase
set showmatch
set termguicolors
set scrolloff=8
set noshowmode
set showmode
set showcmd
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

fun! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfun

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Plugins - Vim Plug
call plug#begin('~/.vim/plugged')
" {{ Theme }}
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

" {{ File Management }}
Plug 'vifm/vifm.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'francoiscabrol/ranger.vim' | Plug 'rbgrouleff/bclose.vim'

" {{ Telescope & requirements }}
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'simrat39/symbols-outline.nvim'

" {{ Tree sitter }}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" {{ Snippets }}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ackyshake/VimCompletesMe'

" {{ Language Server }}
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'neovim/nvim-lspconfig'

" {{ Productivity }}
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(69) } }
Plug 'alok/notational-fzf-vim'
Plug 'jbyuki/venn.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim' | Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'preservim/tagbar'
Plug 'vim-syntastic/syntastic'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdcommenter'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'jreybert/vimagit'
Plug 'alexpearce/nvim-follow-markdown-links', { 'do': ':UpdateRemotePlugins' }

Plug 'ggandor/lightspeed.nvim'
Plug 'tjdevries/train.nvim'

" {{ Fun Stuff }}
Plug 'andweeb/presence.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-scripts/fountain.vim' | Plug 'tpope/vim-markdown' | Plug 'ap/vim-css-color'
Plug 'voldikss/vim-floaterm'
Plug 'dense-analysis/ale'
Plug 'frazrepo/vim-rainbow'
Plug 'PotatoesMaster/i3-vim-syntax'
call plug#end()

" Plugins - Vundle
set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugged')
" Let vundle manage itself
Plugin 'VundleVim/Vundle.vim'

Plugin 'prashanthellina/follow-markdown-links'
call vundle#end()
filetype plugin indent on

" fzf notes
let g:nv_search_paths = ['~/notes']


" nerdcommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" UltiSnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsEditSplit='vertical'

" Vimwiki
let g:vimwiki_list = [
    \ {
    \   'path': '~/vimwiki/',
    \   'syntax': 'markdown',
    \   'ext': '.md'
    \ }]

" Ale config
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['eslint']}
let g:ale_completion_autoimport = 1

" venn
lua <<EOF
    -- enable or disable keymappings for venn
    function _G.toggle_venn()
        local venn_enabled = vim.inspect(vim.b.venn_enabled)
        if(venn_enabled == "nil") then
            vim.b.venn_enabled = true
            vim.cmd[[setlocal ve=all]]
            -- draw a line on HJKL keystokes
            vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<cr>", {noremap = true})
            vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<cr>", {noremap = true})
            vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<cr>", {noremap = true})
            vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<cr>", {noremap = true})
            -- draw a box by pressing "f" with visual selection
            vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<cr>", {noremap = true})
        else
            vim.cmd[[setlocal ve=]]
            vim.cmd[[mapclear <buffer>]]
            vim.b.venn_enabled = nil
        end
    end
    -- toggle keymappings for venn using <leader>v
    vim.api.nvim_set_keymap('n', '<leader>v', ":lua toggle_venn()<cr>", { noremap = true})
EOF

" discord rich presence
let g:presence_auto_update          = 1
let g:presence_neovim_image_text    = 'The One True Text Editor'
let g:presence_main_image           = 'neovim'
let g:presence_client_id            = '793271441293967371'
let g:presence_debounce_timeout     = 10
let g:presence_enable_line_number   = 0
let g:presence_blacklist            = []
let g:presence_buttons              = 1
let g:presence_editing_text         = 'Editing %s'
let g:presence_file_explorer_text   = 'Browsing %s'
let g:presence_git_commit_text      = 'Committing changes'
let g:presence_plugin_manager_text  = 'Managing plugins'
let g:presence_reading_text         = 'Reading %s'
let g:presence_workspace_text       = 'Working on %s'
let g:presence_line_number_text     = 'Line %s out of %s'

" " Vim rainbow
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" Language Server
 let g:LanguageClient_serverCommands = {
    \   'ocaml':           ['ocamllsp'],
    \}

" Opam - Ocaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute 'set rtp+=' . g:opamshare . '/merlin/vim'

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'default'  " f/p/file-name.js
let g:airline_theme='onedark'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
end

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty=''

" Floatterm
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

" Color scheme settings
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark
set termguicolors
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#777777'

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" Key Bindings
let mapleader = ' '
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader><ENTER> :Goyo<CR>
nnoremap <leader><Space> :CtrlP<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>z :set invrnu invnu<CR>
nnoremap <silent><leader>l :Buffers<CR>
nnoremap <leader><C-m> :Maps<CR>
nnoremap <leader><C-l> :set nofoldenable<CR>
nnoremap <C-l> :set foldmethod=indent<CR>
nnoremap <C-k> :set foldmethod=syntax<CR>
nnoremap <C-w>e :SyntasticCheck<CR>
nnoremap <C-w>c :SyntasticReset<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-g> :Ag<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader><C-g> :Commits<CR>
nnoremap <silent><C-s> :NV<CR>

nnoremap <leader>1 :BufferLineGoToBuffer 1<CR>
nnoremap <leader>2 :BufferLineGoToBuffer 2<CR>
nnoremap <leader>3 :BufferLineGoToBuffer 3<CR>
nnoremap <leader>4 :BufferLineGoToBuffer 4<CR>
nnoremap <leader>5 :BufferLineGoToBuffer 5<CR>
nnoremap <leader>6 :BufferLineGoToBuffer 6<CR>
nnoremap <leader>7 :BufferLineGoToBuffer 7<CR>
nnoremap <leader>8 :BufferLineGoToBuffer 8<CR>
nnoremap <leader>9 :BufferLineGoToBuffer 9<CR>

nnoremap <leader>p :bprev<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>e :e<CR>

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

nnoremap / /\v
vnoremap / /\v
map <leader><C-s> :let @/=''<CR>

nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>

nnoremap j gj
nnoremap k gk
noremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv
inoremap <C-j> <esc>:move .+1<CR>==
inoremap <C-k> <esc>:move .-2<CR>==
nnoremap <leader>j :move .+1<CR>==
nnoremap <leader>k :move .-2<CR>==

nnoremap Y y$

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

nnoremap <silent> <leader>c} V}:call nerdcommenter#Comment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{ V{:call nerdcommenter#Comment('x', 'toggle')<CR>

nnoremap Q <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

map <leader>vv :Vifm<CR>
map <leader>vs :VSplitVifm<CR>
map <leader>sp :SplitVifm<CR>
map <leader>dv :DiffVifm<CR>
map <leader>tv :TabVifm<CR>

nnoremap <leader><C-f> :RangerNewTab<CR>

" Nerdtree/ranger/vifm settings
let g:NERDTreeHijackNetrw = 0

let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

" FZF settings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_history_dir = '~/.local/share/fzf-history'

" Goyo settings
fun! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set scrolloff=999
    Limelight
endfun

fun! s:goyo_leave()
    set showmode
    set showcmd
    set scrolloff=8
    Limelight!
    hi! Normal ctermbg=NONE guibg=NONE
endfun

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Trim white space
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup CLEAN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
