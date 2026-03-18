{
  colorschemes = {
    catppuccin = {
      enable = true;
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
}
