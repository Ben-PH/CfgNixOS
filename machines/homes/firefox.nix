{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.default = {
      settings = {
      };
      search.engines = {
      };
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
      ];
    };
  };
}
