{ config, pkgs, ... }:
{
  security.rtkit.enable = true;
  services.pipewire.jack.enable = true;

  services.jack = {
    jackd.enable = false;
    alsa.enable = false;
    loopback = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    ardour
    reaper
  ];
}