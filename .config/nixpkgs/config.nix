{
  packageOverrides = pkgs: with pkgs; {
    basicPackages = pkgs.buildEnv {
      name = "basic-packages";
      paths = [
        # compiler
        openssl coreutils emscripten

        # basics
        git tmux zsh

        # tools
        ffmpeg
        bat exa fd fx httpie htop jq ripgrep
        gitAndTools.tig lazygit # git tools
        graphviz shellcheck shfmt

        # applications
        neovim

        # essential
        nodejs-14_x
        yarn
      ];
      pathsToLink = [ "/share" "/bin" ];
    };
  };
}
