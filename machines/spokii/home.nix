{ config, pkgs, ... }:

{
  home = {
    username = "ben";
    homeDirectory = "/home/${config.home.username}";
  };

  imports = [
    ../../neovim.nix
  ];

  home.packages = with pkgs; [

    # neofetch -- use `nix shell nixpkgs#neofetch -c neofetch` instead
    yazi

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep
    fzf
    gitui
    tree
    tmux
    ncdu
    glow # markdown previewer in terminal
    mdcat

    alacritty
    rofi
    dunst
    papirus-icon-theme

    # networking tools
    # mtr # A network diagnostic tool
    # iperf3
    # dnsutils  # `dig` + `nslookup`
    # ldns # replacement of `dig`, it provide the command `drill`
    # aria2 # A lightweight multi-protocol & multi-source command-line download utility
    # socat # replacement of openbsd-netcat
    # nmap # A utility for network discovery and security auditing
    # ipcalc  # it is a calculator for the IPv4/v6 addresses


    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor


    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Ben-PH";
    userEmail = "benphawke@gmail.com";
  };

  # programs.i3 = {
  #   enable = true;
  #   font = "pango:DejaVu Sans Mono 10";
  #   bar = {
  #     status_command = "i3status";
  #     colors = {
  #       background = "#282c34";
  #       statusline = "#ffffff";
  #       separator = "#666666";
  #       focused_workspace = "#4c7899 #285577 #ffffff";
  #       active_workspace = "#333333 #5f676a #ffffff";
  #       inactive_workspace = "#282c34 #282c34 #888888";
  #       urgent_workspace = "#333333 # 900000#ffffff";
  #     };
  #   };
  # };  

  # TODO
  # fonts.fontconfig = {
  #   enable = true;
  #   defaultFonts = { family = "DejaVu Sans Mono"; size = 10; };
  # };


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
