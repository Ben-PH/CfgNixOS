{
  lib,
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  fonts.fonts = [pkgs.dejavu_fonts];
}
