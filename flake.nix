{
  description = "A Nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
  };

  outputs =
    {
      self,
      nixvim,
      flake-parts,
      import-tree,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      perSystem =
        { system, ... }:
        let
          pkgs = import inputs.nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };

          configuration = nixvim.lib.evalNixvim {
            inherit system;
            modules = [
              { nixpkgs.pkgs = pkgs; }
              (import-tree ./plugins)
            ];
            extraSpecialArgs = { };
          };
        in
        {
          _module.args.pkgs = pkgs;
          checks.default = configuration.config.build.test;
          packages.default = configuration.config.build.package;
        };
    };
}
