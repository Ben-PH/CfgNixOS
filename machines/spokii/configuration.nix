# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  lib,
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      # Add additional package names here
      "steam"
      "steam-original"
      "steam-run"
      "steam-unwrapped"
      "obsidian"
      "lmstudio"
    ];
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../common/locale.nix
    ../common/boot.nix
    ../common/ben.nix
    ../common/hm.nix
    ../common/steam.nix
    ../common/core.nix
    ../common/environment.nix
    ./hardware-configuration.nix
  ];
  boot.supportedFilesystems = ["zfs"];
  # generated with `cksum /etc/machine-id | cut -d ' ' -f1 | xargs printf "%08x"`
  # on another machine, will need to run `=pool import -f`
  networking.hostId = "3863057b"; 
  nix.settings.experimental-features = ["nix-command" "flakes"];
  security.polkit.enable = true;

  hardware.bluetooth.enable = true;
# systemd.tmpfiles.rules = [
# "d /home/ben/immich 755 immich immich -"
# ];
# users.users.immich = {
# isSystemUser = true;
# group = "immich";
# };
  services = {
    # immich = {
    #   enable = true;
    #   host = "localhost";
    #   port = 2283;
    #   openFirewall = false;
    #   user = "immich";
    #   group = "immich";
    #   mediaLocation = "/home/ben/immmich"; # change this to HDD when space starts getting low
    #
    # };
    blueman.enable = true;
    displayManager.defaultSession = "none+i3";

    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      desktopManager.xterm.enable = false;
      displayManager = {
        #   startx.enable = true;
        gdm.enable = true;
      };
      videoDrivers = ["amdgpu"];


    # TODO?: Move this to HM
    # windowManager.i3 = {
    #   enable = true;
    #   extraPackages = with pkgs; [
    #     dmenu
    #     i3status
    #     i3lock
    #   ];
    #   configFile = ./i3config;
    # };

      xkb = {
        layout = "us";
        variant = "dvorak";
      };
    };
  };

  fonts.packages = [pkgs.dejavu_fonts pkgs.nerd-fonts.symbols-only];

  networking.hostName = "spokii";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Configure console keymap
  console.keyMap = "dvorak";

  environment = {
    systemPackages = with pkgs; [
      # `nixos-rebuild` alternative
      nh
      # `find` alternative
      fd
      vim
      rustic
      mdadm
    ];
    variables.EDITOR = "vim";
  };
  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs outputs;};
  };

  # # Sys level user settings
  # users.users.ben = {
  #   isNormalUser = true;
  #   description = "ben";
  #   extraGroups = ["networkmanager" "wheel"];
  #   packages = with pkgs; [
  #     git
  #   ];
  #   shell = pkgs.nushell;
  #
  #   openssh.authorizedKeys.keys = [];
  # };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh = {
  #   enable = true;
  #   settings = {
  #     PasswordAuthentication = false;
  #     PermitRootLogin = "no";
  #   };
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
