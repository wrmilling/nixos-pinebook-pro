# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      <nixos-hardware/pine64/pinebook-pro>
      ./hardware.nix
      ./packages.nix
      ./users.nix
      ./services.nix
      ./desktop.nix
      ./private.nix
    ];
  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.initrd.luks.devices = {
    cryptroot = {
      device = "/dev/disk/by-uuid/f9618ef7-0e79-4181-8a05-d95c300bb10f";
      allowDiscards = true;
      preLVM = true;
    };
  };

  boot.kernelModules = lib.mkAfter [ "zram" ];
  boot.kernelParams = lib.mkAfter [ "console=tty0" ];

  networking.hostName = "serenity"; 
  networking.networkmanager.enable = true; 

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Default Locale
  i18n.defaultLocale = "en_US.UTF-8";

  # Backlight control
  programs.light.enable = true;
  
  system.stateVersion = "22.11"; 
}

