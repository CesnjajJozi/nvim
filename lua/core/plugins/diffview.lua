return {
  "sindrets/diffview.nvim",

  config = function() -- This is the function that runs, AFTER loading
    vim.keymap.set("n", "<leader>dv", function()
      if next(require("diffview.lib").views) == nil then
        vim.cmd("DiffviewOpen")
      else
        vim.cmd("DiffviewClose")
      end
    end, { desc = "Toggle [D]iff[V]iew" })
  end,
}
