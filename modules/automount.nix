{ config, lib, ... }:
{
  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/5f3f2d0d-a3a4-4784-a3a0-2da53796880f";
    fsType = "ext4";
    options = [
      "users" # Allows any user to mount and unmount
      "uid=1000"
      "gid=100"
      "dmask=007"
      "fmask=117"
      "nofail" # Prevent system from failing if this drive doesn't mount
    ];
  };
}
