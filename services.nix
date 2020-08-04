{ config, lib, pkgs, ... }:

{
  systemd.services.nvme-power = { 
    description = "Set the NVMe Power State";
    wantedBy = [ "multi-user.target" ];
    unitConfig.ConditionPathExists = [ "" "/dev/nvme0" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.nvme-cli}/bin/nvme set-feature /dev/nvme0 -f 2 -v 1";
    };
  };
}
