{ pkgs, configs, ... }:{
	boot = {
		loader= {
			grub={
				enable = true;
				device = "nodev";
				efiSupport = true;
			};
			efi = {
				canTouchEfiVariables = true;
				efiSysMountPoint = "/boot";
			};
		};
		kernelParams = [];
		kernelPackages = pkgs.linuxPackages_latest;
	};
    }
