{ config, lib, pkgs, ... }:

{
  systemd.services.nvme-mount = { 
    description = "Mount encrypted NVMe for PBP";
    wantedBy = [ "multi-user.target" ];
    unitConfig.ConditionPathExists = [ "" "/dev/nvme0" ];
    script = ''
      cryptsetup luksOpen /dev/nvme0n1 nvmecrypt --key-file /home/luks/nvme.key
      mount /dev/mapper/nvmecrypt /NVMe
    '';
  };
}

