{ config, pkgs, lib, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "Iosevka Nerd Font Mono:size=13";
        pad = "4x4 center-when-maximized-and-fullscreen";
        bold-text-in-bright = "yes";
      };
      csd = {
        preferred = "none";
      };
      scrollback = {
        lines = 5000;
      };
      cursor = {
        style = "block";
        blink = "yes";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      key-bindings = {
        clipboard-copy = "Control+Shift+c";
        clipboard-paste = "Control+Shift+v";
        font-increase = "Control+plus Control+equal";
        font-decrease = "Control+minus";
        font-reset = "Control+0";
        search-start = "Control+Shift+r";
        spawn-terminal = "Control+Shift+n";
      };
      colors = {
        # ───── Base ─────
        background = "202020";
        foreground = "FEFEFE";
        regular0 = "202020";   # base background
        bright0   = "303030";  # UI surface
        # ───── Text ─────
        regular7 = "CCCCCC";
        bright7  = "FEFEFE";
        # ───── Comments ─────
        regular5 = "6F7B68";
        bright5  = "6F7B68";
        # ───── Errors ─────
        regular1 = "C34143";
        bright1  = "E05255";
        # ───── Strings ─────
        regular2 = "A2A970";
        bright2  = "C4CC8A";
        # ───── Operators ─────
        regular3 = "DEBF7C";
        bright3  = "E3D896";
        # ───── Functions ─────
        regular4 = "C39AE8";
        bright4  = "D9B8FF";
        # ───── Identifiers / Dirs ─────
        regular6 = "5FC8C8";
        # ───── Specials ─────
        bright6  = "C1C88D";
        # ───── Selection ─────
        selection-foreground = "BFBBBA";
        selection-background = "454545";
      };
    };
  };
}
