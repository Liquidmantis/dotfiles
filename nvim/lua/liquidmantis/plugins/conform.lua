-- conform autoformatting
return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require("conform").setup({
      formatters = {
        yamlfmt = {
          prepend_args = { "-formatter", "retain_line_breaks=true" },
        },
      },

      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },

      formatters_by_ft = {
        terraform = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" }, -- the hyphen causes issues with the key, so we need to use this syntax
        packer = { "packer_fmt" },
        -- yaml = { "yamlfmt" },
      }

    })
  end
}
