{
  lib,
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  # use switch-to-configuration-ng
  system.switch = {
    enable = false;
    enableNg = true;
  };
}
