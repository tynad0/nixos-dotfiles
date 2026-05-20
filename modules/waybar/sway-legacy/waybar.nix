{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 0;
        height = 22;
        reload_style_on_change = true;
        "custom/separator" = {
          format = "::";
          interval = "once";
          tooltip = false;
        };
        modules-left = [
          "sway/workspaces"
          "sway/mode"
          "sway/window"
          "custom/separator"
          "sway/language"
        ];
        modules-right = [
          "tray"
          # "sway/language"
          "cpu"
          "custom/separator"
          "memory"
          "custom/separator"
          "battery"
          "custom/separator"
          "network"
          "custom/separator"
          "pulseaudio"
          "custom/separator"
          "clock"
        ];
        "sway/window" = {
          max-length = 25;
        };
        tray = {
          spacing = 2;
          tooltip = false;
        };
        "sway/language" = {
          format = "{short}";
        };
        cpu = {
          format = "cpu {usage}%";
          interval = 2;
        };
        memory = {
          format = "mem {percentage}%";
          interval = 2;
        };
        battery = {
          format = "bat {capacity}%";
          interval = 5;
          tooltip = false;
        };
        network = {
          format-wifi = "{essid}";
          format-ethernet = "{essid}";
          format-disconnected = "no net";
          interval = 5;
          tooltip = false;
        };
        pulseaudio = {
          scroll-step = 5;
          max-volume = 150;
          format = "vol {volume}%";
          format-muted = "mute";
          on-click = "pavucontrol";
          tooltip = false;
        };
        clock = {
          format = "{:%a %d %b %H:%M:%S}";
          interval = 1;
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "Iosevka Nerd Font Mono";
        font-size: 13px;
        padding: 0;
        margin: 0;
      }
      window#waybar {
        background: #202020;
        color: #9b8d7f;
        padding: 0 3px;
      }
      #workspaces button {
        color: #9b8d7f;
      }
      #workspaces button.focused {
        background-color: #9b8d7f;
        color: #202020;
      }
      #window {
        padding: 0 4px;
        color: #9b8d7f;
      }
      #cpu,
      #memory,
      #battery,
      #network,
      #pulseaudio,
      #clock,
      #tray,
      #language {
        padding: 0 4px;
        margin: 0 1px;
        color: #9b8d7f;
      }      
      #battery, #clock {
        background-color: #9b8d7f;
        color: #202020;
      }
      
      #custom-separator {
        padding: 0 1px;
        margin: 0;
      }
    '';
  };
}
