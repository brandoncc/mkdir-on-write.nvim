---@diagnostic disable-next-line: undefined-global
local api = vim.api

local function setup()
  -- When writing a file, make sure the directory it is in exists first
  local mkdir_group = api.nvim_create_augroup("mkdir-on-write", { clear = true })
  api.nvim_create_autocmd("BufWritePre", {
    command = 'call mkdir(expand("<afile>:p:h"), "p")',
    group = mkdir_group,
  })
end

return {
  setup = setup,
}
