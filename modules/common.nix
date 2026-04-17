{ pkgs, ... }:
{
    # common stuff
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    security.polkit.enable = true;
    networking.networkmanager.enable = true;
    time.timeZone = "Europe/Berlin";
    i18n.defaultLocale = "de_DE.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
    };

    services.xserver.xkb = {
        layout = "de";
        variant = "";
    };

    programs.firefox.enable = true;
    services.printing.enable = true;

    console.keyMap = "de";
    services.gnome.gnome-keyring.enable = true;
    environment.systemPackages = with pkgs; [
        helix
        kitty
        vscode
        networkmanagerapplet
        git
        reaper
        nemo
        shared-mime-info
        #ardour
        lxqt.lxqt-policykit
        wiremix
        mate.caja-with-extensions
        adwaita-icon-theme
    ];

    nixpkgs.config.allowUnfree = true;
      # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    users.users.lenna = {
        isNormalUser = true;
        description = "lenna";
        extraGroups = [ "networkmanager" "wheel" "jackaudio" ];
    };

    system.stateVersion = "25.11";
}