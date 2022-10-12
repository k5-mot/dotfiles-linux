
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup({
    create_in_closed_folder = true,
    hijack_cursor = true,
    open_on_setup = true,
    open_on_setup_file = true,
    focus_empty_on_setup = true,
    sync_root_with_cwd = true,
    view = {
        adaptive_size = false,
        --mappings = {
        --    list = {
        --        { key = { "<2-RightMouse>", "<C-]>" }, action = "" }, -- cd
        --        { key = "<C-v>", action = "" }, -- vsplit
        --        { key = "<C-x>", action = "" }, -- split
        --        { key = "<C-t>", action = "" }, -- tabnew
        --        { key = "<BS>", action = "" }, -- close_node
        --        { key = "<Tab>", action = "" }, -- preview
        --        { key = "D", action = "" }, -- trash
        --        { key = "[e", action = "" }, -- prev_diag_item
        --        { key = "]e", action = "" }, -- next_diag_item
        --        { key = "[c", action = "" }, -- prev_git_item
        --        { key = "]c", action = "" }, -- next_git_item
        --        { key = "-", action = "" }, -- dir_up
        --        { key = "s", action = "" }, -- system_open
        --        { key = "W", action = "" }, -- collapse_all
        --        { key = "g?", action = "help" }, -- toggle_help

        --        { key = "d", action = "cd" }, -- remove
        --        { key = "x", action = "remove" }, -- cut

        --        { key = "t", action = "cut" },
        --        { key = "<Space>p", action = "prev_diag_item" },
        --        { key = "<Space>.", action = "next_diag_item" },
        --        { key = "<Space>k", action = "prev_git_item" },
        --        { key = "<Space>j", action = "next_git_item" },
        --        { key = "u", action = "dir_up" },
        --        { key = "'", action = "close_node" },
        --        { key = '"', action = "collapse_all" },
        --        { key = "?", action = "toggle_help" },
        --    },
        --},
    },
    renderer = {
        full_name = true,
        group_empty = true,
        special_files = {},
        symlink_destination = false,
        indent_markers = {
            enable = true,
        },
        icons = {
            webdev_colors = true,
            git_placement = "signcolumn",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs ={
                default = "",
                symlink = "",
                git = {
                    unstaged  = " ", -- \ueadc
                    staged    = " ", -- \uf068
                    unmerged  = " ", -- \ueafe
                    renamed   = " ", -- \ueae0
                    deleted   = " ", -- \ueadf
                    untracked = " ", -- \uf067
                    ignored   = " ", -- \ueadd
                },
                folder = {
                    default    = " ",
                    open       = " ",
                    empty      = " ",
                    empty_open = " ",
                    symlink    = " ",
                },
            }
        },
    },
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = { "help" },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {
            error   = " ", -- \uea87
            warning = " ", -- \uea6c
            hint    = " ", -- \uf400
            info    = " ", -- \uf449
        }
    },
    filters = {
        custom = {
            "^.git$",
        },
    },
    actions = {
        change_dir = {
            enable = false,
            restrict_above_cwd = true,
        },
        open_file = {
            resize_window = true,
            window_picker = {
                chars = "aoeui",
            },
        },
        remove_file = {
            close_window = false,
        },
    },
    log = {
        enable = false,
        truncate = true,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
        },
    },
})
