local modes = {
    ["n"] = "NORMAL",
    ["no"] = "NORMAL",
    ["v"] = "VISUAL",
    ["V"] = "VISUAL LINE",
    [""] = "VISUAL BLOCK",
    ["s"] = "SELECT",
    ["S"] = "SELECT LINE",
    [""] = "SELECT BLOCK",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rv"] = "VISUAL REPLACE",
    ["c"] = "COMMAND",
    ["cv"] = "VIM EX",
    ["ce"] = "EX",
    ["r"] = "PROMPT",
    ["rm"] = "MOAR",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
}

-- Display the currently active mode
local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format("%s ", modes[current_mode]):upper()
end

--- Display git info via mini.nvim if in a git repo
local function git()
    local git_info = vim.b.minigit_summary
    if not git_info or not git_info.head_name or git_info.head_name == "" then
        return ""
    end

    local diff_info = vim.b.minidiff_summary or {}
    local head      = git_info.head_name
    local added     = (diff_info.add or 0) > 0 and (" +" .. diff_info.add) or ""
    local changed   = (diff_info.change or 0) > 0 and (" ~" .. diff_info.change) or ""
    local removed   = (diff_info.delete or 0) > 0 and (" -" .. diff_info.delete) or ""

    return table.concat({
        "[ ", -- branch icon
        head,
        added, changed, removed,
        "]",
    })
end

--- Display diagnostic counts for the current buffer
local function diagnostics()
    local counts   = vim.diagnostic.count(0)
    local severity = vim.diagnostic.severity
    local parts    = {}

    for _, s in ipairs({
        { severity.ERROR, "" },
        { severity.WARN, "" },
        { severity.INFO, "" },
        { severity.HINT, "" },
    }) do
        local count = counts[s[1]]
        if count and count > 0 then
            table.insert(parts, s[2] .. " " .. count)
        end
    end

    if #parts == 0 then
        return ""
    end

    return " [" .. table.concat(parts, " ") .. "]"
end

Statusline = {}

function Statusline:active()
    return table.concat {
        mode(),
        "[%f] ",
        git(),
        diagnostics(),
        "%=",
        "%y [%l:%c %P]"
    }
end

function Statusline:inactive()
    return " %t"
end

local group = vim.api.nvim_create_augroup("Statusline", { clear = true })


vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = group,
    desc = "Activate statusline on focus",
    callback = function()
        vim.opt_local.statusline = "%!v:lua.Statusline.active()"
    end,
})

vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = { "MiniGitUpdated", "MiniDiffUpdated" },
    desc = "Redraw statusline when git info changes",
    callback = function()
        vim.cmd.redrawstatus()
    end,
})

vim.api.nvim_create_autocmd("DiagnosticChanged", {
    group = group,
    desc = "Redraw statusline when diagnostics change",
    callback = function()
        vim.cmd.redrawstatus()
    end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    group = group,
    desc = "Deactivate statusline when unfocused",
    callback = function()
        vim.opt_local.statusline = "%!v:lua.Statusline.inactive()"
    end,
})
