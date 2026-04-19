{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
#    plasma-manager = {
#      url = "github:nix-community/plasma-manager";
#      inputs.nixpkgs.follows = "nixpkgs";
#      inputs.home-manager.follows = "home-maanger";
#    };
    momosoft-bootscreen = {
      url = "github:thallosaurus/momosoft-bootscreen";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pywal-nix = {
      url = "github:Fuwn/pywal.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      femtoy = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./modules/common.nix
          ./hosts/femtoy
          ./hosts/femtoy/hardware-configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.lenna = import ./home/lenna;
          }
        ];
      };

      voidscream = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./modules/common.nix
          ./hosts/voidscream
          ./hosts/voidscream/hardware-configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "hm-backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.lenna = import ./home/lenna;
          }
        ];
      };
    };
  };
}
