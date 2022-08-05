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
   
    # GPG
    gnupg
    pinentry-curses

    # Graphical
    mesa
    alacritty
    firefox
    element-desktop
  ];

  fonts.fonts = with pkgs; [
    source-code-pro
  ];
}
