
local status, treesitter = pcall(require, "nvim-treesitter")
if (not status) then return end

require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all"
    ensure_installed = {
        "bash",
        "bibtex",
        "c",
        "c_sharp",
        "cmake",
        "cpp",
        "css",
        "dockerfile",
        "fortran",
        "go",
        "graphql",
        "html",
        "http",
        "java",
        -- "javascript",
        "json",
        -- "julia",
        -- "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "ninja",
        "perl",
        "php",
        "python",
        "r",
        "ruby",
        "rust",
        "scss",
        -- "sql",
        "toml",
        -- "tsx",
        -- "typescript",
        "verilog",
        -- "vim",
        "vue",
        "yaml",
        "zig",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    -- List of parsers to ignore installing (for "all")
    -- ignore_install = { "javascript" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        -- disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
})


