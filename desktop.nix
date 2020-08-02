{ config, pkgs, lib, callPackage, ... }: 

{
  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;
    autorun = true; 
    layout = "us";
    libinput.enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      lightdm.enable = true;
      defaultSession = "none+i3";  
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;

      extraPackages = with pkgs; [
        dmenu
        i3status
        feh
      ];
    }; 
  };
  
  services.picom = {
    enable = true;
    backend = "glx";
  };

}
