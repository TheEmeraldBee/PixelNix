{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-olympus.url = "github:nixos/nixpkgs/57943708113949d3f9f7fce5b835f71a99ebc5b8";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    swww.url = "github:LGFae/swww";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    app-launcher.url = "github:TheEmeraldBee/tui-launcher";

    # Macos Specific
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    brew-nix = {
      url = "github:BatteredBunny/brew-nix";
      inputs.brew-api.follows = "brew-api";
    };

    brew-api = {
      url = "github:BatteredBunny/brew-api";
      flake = false;
    };
  };
  outputs = {
    nixpkgs,
    home-manager,
    nix-darwin,

   
    hyprland,
    ...
  } @ inputs: let
  in {
     nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/configuration.nix
        ];
      };
    };

    darwinConfigurations."macos" = nix-darwin.lib.darwinSystem {
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
    
      specialArgs = {inherit inputs;};
      modules = [
        ./macos/configuration.nix
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.brightoncox = import ./macos/home.nix;
        }
      ];
    };
   
    homeConfigurations = {
      brightonlcox = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [
          {
            wayland.windowManager.hyprland = {
              enable = true;
              package = hyprland.packages.x86_64-linux.hyprland;
            };
          }
          ./home-manager/home.nix
        ];
      };
    };
  };
}
