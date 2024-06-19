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

    #### ---- Home
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    darwin,
    home-manager,
    nixpkgs,
    flake-utils,
  }: let
    username = "zero";
    system = "aarch64-darwin"; # aarch64-darwin or x86_64-darwin
    hostname = "Zeros-MacBook-Pro-2";
    specialArgs =
      inputs
      // {
        inherit username hostname;
      };
  in {
    darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
      inherit system specialArgs;

      modules = [
        ./modules/darwin
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs username;};
            users.zero.imports = [
              ./modules/home-manager
            ];
          };
        }
      ];
    };
    darwinPackages = self.darwinConfigurations."${hostname}".pkgs;
  };
}
