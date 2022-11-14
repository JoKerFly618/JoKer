local colorscheme = "tokyonight-night"
-- local colorscheme = "gruvbox"
-- local colorscheme = "OceanicNext"
-- local colorscheme = "nord"
-- local colorscheme = "nordfox"
-- local colorscheme = "onedark"
-- local colorscheme = "nightfox"

---@diagnostic disable-next-line: param-type-mismatch
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
   vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
   return
end
