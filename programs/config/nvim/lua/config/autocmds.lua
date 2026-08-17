vim.filetype.add({
    pattern = {
        [".*/ansible/.*%.ya?ml"] = "yaml.ansible",
        [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*/defaults/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*/vars/.*%.ya?ml"] = "yaml.ansible",
    },
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})
