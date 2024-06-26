{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "marc-tools";
      paths = [
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
