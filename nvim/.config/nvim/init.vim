syntax on
set nocompatible

set t_Co=256
set exrc
" set nohlsearch
set hidden
set relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set backupcopy=yes
set undodir=~/.vim/undodir
set undofile
set incsearch
" set termguicolors
set scrolloff=8
set signcolumn=yes

set colorcolumn=80

set cmdheight=2
set updatetime=300
set shortmess+=c

" open new split panes to the right and below
set splitright
set splitbelow

set spelllang=en_us
set spell

set listchars=tab:⇥⇥,trail:⎵,nbsp:⎴
set list

lang en_US.UTF-8

call plug#begin(stdpath('data') . '/plugged')

" Language Client
" https://betterprogramming.pub/setting-up-neovim-for-web-development-in-2020-d800de3efacd
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-json', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-stylelintplus']
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

" Plug 'glepnir/lspsaga.nvim'
Plug 'tami5/lspsaga.nvim'

" Theme
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" Plug 'sbdchd/neoformat'
" Plug 'sheerun/vim-polyglot'
" Plug 'BurntSushi/ripgrep'
" Plug 'sharkdp/fd'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'ryanoasis/vim-devicons'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'nvim-lualine/lualine.nvim'

Plug 'mbbill/undotree'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'

Plug 'previm/previm'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'windwp/nvim-autopairs'

call plug#end()

colorscheme onehalfdark

highlight LineNr ctermbg=none
highlight Normal ctermbg=none

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "

" netrw
let g:netrw_banner = 0
" let g:netrw_winsize = 25
let g:netrw_browse_split = 0
let g:netrw_liststyle = 3

" neoformat
" let g:neoformat_try_node_exe = 1

" previm
" let g:previm_open_cmd = 'open -a Firefox'
let g:previm_open_cmd = 'open'
let g:previm_show_header = 0

nnoremap <C-p> :lua require('telescope.builtin').git_files()<cr>

nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ") })<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" UndotreeShow
nnoremap <leader>u :UndotreeShow<cr>

" Move normally between wrapped lines
nmap j gj
nmap k gk

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" Space + Space to clean search highlight
nmap <silent> <Leader>h :noh<CR>

" Moving text
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Fixes pasting after visual selection.
xnoremap p "_dP

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

inoremap <C-c> <esc>

nnoremap <leader>pv :Sex!<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>vv :vnew<cr>
nnoremap <leader>= :vertical resize +5<cr>
nnoremap <leader>- :vertical resize -5<cr>

nnoremap <leader>] :bn<cr>
nnoremap <leader>[ :bp<cr>

" eslint
" nmap <leader>. <Plug>(coc-codeaction)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" nmap <leader>gy :call CocAction('jumpTypeDefinition', 'vsplit')<CR><C-w>r<C-w>l

tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

lua <<EOF
require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "css",
    "go",
    "html",
    "javascript",
    "json",
    "markdown",
    "scss",
    "typescript",
    "vim",
    "vue"
  },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" }
})

require 'telescope'.setup {
  defaults = {
    file_sorter = require 'telescope.sorters'.get_fzy_sorter,
    layout_strategy = 'vertical',
    layout_config = {
      preview_cutoff = 30
    }
  }
}

EOF

" nvim-cmp config based on https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
lua <<EOF

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

EOF

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup THE_PRIMEAGEN
    autocmd!
    " trim whitespace
    autocmd BufWritePre * %s/\s\+$//e
augroup END

" augroup MARTIN
"    autocmd BufWritePre *.js,*.ts Neoformat
" augroup END

