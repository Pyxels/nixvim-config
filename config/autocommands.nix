{
  autoCmd = [
    {
      event = "TextYankPost";
      command = "silent! lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})";
    }
    {
      event = ["BufEnter" "FocusGained" "InsertLeave" "CmdlineLeave" "WinEnter"];
      callback = {
        __raw = "
function()
  local bufnr = vim.api.nvim_get_current_buf()
  local exclude = {
    [''] = true,
    ['NvimTree'] = true,
    ['qf'] = true,
    ['alpha'] = true,
    ['help'] = true,
    ['undotree'] = true,
    ['diff'] = true,
  }

  if exclude[vim.api.nvim_buf_get_option(bufnr, 'filetype')] then
    vim.o.number = false
    return
  end
  vim.o.relativenumber = true
  vim.o.cul = true
end";
      };
    }
    {
      event = ["BufLeave" "FocusLost" "InsertEnter" "CmdlineEnter" "WinLeave"];
      callback = {
        __raw = "
function()
  local bufnr = vim.api.nvim_get_current_buf()
  local exclude = {
    [''] = true,
    ['NvimTree'] = true,
    ['qf'] = true,
    ['alpha'] = true,
    ['help'] = true,
    ['undotree'] = true,
    ['diff'] = true,
  }

  if exclude[vim.api.nvim_buf_get_option(bufnr, 'filetype')] then
    return
  end
  vim.o.relativenumber = false
  vim.o.cul = false
end";
      };
    }
  ];
}
