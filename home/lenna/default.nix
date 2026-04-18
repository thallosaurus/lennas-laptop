{ config, lib, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lenna";
  home.homeDirectory = "/home/lenna";

  imports = [
    ./sway.nix
    ./vscode.nix
    ./waybar.nix
    inputs.pywal-nix.homeManagerModules.x86_64-linux.default
#    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  nixpkgs.config = {
    allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "discord"
        "vscode"
      ];
  };

#  inputs.home-manager.lib.homeManagerConfiguration = {
#        modules = [
#          inputs.pywal-nix.homeManagerModules.${pkgs.system}.default
#        ];
#      };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

#  gtk.iconTheme.name = "Adwaita";

#  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    pkgs.nerd-fonts.fira-code
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
      pkgs.nerd-fonts._3270
#      pkgs.pywal16
      pkgs.waybar
      pkgs.discord
      pkgs.direnv
#      pkgs.vscode
      pkgs.neofetch
      pkgs.wofi
      pkgs.keepassxc
      pkgs.wallust
  ];
  fonts.fontconfig.enable = true;

  gtk.enable = true;
#  gtk.iconTheme.package = lib.mkForce pkgs.papirus-icon-theme;
  gtk.iconTheme.name = lib.mkForce "Adwaita";

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
    ".bashrc".text = ''
      #!/bin/bash
      (cat ~/.cache/wal/sequences &)
    '';

    ".config/helix/config.toml".text = ''
      theme = "base16_terminal"
    '';

    ".config/wallust/wallust.toml".text = ''
      # Let's keep good old pywal look and feel
      backend = "wal"
      #color_space = "lch" # idc about this one..
      #threshold = "20" # neither about this, since I read wallust does it automagically..
      # classic look
      palette = "dark16"
      # let's keep the contrast very very very clear.
      check_contrast = true

      [templates]
      # dunst templates
#      dunst.template = "dunstrc.monitor"
#      dunst.target = "~/.config/dunst/dunstrc"

      # one liner for zathura
#      zathura = { template = 'zath', target = '~/.config/zathura/zathurarc' }

      # even a shorter way, using directories, but only one level recursion
#      glava = { src = 'glava', dst = '~/.config/glava/', max_depth = 1 }

      # or splited in the dotted syntax
#      res.src = "xres"
#      res.dst = "~/.config/Xresources"

      # old times, good times. Here I put old pywal templates.
      # NOTE THAT BOTH src AND dst ARE DIRECTORIES!
      pywal = { src = "templates/", dst = '~/.cache/wal/', pywal = true }
    '';
  
    ".config/kitty/kitty.conf".text = ''
      include ~/.cache/wal/colors-kitty.conf
      font_family FiraCode Nerd Font Mono
      font_size 9.0
      background_blur 1
      background_opacity 0.8
      enable_background_blur yes
    '';

    ".config/wal/templates/colors-kitty.conf".source = ./templates/colors-kitty.conf;
    ".config/wallust/templates/templates/colors-kitty.conf".source = ./templates/colors-kitty.conf;

    ".config/wal/templates/colors-waybar-transparent.css".text = ./templates/colors-waybar-transparent.css;
    ".config/wallust/templates/templates/colors-waybar-transparent.css".text = ./templates/colors-waybar-transparent.css;

    ".config/nixpkgs/config.nix".text = ''
      { allowUnfree = true; }
    '';
    
    ".config/neofetch" = {
      source = ./neofetch;
      recursive = true;
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/lenna/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.pywal.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
