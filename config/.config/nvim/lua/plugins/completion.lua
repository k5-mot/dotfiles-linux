-- Completion {{{

local status, cmp = pcall(require, "cmp")
if (not status) then return end
local status, lspkind = pcall(require, "lspkind")
if (not status) then return end
local status, luasnip = pcall(require, "luasnip")
if (not status) then return end
local status, cmp_tabnine = pcall(require, "cmp_tabnine")
if (not status) then return end

vim.opt.completeopt = {'menu','menuone','noselect'}

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>']     = cmp.mapping.select_prev_item(),
        ['<C-n>']     = cmp.mapping.select_next_item(),
        ['<S-TAB>']   = cmp.mapping.select_prev_item(),
        ['<TAB>']     = cmp.mapping.select_next_item(),
        ['<C-b>']     = cmp.mapping.scroll_docs(-4),
        ['<C-f>']     = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>']     = cmp.mapping.close(), -- cmp.mapping.abort(),
        ['<CR>']      = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        -- { name = 'buffer' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'cmp_tabnine' },
        -- { name = 'copilot' },
        { name = 'emoji' },
    }),
    formatting = {
        format = lspkind.cmp_format({

            -- defines how annotations are shown
            -- default: symbol
            -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
            mode = 'symbol_text',

            -- default symbol map
            -- can be either 'default' (requires nerd-fonts font) or
            -- 'codicons' for codicon preset (requires vscode-codicons font)
            --
            -- default: 'default'
            preset = 'default',

            -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            maxwidth = 50,

            -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            ellipsis_char = '...',

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
                local source_mapping = {
                    buffer      = "[Buffer]",
                    nvim_lsp    = "[LSP]",
                    nvim_lua    = "[Lua]",
                    cmp_tabnine = "[Tabnine]",
                    path        = "[Path]",
                    luasnip     = "[Snippet]",
                    emoji       = "[Emoji]",
                    copilot     = "[Copilot]",
                }

                -- if you have lspkind installed, you can use it like
                -- in the following line:
                vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol_text"})
                vim_item.menu = source_mapping[entry.source.name]
                if entry.source.name == "cmp_tabnine" then
                    local detail = (entry.completion_item.data or {}).detail
                    vim_item.kind = ""
                    if detail and detail:find('.*%%.*') then
                        vim_item.kind = vim_item.kind .. ' ' .. detail
                    end

                    if (entry.completion_item.data or {}).multiline then
                        vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
                    end
                end
                local maxwidth = 80
                vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
                return vim_item
            end
        })
    }
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--         { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--     }, {
--         { name = 'buffer' },
--     })
-- })

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    })
})


-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--  capabilities = capabilities

-- }}}

-- Tabnine {{{

-- Pretty Printing Menu Items
local tabnine = require('cmp_tabnine.config')
tabnine.setup({
    -- How many lines of buffer context to pass to TabNine
    max_lines = 1000,
    -- How many results to return
    max_num_results = 20,
    -- Sort results by returned priority
    sort = true,
    -- Sort results by returned priority
    run_on_every_keystroke = true,
    -- Indicates where the cursor will be placed in case a completion item is a snippet
    snippet_placeholder = '..',
    -- Which file types to ignore
    ignored_file_types = {
        -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
    },
    -- display the prediction strength as a percentage
    show_prediction_strength = false
})

-- Sorting
local compare = require('cmp.config.compare')
cmp.setup({
    sorting = {
        priority_weight = 2,
        comparators = {
            require('cmp_tabnine.compare'),
            compare.offset,
            compare.exact,
            compare.score,
            compare.recently_used,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
        },
    },
})

-- Prefetch
local prefetch = vim.api.nvim_create_augroup("prefetch", {clear = true})
vim.api.nvim_create_autocmd('BufRead', {
    group = prefetch,
    pattern = '*.py',
    callback = function()
        require('cmp_tabnine'):prefetch(vim.fn.expand('%:p'))
    end
})

-- }}}



