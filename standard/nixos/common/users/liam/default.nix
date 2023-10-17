{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = false;
  users.users.liam = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "network"
      "wireshark"
      "mysql"
      "docker"
      "podman"
      "git"
      "libvirtd"
      "deluge"
    ];

    # openssh.authorizedKeys.keys = [ (builtins.readFile ../../../../home/liam/ssh.pub) ];
    # passwordFile = config.sops.secrets.liam-password.path;
    packages = [ pkgs.home-manager ];
  };

#   sops.secrets.liam-password = {
#     sopsFile = ../../secrets.yaml;
#     neededForUsers = true;
#   };

  home-manager.users.liam = import ../../../../home-manager/home/${config.networking.hostName}.nix;

  services.geoclue2.enable = true;
#   security.pam.services = { swaylock = { }; };
}
