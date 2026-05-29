{ config, pkgs, inputs, pkgs-stable, ... }:

{
    imports = [
        ./kitty.nix
        ./niri.nix
        ./rofi.nix
        ./theme.nix
        ./waybar.nix
    ];
    home.username = "jraj";
    home.homeDirectory = "/home/jraj";
    home.stateVersion = "25.11"; # Match this to your primary NixOS version

        home.packages = [
            pkgs.pywal16
	    pkgs.w3m
            pkgs.swaybg
            pkgs.neovim
            pkgs.imagemagick
            pkgs.wl-clipboard
            pkgs.kdePackages.breeze-gtk
            pkgs.bibata-cursors
            pkgs.papirus-icon-theme
            inputs.zen-browser.packages.${pkgs.system}.default
            inputs.prismlauncher.packages.${pkgs.system}.prismlauncher
        ];

    programs.bash = {
        enable = true;
        enableCompletion = true;
        shellAliases = {
            vim = "nvim";
            nix-switch = "sudo nixos-rebuild switch --flake .";
            home-switch = "home-manager switch --flake .#jraj";
            l = "eza -l --color=auto --icons";
            ll = "eza -la --color=auto --icons";
            lg = "lazygit";
            g = "git";
        };
    };
    programs.starship = {
        enable = true;
    };
    programs.git = {
        enable = true;
        userName = "RajeshJaga";
        userEmail = "rajaga223@gmail.com";
        settings.alias = {
            c = "commit";
            s = "status";
            l = "log";
        };
        extraConfig = {
            init.defaultBranch = "master";
        };
    };
    programs.home-manager.enable = true;
}
