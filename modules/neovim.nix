{ pkgs, ... }:
{

  home.packages = with pkgs; [
    # real dependencies
    fd
    fzf
    ripgrep
    rustc
    cargo

    # language servers
    lua-language-server
    nil
    zls
  ];

  programs.neovim= {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

}
