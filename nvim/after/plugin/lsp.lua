local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then desc = 'LSP: ' .. desc end

        vim.keymap.set('n', keys, func, {buffer = bufnr, desc = desc})
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references,
         '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols,
         '[D]ocument [S]ymbols')
    nmap('<leader>ws',
         require('telescope.builtin').lsp_dynamic_workspace_symbols,
         '[W]orkspace [S]ymbols')

    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder,
         '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder,
         '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    vim.api.nvim_buf_create_user_command(bufnr, 'Format',
                                         function(_) vim.lsp.buf.format() end, {
        desc = 'Format current buffer with LSP'
    })
end

local servers = {
    pyright = {},
    sourcery = {},
    --  tsserver = {},
    lemminx = {},
    lua_ls = {
        Lua = {
            workspace = {checkThirdParty = false},
            telemetry = {enable = false}
        }
    }
}

require('neodev').setup()
require('fidget').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

require('mason').setup()

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {ensure_installed = vim.tbl_keys(servers)}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name]
        }
    end
}

local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client) return client.name == "null-ls" end,
        bufnr = bufnr
    })
end
null_ls.setup {
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.lua_format
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function() lsp_formatting(bufnr) end
            })
        end
    end
}
