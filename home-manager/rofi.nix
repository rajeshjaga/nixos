{pkgs, config, ... }:{
    programs.rofi = {
        enable = true;
        font = "JetBrainsMono Nerd Font 14";
        modes = [ "drun" "window" ];
        theme = ./config/rofi/theme.rasi ;
    };
}
