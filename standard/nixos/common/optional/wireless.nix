{ config, lib, ... }: {
  # Wireless secrets stored through sops
  sops.secrets.wireless = {
    sopsFile = ../secrets.yaml;
    neededForUsers = true;
  };

  networking.wireless = {
    enable = true;
    fallbackToWPA2 = false;
    # Declarative
    environmentFile = config.sops.secrets.wireless.path;
    networks = {
      "[NAME]" = {
        psk = "@[NAME]@";
      };
      "[NAME]" = {
        auth = ''
          key_mgmt=WPA-EAP
          pairwise=CCMP
          auth_alg=OPEN
          eap=PEAP
          identity="[IDENTITY]"
          password="@[PASSWORD]@"
        '';
      };
    };

    # Imperative
    allowAuxiliaryImperativeNetworks = true;
    userControlled = {
      enable = true;
      group = "network";
    };
    extraConfig = ''
      update_config=1
    '';
  };

  # Ensure group exists
  users.groups.network = { };

  systemd.services.wpa_supplicant.preStart = "touch /etc/wpa_supplicant.conf";
}
