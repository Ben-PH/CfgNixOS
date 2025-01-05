{
  lib,
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  # Sys level user settings
  users.users.ben = {
    isNormalUser = true;
    description = "ben";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      git
    ];
    shell = pkgs.nushell;

    openssh.authorizedKeys.keys = [];
  };
}
