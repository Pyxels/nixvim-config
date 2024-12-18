{pkgs, ...}: {
  plugins = {
    cmp = {
      enable = true;
      settings = {
        mapping = {
          "<C-k>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";
          "<Up>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";
          "<C-j>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
          "<Down>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
          "<C-b>" = "cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' })";
          "<C-f>" = "cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' })";
          "<C-Space>" = "cmp.mapping(cmp.mapping.complete(), { 'i', 'c' })";
          "<C-y>" = "cmp.mapping(
            cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            }),
            { 'i', 'c' }
          )";
          "<C-e>" = "cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          })";
          "<C-l>" = "cmp.mapping(function()
            require('luasnip').jump(1)
          end, { 'i', 's' })";
          "<C-h>" = "cmp.mapping(function()
            require('luasnip').jump(-1)
          end, { 'i', 's' })";
          "<A-l>" = "cmp.mapping(function()
            require('luasnip').change_choice(1)
          end, { 'i', 's' })";
          "<A-h>" = "cmp.mapping(function()
            require('luasnip').change_choice(-1)
          end, { 'i', 's' })";
          "<C-c>" = "cmp.mapping(function()
            if require('luasnip').choice_active() then
              select_choice()
            end
          end, { 'i', 's' })";
        };
        sources = [
          {name = "luasnip";}
          {name = "nvim_lsp";}
          {name = "crates";}
          {name = "path";}
        ];
        snippet.expand = ''function(args) require('luasnip').lsp_expand(args.body) end'';
      };
    };

    luasnip = {
      enable = true;
      settings = {
        region_check_events = "CursorHold,InsertLeave";
        delete_check_events = "TextChanged,InsertEnter";
      };
      fromVscode = [
        {
          lazyLoad = true;
          paths = "${pkgs.vimPlugins.friendly-snippets}";
        }
      ];
      filetypeExtend = {
        typescript = ["javascript"];
      };
    };
  };
}
