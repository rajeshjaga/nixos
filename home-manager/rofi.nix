{pkgs, config, ... }:{
    programs.rofi = {
        enable = true;
        font = "JetBrainsMono Nerd Font";
        modes = [ "drun" "window" ];
        theme = "~/.cache/wal/colors-rofi-dark.rasi";
    };
}
