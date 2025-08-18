vim.api.nvim_create_user_command("FormatLua", function()
    local filename = vim.fn.expand("%")
    vim.cmd("write")
    vim.fn.jobstart({
        vim.fn.stdpath("data") .. "/mason/bin/lua-format", "--indent-width", "4", "-i", filename
    }, {stdout_buffered = true, on_exit = function() vim.cmd("edit!") end})
end, {})

