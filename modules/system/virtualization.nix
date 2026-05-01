{config, pkgs, lib, ... }:
{
    options.my-system.virtualization.enable = lib.mkEnableOption "Virtualization Tools";

    config = lib.mkIf config.my-system.virtualization.enable {
        virtualisation.docker.enable = true;
        virtualisation.libvirtd.enable = true;
        programs.virt-manager.enable = true;
        environment.systemPackages = with pkgs; [
            virt-viewer
                spice # Often needed for good VM display/USB redirection
                spice-gtk
        ];
    };
}
