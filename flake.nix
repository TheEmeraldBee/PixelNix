{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Helix editor
    helix.url = "github:helix-editor/helix";
    helix.inputs.nixpkgs.follows = "nixpkgs";

    # Nixos Specific
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

    # Secrets
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {
    nixpkgs,
    home-manager,
    nix-darwin,
    hyprland,
    ...
  } @ inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/configuration.nix
        ];
      };
    };

    darwinConfigurations."macos" = nix-darwin.lib.darwinSystem {
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        config.allowUnfree = true;
      };

      specialArgs = {inherit inputs;};
      modules = [
        ./macos/configuration.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.brightoncox = import ./macos/home.nix;
        }
      ];
    };

    homeConfigurations = {
      brightonlcox = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        extraSpecialArgs = {inherit inputs;};

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
