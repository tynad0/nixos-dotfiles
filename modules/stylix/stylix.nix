{ pkgs, ... }:

{
  stylix = {
    enable = true;

    #image = ./wallpapers/platform.jpg;
    polarity = "dark";

    
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa-dragon.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
    #base16Scheme = ./themes/mygray.yaml;
  };
}
