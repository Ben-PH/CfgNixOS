# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{lib,  inputs, outputs, config, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      # Add additional package names here
      "discord"
    ];
  imports = [ 
    inputs.home-manager.nixosModules.home-manager
    ../locale.nix
    ./boot.nix
    ./hardware-configuration.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    displayManager = {
      startx.enable = true;
      lightdm.enable = true;
      defaultSession = "none+i3";
    };

    # TODO?: Move this to HM
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
      ];
      configFile = ./i3config;
    };

    xkb = {
      layout = "us";
      variant = "dvorak";
    };
  };

  fonts.fonts = [pkgs.dejavu_fonts];

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
    systemPackages = [
      pkgs.vim
    ];
    variables.EDITOR = "vim";
  };
  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs outputs; };
  };

  # Sys level user settings
  users.users.ben = {
    isNormalUser = true;
    description = "ben";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ 
      git
    ];
    shell = pkgs.nushell;

    openssh.authorizedKeys.keys = [ ];
  };


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
  system.stateVersion = "24.05"; # Did you read the comment?

}
