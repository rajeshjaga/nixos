{ lib, config, pkgs, ... }:
{
    options.nvidia.victus.enable = lib.mkEnableOption "Nvidia DGpu for my victus ie, RTX 3050";
    
    config = lib.mkIf config.nvidia.victus.enable {
        hardware.graphics = {
            enable = true;
            enable32Bit = true;
        };

        services.xserver.videoDrivers = ["nvidia"];

        # Centralize your NVIDIA kernel parameters here
        # (nvidia-drm.modeset=1 is automatically handled by modesetting.enable = true below)
        boot.kernelParams = [ "nvidia-drm.fbdev=1" ];

        hardware.nvidia = {
            modesetting.enable = true;
            
            # THE FIX: This preserves VRAM during sleep to stop the freezing
            powerManagement.enable = true; 
            
            open = true; 
            
            prime = {
                # Sync mode means the NVIDIA GPU is always on. 
                # This gives max performance, but requires powerManagement.enable = true 
                # to survive a suspend/resume cycle.
                sync.enable = true; 

                intelBusId = "PCI:0:2:0"; 
                nvidiaBusId = "PCI:1:0:0";
            };
        };
    };
}
