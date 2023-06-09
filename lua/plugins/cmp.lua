local cmp = require "cmp"

cmp.setup(
    {
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        },
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
            },
            --["<Tab>"] = function(fallback)
             --   if cmp.visible() then
              --      cmp.select_next_item()
               -- else
                --    fallback()
                --end
            --end
	['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
        },
        sources = {
            {name = "nvim_lsp"},
            -- For luasnip user.
            {name = "luasnip"},
            -- For ultisnips user.
            -- { name = 'ultisnips' },

            {name = "buffer"}
        }
    }
)
