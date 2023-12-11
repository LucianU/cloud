{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/22.11";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, treefmt-nix }:
    let
      formatterOptions = {
        projectRootFile = "flake.nix";
        programs.nixpkgs-fmt.enable = true;
        programs.terraform.enable = true;
      };
      linux-pkgs = nixpkgs.legacyPackages.x86_64-linux;
      darwin-pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      shellOptions = {
        nativeBuildInputs = [ ];
      };
    in
    {
      formatter = {
        x86_64-linux = treefmt-nix.lib.mkWrapper linux-pkgs formatterOptions;
        aarch64-darwin = treefmt-nix.lib.mkWrapper darwin-pkgs formatterOptions;
      };
      devShell = {
        x86_64-linux = linux-pkgs.mkShell shellOptions;
        aarch64-darwin = darwin-pkgs.mkShell shellOptions;
      };
    };
}
