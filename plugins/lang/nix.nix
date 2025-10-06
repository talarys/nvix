{
  plugins = {
    lsp.servers = {
      nil_ls = {
        enable = true;
      };
      statix.enable = true;
    };
    conform-nvim.settings = {
      formatters_by_ft.nix = [ "nixfmt" ];
    };
  };
}
