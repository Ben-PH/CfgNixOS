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
      nim
      nimlangserver
      nimlsp
      nimble
    ];
    variables.EDITOR = "vim";
  };
}
