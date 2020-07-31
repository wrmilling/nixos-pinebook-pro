{ config, pkgs, ... }: 

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Basic Terminal Stuff
    vim
    htop
    tmux
    git
    yadm
    nvme-cli
    zsh

    # Useful Applications
    firefox

    # Graphics Stuff
    mesa
    glxinfo
  ];
}
