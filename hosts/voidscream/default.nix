{ pkgs, ... }: {
  networking.hostName = "voidscream";
  imports = [
    ../../modules/common.nix
    ../../modules/plasma.nix
    ../../modules/plymouth.nix
    ../../modules/ly.nix
    ../../modules/audio.nix
    ../../modules/disable-suspend.nix
    ../../modules/steam.nix
  ];
}