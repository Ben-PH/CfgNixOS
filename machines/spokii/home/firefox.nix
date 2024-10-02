{config, pkgs, inputs, ...}:
{
  programs.firefox = {
    enable = true;
    profiles.ben = {
      bookmarks = [
        # {
        #   name = "";
        #   tags = [ ];
        #   keyword = "";
        #   url = "https://";
        # }
      ];
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
