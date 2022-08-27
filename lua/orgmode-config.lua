local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup_ts_grammar({
  org_agenda_files = {'~/org/*'},
  org_default_notes_file = '~/org/refile.org',
  mappings = {
    global = {
      org_agenda = 'ga',
      org_capture = 'gc'
    },
    agenda = {
      org_agenda_todo = 't'
    },
    org={
      org_todo = 't',
      org_global_cycle = 'X',
      org_cycle = 'x',
      org_insert_todo_heading = '<leader>a'
    }
  },
  org_todo_keywords = {'TODO', 'WAITING', '|', 'DONE', 'DELEGATED', 'CANCELED'},
})

