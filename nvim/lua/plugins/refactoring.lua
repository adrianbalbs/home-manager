return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "lewis6991/async.nvim",
    },
    lazy = false,
    config = function()
        require("refactoring").setup()
        vim.keymap.set({ "n", "x" }, "<leader>rs", function()
            require("refactoring").select_refactor()
        end, { desc = "Select refactor" })
    end
}
