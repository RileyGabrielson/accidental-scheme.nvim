if vim.fn.has("nvim-0.7.0") == 0 then
  vim.api.nvim_err_writeln("accidental_scheme requires at least nvim-0.7.0.1")
  return
end

if vim.g.loaded_accidental_scheme == 1 then
  return
end

vim.g.loaded_accidental_scheme = 1
