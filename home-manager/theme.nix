{pkgs, config, ...}:
{
    gtk = {
        cursorTheme = {
            name = "Bibata-Modern-Classic";
            package = pkgs.bibata-cursors;
            size = 24;
        };
        theme = {
            name = "Breeze-Dark";
            package = pkgs.breeze-gtk;
        };
        iconTheme = {
            name = "Papirus";
            package = pkgs.papirus-icon-theme;
        };
    };
}
