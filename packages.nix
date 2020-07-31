{ config, pkgs, ... }: 

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    htop
    tmux
    git
    firefox
  ];
}
