{
  programs = {
    nushell = {
      enable = true;
      configFile.source = ./nu_cfg.nu;
    };

    starship = {
      enable = true;
      settings = {
        add_newline = true;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
  };
}
