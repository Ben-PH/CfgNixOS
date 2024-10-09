{
  config,
  lib,
  pkgs,
  ...
}: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        rust-analyzer
        lua-language-server
        luajitPackages.lua-lsp
        xclip
        wl-clipboard
        nil
      ];

      plugins = with pkgs.vimPlugins; let
        toLua = str: "lua << EOF\n${str}\nEOF\n";
        toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
      in [
        which-key-nvim
        (pkgs.vimUtils.buildVimPlugin {
          pname = "nvim-myconfig";
          version = "24-10-08:0";
          src = ./nvim-myconfig;
        })

        {
          plugin = barbar-nvim;
          config = toLuaFile ./barbar.lua;
        }
        nvim-web-devicons
        bufferline-nvim
        {
          plugin = tokyonight-nvim;
          config = toLuaFile ./theme.lua;
        }
        plenary-nvim
        dressing-nvim
        {
          plugin = comment-nvim;
          config = toLua "require(\"Comment\").setup()";
        }
        {
          plugin = yazi-nvim;
          config = toLuaFile ./yazi.lua;
        }
        {
          plugin = leap-nvim;
          config = toLua "require(\"leap\").create_default_mappings()";
        }
        {
          plugin = nvim-surround;
          config = toLua "require(\"nvim-surround\").setup({})";
        }
        {
          plugin = yazi-nvim;
          config = toLuaFile ./yazi.lua;
        }
        {
          plugin = nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-rust
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-python
            p.tree-sitter-json
          ]);
          config = toLuaFile ./treesitter.lua;
        }

        luasnip
        friendly-snippets
        cmp_luasnip
        cmp-nvim-lsp
        lazydev-nvim
        {
          plugin = nvim-cmp;
          config = toLuaFile ./cmp.lua;
        }
        telescope-fzf-native-nvim
        {
          plugin = telescope-nvim;
          config = toLuaFile ./telescope.lua;
        }
        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./lspconfig.lua;
        }
      ];
    };
  };
}
