{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Helix editor
    helix.url = "github:helix-editor/helix";
    helix.inputs.nixpkgs.follows = "nixpkgs";

    # Terminal
    ghostty.url = "github:ghostty-org/ghostty";

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

    ranch.url = "github:TheEmeraldBee/ranch";
    ferrite.url = "github:TheEmeraldBee/ferrite";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    # Flatpak Stuff
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    zen-nebula.url = "github:JustAdumbPrsn/Nebula-A-Minimal-Theme-for-Zen-Browser";

    zig.url = "github:mitchellh/zig-overlay";
    zig.inputs.nixpkgs.follows = "nixpkgs";

    # Framework 16 stuff
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };
  outputs = {
    nixpkgs,
    home-manager,
    nix-darwin,
    hyprland,
    ...
  } @ inputs: {
    nixosConfigurations = {
      nvidia_pc = nixpkgs.lib.nixosSystem {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        specialArgs = {inherit inputs;};
        modules = [
          inputs.nix-flatpak.nixosModules.nix-flatpak
          ./machines/nvidia_pc/configuration.nix
        ];
      };
      framework_laptop = nixpkgs.lib.nixosSystem {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        specialArgs = {inherit inputs;};
        modules = [
          inputs.nixos-hardware.nixosModules.framework-16-7040-amd
        ];
      };
    };

    homeConfigurations = {
      nvidia_pc = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        extraSpecialArgs = {inherit inputs;};

        modules = [
          ./machines/nvidia_pc/home.nix
        ];
      };
      framework_laptop = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        extraSpecialArgs = {inherit inputs;};

        modules = [
          ./machines/framework_laptop/home.nix
        ];
      };
    };
  };
}
