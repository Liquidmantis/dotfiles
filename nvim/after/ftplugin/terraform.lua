local terraform_fmt_group = vim.api.nvim_create_augroup("TerraformFmt", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
    group = terraform_fmt_group,
    pattern = "*.tf",
    callback = function()
        -- Execute terraform fmt on the current file
        vim.cmd('silent !terraform fmt %')
        -- Reload the buffer to reflect any changes made by the formatting
        vim.cmd('edit')
    end,
})
