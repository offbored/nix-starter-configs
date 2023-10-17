{
  services = {
    xserver = {
      desktopManager.plasma5 = {
        enable = true;
      };
      displayManager.sddm = {
        enable = true;
        autoSuspend = false;
      };
    };
    geoclue2.enable = true;
  };
}
