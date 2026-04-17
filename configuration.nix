# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
#      ./hardware-configuration.nix
      ./plymouth.nix
    ];


  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  # services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  # services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;


#  programs.sway.wrapperFeatures.gtk = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.


#  fonts.packages = with pkgs; [ nerd-fonts ];

#  security.doas.enable = true;
#  security.sudo.enable = false;

#  security.doas.extraRules = [{
#    users = ["lenna"];
#  # Optional, retains environment variables while running commands 
#  # e.g. retains your NIX_PATH when applying your config
#    keepEnv = true; 
#    persist = true;  # Optional, only require password verification a single time
#  }];

  # Install firefox.


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

 

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
