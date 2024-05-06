{
  inputs = {
    systems.url = "systems";
    nixpkgs.url = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      systems,
    }:
    let
      forEachSystem =
        f:
        nixpkgs.lib.genAttrs (import systems) (
          system:
          f {
            pkgs = import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
          }
        );
    in
    {
      devShells = forEachSystem (
        { pkgs }:
        {
          default = pkgs.mkShellNoCC {
            packages = with pkgs; [ opentofu ];
            shellHook = ''
              export TF_VAR_cp_region=au
            '';
          };
        }
      );
    };
}
