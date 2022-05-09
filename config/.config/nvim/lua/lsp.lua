vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
}
)

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local nvim_lsp = require 'lspconfig'

local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "sh", vim.lsp.buf.signature_help, { buffer = 0 })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
    vim.keymap.set("n", "gs", vim.lsp.buf.document_symbol, { buffer = 0 })
    vim.keymap.set("n", "gS", vim.lsp.buf.workspace_symbol, { buffer = 0 })
    vim.keymap.set("n", "<leader>l", vim.lsp.buf.incoming_calls, { buffer = 0 })
    vim.keymap.set("n", "<leader>L", vim.lsp.buf.outgoing_calls, { buffer = 0 })
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = 0 })
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting, { buffer = 0 })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { buffer = 0 })

    local format_on_write = vim.api.nvim_create_augroup("formatOnBufWrite", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
            buffer = 0,
            callback = function() vim.lsp.buf.formatting_sync() end,
            group = format_on_write
    }
    )
end

nvim_lsp.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- TODO: figure out how to use company in house tools for linting/formatting
nvim_lsp.efm.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = { documentFormatting = true, completion = false },
    settings = {
        rootMarkers = { ".git/" },
        languages = {
            python = {
                { formatCommand = 'black -', formatStdin = true }
            },
        },
    },
    filetypes = { 'python' }
}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
