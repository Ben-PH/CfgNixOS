{
  inputs,
  modulesPath,
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common/locale.nix
    "${modulesPath}/installer/cd-dvd/installation-cd-graphical-gnome.nix"
  ];
  nixpkgs.hostPlatform = "x86_64-linux";
  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak";
  };

  # Configure console keymap
  console.keyMap = "dvorak";

  environment = {
    systemPackages = with pkgs; [
      vim
      curl
      htop
      ripgrep
      git
      gitui
      pkgs.latest.disko
      parted
    ];
    variables.EDITOR = "vim";
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}
