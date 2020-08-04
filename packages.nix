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
    st
    mc
    p7zip
    wget
    xclip
    weechat

    # Useful Applications
    firefox
    rclone
    keepassxc

    # Graphics Stuff
    mesa
    glxinfo

    # Kernel Tools
    dtc
  ];
}
