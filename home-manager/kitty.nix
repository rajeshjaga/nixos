{config, lib, pkgs, ... }:
{
    programs.kitty = {
        enable = true;
        extraConfig = ''
            font_family      JetBrainsMono Nerd Font
            bold_font        auto
            italic_font      auto
            bold_italic_font auto
            font_size 14.0
            force_ltr no

            box_drawing_scale 1, 1, 1, 2

            include ~/.cache/wal/colors-kitty.conf

            background_opacity 0.8
            dim_opacity 1
            window_margin_width 20 15
            repaint_delay  10
            input_delay 3
            sync_to_monitor yes

            tab_bar_min_tabs            1
            tab_bar_edge                bottom
            tab_bar_style               powerline
            tab_powerline_style         slanted

            enable_audio_bell no
            '';
    };
}
