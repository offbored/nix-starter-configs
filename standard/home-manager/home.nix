# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./global
    ./features/desktop/plasma
    # ./features/productivity
    ./features/pass
    # ./features/games
    # ./features/music
  ];

  colorscheme = inputs.nix-colors.colorschemes.tokyo-night-storm;
  wallpaper = outputs.wallpapers.watercolor-beach;

  #  ------   -----   ------
  # | DP-3 | | DP-1| | DP-2 |
  #  ------   -----   ------
  # monitors = [
  #   {
  #     name = "DP-3";
  #     width = 1920;
  #     height = 1080;
  #     x = 0;
  #     workspace = "3";
  #     enabled = false;
  #   }
  #   {
  #     name = "DP-1";
  #     width = 2560;
  #     height = 1080;
  #     refreshRate = 75;
  #     x = 1920;
  #     workspace = "1";
  #     primary = true;
  #   }
  #   {
  #     name = "DP-2";
  #     width = 1920;
  #     height = 1080;
  #     x = 4480;
  #     workspace = "2";
  #   }
  # ];

  # nixpkgs = {
  #   # You can add overlays here
  #   overlays = [
  #     # Add overlays your own flake exports (from overlays and pkgs dir):
  #     outputs.overlays.additions
  #     outputs.overlays.modifications
  #     outputs.overlays.unstable-packages

  #     # You can also add overlays exported from other flakes:
  #     # neovim-nightly-overlay.overlays.default

  #     # Or define it inline, for example:
  #     # (final: prev: {
  #     #   hi = final.hello.overrideAttrs (oldAttrs: {
  #     #     patches = [ ./change-hello-to-hi.patch ];
  #     #   });
  #     # })
  #   ];
  #   # Configure your nixpkgs instance
  #   config = {
  #     # Disable if you don't want unfree packages
  #     allowUnfree = true;
  #     # Workaround for https://github.com/nix-community/home-manager/issues/2942
  #     allowUnfreePredicate = _: true;
  #   };
  # };

  # TODO: Set your username
  # home = {
  #   username = "your-username";
  #   homeDirectory = "/home/your-username";
  # };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  # programs.home-manager.enable = true;
  # programs.git.enable = true;

  # Nicely reload system units when changing configs
  # systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
