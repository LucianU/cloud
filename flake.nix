
{
  description = "Cloud Env";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/23.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, treefmt-nix }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
          "aarch64-darwin"
          "x86_64-darwin"
          "x86_64-linux"
          "aarch64-linux"
      ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        devShells = {
          default = pkgs.mkShell {
            name = "cloud";
            packages = with pkgs; [
              python3
              poetry
              black
              mypy
            ];
          };
        };

        formatter =
          treefmt-nix.lib.mkWrapper
            pkgs
            {
              projectRootFile = "flake.nix";
              programs.nixpkgs-fmt.enable = true;
              programs.terraform.enable = true;
              programs.black.enable = true;
            };
      };
    };
}
