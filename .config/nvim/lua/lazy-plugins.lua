-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
require('lazy').setup({
  require 'nonames/plugins/autopairs',
  require 'nonames/plugins/cmp',
  require 'nonames/plugins/comment',
  require 'nonames/plugins/conform',
  require 'nonames/plugins/debug',
  require 'nonames/plugins/dracula',
  require 'nonames/plugins/gitsigns',
  require 'nonames/plugins/harpoon',
  require 'nonames/plugins/indent_line',
  require 'nonames/plugins/lint',
  require 'nonames/plugins/lspconfig',
  require 'nonames/plugins/mini',
  require 'nonames/plugins/noice',
  require 'nonames/plugins/rainbow-delimiters',
  require 'nonames/plugins/telescope',
  require 'nonames/plugins/todo-comments',
  require 'nonames/plugins/treesitter-context',
  require 'nonames/plugins/treesitter',
  require 'nonames/plugins/trouble',
  require 'nonames/plugins/undotree',
  require 'nonames/plugins/vim-be-good',
  require 'nonames/plugins/vim-notify',
  require 'nonames/plugins/vim-sleuth',
  require 'nonames/plugins/which-key',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
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

-- vim: ts=2 sts=2 sw=2 et
