{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Helix editor
    helix.url = "github:helix-editor/helix";
    helix.inputs.nixpkgs.follows = "nixpkgs";

    # Neovim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixos Specific
    nixpkgs-olympus.url = "github:nixos/nixpkgs/3be662c31b6cc04b10043641f4ccfc97c8a34704";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland?ref=refs/tags/v0.50.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    waybar = {
      url = "github:Alexays/waybar";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hy3 = {
      url = "github:outfoxxed/hy3?ref=refs/tags/hl0.50.0";
      inputs.hyprland.follows = "hyprland";
    };

    swww.url = "github:LGFae/swww";

    ranch.url = "github:TheEmeraldBee/ranch";
    ferrite.url = "github:TheEmeraldBee/ferrite";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    # Framework 16 stuff
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      nix-darwin,
      hyprland,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        nvidia_pc = nixpkgs.lib.nixosSystem {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };

          specialArgs = { inherit inputs; };
          modules = [
            ./machines/nvidia_pc/configuration.nix
          ];
        };
        framework_laptop = nixpkgs.lib.nixosSystem {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };

          specialArgs = { inherit inputs; };
          modules = [
            inputs.nixos-hardware.nixosModules.framework-16-7040-amd
            ./machines/framework_laptop/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        nvidia_pc = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };

          extraSpecialArgs = { inherit inputs; };

          modules = [
            inputs.nixvim.homeModules.nixvim
            ./machines/nvidia_pc/home.nix
          ];
        };
        framework_laptop = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };

          extraSpecialArgs = { inherit inputs; };

          modules = [
            inputs.nixvim.homeModules.nixvim
            ./machines/framework_laptop/home.nix
          ];
        };
      };
    };
}
