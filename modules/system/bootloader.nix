{ lib, pkgs, config, ... }:
{
    options.victus.c_state.enable = lib.mkEnableOption "Intel Cstate for suspend and better cpu power handling";
    config = lib.mkMerge[
    {
        boot = {
            loader= {
                grub={
                    enable = true;
                    device = "nodev";
                    efiSupport = true;
                    useOSProber = true;
                };
                efi = {
                    canTouchEfiVariables = true;
                    efiSysMountPoint = "/boot/efi";
                };
            };
            kernelParams = [];
            kernelPackages = pkgs.linuxPackages_latest;
        };
    }

    (lib.mkIf config.my-system.virtualization.enable {
     boot.kernelParams = [ "intel_idle.max_cstate=3" ];
     })
    ];
}
