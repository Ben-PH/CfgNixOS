{
  lib,
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs outputs;};
  };
}
