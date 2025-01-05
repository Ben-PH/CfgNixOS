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
      "obsidian"
    ];
  imports = [
    # inputs.home-manager.nixosModules.home-manager
    ../common/locale.nix
    ../common/xi3.nix
    ../common/me.nix
    ../common/bluetooth.nix
    ../common/hm.nix
    ../common/steam.nix
    ../common/fonts.nix
    ../common/core.nix
    ../common/environment.nix
    ../common/boot.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "spokii";
  services.xserver.videoDrivers = ["amdgpu"];

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";



  environment = {
    systemPackages = with pkgs; [
      rustic
      mdadm
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # programs.gamemode.enable = true;

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
