
{
  lib,
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  # Sys level user settings
    virtualisation.docker.rootless = {
			enable = true;
			setSocketVariable = true;
		};
  users.users.ben = {
    isNormalUser = true;
    description = "ben";
    extraGroups = ["networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      git
      freecad
    ];
    shell = pkgs.nushell;

    openssh.authorizedKeys.keys = [];
  };
}
