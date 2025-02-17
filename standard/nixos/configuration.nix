# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-gpu-nvidia
    inputs.hardware.nixosModules.common-pc-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix

    ../common/global
    ../common/users/liam
    
    ../common/optional/ckb-next.nix
    # ../common/optional/greetd.nix
    ../common/optional/pipewire.nix
    # ../common/optional/quietboot.nix
    ../common/optional/docker.nix
    ../common/optional/plasma.nix
    # ../common/optional/gnome.nix
    # ../common/optional/wireless.nix
    # ../common/optional/wireshark.nix
  ];

  networking = {
    hostName = "wilty";
    # networkmanager.enable = true;
    # interfaces.enp3s0 = {
    #   useDHCP = true;
    #   wakeOnLan.enable = true;

    #   ipv4 = {
    #     addresses = [{
    #       address = "192.168.0.17";
    #       prefixLength = 24;
    #     }];
    #   };
    #   ipv6 = {
    #     addresses = [{
    #       address = "2804:14d:8084:a484::2";
    #       prefixLength = 64;
    #     }];
    #   };
    # };
  };

  programs = {
    # adb.enable = true;
    dconf.enable = true;
    kdeconnect.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  services.hardware.openrgb.enable = true;
  hardware = {
    opengl = {
      enable = true;
      # extraPackages = with pkgs; [ amdvlk ];
      driSupport = true;
      driSupport32Bit = true;
    };
    opentabletdriver.enable = true;
  };

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
  #   };
  # };

  # nix = {
  #   # This will add each flake input as a registry
  #   # To make nix3 commands consistent with your flake
  #   registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

  #   # This will additionally add your inputs to the system's legacy channels
  #   # Making legacy nix commands consistent as well, awesome!
  #   nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

  #   settings = {
  #     # Enable flakes and new 'nix' command
  #     experimental-features = "nix-command flakes";
  #     # Deduplicate and optimize nix store
  #     auto-optimise-store = true;
  #   };
  # };

  # FIXME: Add the rest of your current configuration

  # TODO: Set your time zone, locale settings, etc.

  # users.defaultUserShell = pkgs.zsh;
  # programs.zsh.enable = true;

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  # users.users = {
  #   # FIXME: Replace with your username
  #   liam = {
  #     # TODO: You can set an initial password for your user.
  #     # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
  #     # Be sure to change it (using passwd) after rebooting!
  #     # initialPassword = "correcthorsebatterystaple";
  #     isNormalUser = true;
  #     openssh.authorizedKeys.keys = [
  #       # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
  #     ];
  #     # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
  #     extraGroups = ["wheel"];
  #   };
  # };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  # services.openssh = {
  #   enable = true;
  #   # Forbid root login through SSH.
  #   permitRootLogin = "no";
  #   # Use keys only. Remove if you want to SSH using password (not recommended)
  #   passwordAuthentication = false;
  # };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
