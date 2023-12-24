-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    wrap = true, -- sets vim.opt.wrap
    --backup = false, -- creates a backup file
    encoding = "utf-8",
    linebreak = true,
    list = true,
    listchars = { tab = "> ", trail = "·", extends = ">", precedes = "<", nbsp = "-", eol = "↵" },
    scrolloff = 2, -- Number of lines to keep above and below the cursor
    shiftwidth = 2, -- Number of space inserted for indentation
    showtabline = 2, -- always display tabline
    sidescrolloff = 4, -- Number of columns to keep at the sides of the cursor
    smartindent = true, -- make indenting smarter again
    --swapfile = false, -- creates a swapfile
    tabstop = 2, -- Number of space in a tab
    smarttab = true,
    --showcmd = false -- hide (partial) command in the last line of the screen (for performance)
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
