return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup {
      options = {
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = false,
        always_show_bufferline = true,
      },
      highlights = {
        fill = { bg = 'NONE' },
        --선택되지 않은 탭
        background = { bg = 'NONE', fg = '#565c64' },
        numbers = { bg = 'NONE', fg = '#565c64' },
        close_button = { bg = 'NONE', fg = '#565c64' },
        --선택된탭
        buffer_selected = { bg = '#21252b', fg = '#abb2bf', bold = true },
        numbers_selected = { bg = '#21252b', fg = '#abb2bf', bold = true },
        close_button_selected = { bg = '#21252b', fg = '#e06c75' },
        --구분자 색상
        separator = { bg = '#35373b', fg = '#35373b' },
        separator_selected = { bg = '#21252b', fg = '#35373b' },
        separator_visible = { bg = 'NONE', fg = '#35373b' },

        -- LSP 진단 색상
        hint_selected = { bg = '#21252b', bold = true },
        warning_selected = { bg = '#21252b', bold = true },
        error_selected = { bg = '#21252b', bold = true },
        info_selected = { bg = '#21252b', bold = true },
        diagnostic_selected = { bg = '#21252b', bold = true },
      }

    }
  end
}
