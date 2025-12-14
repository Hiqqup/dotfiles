{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      username = "ju";
    in {
      homeConfigurations.${username} =
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
          };

          modules =    [({ pkgs, ... }:
            {
              home.username = username;
              home.homeDirectory = "/home/${username}";
              home.stateVersion = "24.05";

              programs.home-manager.enable = true;

              home.packages = [
                pkgs.hello
              ];
            }
          )];
        };
    };
}
