return {
    "cbochs/grapple.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true }
    },
    config = function()
      require("telescope").load_extension("grapple")
    end,
    keys = {
      { "<leader>ha", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
      { "<c-e>", "<cmd>Telescope grapple tags<cr>", desc = "Toggle tags menu" },

      -- { "<c-h>", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
      -- { "<c-t>", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
      -- { "<c-n>", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
      -- { "<c-s>", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },

      { "<c-s-n>", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
      { "<c-s-p>", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
    },
}
