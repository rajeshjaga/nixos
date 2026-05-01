{config, pkgs, ... }:
{
    services.xserver ={
        enable = true;
        desktopManager = {
            xterm.enable = true;
        };
        xkb.layout = "us";
    };
    services.displayManager = {
        defaultSession = "niri";
        sddm = {
            enable = true;
        };
    };
}
