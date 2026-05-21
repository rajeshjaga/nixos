{pkgs, config, ...}:{

    programs.waybar = {
    enable = true;
    };
    xdg.configFile ={
        "waybar/config.jsonc".source = ./config/waybar/config.jsonc;
        "waybar/style.css".source = ./config/waybar/style.css;
    };
}
