{config, pkgs, lib, ... }:
{
    xdg.configFile."niri/config.kdl".source = ./config/niri/config.kdl;
    xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config.common.default = [ "gnome" "gtk" ];
  };
  services.swayidle = {
    enable = true;
  };
}
