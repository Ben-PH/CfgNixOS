{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.ben = {
      settings = {
      };
      search.engines = {
      };
      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
      ];
    };
  };
}
