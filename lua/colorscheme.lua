
local colorscheme = "tokyonight-night"
--local colorscheme = "OceanicNext"
--local colorscheme = "gruvbox"
--local colorscheme = "nord"
--local colorscheme = "nordfox"
--local colorscheme = "onedark"
--local colorscheme = "nightfox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end
