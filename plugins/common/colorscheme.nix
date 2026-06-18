{
  colorschemes = {
    gruvbox = {
      enable = true;
      settings = {
      };
    };
    catppuccin = {
      # enable = true;
      settings = {
        integrations.native_lsp = {
          enabled = true;
          underlines = {
            errors = [ "undercurl" ];
            hints = [ "undercurl" ];
            warnings = [ "undercurl" ];
            information = [ "undercurl" ];
          };
        };
        float = {
          transparent = true;
          solid = false;
        };
        flavor = "mocha";
        italic = true;
        bold = true;
        dimInactive = false;
        transparent_background = true;
      };
    };
  };
  autoCmd = [
    {
      event = "VimEnter";
      pattern = "*";
      callback.__raw = ''
        function()
          local clear_targets={
            "NormalFloat",
            "FloatBorder",
            "TabLine",
            "TabLineFill",
            "BufferLineBackground",
            "BufferLineFill",
            }
          for _, group in ipairs(clear_targets) do
          vim.api.nvim_set_hl(0, group, { bg = "NONE" })
          end
        end
      '';
    }
  ];
}
