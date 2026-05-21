{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixos-stable.url = "github:nixos/nixpkgs/nixos-25.11";
        home-manager ={
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        prismlauncher.url = "github:PrismLauncher/PrismLauncher";
        zen-browser = {
            url = "github:youwen5/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nixos-stable, home-manager, prismlauncher, ... }@inputs:
        let 
        system = "x86_64-linux";
    in {
        # home manager
        homeConfigurations.jraj = home-manager.lib.homeManagerConfiguration{
            pkgs = nixpkgs.legacyPackages.${system};
            extraSpecialArgs = { inherit inputs; };
            modules = [ ./home-manager/home.nix ];
        };

        # hp victus
        nixosConfigurations.victus = nixpkgs.lib.nixosSystem {
            inherit  system;
            specialArgs = { inherit inputs; };
            modules = [ 
                ./hosts/victus/configurations.nix
            ];
        };

        # just a vm
        nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs; };
            modules = [ 
                ./hosts/vm/configurations.nix
            ];
        };

        # hp probook
        nixosConfigurations.probook = nixpkgs.lib.nixosSystem {
            inherit  system;
            specialArgs = { inherit inputs ; };
            modules = [ 
                ./hosts/probook/configurations.nix
            ];
        };

    };
}
