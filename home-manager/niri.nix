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
    timeouts = [
    { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -f -i /home/jraj/Pictures/wallies/malenia.jpg"; }
    { timeout = 360; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
  };
}
