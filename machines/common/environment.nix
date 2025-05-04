{
  lib,
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      # `nixos-rebuild` alternative
      nh
      # `find` alternative
      fd
      vim
      gnupg
      pinentry

    ];
    variables.EDITOR = "vim";
  };
}
