{config, pkgs, ... }:
{
	imports =
		[       
		./hardware-configuration.nix
        ../package.nix
        ../../modules/bundle.nix
		];



	time.timeZone = "Asia/Kolkata";
	i18n.defaultLocale = "en_IN";

	programs.firefox.enable = true;
	programs.niri.enable = true;

	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = true;
	};

    my-system.virtualization.enable = true;
    victus.c_state.enable = true;
    nvidia.victus.enable = true;
    nix.settings = {
        experimental-features = ["nix-command" "flakes"];
        substituters = [ "https://niri.cachix.org" ];
        trusted-public-keys = [
            "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
            ];
        };

	system.stateVersion = "25.11";
}
