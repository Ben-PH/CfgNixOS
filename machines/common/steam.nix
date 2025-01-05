{
  lib,
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
}
