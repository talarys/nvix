{
  plugins = {
    lsp.servers.biome = {
      enable = true;
    };
    conform-nvim.settings = {
      formatters_by_ft.javascript = [ "biome" ];
      formatters_by_ft.typescript = [ "biome" ];
    };
  };
}
