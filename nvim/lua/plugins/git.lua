return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration
            "ibhagwan/fzf-lua", -- optional
        },
        config = function()
            local neogit = require "neogit"
            vim.keymap.set("n", "<leader>gg", function()
                neogit.open { kind = "auto" }
            end, { desc = "Open neogit" })
        end,
    },
}
