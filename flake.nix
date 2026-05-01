{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

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

    outputs = { self, nixpkgs, home-manager, nixpkgs-stable, prismlauncher, ... }@inputs:
        let 
        system = "x86_64-linux";
    pkgs-stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
    };
    in {
#just a vm
        nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs pkgs-stable; };
            modules = [ 
                ./hosts/vm/configurations.nix
            ];
        };

#hp victus
        nixosConfigurations.victus = nixpkgs.lib.nixosSystem {
            inherit  system;
            specialArgs = { inherit inputs pkgs-stable; };
            modules = [ 
                ./hosts/victus/configurations.nix
            ];
        };

#hp probook
        nixosConfigurations.probook = nixpkgs.lib.nixosSystem {
            inherit  system;
            specialArgs = { inherit inputs pkgs-stable; };
            modules = [ 
                ./hosts/probook/configurations.nix
            ];
        };

# home-manager
        homeConfigurations.jraj = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            extraSpecialArgs = {
                inherit inputs pkgs-stable;
            };
            modules = [ ./home-manager/home.nix ];
        };
    };
}
