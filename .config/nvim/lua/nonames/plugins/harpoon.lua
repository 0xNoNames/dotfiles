-- return {
--   'windwp/nvim-autopairs',
--   event = 'InsertEnter',
--   -- Optional dependency
--   dependencies = { 'hrsh7th/nvim-cmp' },
--   config = function()
--     require('nvim-autopairs').setup {}
--     -- If you want to automatically add `(` after selecting a function or method
--     local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
--     local cmp = require 'cmp'
--     cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
--   end,
-- }

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
      desc = '[A]dd file to harpoon'
    end)
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<C-h>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<C-t>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<C-n>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<C-s>', function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end)
  end,
}
