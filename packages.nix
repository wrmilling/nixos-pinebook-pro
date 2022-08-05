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
    alacritty
    firefox
    
    # Chat
    element-desktop
    
    # Development
    vscode
    dtc
  ];

  fonts.fonts = with pkgs; [
    source-code-pro
  ];
}
