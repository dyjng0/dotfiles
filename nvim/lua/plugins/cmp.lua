return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "SirVer/ultisnips",
    dependencies = {
      "quangnguyen30192/cmp-nvim-ultisnips",
    },
    config = function()
      -- Optional: configure UltiSnips trigger keys
      vim.g.UltiSnipsExpandTrigger = "<tab>"
      vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
    end,
  },
  -- {
  -- 	"L3MON4D3/LuaSnip",
  -- 	dependencies = {
  -- 		"saadparwaiz1/cmp_luasnip",
  -- 		"rafamadriz/friendly-snippets",
  -- 	},
  -- },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      -- require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            -- require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          -- { name = "luasnip" }, -- For luasnip users.
          { name = "ultisnips" }, -- for ultisnips users.
        }, {
          { name = "buffer" },
        }),
      })

      cmp.setup.filetype("tex", {
        sources = {
          { name = "ultisnips" },
        },
      })
    end,
  },
}
