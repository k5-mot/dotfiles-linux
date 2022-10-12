local status, telescope = pcall(require, "telescope")
if (not status) then return end

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff',
    function()
        builtin.find_files({no_ignore = false, hidden = true})
    end
    , {})
vim.keymap.set('n', 'fg', builtin.live_grep,  {})
vim.keymap.set('n', 'fb', builtin.buffers,    {})
vim.keymap.set('n', 'fh', builtin.help_tags,  {})


local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end
require("telescope").setup {
    extensions = {
        file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
    },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension("file_browser")
vim.keymap.set("n", "ft", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 }})
    end, { noremap = true }
)

