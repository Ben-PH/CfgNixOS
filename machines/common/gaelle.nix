
{
  lib,
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  # Sys level user settings
  users.users.gaelle = {
    isNormalUser = true;
    description = "gaelle";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
    ];
    shell = pkgs.nushell;

    openssh.authorizedKeys.keys = [];
  };
}
