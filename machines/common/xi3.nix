{
  lib,
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  services.displayManager.defaultSession = "none+i3";
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    desktopManager.xterm.enable = false;
    displayManager = {
      #   startx.enable = true;
      gdm.enable = true;
      defaultSession = "none+i3";
    };

    xkb = {
      layout = "us";
      variant = "dvorak";
    };
  };
}
