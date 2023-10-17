{ pkgs, ... }:

{
  programs.browserpass.enable = true;
  programs.firefox = {
    enable = true;
    profiles.liam = {
      bookmarks = { };
    #   https://nur.nix-community.org/repos/rycee/
      extensions = with pkgs.inputs.firefox-addons; [
        ublock-origin
        browserpass
        bypass-paywalls-clean
        cookie-autodelete
        decentraleyes
        disable-javascript
        multi-account-containers
        open-url-in-container
        temporary-containers
        tab-session-manager
        terms-of-service-didnt-read
        reddit-enhancement-suite
        libredirect
        privacy-settings
        profile-switcher
        link-gopher
        zoom-redirector
        lastpass-password-manager
        video-downloadhelper
        sponsorblock
        peertubeify
        youtube-dislikes
        w2g
        # tournesol
        # youtube-recommended-videos
        # youtube-shorts-block
        # enhancer-for-youtube
        # improved-tube
      ];
      bookmarks = { };
      settings = {
        "browser.disableResetPrompt" = true;
        "browser.download.panel.shown" = true;
        "browser.download.useDownloadDir" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.startup.page" = 3;
        # "browser.startup.homepage" = "https://start.duckduckgo.com";
        "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"nav-bar":["back-button","forward-button","stop-reload-button","home-button","urlbar-container","downloads-button","library-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","widget-overflow-fixed-list"],"currentVersion":18,"newElementCount":4}'';
        "dom.security.https_only_mode" = true;
        "identity.fxaccounts.enabled" = false;
        "privacy.trackingprotection.enabled" = true;
        "signon.rememberSignons" = false;
      };
    };
  };

  home = {
    persistence = {
      # Not persisting is safer
      # "/persist/home/name".directories = [ ".mozilla/firefox" ];
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}
