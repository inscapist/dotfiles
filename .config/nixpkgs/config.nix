{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        # use unstable channel
        nixUnstable 

        # compiler
        openssl coreutils emscripten

        # basics
        git tmux starship zsh

        # tools
        ffmpeg
        bat exa fd fx httpie htop jq ripgrep
        gitAndTools.tig lazygit # git tools
        graphviz shellcheck proselint

        # applications
        alacritty
        emacsMacport
        neovim

        # essential
        python39
        nodejs-14_x
        yarn
      ];
      pathsToLink = [ "/share" "/bin" "/Applications" ];
    };
  };
}
