{ config, lib, pkgs, ... }:

{
  systemd.services.nvme-mount = {
    description = "Mount encrypted NVMe for PBP";
    wantedBy = [ "multi-user.target" ];
    unitConfig.ConditionPathExists = [ "" "/dev/nvme0" ];
    script = ''
      is_mounted() {
        ${pkgs.mount}/bin/mount | ${pkgs.gawk}/bin/awk -v DIR="$1" '{if ($3 == DIR) { exit 0}} ENDFILE{exit -1}'
      }

      if ! is_mounted "/mnt/NVMe"; then
        ${pkgs.cryptsetup}/bin/cryptsetup luksOpen /dev/nvme0n1 nvmecrypt --key-file /home/luks/nvme.key
        ${pkgs.mount}/bin/mount /dev/mapper/nvmecrypt /mnt/NVMe
      fi
    '';
  };
}

