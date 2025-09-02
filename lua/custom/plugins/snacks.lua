return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    picker = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
  config = function()
    -- Notifications Autocmds
    local notifier = require('snacks').notifier

    -- -- 🔹 Notify on diagnostics changes
    -- vim.api.nvim_create_autocmd('DiagnosticChanged', {
    --   callback = function(args)
    --     local bufnr = args.buf
    --     local diags = vim.diagnostic.get(bufnr)
    --     local count = #diags
    --     if count > 0 then
    --       notifier.notify(count .. ' issue(s) found', { title = 'LSP Diagnostics', level = 'warn' })
    --     else
    --       notifier.notify('No issues found', { title = 'LSP Diagnostics', level = 'info' })
    --     end
    --   end,
    -- })

    -- 🔹 Notify when any LSP client attaches
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
          notifier.notify('LSP attached: ' .. client.name, { title = 'LSP', level = 'info' })
        end
      end,
    })

    -- 🔹 Notify when formatting happens
    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = function()
        -- Format the file using LSP
        vim.lsp.buf.format { async = false }
        notifier.notify('File formatted', { title = 'Formatter', level = 'info' })
      end,
    })
  end,
}
