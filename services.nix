{ config, lib, pkgs, ... }:

{
  systemd.services.nvme-mount = { 
    description = "Mount encrypted NVMe for PBP";
    wantedBy = [ "multi-user.target" ];
    unitConfig.ConditionPathExists = [ "" "/dev/nvme0" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "/home/luks/mount.sh";
    };
  };
}

