{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;

    settings = {
      font = "Iosevka Nerd Font Mono 11";
      anchor = "top-right";
      layer = "top";

      width = 320;
      margin = "12";
      padding = "12";
      border-size = 2;
      border-radius = 0;

      background-color = "#202020";
      text-color = "#FEFEFE";
      border-color = "#303030";

      progress-color = "over #454545";

      icons = true;
      max-icon-size = 40;

      default-timeout = 5000;
      ignore-timeout = false;
      max-visible = 5;

      markup = true;
    };

    extraConfig = ''
      [urgency=low]
      border-color=#6F7B68
      text-color=#CCCCCC

      [urgency=normal]
      border-color=#8B9698

      [urgency=critical]
      border-color=#C34143
      text-color=#FEFEFE
      default-timeout=0
    '';
  };
}
