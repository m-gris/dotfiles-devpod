--[[ =====================================================================

==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know how the Neovim basics, you can skip this step)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not sure exactly what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or neovim features used in kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your nvim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

--------------------------------------
-- BACKUPS & UNDOS
vim.opt.swapfile = false
vim.opt.backup = false
-- to allow super long undo trees (go back days ago...)
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
--------------------------------------

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
-- i.e, a dedicated column for displaying signs
-- like breakpoints or Git markers,
vim.opt.signcolumn = 'yes' -- for debuggers etc...

-- Decrease update time
vim.opt.updatetime = 250 -- save the buffer to disk in case of crash

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Show which column your cursor is on
vim.opt.cursorcolumn = true

-- Show tabline (i.e the name of the different nvim windows opened)
vim.opt.showtabline = 2

-- Minimal number of screen lines to keep above and below the cursor.
-- vim.opt.scrolloff = 10

--------------------------------------
-- 4 SPACE INDENTING
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
--------------------------------------

--------------------------------------
-- enables smart indentation in NeoVim,
-- automatically indenting new lines based on
-- the previous line's indentation and language-specific rules.
vim.opt.smartindent = true

-- disables line wrapping
-- making long lines appear as
-- a single, horizontally-scrollable line
-- instead of breaking onto multiple lines.
vim.opt.wrap = false

-- REALLY USEFULL
-- Incremental Search
-- will progressively highlight
-- cool when unsure about the search pattern !!!
vim.opt.incsearch = true
--------------------------------------

-- include the "@" and "-" characters
-- as part of what's considered a filename
-- Useful for navigating or manipulating filenames with these characters.
vim.opt.isfname:append '@-@'
--------------------------------------

--------------------------------------
-- TERMINAL COLORS
-- enables 24-bit RGB color support
-- in the terminal for NeoVim,
-- allowing for a richer color experience.
vim.opt.termguicolors = true
--------------------------------------

-- sets the time (in milliseconds) NeoVim waits
-- before triggering the CursorHold event and updating the swap file.
-- Lower values make these updates more frequent.
vim.opt.updatetime = 50

--sets a vertical line at the 80th column in NeoVim,
--often used as a visual aid for code line length.
vim.opt.colorcolumn = '80'

-- FOLDS
vim.opt.foldcolumn = '1'
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevel = 1 -- OPEN FILE WITH CLOSE FOLDS (AS A REMINDER TO USE FOLDS)

-- AUTOMATICALLY "fix" indentation
vim.opt.shiftround = true

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- vim.keymap.set('i', '<C-h>', '<BS>', { desc = 'Delete previous Character' })

-- Select all text in current file / buffer
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')


-- PRIMEAGEN allow to move around highlighted text
-- (will automatically indent stuffs !)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- PRIMEAGEN
-- -- POWERFULL SUBSTITUTION !!!
-- space s
-- highlight and replace all instances of the word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- MARC
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- MARC -- next / previous search match always "centered"
vim.keymap.set('n', 'n', 'nzz', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true, silent = true })

-- COPY THE CURRENT FILE'S PATH WITH LEADER + CP
vim.api.nvim_set_keymap('n', '<leader>cp', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })


-- DEBUGGER dap / dap-ui etc...
vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.api.nvim_create_user_command('DapUiToggle', function() require('dapui').toggle() end, { nargs = 0 })
vim.api.nvim_set_keymap("n", "<Leader>dt", ":DapUiToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<F9>", ":DapToggleBreakpoint<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<F5>", ":DapContinue<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<F11>", ":DapStepInto<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<F10>", ":DapStepOver<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<S-F11>", ":DapStepOut<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<S-F5>", ":DapTerminate<CR>", {noremap=true})
-- last one resets the UI (panes proportions & arrangement)
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", {noremap=true})
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
-- THIS WILL BOOTSTRAP / AUTO-INSTALL LAZY IF IT IS NOT ALREADY INSTALLED...
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- to toggle inline linting errors etc...
-- source:
-- https://www.reddit.com/r/neovim/comments/13wcqdr/disable_hintslsperrors_etc/
vim.api.nvim_create_user_command('DiagnosticToggle', function()
  local config = vim.diagnostic.config
  local vt = config().virtual_text
  config {
    virtual_text = not vt,
    underline = not vt,
    signs = not vt,
  }
end, { desc = 'toggle diagnostic' })
-- Disable diagnostic by default
vim.cmd 'autocmd VimEnter * DiagnosticToggle'

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
--

-- MARC ... for some plugins
  -- Define a utils table to store your function
  local utils = {}

  -- Define the thunk function within the utils table
  function utils.thunk(f, opts)
      return function()
          f(opts)
      end
  end


-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-fugitive',
  'tpope/vim-unimpaired',

  -- MARC
  'masukomi/vim-markdown-folding',
  'ThePrimeagen/git-worktree.nvim',

  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',
  -- pseudo dep. for vim-dadbod-completion...

  -- DEBUGGING
  { "nvim-neotest/nvim-nio" },
  { 'mfussenegger/nvim-dap' , requires = { "nvim-neotest/nvim-nio" }, },
  { "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
    --   require('dapui').setup()
    -- end,
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  { 'mfussenegger/nvim-dap-python',
    ft= 'python',
    requires = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    config = function()
      require("dap-python").setup("python")
    end
  },

  {'akinsho/git-conflict.nvim', version = "*", config = true},
  {'theHamsta/nvim-dap-virtual-text',
    config = function()
      require("nvim-dap-virtual-text").setup()
  end
  },


  -- DEV-CONTAINERS
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  {
    "erichlf/devcontainer-cli.nvim",
    dependencies = { 'akinsho/toggleterm.nvim' },
    keys = {
      -- stylua: ignore
      {
        "<leader>Du",
        ":DevcontainerUp<CR>",
        desc = "Bring up the DevContainer",
      },
      {
        "<leader>Dc",
        ":DevcontainerConnect<CR>",
        desc = "Connect to DevContainer",
      },
      {
        "<leader>Dd",
        ":DevcontainerDown<CR>",
        desc = "Kill the current DevContainer",
      },
      {
        "<leader>De",
        ":DevcontainerExec direction='vertical' size='40'<CR>",
        desc = "Execute a command in DevContainer",
      },
      {
        "<leader>Db",
        ":DevcontainerExec cd build && make<CR>",
        desc = "Execute build command in DevContainer",
      },
      {
        "<leader>Dt",
        ":DevcontainerExec cmd='cd build && make test' direction='horizontal'<CR>",
        desc = "Execute test command in DevContainer",
      },
      {
        "<leader>DT",
        "<CMD>DevContainerToggle<CR>",
        desc = "Toggle the current DevContainer Terminal"
      },
    },
    init = function()
      local opts = {
        -- whather to verify that the final devcontainer should be run
        interactive = false,
        -- search for the devcontainer directory closest to the root in the
        -- directory tree
        toplevel = true,
        -- Remove existing container each time DevcontainerUp is executed
        -- If set to True [default_value] it can take extra time as you force to
        -- start from scratch
        remove_existing_container = true,
        -- By default, if no extra config is added, following nvim_dotfiles are
        -- installed: "https://github.com/erichlf/dotfiles"
        -- This is an example for configuring other dotfiles inside the docker container
        -- dotfiles_repository = "https://github.com/erichlf/dotfiles.git",
        -- dotfiles_branch = "devcontainer-cli", -- branch to clone from dotfiles_repository`
        -- dotfiles_targetPath = "~/dotfiles", -- location to install dotfiles
        -- script to run after dotfiles are cloned
        -- dotfiles_intallCommand = "install.sh", 
        shell = "bash", -- shell to use when executing commands
        -- The particular binary to use for connecting to in the devcontainer
        -- Most likely this should remain nvim
        nvim_binary = "nvim",
        -- Set the logging level for console (notifications) and file logging. 
        -- The available levels are trace, debug, info, warn, error, or fatal.
        -- Set the log level for file logging
        log_level = "info",
        -- Set the log level for console logging
        console_level = "info",
      }
      require('devcontainer-cli').setup(opts)
    end,
  },

  -- DEV -CONTAINER   end


  'mbbill/undotree',

  -- For ANSII Colors, special characters etc...
  {
    "m00qek/baleia.nvim",
    version = "*",
    config = function()
      vim.g.baleia = require("baleia").setup({ })

      -- Command to colorize the current buffer
      vim.api.nvim_create_user_command("BaleiaColorize", function()
        vim.g.baleia.once(vim.api.nvim_get_current_buf())
      end, { bang = true })

      -- Command to show logs 
      vim.api.nvim_create_user_command("BaleiaLogs", vim.g.baleia.logger.show, { bang = true })
    end,
  },

  -- better % behavior
  {
    "andymass/vim-matchup",
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- nice code snapshots
  {
    "mistricky/codesnap.nvim",
    build = "make build_generator" ,
    config = function()
      require("codesnap").setup({
        has_breadcrumbs = true,
        show_workspace = true,
        watermark = "",
      })
    end,
    keys = {
      { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    }
  },


  --
  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  { 'rebelot/kanagawa.nvim', opts = {} }, -- earger loading

  -- MARC - markdown preview inside neovim
  {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},

  -- MARC - to execute highlighted code in ipython
  {'jpalardy/vim-slime', ft = 'python'},
  {'hanschen/vim-ipython-cell', ft = 'python'},
  {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async'
  },
    --
  -- MARC - scratchpad...
  {
    "LintaoAmons/scratch.nvim",
    event = "VeryLazy",
  },
  -- MARC - to forbid the use of HJKL ;-)
  {
     "m4xshen/hardtime.nvim",
     dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
     opts = {}
  },

  -- MARC - nice status bar plugin
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- NOTE: Plugins can also be configured to run lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- local ui = require('harpoon-core.ui')
      -- local mark = require('harpoon-core.mark')

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },

        -- ['1'] = { utils.thunk(ui.nav_file, 1), 'Harpoon Open file 1' },
        -- ['2'] = { utils.thunk(ui.nav_file, 2), 'Harpoon Open file 2' },
        -- ['3'] = { utils.thunk(ui.nav_file, 3), 'Harpoon Open file 3' },
        -- ['4'] = { utils.thunk(ui.nav_file, 4), 'Harpoon Open file 4' },
        -- ['5'] = { utils.thunk(ui.nav_file, 5), 'Harpoon Open file 5' },

        -- ['<leader>h'] = {
        --         name = 'harpoon',
        --         a = { mark.add_file, 'Add current file' },
        --         r = { mark.rm_file, 'Remove current file' },
        --         u = { ui.toggle_quick_menu, 'Toggle UI' },
        --         t = { '<cmd>Telescope harpoon-core marks<cr>', 'Telescope menu' },
        --         n = { ui.nav_next, 'Next file' },
        --         p = { ui.nav_prev, 'Previous file' },
        --     },

      }
    end,
  },
  {
    "cbochs/grapple.nvim",
    opts = {
      scope = "git", -- also try out "git_branch"
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
      { "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
      { "<leader>M", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
      { "<leader>n", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
      { "<leader>p", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
    },
  },

  -- MARC - to try to "root" nvim in the repo's root
  -- and be able to use fzf from anywhere
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
    end
  },


  {
    "GCBallesteros/NotebookNavigator.nvim",
    keys = {
      { "]h", function() require("notebook-navigator").move_cell "d" end },
      { "[h", function() require("notebook-navigator").move_cell "u" end },
      { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
      { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
    },
    dependencies = {
      "echasnovski/mini.comment",
      "hkupty/iron.nvim", -- repl provider
      -- "akinsho/toggleterm.nvim", -- alternative repl provider
      -- "benlubas/molten-nvim", -- alternative repl provider
      "anuvyklack/hydra.nvim",
    },
    event = "VeryLazy",
    config = function()
      local nn = require "notebook-navigator"
      nn.setup({ activate_hydra_keys = "<leader>h" })
    end,
  },



    -- search text on the web
    -- :BrowserSearch
    -- custom binding:  <learder>w
  {'voldikss/vim-browser-search'},



  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function ()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true, -- default settings
    submodules = false, -- not needed, submodules are required only for tests

    -- you can specify also another config if you want
    config = function() require("gx").setup {
      open_browser_app = "open", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
      open_browser_args = { "--background" }, -- specify any arguments, such as --background for macOS' "open".
      handlers = {
        plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
        github = true, -- open github issues
        brewfile = true, -- open Homebrew formulaes and casks
        package_json = true, -- open dependencies from package.json
        search = true, -- search the web/selection on the web if nothing else is found
        go = true, -- open pkg.go.dev from an import statement (uses treesitter)
        jira = { -- custom handler to open Jira tickets (these have higher precedence than builtin handlers)
          name = "jira", -- set name of handler
          handle = function(mode, line, _)
            local ticket = require("gx.helper").find(line, mode, "(%u+-%d+)")
            if ticket and #ticket < 20 then
              return "http://jira.company.com/browse/" .. ticket
            end
          end,
        },
        rust = { -- custom handler to open rust's cargo packages
          name = "rust", -- set name of handler
          filetype = { "toml" }, -- you can also set the required filetype for this handler
          filename = "Cargo.toml", -- or the necessary filename
          handle = function(mode, line, _)
            local crate = require("gx.helper").find(line, mode, "(%w+)%s-=%s")

            if crate then
              return "https://crates.io/crates/" .. crate
            end
          end,
        },
      },
      handler_options = {
        search_engine = "google", -- you can select between google, bing, duckduckgo, and ecosia
        search_engine = "https://search.brave.com/search?q=", -- or you can pass in a custom search engine
        select_for_search = false, -- if your cursor is e.g. on a link, the pattern for the link AND for the word will always match. This disables this behaviour for default so that the link is opened without the select option for the word AND link

        git_remotes = { "upstream", "origin" }, -- list of git remotes to search for git issue linking, in priority
        git_remotes = function(fname) -- you can also pass in a function
            if fname:match("myproject") then
                return { "mygit" }
            end
            return { "upstream", "origin" }
        end,

        git_remote_push = false, -- use the push url for git issue linking,
        git_remote_push = function(fname) -- you can also pass in a function
          return fname:match("myproject")
        end,
      },
    } end,
  },

  -- {
  --   "folke/noice.nvim", -- BETTER VIM-TERMINAL UI
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --   },
  --

  --
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   },
  --
  --   config = function()
  --     require("noice").setup({
  --       lsp = {
  --         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --         override = {
  --           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --           ["vim.lsp.util.stylize_markdown"] = true,
  --           ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
  --         },
  --       },
  --       -- you can enable a preset for easier configuration
  --       presets = {
  --         bottom_search = true, -- use a classic bottom cmdline for search
  --         command_palette = true, -- position the cmdline and popupmenu together
  --         long_message_to_split = true, -- long messages will be sent to a split
  --         inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --         lsp_doc_border = false, -- add a border to hover docs and signature help
  --       },
  --     })
  --   end
  -- },
  --
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  {
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup({ replace_netrw = true })
      vim.api.nvim_set_keymap("n", "<leader>ef", "", {
        noremap = true,
        callback = function()
          require("ranger-nvim").open(true)
        end,
      })

    require("ranger-nvim").setup({
      enable_cmds = false,
      replace_netrw = false,
      keybinds = {
        ["ov"] = require("ranger-nvim").OPEN_MODE.vsplit,
        ["oh"] = require("ranger-nvim").OPEN_MODE.split,
        ["ot"] = require("ranger-nvim").OPEN_MODE.tabedit,
        ["or"] = require("ranger-nvim").OPEN_MODE.rifle,
      },
      ui = {
        border = "none",
        height = 1,
        width = 1,
        x = 0.5,
        y = 0.5,
      }
    })

    end,
  },
  -- MARC - primegean harpoon for easy file navigation
  -- {
  --   "ThePrimeagen/harpoon",
  --   branch = "harpoon2",
  --   dependencies = { "nvim-lua/plenary.nvim" }
  -- },

    -- {
    --
    -- 'MeanderingProgrammer/harpoon-core.nvim',
    -- -- dev = true,
    -- dependencies = {
    --     'nvim-lua/plenary.nvim',
    --     'nvim-telescope/telescope.nvim',
    -- },
    -- config = function()
    --     require('harpoon-core').setup({
    --         default_action = 'vs',
    --     })
    --     require('telescope').load_extension('harpoon-core')
    --
    --     -- local mark = require('harpoon-core.mark') -- created/used in 'which-key'
    --     -- local ui = require('harpoon-core.ui')-- created/used in 'which-key'
    --     -- local utils = require('mp.utils') -- we defined our own, above in the file
    --
    --
    -- end,
    -- },


  -- MARC - for "extract variable", "inline variable" etc...
    {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },

  -- MARC - for databases access
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -----------------------------------------
  -- ZEN PLUGGINS - Start ------------------------------------------
  -----------------------------------------
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  {"shortcuts/no-neck-pain.nvim", version = "*"},

  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  },
  -----------------------------------------
  -- ZEN PLUGGINS - End ------------------------------------------
  -----------------------------------------


  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  -- MARC TEST - Start - IS THIS FOR FOLDS & MARKDOWN ????
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
  },
  -- MARC TEST - Start

  -- MARC autopair
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
},
  -- MARC - Start - for remote sessions
  {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    config = function()
      require('distant'):setup()
    end,
  },
  {
    'Pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup {
        -- your config goes here
        -- or just leave it empty :)
        --
      }
    end,
  },
  --Marc - for easier file navigation (i.e pression minus / - brings up one level in the file tree)

  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("oil").setup{
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
        }
      }
    end
  },

  -- Marc
  {
    'cuducos/yaml.nvim',
    ft = { 'yaml' }, -- optional
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
    },
  },

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },

      -- MARC - to explore yaml with telescope
      { "dapc11/telescope-yaml.nvim" },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of help_tags options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      -- MARC
      pcall(require('telescope').load_extension, 'git_worktree')

      pcall(require("telescope").load_extension, "telescope-yaml")

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      -- Brief Aside: **What is LSP?**
      --
      -- LSP is an acronym you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself
          -- many times.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace
          --  Similar to document symbols, except searches over your whole project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP Specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        pyright = {},
        lua_ls = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        -- tsserver = {},
        --

        lua_ls = {
          -- cmd = {...},
          -- filetypes { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  -- { -- Autoformat
  --   'stevearc/conform.nvim',
  --   opts = {
  --     notify_on_error = false,
  --     format_on_save = function(bufnr)
  --       -- Disable "format_on_save lsp_fallback" for languages that don't
  --       -- have a well standardized coding style. You can add additional
  --       -- languages here or re-enable it for the disabled ones.
  --       local disable_filetypes = { c = true, cpp = true }
  --       return {
  --         timeout_ms = 500,
  --         lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
  --       }
  --     end,
  --     formatters_by_ft = {
  --       lua = { 'stylua' },
  --       -- Conform can also run multiple formatters sequentially
  --       -- python = { "isort", "black" },
  --       --
  --       -- You can use a sub-list to tell conform to run *until* a formatter
  --       -- is found.
  --       -- javascript = { { "prettierd", "prettier" } },
  --     },
  --   },
  -- },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          -- ['<C-h>'] = cmp.mapping(function()
          --   if luasnip.locally_jumpable(-1) then
          --     luasnip.jump(-1)
          --   end
          -- end, { 'i', 's' }),

          -- For more advanced luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'folke/tokyonight.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  { -- BETTER 'EASY MOTION'
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "ss", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "<Leader>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- MARC - scala
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()
      metals_config.on_attach = function(client, bufnr)
        -- your on_attach function
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- -- Simple and easy statusline.
      -- --  You could remove this setup call if you don't like it,
      -- --  and try some other statusline plugin
      -- local statusline = require 'mini.statusline'
      -- -- set use_icons to true if you have a Nerd Font
      -- statusline.setup { use_icons = vim.g.have_nerd_font }
      --
      -- -- You can configure sections in the statusline by overriding their
      -- -- default behavior. For example, here we set the section for
      -- -- cursor location to LINE:COLUMN
      -- ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      -- return '%2l:%-2v'
      -- end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby', 'python' },
      },
      indent = { enable = true, disable = { 'ruby', 'python'} },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- put them in the right spots if you want.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for kickstart
  --
  --  Here are some example plugins that I've included in the kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- MARC -- start - not sure where to put those...
vim.cmd 'colorscheme kanagawa'
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
require('git-worktree').setup()
vim.keymap.set('n', '<Leader>tl', "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", silent)
vim.keymap.set('n', '<Leader>tc', "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", silent)

-- set tab to 2 spaces for yaml
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"yaml", "yml"},
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- TRYING TO SPLIT SCREEN FOR IRON.NVIM WITH NotebookNavigator
local view = require("iron.view")

-- iron.setup {...

-- One can always use the default commands from vim directly
repl_open_cmd = "vertical botright 80 split"

-- But iron provides some utility functions to allow you to declare that dynamically,
-- based on editor size or custom logic, for example.

-- Vertical 50 columns split
-- Split has a metatable that allows you to set up the arguments in a "fluent" API
-- you can write as you would write a vim command.
-- It accepts:
--   - vertical
--   - leftabove/aboveleft
--   - rightbelow/belowright
--   - topleft
--   - botright
-- They'll return a metatable that allows you to set up the next argument
-- or call it with a size parameter
repl_open_cmd = view.split.vertical.botright(50)

-- If the supplied number is a fraction between 1 and 0,
-- it will be used as a proportion
repl_open_cmd = view.split.vertical.botright(0.61903398875)

-- The size parameter can be a number, a string or a function.
-- When it's a *number*, it will be the size in rows/columns
-- If it's a *string*, it requires a "%" sign at the end and is calculated
-- as a percentage of the editor size
-- If it's a *function*, it should return a number for the size of rows/columns

repl_open_cmd = view.split("40%")

-- You can supply custom logic
-- to determine the size of your
-- repl's window
repl_open_cmd = view.split.topleft(function()
  if some_check then
    return vim.o.lines * 0.4
  end
  return 20
end)

-- An optional set of options can be given to the split function if one
-- wants to configure the window behavior.
-- Note that, by default `winfixwidth` and `winfixheight` are set
-- to `true`. If you want to overwrite those values,
-- you need to specify the keys in the option map as the example below

repl_open_cmd = view.split("40%", {
  winfixwidth = false,
  winfixheight = false,
  -- any window-local configuration can be used here
  number = true
})


-- local harpoon = require("harpoon")
--
-- -- REQUIRED
-- harpoon:setup()
-- -- REQUIRED
--
-- -- basic telescope configuration
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local file_paths = {}
--     for _, item in ipairs(harpoon_files.items) do
--         table.insert(file_paths, item.value)
--     end
--
--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--     }):find()
-- end
--
-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
--
-- vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end)
--
-- -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- -- vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
-- -- vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
-- -- vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end)
-- --
-- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)


vim.g.slime_target = "tmux"
vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
vim.g.slime_dont_ask_default = 1

vim.keymap.set("n", "<Leader>sc", "<cmd>Scratch<cr>")
vim.keymap.set("n", "<Leader>so", "<cmd>ScratchOpen<cr>")


vim.api.nvim_set_keymap('i', '<C-h>', '<Backspace>', {noremap = true, silent = true})


local temp_file1 = nil
local temp_file2 = nil

local function yank_to_temp_file()
    -- Get the currently highlighted text
    local _, start_line, start_col, _ = unpack(vim.fn.getpos("'<"))
    local _, end_line, end_col, _ = unpack(vim.fn.getpos("'>"))
    if start_line > end_line or (start_line == end_line and start_col > end_col) then
        start_line, end_line = end_line, start_line
        start_col, end_col = end_col, start_col
    end
    local lines = vim.api.nvim_buf_get_lines(0, start_line-1, end_line, false)
    if #lines > 0 then
        lines[#lines] = string.sub(lines[#lines], 1, end_col)
        lines[1] = string.sub(lines[1], start_col)
    end

    -- Write to a temporary file and store the filename
    local tempfile = vim.fn.tempname()
    vim.fn.writefile(lines, tempfile)
    return tempfile
end

local function diff_with_delta()
    -- Check if there's already one file waiting for comparison
    if temp_file1 == nil then
        -- First yank
        temp_file1 = yank_to_temp_file()
        print("First text yanked. Select and yank the second text, then press the diff key.")
    else
        -- Second yank and diff
        temp_file2 = yank_to_temp_file()
        local cmd = string.format("terminal delta %s %s", temp_file1, temp_file2)
        vim.cmd(cmd)
        -- Clean up
        vim.fn.delete(temp_file1)
        vim.fn.delete(temp_file2)
        -- Reset temp files
        temp_file1 = nil
        temp_file2 = nil
    end
end

-- Map the diff function to a key
vim.api.nvim_set_keymap('v', '<Leader>dd', '<Esc>:lua diff_with_delta()<CR>', { noremap = true, silent = true })


-- Start -- nvim ufo settings (for folds)

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- Option 2: nvim lsp as LSP client
-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities
        -- you can add other fields for setting up lsp server in this table
    })
end
require('ufo').setup()
--
-- -- Option 3: treesitter as a main provider instead
-- -- (Note: the `nvim-treesitter` plugin is *not* needed.)
-- -- ufo uses the same query files for folding (queries/<lang>/folds.scm)
-- -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
-- require('ufo').setup({
--     provider_selector = function(bufnr, filetype, buftype)
--         return {'treesitter', 'indent'}
--     end
-- })
-- -- END -- nvim ufo settings (for folds)

-- TRUE-ZEN BINDING
vim.keymap.set("n", "<leader>zn", ":TZNarrow<CR>", {})
vim.keymap.set("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
vim.keymap.set("n", "<leader>zf", ":TZFocus<CR>", {})
vim.keymap.set("n", "<leader>zm", ":TZMinimalist<CR>", {})
vim.keymap.set("n", "<leader>za", ":TZAtaraxis<CR>", {})

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })


-- remove trailing whitespaces
vim.api.nvim_set_keymap('n', '<leader>rt', ':%s/\\s\\+$//e<CR>', { noremap = true, silent = true })

-- status line
require('lualine').setup()

-- RUN PYTHON SCRIPT BINDING
vim.api.nvim_set_keymap('n', '<leader>rp', '<cmd>lua RunCurrentPythonScript()<CR>', {noremap = true, silent = true})

function RunCurrentPythonScript()
  local Terminal = require("toggleterm.terminal").Terminal
  local current_file = vim.api.nvim_buf_get_name(0)
  local python_run = Terminal:new({
    -- Start an interactive shell and then execute the Python script within it
    cmd = "bash -c 'python " .. current_file .. "; exec zsh'",
    close_on_exit = false,
    direction = "float",
    float_opts = {
      border = "curved"
    },
    on_open = function(term)
      vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<cmd>close<CR>", {noremap = true, silent = true})
    end,
  })
  python_run:toggle()
end


vim.api.nvim_set_keymap('n', '<leader>rip', '<cmd>lua RunPythonScriptInteractive()<CR>', {noremap = true, silent = true})

function RunPythonScriptInteractive()
  local Terminal = require("toggleterm.terminal").Terminal
  local current_file = vim.api.nvim_buf_get_name(0)
  local python_run = Terminal:new({
    cmd = "bash -c 'python -i " .. current_file .. "; exec zsh'",
    close_on_exit = false,
    direction = "float",
    float_opts = {
      border = "curved"
    },
    on_open = function(term)
      vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<cmd>close<CR>", {noremap = true, silent = true})
    end,
  })
  python_run:toggle()
end

-- MARC fuzzy-refine a telescope grep search... ex: narrowing to yml files
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-g>"] = actions.to_fuzzy_refine
      },
    },
  },
}

local builtin = require('telescope.builtin')
local action_state = require('telescope.actions.state')

-- MARC closing buffers from Telescope
-- source: https://github.com/nvim-telescope/telescope.nvim/issues/621#issuecomment-2094652982
vim.keymap.set('n', '<leader><leader>', function()
  builtin.buffers({
    initial_mode = "normal",
    attach_mappings = function(prompt_bufnr, map)
      local delete_buf = function()
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        current_picker:delete_selection(function(selection)
          vim.api.nvim_buf_delete(selection.bufnr, { force = true })
        end)
      end

      map('n', '<c-d>', delete_buf)

      return true
    end
  }, {
    sort_lastused = true,
    sort_mru = true,
    theme = "dropdown"
  })
end)

-- MARC -- end - not sure where to put those...
