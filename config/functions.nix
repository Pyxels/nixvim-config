{
  extraConfigLua = ''
    function SaveBufferList()
      local buffers = vim.api.nvim_list_bufs()
      local buffer_list = {}
      local filepath = vim.fn.stdpath('data') .. "/buffer_list.txt"

      for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) then
          local bufname = vim.api.nvim_buf_get_name(buf)
          if bufname ~= "" then
            table.insert(buffer_list, bufname)
          end
        end
      end

      local file = io.open(filepath, "w")
      for _, bufname in ipairs(buffer_list) do
        file:write(bufname .. "\n")
      end
      file:close()

      print("Buffer list saved to: " .. filepath)
    end

    function OpenBufferList()
      local file = io.open(vim.fn.stdpath('data') .. "/buffer_list.txt", "r")
      if not file then
        print("No buffer list file found.")
        return
      end

      for line in file:lines() do
        vim.cmd("edit " .. line)
      end
      file:close()

      print("Buffer list opened.")
    end
  '';

  userCommands = {
    SaveBufferList.command = "lua SaveBufferList()";
    OpenBufferList.command = "lua OpenBufferList()";
  };
}
