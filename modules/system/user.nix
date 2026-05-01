{pkgs, ... }:
{
    users.users.jraj = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "users" "docker" "libvirtd" ];
            packages = with pkgs; [
            tree
            ];
    };
}
