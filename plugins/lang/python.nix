{
  plugins.lsp.servers = {
    ruff.enable = true;
    pyright = {
      enable = true;
      settings = {
        pyright.disableOrganizeImports = false;
        python.analysis.ignore = [ "*" ];
      };
    };
  };
}
