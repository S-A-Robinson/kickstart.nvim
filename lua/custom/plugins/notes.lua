return {
  {
    "gsuuon/note.nvim",
    lazy = false,
    config = function()
      require("note").setup({
        spaces = {
          "~",
        },
        keymap = false, -- Disable plugin's keymaps, we'll set our own
      })

      -- Manually set up keymaps
      vim.keymap.set("n", "<leader>ln", "<cmd>Note<cr>", { desc = "New note" })
      vim.keymap.set("n", "<leader>ll", function()
        require("note.picker").pick_note()
      end, { desc = "Pick note" })
      vim.keymap.set("n", "<leader>ld", function()
        require("note.picker").pick_note_directory()
      end, { desc = "Pick note directory" })
    end,
    keys = {
      {
        "<leader>sl",
        function()
          require("telescope.builtin").live_grep({
            cwd = require("note.api").current_note_root(),
          })
        end,
        mode = "n",
        desc = "Search notes",
      },
    },
  },
}
