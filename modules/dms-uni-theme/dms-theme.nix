{ config, ... }:
let
  theme = {
    name = "Graphite Taupe";

    # Accent: the waybar focused workspace / battery / clock color
    primary          = "#9b8d7f";
    primaryText      = "#202020";   # dark text on the accent, like the waybar focused workspace
    primaryContainer = "#4a443e";   # darker taupe for subtle highlights
    surfaceTint      = "#9b8d7f";
    secondary        = "#A2A970";   # foot "strings" olive

    # Base surfaces
    background     = "#202020";
    backgroundText = "#FEFEFE";
    surface        = "#202020";
    surfaceText    = "#CCCCCC";
    surfaceVariant     = "#303030"; # foot bright0 / mako border
    surfaceVariantText = "#9b8d7f"; # muted taupe text, same as waybar modules

    # Layered panels (control center, popups), stepping lighter
    surfaceContainerLowest  = "#121212"; # rofi alternate row
    surfaceContainerLow     = "#1a1a1a";
    surfaceContainer        = "#262626";
    surfaceContainerHigh    = "#303030";
    surfaceContainerHighest = "#454545"; # foot selection background

    outline = "#454545";

    # States
    error   = "#C34143";  # foot red / mako critical
    warning = "#DEBF7C";  # foot yellow
    info    = "#5f8787";  # rofi urgent teal

    matugen_type = "scheme-neutral";
  };
in {
  xdg.configFile."DankMaterialShell/themes/graphite-taupe.json".text =
    builtins.toJSON theme;
}
