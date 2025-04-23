{
  autoCmd = [
    {
      event = "TextYankPost";
      callback = {__raw = "function() vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 }) end";};
    }
    {
      event = "FileType";
      pattern = "go";
      callback = {__raw = "function() vim.opt_local.list = false end";};
    }
    {
      event = ["BufEnter" "FocusGained" "InsertLeave" "CmdlineLeave" "WinEnter"];
      callback = {
        __raw = "
function()
  local bufnr = vim.api.nvim_get_current_buf()
  local exclude = {
    [''] = true,
    ['qf'] = true,
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
    ['qf'] = true,
    ['help'] = true,
    ['undotree'] = true,
    ['diff'] = true,
  }

  if exclude[vim.api.nvim_buf_get_option(bufnr, 'filetype')] then
    return
  end
  vim.o.relativenumber = false
  vim.o.cul = false
  vim.o.number = true
end";
      };
    }
  ];
}
