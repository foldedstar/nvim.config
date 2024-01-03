return {
  -- Configuration for vimwiki plugin
  {
    "vimwiki/vimwiki",
    -- defaults to the latest commit on the dev branch. If encountering stability issues try switching to a stable release per below
    version = "*", -- enable this to force use of the latest stable version
    event = "BufEnter *.md", -- lazy load on event
    keys = {
      { "<leader>ni", "<Plug>VimwikiIndex<cr>", desc = "Notebook index" },
      --{ "<leader>nt", "<Plug>VimwikiTabIndex<cr>", desc = "Open notebook index tab" },
      { "<leader>ns", "<Plug>VimwikiUISelect<cr>", desc = "Notebook select from list" },

      { "<leader>nd", "<Plug>VimwikiDeleteFile", desc = "Note delete" },
      { "<leader>nr", "<Plug>VimwikiRenameFile", desc = "Note rename" },
      { "<leader>no", "<Plug>VimwikiGoto", desc = "Note open" },
      { "<leader>nb", "<Plug>VimwikiBacklinks", desc = "Note backlinks" },
      { "<leader>nvl", "<Plug>VimwikiCheckLinks", desc = "Note verify all links" },

      { "<leader>nI", "<Plug>VimwikiDiaryIndex", desc = "Diary index" },
      { "<leader>nD", "<Plug>VimwikiMakeDiaryNote", desc = "Diary today" },
      { "<leader>nR", "<Plug>VimwikiDiaryGenerateLinks", desc = "Diary refresh index" },
      { "<leader>nT", "<Plug>VimwikiMakeTomorrowDiaryNote", desc = "Diary yesterday" },
      { "<leader>nY", "<Plug>VimwikiMakeYesterdayDiaryNote", desc = "Diary tomorrow" },

      { "<leader>wt", false },
      { "<leader>wh", false },
      { "<leader>wc", false },
    },

    -- Guidance for vimwiki is to set properties before the plugin is loaded - hence setting via 'init' rather than 'config'
    init = function()
      vim.g.vimwiki_list = {
        {
          -- Just one wiki for now. Add others here if required
          path = "~/Documents/notes/",
          syntax = "markdown",
          ext = ".md",
        },
      }
      vim.g.vimwiki_folding = "list"
      vim.g.vimwiki_hl_headers = 1 -- use alternating colours for different heading levels
      vim.g.vimwiki_global_ext = 0 --" don't treat all md files as vimwiki
      vim.g.vimwiki_markdown_link_ext = 1 -- add markdown file extension when generating links
      vim.g.taskwiki_markdown_syntax = "markdown"
      --vim.g.indentLine_conceallevel = 2 -- indentline controlls concel
      --vim.set.o.conceallevel = 1 -- so that I can see `` and full urls in markdown files

      vim.g.vimwiki_ext2syntax =
        { -- the set of extensions registered with vimwiki. Setting this overrides the default (a wider set)
          [".md"] = "markdown",
          [".markdown"] = "markdown",
          [".mdown"] = "markdown",
        }
    end,
  },
  -- For whatever reason this has to be in the same file as the rest of the mappings, otherwise is ignored
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>n"] = { name = "+notes" },
      },
    },
  },
}

-- The following includes additional config examples ussed by others:

-- vim.cmd [[
--  autocmd BufNewFile */diary/????-??-??.md call New_vimwiki_diary_template()
--
-- function New_vimwiki_diary_template()
-- "" If it's Friday, open a end of week lookback template
--    if system('date +%u') == 5
--         read ~/vimwiki/Diary\ TemplateEndOfWeek.md | execute "normal ggdd"
--     else
--         read  ~/vimwiki/Diary\ Template.md | execute "normal ggdd"
--     end
--  endfunction
-- ]]

-- Function to create taskwiki
-- function vimwikiSubtask(text)
--   local pos = vim.api.nvim_win_get_cursor(0)[2]
--   local line = vim.api.nvim_get_current_line()
--   -- Lua string concat is done via .. instead of + : "text" .. var is equiv to "text" + var in most languages
--   local txt = "##" .. text .. " || project:" .. text
--   local nline = line:sub(0, pos) .. txt .. line:sub(pos + 1)
--   vim.api.nvim_set_current_line(nline)
-- end

-- This was pretty hard to find - how to pass an argument to a vim function : https://stackoverflow.com/questions/3213657/vim-how-to-pass-arguments-to-functions-from-user-commands
-- Also need to use a syntax like command! <commandName> lua <lua function>() as the generic way to map a lua function to a vim cmd
-- vim.cmd([[command! -nargs=1 VimWikiSubTask lua vimwikiSubtask(<f-args>)]])
