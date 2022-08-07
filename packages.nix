{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Terminal Basics
    vim
    htop
    tmux
    git
    zsh
    wget
    chezmoi
    gnupg
    pinentry-curses

    # Graphical Basics
    mesa
    glxinfo
    alacritty
    firefox
    
    # Chat
    element-desktop
    
    # Development
    vscode
    dtc
    
    # K8s
    kubectl
    fluxcd
    helm
    stern
    sops
    k9s
  ];

  fonts.fonts = with pkgs; [
    source-code-pro
    font-awesome_4
  ];
}
