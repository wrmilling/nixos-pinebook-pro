{ pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [
    vim
    htop
    tmux
    git
  ];
}
