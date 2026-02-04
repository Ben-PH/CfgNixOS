{
  config,
  pkgs,
  inputs,
  ...
}: {
  home = {
    username = "ben";
    homeDirectory = "/home/${config.home.username}";
    keyboard = {
      layout = "us";
      variant = "dvorak";
    };
  };
  programs = {
    git = {
      enable = true;
      userName = "Ben-PH";
      userEmail = "benphawke@gmail.com";
    };
    i3status-rust = {
      enable = true;
    };
    # Let home Manager install and manage itself.
    home-manager.enable = true;
  };

  xsession.windowManager.i3 = {
    enable = true;
  };

  imports = [
    inputs.nvf.homeManagerModules.default
    ./firefox.nix
    ./nushell.nix
    ./i3.nix
  ];
  programs.nvf = {
    enable = true;
    settings.vim = {
      extraPlugins = with pkgs.vimPlugins; {
        barbar = {
          package = barbar-nvim;
          setup = ''
           require("barbar").setup()
          '';
        };
      };
      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
      };
      lineNumberMode = "none";
    
      languages = {
        enableTreesitter = true;
        rust = {
          enable = true;
          dap.enable = true;
          treesitter.enable = true;
          extensions.crates-nvim = {
            enable = true;
            setupOpts = {
              completion.crates.enabled = true;
              lsp.actions = true;
              lsp.completion = true;
              lsp.lsp = true;
              lsp.hover = true;
            };
          };
          lsp.enable = true;
        };
        toml.enable = true;
        nu.enable = true;
      };
      autopairs.nvim-autopairs.enable = true;
      autocomplete.nvim-cmp.enable = true;
      
      binds.whichKey.enable = true;
      maps = {
        normal = {
	  "<A-,>" = {
	    action = "<cmd>BufferPrevious<cr>";
	    desc = "Buffer: Previous";
	  };
	  "<A-.>" = {
	    action = "<cmd>BufferNext<cr>";
	    desc = "Buffer: Next";
	  };
	  "<A-1>" = {
	    action = "<cmd>BufferGoto 1<cr>";
	    desc = "Buffer: GoTo 1";
	  };
	  "<A-2>" = {
	    action = "<cmd>BufferGoto 2<cr>";
	    desc = "Buffer: GoTo 2";
	  };
	  "<A-3>" = {
	    action = "<cmd>BufferGoto 3<cr>";
	    desc = "Buffer: GoTo 3";
	  };
	  "<A-4>" = {
	    action = "<cmd>BufferGoto 4<cr>";
	    desc = "Buffer: GoTo 4";
	  };
	  "<A-5>" = {
	    action = "<cmd>BufferGoto 5<cr>";
	    desc = "Buffer: GoTo 5";
	  };
	  "<A-6>" = {
	    action = "<cmd>BufferGoto 6<cr>";
	    desc = "Buffer: GoTo 6";
	  };
	  "<A-7>" = {
	    action = "<cmd>BufferGoto 7<cr>";
	    desc = "Buffer: GoTo 7";
	  };
	  "<A-8>" = {
	    action = "<cmd>BufferGoto 8<cr>";
	    desc = "Buffer: GoTo 8";
	  };
	  "<A-9>" = {
	    action = "<cmd>BufferGoto 9<cr>";
	    desc = "Buffer: GoTo 9";
	  };
	  "<A-0>" = {
	    action = "<cmd>BufferLast<cr>";
	    desc = "Buffer: GoTo Last";
	  };
	  "<A-w>" = {
	    action = "<cmd>w<cr>";
	    desc = "Buffer: All";
	  };
	  "<A-W>" = {
	    action = "<cmd>wa<cr>";
	    desc = "Buffer: Save All";
	  };
	  "<A-c>" = {
	    action = "<cmd>BufferClose<cr>";
	    desc = "Buffer: Close";
	  };
	  "<A-C>" = {
	    action = "<cmd>BufferRestore<cr>";
	    desc = "Buffer: Restore";
	  };
	  "<A-y>" = {
	    action = "<cmd>Yazi<cr>";
	    desc = "Yazi";
	  };
	  "<A-F>" = {
	    action = "<cmd>Telescope find_files<cr>";
	    desc = "Yazi";
	  };
	};
      };
      # extraPlugins = with pkgs.vimPlugins; {
      # };
      telescope = {
        enable = true;
	setupOpts.defaults.layout_config.horizontal.prompt_position = "bottom";
	};
      treesitter.context.enable = true;
      lsp = {
        enable = true;
        # formatOnSave = true;
        lightbulb.enable = true;
        trouble.enable = true;
      };
      git = {
        enable = true;
	gitsigns.enable = true;
      };
      fzf-lua.enable = true;
      utility = {
        diffview-nvim.enable = true;
        surround.enable = true;
        yazi-nvim.enable = true;
        motion.leap.enable = true;

      };
    };
  };

  home.packages = with pkgs; [
    freecad
    neofetch
    yazi
    cargo
    zellij
    lmstudio

    flameshot
    nixVersions.latest

    # needs unfree. done in configuration.nix at time of writing
    vesktop
    # equibop

    # Needed for LM studio
    appimage-run

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep
    fzf
    gitui
    bacon
    obsidian

    tree
    ncdu
    glow # markdown previewer in terminal
    mdcat
    direnv

  
    # blogging
    zola

    alacritty
    rofi
    dunst
    papirus-icon-theme

    # networking tools
    # mtr # A network diagnostic tool
    # iperf3
    # dnsutils  # `dig` + `nslookup`
    # ldns # replacement of `dig`, it provide the command `drill`
    # aria2 # A lightweight multi-protocol & multi-source command-line download utility
    # socat # replacement of openbsd-netcat
    # nmap # A utility for network discovery and security auditing
    # ipcalc  # it is a calculator for the IPv4/v6 addresses

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb


    # haskell.compiler.ghc910
    # haskellPackages.cabal-install
    # haskellPackages.stack
    # haskell-language-server
  ];


  # TODO
  # fonts.fontconfig = {
  #   enable = true;
  #   defaultFonts = { family = "DejaVu Sans Mono"; size = 10; };
  # };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

}
