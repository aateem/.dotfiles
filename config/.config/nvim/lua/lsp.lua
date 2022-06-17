-- In case I am in the mood of smth fancy
-- vim.fn.sign_define('DiagnosticSignError', { text = "", texthl = "DiagnosticError" })
-- vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarn" })
-- vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticInfo" })
-- vim.fn.sign_define("DiagnosticSignHint", { text = "ﯽ", texthl = "DiagnosticHint" })

vim.diagnostic.config({
    virtual_text=true,
    update_in_insert=true,
    severity_sort=true,
    float = {
        border = "rounded",
        style = "minimal",
        source = "always",
    }
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local nvim_lsp = require 'lspconfig'

local function lsp_keymaps(bufnr)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = bufnr })
    vim.keymap.set("n", "sh", vim.lsp.buf.signature_help, { buffer = bufnr })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
    vim.keymap.set("n", "gs", vim.lsp.buf.document_symbol, { buffer = bufnr })
    vim.keymap.set("n", "gS", vim.lsp.buf.workspace_symbol, { buffer = bufnr })
    vim.keymap.set("n", "<leader>l", vim.lsp.buf.incoming_calls, { buffer = bufnr })
    vim.keymap.set("n", "<leader>L", vim.lsp.buf.outgoing_calls, { buffer = bufnr })
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = bufnr })
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting, { buffer = bufnr })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = bufnr })
    vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { buffer = bufnr })
    vim.keymap.set("n", "<leader>e", function () vim.diagnostic.goto_next({float=true}) end, {buffer = bufnr})
    vim.keymap.set("n", "<leader>E", function () vim.diagnostic.goto_prev({float=true}) end, {buffer = bufnr})
end

local function on_attach(client, bufnr)
    if client.resolved_capabilities.document_highlight then
        local doc_hl = vim.api.nvim_create_augroup("highlightLSPDocument", { clear = true })
        vim.api.nvim_create_autocmd(
        "CursorHold",
            {
            buffer = bufnr,
            callback = function() vim.lsp.buf.document_highlight() end,
            group = doc_hl
            }
        )
        vim.api.nvim_create_autocmd(
        "CursorMoved",
            {
            buffer = bufnr,
            callback = function() vim.lsp.buf.clear_references() end,
            group = doc_hl
            }
        )
    end
    lsp_keymaps(bufnr)
end

nvim_lsp.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
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
