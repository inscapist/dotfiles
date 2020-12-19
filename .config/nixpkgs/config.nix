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
        graphviz shellcheck proselint

        # applications
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
