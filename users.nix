{ config, pkgs, ... }: 

{
  users.users.w4cbe = {
    isNormalUser = true;
    home = "/home/w4cbe";
    description = "Winston R. Milling";
    extraGroups = [ "wheel" ];
  };
}
