{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        nixUnstable
        openssl
        coreutils

        tmux
        gitAndTools.gitFull
        zsh
        starship
        yabai
        skhd

        ffmpeg
        emscripten

        wget
        exa
        fd
        htop
        httpie
        jq
        rg
        fzf

        python39
        poetry
        nodejs-14_x
        yarn

        emacsMacport
        neovim
        graphviz
        shellcheck
        proselint
      ];
      pathsToLink = [ "/share/man" "/share/doc" "/bin" "/Applications" ];
      extraOutputsToInstall = [ "man" "doc" ];
    };
  };
}
