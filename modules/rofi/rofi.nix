{ config, pkgs, lib, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;

in {
  programs.rofi = {
    enable  = true;
    package = pkgs.rofi;
    font    = "Iosevka Nerd Font Mono 12";
    extraConfig = {
      lazy-grab = false;
      show-icons = true;
    };

    theme = {
      "*" = {
        background-color = mkLiteral "#202020";
        text-color       = mkLiteral "#c1c1c1";
      };

      window = {
        fullscreen       = true;
        background-color = mkLiteral "#202020";
        border           = mkLiteral "0px";
        padding          = mkLiteral "38% 40% 25% 40%";
        children         = mkLiteral "[mainbox]";
      };

      mainbox = {
        background-color = mkLiteral "transparent";
        spacing          = mkLiteral "2px";
        children         = mkLiteral "[inputbar, listview]";
      };

      inputbar = {
        background-color = mkLiteral "#202020";
        text-color       = mkLiteral "#c1c1c1";
        children         = mkLiteral "[prompt, entry]";
        padding          = mkLiteral "1px";
      };

      prompt = {
        background-color = mkLiteral "transparent";
        text-color       = mkLiteral "#c1c1c1";
      };

      entry = {
        background-color = mkLiteral "transparent";
        text-color       = mkLiteral "#c1c1c1";
        cursor-width     = mkLiteral "1ch";
      };

      listview = {
        background-color = mkLiteral "transparent";
        spacing          = mkLiteral "2px";
        columns          = 1;
        cycle            = false;
      };

      element = {
        border  = mkLiteral "0px";
        padding = mkLiteral "0px";
      };

      "element normal.normal" = {
        background-color = mkLiteral "#202020";
        text-color       = mkLiteral "#9b8d7f";
      };

      "element normal.active" = {
        background-color = mkLiteral "#202020";
        text-color       = mkLiteral "#999999";
      };

      "element normal.urgent" = {
        background-color = mkLiteral "#202020";
        text-color       = mkLiteral "#5f8787";
      };

      "element selected.normal" = {
        background-color = mkLiteral "#000000";
        text-color       = mkLiteral "#c1c1c1";
      };

      "element selected.active" = {
        background-color = mkLiteral "#000000";
        text-color       = mkLiteral "#999999";
      };

      "element selected.urgent" = {
        background-color = mkLiteral "#5f8787";
        text-color       = mkLiteral "#000000";
      };

      "element alternate.normal" = {
        background-color = mkLiteral "#121212";
        text-color       = mkLiteral "#9b8d7f";
      };

      scrollbar = {
        width        = mkLiteral "4px";
        handle-width = mkLiteral "8px";
        handle-color = mkLiteral "#444444";
      };
    };
  };
}
