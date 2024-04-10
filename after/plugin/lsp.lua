local lspconfig = require('lspconfig')
local wk = require("which-key")

local servers = {
    'tsserver', 'lua_ls', 'dockerls', 'bashls'
}

require('mason').setup()

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.workspace = {
    configuration = true,
    didChangeWatchedFiles = {
        dynamicRegistration = true
    },
    didChangeConfiguration = {
        dynamicRegistration = true
    }
}

require('mason-lspconfig').setup({
    ensure_installed = servers,
})

-- Setup all languages servers
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities
    }
end

-- luasnip setup
local luasnip = require('luasnip')

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

--map('n', '<space>e', vim.diagnostic.open_float)
--map('n', '[d', vim.diagnostic.goto_prev)
--map('n', ']d', vim.diagnostic.goto_next)
--map('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {

    group = vim.api.nvim_create_augroup('UserLspConfig', {}),

    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        wk.register({
            ["D"] = { vim.lsp.buf.declaration, "Go to declaration" },
            ["d"] = { vim.lsp.buf.definition, "Go to definition" },
            ["i"] = { vim.lsp.buf.implementation, "Go to implementation" },
            ["r"] = { ":Telescope lsp_references show_line=false<CR>", "Go to references" },
            ["t"] = { vim.lsp.buf.type_definition, "Go to type definition" }
        }, {
            prefix = "g",
            buffer = ev.buf,
            mode = "n"
        })

        wk.register({
            ["K"] = { vim.lsp.buf.hover, "hover box description" }
        }, {
            buffer = ev.buf
        })

        wk.register({
            w = {
                name = "Workspace", -- optional group name
                a = { vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
                r = { vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
                d = { ':cd %:h <CR>', 'Set current file dir as workspace' },
                l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders" }
            },
            ["a"] = { require("actions-preview").code_actions, "code Action" }
        }, {
            prefix = "<leader>",
            buffer = ev.buf
        })
    end,
})
