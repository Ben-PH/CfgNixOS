# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, outputs, config, pkgs, ... }:

{
  imports = [ 
    inputs.home-manager.nixosModules.home-manager
    ../locale.nix
    ./boot.nix
    ./hardware-configuration.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "vbox";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak";
  };

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
  users.users.ben3 = {
    isNormalUser = true;
    description = "ben3";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ 
      home-manager
      git
    ];

    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9h/vRbWwcw6QuFuyDNEh/nU22KaQXbkdl02tW2hJBt+lykB8HjrYWrIIN1IkK9qlMZMwCWK/iRtXIrwEbsVwInNCHw3iAIk1Xf1xQXHcPVdLJnkw/aLkRLgjwbzCYpp7aGG7oRuPqVoNDvdBTCgItrj+B8j/ybuBfc4HU/QYXMm7yos9hr65php96RUZ9HnvNb3ZqOaDvcU+S3bUsEQl3yBfyiS5Rfv8d0ESTRRkzu5dEUxBO37bzpPREnMiNK9XdehH8yBczjZDxViAiHZp1k/zYC5VyzJnmlOHyGs/9lKbBNkCuTxrLA/zOwr3RHfrp8x8pSnyIKFCuZFw/pDrD7GU+TOZw5+j6pBUvijOmFF/7PwJo/y1jjVcoFdktvArQP50v+G7Cn5TF2FN9kP6N+ECH3Rph7YIfuqkBUgKQyPPYBwRdkQZMt1QaLbGQ/IYJknu8PCCIPeKCIL7CHcqrGG7tjzIa9+myLfRK3Iv0jHAxiVYCH5E7iIKW9fRuQnv8EU1RFAATmaDXlVpCJMsou/V2tiQLSsem2RxSBBPM1iCchESDQGFnZ4vSoSFidJ0rx+RqVy96Sgrjzrx7TetyE+vMeyZYByIt8aXA23QgW1c45M5U3pTROAA1kG81wLTt79oA5O6OHlNDw4ltHBGV1KuE9aaJg44SpJfPYgdabQ== benphawke@gmail.com"
    ];
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
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [22];
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
