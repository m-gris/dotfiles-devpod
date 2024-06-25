{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "marc-tools";
      paths = [
        python3
        debugpy
        bash-completion
        neovim
        starship
        fd
        ripgrep
        fzf
        lazygit
      ];
    };
  };
}
