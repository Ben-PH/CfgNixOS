{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "gaelle";
    homeDirectory = "/home/${config.home.username}";
    keyboard = {
      layout = "fr";
    };
  };
  programs = {
    # Let home Manager install and manage itself.
    home-manager.enable = true;
  };
  xsession.desktopManager.gnome = {
    enable = true;
  };
  xsession.windowManager.i3 = {
    enable = false;
  };


  imports = [
    ./firefox.nix
  ];

  home.packages = with pkgs; [
    obsidian
  ];


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

}
