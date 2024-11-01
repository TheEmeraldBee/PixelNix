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
  };
  outputs = {
    nixpkgs,
    home-manager,
    hyprland,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/configuration.nix
        ];
      };
    };
    homeConfigurations = {
      brightonlcox = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          {
            wayland.windowManager.hyprland = {
              enable = true;
              package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
            };
          }
          ./home-manager/home.nix
        ];
      };
    };
  };
}
