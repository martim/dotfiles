local telescope = require("telescope")
local actions = require('telescope.actions')

local function telescope_buffer_dir() return vim.fn.expand('%:p:h') end

local fb_actions = require"telescope".extensions.file_browser.actions

telescope.setup {
    defaults = {mappings = {n = {["q"] = actions.close}}},
    extensions = {
        file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                -- your custom insert mode mappings
                ["i"] = {["<C-w>"] = function()
                    vim.cmd('normal vbd')
                end},
                ["n"] = {
                    -- your custom normal mode mappings
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function() vim.cmd('startinsert') end
                }
            }
        }
    }
}

pcall(require('telescope').load_extension, 'file_browser')
pcall(require('telescope').load_extension, 'fzf')
-- pcall(require('telescope').load_extension, 'harpoon')

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
               {desc = '[?] Find recently opened files'})
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers,
               {desc = '[ ] Find existing buffers'})
vim.keymap.set('n', '<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require(
                                                               'telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false
    })
end, {desc = '[/] Fuzzily search in current buffer]'})

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files,
               {desc = '[S]earch [F]iles'})
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags,
               {desc = '[S]earch [H]elp'})
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,
               {desc = '[S]earch current [W]ord'})
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep,
               {desc = '[S]earch by [G]rep'})
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics,
               {desc = '[S]earch [D]iagnostics'})
vim.keymap.set('n', '<leader>fs', function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = {height = 40}
    })
end)
