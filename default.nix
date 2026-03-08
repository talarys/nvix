{ inputs, self, ... }:
{
  debug = true;
  perSystem =
    { system, ... }:
    let
      inherit inputs self;
      module = [
        # Core functionality and improvements
        self.nvixPlugins.common
        self.nvixPlugins.buffer
        self.nvixPlugins.ux # better user experience
        self.nvixPlugins.snacks

        # noice for cmdline
        self.nvixPlugins.noice

        # Git and version control
        self.nvixPlugins.git

        # UI and appearance
        self.nvixPlugins.lualine
        self.nvixPlugins.firenvim

        # Code editing and syntax
        self.nvixPlugins.treesitter
        self.nvixPlugins.blink-cmp
        self.nvixPlugins.lang
        self.nvixPlugins.lsp

        # Productivity
        self.nvixPlugins.autosession
        self.nvixPlugins.ai
      ];
    in
    {
      packages = {
        default = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
          extraSpecialArgs = { inherit inputs self; };
          inherit module;
        };
      };
    };
}
