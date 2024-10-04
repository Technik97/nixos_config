{ pkgs, lib, ...}:

let
  fromGitHub = import ../../functions/fromGitHub.nix;
in
{
  imports = [
    ./colorscheme.nix
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      plenary-nvim
      gruvbox-material
      mini-nvim
      (fromGitHub { inherit pkgs; rev="ac7ad3c8e61630d15af1f6266441984f54f54fd2"; ref="main"; user="elihunter173"; repo="dirbuf.nvim"; })
    ];
  };

  home.file."./.config/nvim/" = {
	source = ./nvim;
	recursive = true;
  };
}
