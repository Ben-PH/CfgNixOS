{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "ben";
    homeDirectory = "/home/${config.home.username}";
    keyboard = {
      layout = "us";
      variant = "dvorak";
    };
  };

  programs.git = {
    enable = true;
    userName = "Ben-PH";
    userEmail = "benphawke@gmail.com";
  };

  xsession.windowManager.i3 = {
    enable = true;
  };

  programs.i3status-rust = {
    enable = true;
  };

  imports = [
    ./neovim
    ./firefox.nix
    ./nushell.nix
    ./i3.nix
  ];

  home.packages = with pkgs; [
    vscode
    neofetch
    yazi
    broot
    cargo
    zellij

    flameshot


    # 3d printing stuff
    prusa-slicer
    orca-slicer

    # needs unfree. done in configuration.nix at time of writing
    vesktop
    # Needed for LM studio
    appimage-run

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep
    fzf
    gitui
    bacon
    obsidian

    tree
    ncdu
    glow # markdown previewer in terminal
    mdcat
    direnv

  
    # blogging
    zola

    alacritty
    rofi
    dunst
    papirus-icon-theme
    # nerdfonts

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

    btop # replacement of htop/nmon
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


    # haskell.compiler.ghc910
    # haskellPackages.cabal-install
    # haskellPackages.stack
    # haskell-language-server
  ];

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
