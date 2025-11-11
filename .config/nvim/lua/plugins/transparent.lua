return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false, -- must not be lazy-loaded
    config = function()
      require("transparent").setup({
        extra_groups = {
          "NormalFloat",
          "NvimTreeNormal",
        },
      })
      vim.cmd("TransparentEnable")
    end,
  },
}

