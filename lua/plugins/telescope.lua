local mapKey = require("utils.keyMapper").mapKey
-- 수평 분할시 오른쪽으로
vim.opt.splitright = true

-- 수직 분할시 아래쪽으로
vim.opt.splitbelow = true

-- 기존 Telescope 관련 설정을 모두 이 코드로 교체하세요.
return {
  'nvim-telescope/telescope.nvim',
  branch = 'master',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
  config = function()
    local telescope = require('telescope')
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")

    -- Telescope 기본 설정
    telescope.setup({
      defaults = {

        -- 이 부분이 검색창을 하단에 배치하는 설정입니다.
        layout_config = {
          prompt_position = "top",
          height = 0.5,
          width = 0.95,
          anchor = "S",
        },
        prompt_prefix = "🔍 ",
        -- 이 부분이 목록을 최근 사용 순서(MRU)로 정렬하는 기본 소터를 지정합니다.
        sorting_strategy = "ascending",

        mappings = {
          i = {
            ["<Esc>"] = require("telescope.actions").close,
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["<C-d>"] = actions.delete_buffer, -- ⬅️ 버퍼 삭제 (normal 모드)
          },

        },
      },
      pickers = {
        -- 버퍼(buffers) 피커에 대한 개별 설정입니다.
        buffers = {
          -- 버퍼 목록을 항상 최근 사용(MRU) 순으로 정렬합니다.
          sort_mru = true,
          -- 이미 정렬되어 있으므로 기본 소터를 사용하지 않습니다.
          sorter = require('telescope.sorters').get_generic_fuzzy_sorter({}),
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- 드롭다운 테마에 대한 추가 설정
          }
        }
      }
    })

    require("telescope").load_extension("ui-select")

    mapKey('<leader>ff', builtin.find_files)
    mapKey("<leader>fa", function()
      builtin.find_files({
        find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!.git/*" }
      })
    end, "n", { desc = "Find absolutely all files" })
    mapKey('<leader>fg', builtin.live_grep)
    mapKey('<leader>fb', builtin.buffers)
    mapKey('<leader>fh', builtin.help_tags)
  end,
}
