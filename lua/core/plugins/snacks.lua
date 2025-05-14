return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      formatters = {
        file = {
          truncate = 100,
          filename_first = true,
        },
      },
      win = {
        input = {
          keys = {
            ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
          },
        },
      },
    },
    image = {
      convert = {
        notify = false,
      },
    },
    scope = {},
    notifier = {},
    lazygit = {},
  },
  keys = {
    {
      "<leader>sf",
      function()
        Snacks.picker.files()
      end,
      desc = "[S]earch [F]iles",
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "[S]earch [G]rep",
    },
    {
      "<leader>sn",
      function()
        Snacks.picker.files({ cwd = "~/code/.config/nvim" })
      end,
      desc = "[S]earch [F]iles",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "[S]earch [D]iffs",
    },
    {
      "<leader>sb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "[S]earch [B]rances",
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "[S]earch [L]azyGit [C]hanges",
    },
    {
      "<leader>sr",
      function()
        Snacks.picker.resume()
      end,
      desc = "[S]earch [R]esume",
    },
    {
      "<leader>s.",
      function()
        Snacks.picker.recent()
      end,
      desc = "[S]earch Recent",
    },
    {
      "<leader>sp",
      function()
        Snacks.picker.lazy()
      end,
      desc = "Search for Plugin Spec",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "[S]earch [H]elp",
    },
    {
      "<leader>so",
      function()
        Snacks.picker.files({ cwd = "~/code/code/obsidian-vault/" })
      end,
      desc = "[S]earch [O]bsidian",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "[S]earch [W]ord",
      mode = { "n", "x" },
    },
    {
      "<leader>se",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "[S]earch [E]rrors",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "[S]earch [Q]uickfix",
    },
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo History",
    },
    -- LSP
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
    {
      "<leader>sS",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>sm",
      function()
        Snacks.picker.marks({
          global = true,
          ["local"] = false,
        })
      end,
      desc = "Marks",
    },
    -- CUSTOM HYBRIS SEARCH
    {
      "<leader>ss",
      function()
        local choices = {
          "facades",
          "controllers",
          "populators",
          "services",
          "XMLs",
          "DAOs",
        }
        vim.ui.select(choices, {
          prompt = "Select a directory:",
          format_item = function(item)
            return item
          end,
        }, function(choice)
          if choice then
            local searches = {
              controllers = {
                dir = "~/code/goHy2/core-customize/hybris/bin/custom/ggcommercewebservices/web/src/si/zenlab/v2/controller",
                search = "value =.*",
              },
              facades = {
                dir = "~/code/goHy2/core-customize/hybris/bin/custom/gorenje/ggfacades/src/si/zenlab/gg/facades/impl",
                search = "public.*",
              },
              DAOs = {
                dir = "~/code/goHy2/core-customize/hybris/bin/custom/gorenje/ggcore/src/si/zenlab/gg/core/daos/impl",
                search = "public.*",
              },
              populators = {
                dir = "~/code/goHy2/core-customize/hybris/bin/custom/gorenje/ggfacades/src/si/zenlab/gg/facades/populators",
                search = "public class.*",
              },
              services = {
                dir = "~/code/goHy2/core-customize/hybris/bin/custom/gorenje/ggcore/src/si/zenlab/gg/core/service/impl",
                search = "public.*",
              },
              XMLs = {
                dir = "~/code/goHy2/core-customize/hybris/bin/custom/gorenje/ggcore/resources/ggcore-items.xml",
                search = "(type|attribute).*",
              },
            }
            Snacks.picker.grep({
              dirs = { searches[choice].dir },
              search = searches[choice].search,
            })
          end
        end)
      end,
      desc = "[S]earch [H]ybris",
    },
  },
}
