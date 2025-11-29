local output = vim.fn.system('bash ' .. os.getenv('HOME') .. '/.config/nvim/install_paq.sh')
print(output)

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.smartindent = true
vim.o.showmatch = true
vim.o.number = true
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.incsearch = true
vim.o.swapfile = false
vim.o.undofile = true

vim.o.backspace = 'indent,eol,start'
vim.o.signcolumn = 'yes'
vim.o.winborder = 'single'
vim.o.completeopt = 'menu,menuone,noselect'

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.g.mapleader = ' '

vim.cmd('colorscheme vague')
vim.cmd('filetype plugin on')

vim.keymap.set('n', '<leader>q', ':bdelete<CR>')
vim.keymap.set('n', '<leader>w', ':update<CR>')
vim.keymap.set('n', '<leader>e', ':Oil<CR>')
vim.keymap.set('i', '<C-x>', '<Nop>', { noremap = true } )
vim.keymap.set('n', '<C-c>', ':noh<CR>')
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)

vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p')

require('paq') {
  'savq/paq-nvim',
  'vague-theme/vague.nvim',
  'stevearc/oil.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'neovim/nvim-lspconfig',
  'nvim-telescope/telescope-ui-select.nvim',
  'rafamadriz/friendly-snippets',
  { 'saghen/blink.cmp', tag = '1.8.0' },
  { 'nvim-telescope/telescope.nvim', tag = 'v0.2.0' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }
}

-- auto install packages only when needed
vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
	callback = function()
    local pkgs_count = #require('paq').query('to_install')
    if pkgs_count < 1 then return end
	  vim.notify(string.format('There are %d to install', pkgs_count))
    require('paq').install()
	end
})

require('vague').setup()
require('oil').setup()
require('telescope').setup()
require('telescope').load_extension('ui-select')

require('blink.cmp').setup({
  fuzzy = { prebuilt_binaries = { force_version = 'v1.8.0' } },
  keymap = { preset = 'default',
    ['<C-k>'] = { 'select_prev', 'fallback' },
    ['<C-j>'] = { 'select_next', 'fallback' },
    ['<C-c>'] = { 'hide', 'fallback' },
    ['<C-x>'] = { 'show', 'fallback' },
    ['<Tab>'] = { 'accept', 'fallback'}
  },
  appearance = { nerd_font_variant='normal' },
})

require('lualine').setup({
  sections = { lualine_x = { 'filetype' }, lualine_b = {} },
  options = { section_separators = { left = '', right = '' }, component_separators = { left = '', right = '' }, theme = 'vague' }
})

---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup {
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  ensure_installed = {
    'lua',
    'nix',
    'zig',
  }
}

vim.lsp.enable({
  'lua_ls',
  'nil_ls',
  'zls',
})
