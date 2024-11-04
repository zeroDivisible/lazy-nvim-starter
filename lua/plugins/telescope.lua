return {
  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-project.nvim",

      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "nvim-telescope/telescope-file-browser.nvim",
      },
    },

    keys = {
      -- add a keymap to browse plugin files
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },

    config = function(_, _)
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      local opts = {
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
        },
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--glob=!.git/",
          },
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "descending",
          layout_strategy = "bottom_pane",
          layout_config = {
            horizontal = {
              prompt_position = "bottom",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            bottom_pane = {
              prompt_position = "top",
            },
            width = 0.87,
            height = 0.30,
            preview_cutoff = 120,
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "smart" },
          winblend = 0,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            i = {
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              ["<C-c>"] = actions.close,
              ["<C-j>"] = actions.cycle_history_next,
              ["<C-k>"] = actions.cycle_history_prev,
              ["<C-q>"] = function(...)
                actions.smart_send_to_qflist(...)
                actions.open_qflist(...)
              end,
              ["<CR>"] = actions.select_default,
              ["<esc>"] = actions.close,
            },
            n = {
              ["q"] = require("telescope.actions").close,
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              ["<C-q>"] = function(...)
                actions.smart_send_to_qflist(...)
                actions.open_qflist(...)
              end,
            },
          },
        },

        extensions_list = { "themes", "terms", "fzf", "projects" },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      }

      telescope.setup(opts)
      telescope.load_extension("project")
      telescope.load_extension("file_browser")
      telescope.load_extension("noice")

      local builtin = require("telescope.builtin")
      local keymap = vim.keymap

      keymap.set("n", "<leader>pf", builtin.find_files, {})
      keymap.set("n", "<C-p>", builtin.git_files, {})
      keymap.set("n", "<D-p>", builtin.git_files, {})
      keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
      keymap.set("n", "<leader>vh", builtin.help_tags, {})

      keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
      keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
      keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
      keymap.set("n", "<leader>ss", "<cmd>Telescope current_buffer_fuzzy_find<cr>") -- list available help tags
      keymap.set("n", "<leader>sS", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
      keymap.set("n", "<leader>sp", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
      keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>") -- list available help tags
      keymap.set("n", "<leader>'", "<cmd>Telescope resume<cr>") -- Last telescope results.

      keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")
      keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>")
      keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
      keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")
      keymap.set("n", "<leader>fB", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
    end,
  },
}
