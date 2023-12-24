return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "astrodark",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
      "clangd",
      "lua_ls",
      "stylua",
      --"rust-analyzer",
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        paths = {
          supported_configs = function(opts)
            -- add path to rtp
            table.insert(opts.performance.rtp.paths, "/data/data/com.termux/files/usr/bin/")
            return opts
          end,
        },
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }

    vim.cmd [[
      let g:clipboard = {
        \   'name': 'termux-clipboard',
        \   'copy': {
        \      '+': ['termux-clipboard-set'],
        \      '*': ['termux-clipboard-set'],
        \    },
        \   'paste': {
        \      '+': ['termux-clipboard-get'],
        \      '*': ['termux-clipboard-get'],
        \   },
        \   'cache_enabled': 1,
        \ }
    ]]

    vim.cmd [[
      " for detecting OS
      if !exists("g:os")
        if has("win64") || has("win32") || has("win16")
          let g:os = "Windows"
        else
          let g:os = substitute(system('uname'), '\n', '', '')
        endif
      endif

      " important option that should already be set!
      set hidden

      " available options:
      " * g:split_term_style
      " * g:split_term_resize_cmd
      function! TermWrapper(command) abort
	      if !exists('g:split_term_style') | let g:split_term_style = 'horizontal' | endif
	      if g:split_term_style ==# 'vertical'
		      let buffercmd = 'vnew'
	      elseif g:split_term_style ==# 'horizontal'
		      let buffercmd = 'new'
	      else
		      echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
		      throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
	      endif
	      exec buffercmd
	      if exists('g:split_term_resize_cmd')
		      exec g:split_term_resize_cmd
	      endif
	      exec 'term ' . a:command
	      exec 'setlocal nornu nonu'
	      exec 'startinsert'
	      autocmd BufEnter <buffer> startinsert
      endfunction

      command! -nargs=0 CompileAndRun call TermWrapper(printf('g++ -std=c++17 %s && ./a.out', expand('%')))
      command! -nargs=1 -complete=file CompileAndRunWithFile call TermWrapper(printf('g++ -std=c++17 %s && ./a.out < %s', expand('%'), <q-args>))
      autocmd FileType cpp nnoremap <leader>mc :CompileAndRun<CR>

      " For those of you that like to use -o and a specific outfile executable
      " (i.e., xyz.cpp makes executable xyz, as opposed to a.out
      " This C++ toolkit gives you commands to compile and/or run in different types
      " of terminals for your own preference.
      augroup CppToolkit
	      autocmd!
	      if g:os == 'Darwin'
		      autocmd FileType cpp nnoremap <leader>mt :!g++ -std=c++17 -o %:r % && open -a Terminal './%:r'<CR>
	      endif
	      autocmd FileType cpp nnoremap <leader>mb :!g++ -std=c++17 -o %:r % && ./%:r<CR>
	      autocmd FileType cpp nnoremap <leader>mr :!./%:r.out<CR>
      augroup END

      " options
      " choose between 'vertical' and 'horizontal' for how the terminal window is split
      " (default is horizontal)
      let g:split_term_style = 'horizontal'

      " add a custom command to resize the terminal window to your preference
      " (default is to split the screen equally)
      let g:split_term_resize_cmd = 'resize 8'
      " (or let g:split_term_resize_cmd = 'vertical resize 40')
    ]]

    -- Automatically deletes all trailing whitespace and newlines at end of file on save.
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      command = [[%s/\s\+$//e]],
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      command = [[%s/\n\+\%$//e]],
    })
  end,
}
