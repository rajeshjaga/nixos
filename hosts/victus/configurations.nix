{config, pkgs, ... }:
{
	imports =
		[       
		./hardware-configuration.nix
        ../package.nix
        ../../modules/bundle.nix
		];



	time.timeZone = "Asia/Kolkata";
	i18n.defaultLocale = "en_IN.UTF-8";

	programs.firefox.enable = true;
	programs.niri.enable = true;

	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = true;
	};

    my-system.virtualization.enable = true;
    nix.settings.experimental-features = ["nix-command" "flakes"];

	system.stateVersion = "25.11";
}

