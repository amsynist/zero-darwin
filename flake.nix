{
  description = "Zero Darwin System Flake :)";
  nixConfig = {
  };

  inputs = {
    ## -- nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    ## -- Platform

    #### ---- MacOS
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-formatter-pack = {
      url = "github:Gerschtli/nix-formatter-pack";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #### ---- Home
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ### neovim
    nixvim = {
      url = "github:nix-community/nixvim";
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
    };
  };

  outputs = inputs @ {
    self,
    darwin,
    home-manager,
    nixpkgs,
    nixvim,
    flake-utils,
    nix-formatter-pack,
  }: let
    username = "zero";
    system = "aarch64-darwin"; # aarch64-darwin or x86_64-darwin
    hostname = "Zeros-MacBook-Pro-2";
    specialArgs =
      inputs
      // {
        inherit username hostname;
      };
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
  in {
    formatter = forAllSystems (
      system:
        nix-formatter-pack.lib.mkFormatter {
          pkgs = nixpkgs.legacyPackages.${system};

          config.tools = {
            deadnix.enable = true;
            nixpkgs-fmt.enable = true;
            statix.enable = true;
          };
        }
    );

    darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
      inherit system specialArgs;

      modules = [
        ./modules/darwin
        home-manager.darwinModules.home-manager
        {
          home-manager = {
          backupFileExtension = ".nixbacked";
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs username;};
            users.zero.imports = [
              ./modules/home-manager
              nixvim.homeManagerModules.nixvim
            ];
          };
        }
      ];
    };
    darwinPackages = self.darwinConfigurations."${hostname}".pkgs;
  };
}
