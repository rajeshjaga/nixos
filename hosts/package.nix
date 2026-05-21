{pkgs, ...}:
{
    nixpkgs.config.allowUnfree = true;
    fonts.packages = with pkgs;[
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        font-awesome
        nerd-fonts.jetbrains-mono
        nerd-fonts.ubuntu
        ubuntu-sans
    ];
    fonts.fontconfig = {
        defaultFonts = {
            serif = [  "Liberation Serif"];
            sansSerif = [ "Ubuntu"  ];
            monospace = [ "JetBrainsMono Nerd Font" ];
        };
    };
    environment.systemPackages = with pkgs; [
        ansible
            aria2
            atuin
            bat
            btop
            bun
            brillo
            chromium
            cmake
            curl
            eza
            fastfetch
            fd
            feh
            fzf
            go
            htop
            imagemagick
            jq
            just
            lazydocker
            lazygit
            libnotify
            lua51Packages.luarocks
            lutris
            mako
            meson
            mpdris2
            mpv
            gnumake
            ncdu
            netcat
            ninja
            nmap
            nodejs_latest
            tree-sitter
            nwg-look
            obs-studio
            obsidian
            pavucontrol
            pciutils
            psmisc
            postgresql
            qbittorrent
            ranger
            rclone
            ripgrep
            rofi
            rustup
            swayidle
            swaylock
            swaynotificationcenter
            tailscale
            terraform
            terminus_font
            thunar
            thunar-volman
            tumbler
            tmux
            virt-top
            virt-viewer
            virt-manager
            vim 
            vlc
            wget
            wireshark
            wl-clipboard
            wl-mirror
            xwayland-satellite
            yt-dlp
            zathura
            zathuraPkgs.zathura_pdf_poppler
            zoxide
            ];
}
