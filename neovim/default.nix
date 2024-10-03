{ config, lib, pkgs, ... }: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        lua-language-server
	xclip
	wl-clipboard
      ];

      plugins = with pkgs.vimPlugins; 
      let
        toLua = str: "lua << EOF\n${str}\nEOF\n";
        toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
      in
      [
        which-key-nvim
        barbar-nvim
	nvim-web-devicons
	{
        plugin = comment-nvim;
	  config = toLua "require(\"Comment\").setup()";
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
          plugin = (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-python
            p.tree-sitter-json
          ]));
          config = toLuaFile ./treesitter.lua;
        }

	luasnip
	friendly-snippets
	cmp_luasnip
	{
	  plugin = nvim-cmp;
	  config = toLuaFile ./cmp.lua;
	}
        telescope-fzf-native-nvim
	{
	  plugin = telescope-nvim;
	  config = toLuaFile ./telescope.lua;
	}
	# {
	#   plugin = nvim-lspconfig;
	#   config = ;
	# }
      ];
    };
  };
}
