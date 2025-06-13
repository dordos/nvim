return {
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = { "*" },
      user_default_options = {
        names = false, -- color 이름 지원 ex: "red"
        rgb_fn = true, -- rgb(), rgba(), hsl(), hsla() 지원
        hsl_fn = true, -- hsl(), hsla() 지원
        css = true, -- CSS 속성 안의 색상도 지원
        tailwind = true, -- Tailwind 클래스도 하이라이트
        mode = "background", -- 색상 미리보기를 배경으로 표시
        virtualtext = "■", -- 또는 "■"처럼 사이드에 출력
      }
    }
  }
}
