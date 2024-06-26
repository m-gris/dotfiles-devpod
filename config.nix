{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "marc-tools";
      paths = [
        python3
        pip3
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
