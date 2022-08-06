{ config, lib, pkgs, ... }:

{
  systemd.services.nvme-mount = {
    description = "Mount encrypted NVMe for PBP";
    wantedBy = [ "multi-user.target" ];
    unitConfig.ConditionPathExists = [ "" "/dev/nvme0" ];
    script = ''
      ${pkgs.cryptsetup}/bin/cryptsetup luksOpen /dev/nvme0n1 nvmecrypt --key-file /home/luks/nvme.key
      ${pkgs.mount}/bin/mount /dev/mapper/nvmecrypt /mnt/NVMe
    '';
  };
}

