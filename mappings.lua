-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    -- ["<leader>b"] = { name = "Buffers" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    -- quick save && quit
    ["<leader>w"] = { ":w<cr> :so %<cr>", desc = "Save&&Reload" },
    ["<leader>x"] = { "<cmd>wq<cr>", desc = "Save&&Quit" },
    ["<C-s>"] = { ":w!<cr> :so %<cr>", desc = "Force Save&&Reload" },
    ["<C-x>"] = { ":wq!<cr>", desc = "Force Save&&Quit" },
    -- change description but the same command
    ["<leader>r"] = { name = "󰑓 Edit && Reload File" },
    ["<leader>rr"] = { ":so %<cr>", desc = "Reload File" },
    ["<leader>re"] = { ":e ~/.config/nvim/lua/user/init.lua<cr>", desc = "Edit user/init.lua" },

    ["<leader>m"] = { name = " Compiler" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
