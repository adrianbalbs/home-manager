vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Configure LSP keymappings and actions",
    callback = function(event)
        local opts = { buffer = event.buf }
        local fzf = require "fzf-lua"

        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
        end

        -- Navigation and Information
        map("n", "K", vim.lsp.buf.hover, "Show hover information")
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "go", vim.lsp.buf.type_definition, "Go to type definition")
        map("n", "gs", vim.lsp.buf.signature_help, "Show signature help")
        map("n", "ge", vim.diagnostic.open_float, "Show code actions")

        -- References and Actions
        map("n", "gr", vim.lsp.buf.references, "Find references")
        map("n", "<leader>cr", vim.lsp.buf.rename, "Rename symbol")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Show code actions")
        map("n", "<leader>fs", function()
            fzf.lsp_document_symbols { previewer = false }
        end, "Find LSP Symbols")
    end,
})


vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    },
    root_markers = { ".git" },
})

vim.lsp.config("css_variables", {
    settings = {
        cssVariables = {
            lookupFiles = {
                "**/*.less",
                "**/*.scss",
                "**/*.sass",
                "**/*.css",
                -- If mantine is installed, this will allow autocomplete
                "node_modules/@mantine/core/styles.css",
            },
        },
    },
})

vim.lsp.config("vtsls", {
    settings = {
        typescript = {
            tsdk = "node_modules/typescript/lib",
            preferences = {
                importModuleSpecifier = "non-relative"
            }
        },
        javascript = {
            preferences = {
                importModuleSpecifier = "non-relative"
            }
        },
        vtsls = {
            autoUseWorkspaceTsdk = true
        }
    }
})

vim.lsp.config("nixd", {
    cmd = { "nixd" },
    filetypes = { "nix" },
    root_markers = { "flake.nix", ".git" },
    settings = {
        nixd = {
            nixpkgs = {
                expr = "import <nixpkgs> { }",
            },
            formatting = {
                command = { "nixfmt" },
            },
            options = {
                -- nixos = {
                --     expr = '(builtins.getFlake (toString ./.)).nixosConfigurations.<hostname>.options',
                -- },
                home_manager = {
                    expr = '(builtins.getFlake (toString ./.)).homeConfigurations."adrianb".options',
                },
            },
        },
    },
})

vim.diagnostic.config { virtual_lines = false, virtual_text = true }

vim.lsp.enable {
    "cssls",
    "hyprls",
    "clangd",
    "lua_ls",
    "vtsls",
    "eslint",
    "gopls",
    "cmake",
    "ty",
    "jsonls",
    "bashls",
    "ruff",
    "astro",
    "marskman",
    "yamlls",
    "fish_lsp",
    "expert",
    "tailwindcss",
    "bashls",
    "ansiblels",
    "biome",
    "css_variables",
    "nixd"
}
