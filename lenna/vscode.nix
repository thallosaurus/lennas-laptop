{ config, pkgs, ...}: {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      arrterian.nix-env-selector
      jnoortheen.nix-ide
      mkhl.direnv
#      dlasagno.wal-theme
    ];
    profiles.default.userSettings = {
      "editor.fontFamily" = "FiraCode Nerd Font Mono";
    };
  };
}