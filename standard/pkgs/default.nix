# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  # Packages with an actual source
  shellcolord = pkgs.callPackage ./shellcolord { };

  # Personal scripts
  nix-inspect = pkgs.callPackage ./nix-inspect { };
  lyrics = pkgs.python3Packages.callPackage ./lyrics { };
  tly = pkgs.callPackage ./tly { };
}
