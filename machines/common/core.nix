{
  lib,
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  security.polkit.enable = true;
  # Enable networking
  networking.networkmanager.enable = true;
  # Configure console keymap
  console.keyMap = "dvorak";
}
