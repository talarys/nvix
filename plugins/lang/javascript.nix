{
  plugins = {
    lsp.servers.biome = {
      enable = true;
    };
    conform-nvim.settings = {
      formatters_by_ft = {
        javascript = [ "biome" ];
        typescript = [ "biome" ];
        javascriptreact = [ "biome" ];
        typescriptreact = [ "biome" ];
      };
    };
  };
}
