{ config, pkgs, ... }:

let
  homeDir = config.home.homeDirectory;
in
{
  imports = [
    ./modules/foot/foot.nix
    ./modules/helix/helix.nix
    ./modules/waybar/sway-legacy/waybar.nix
    ./modules/rofi/rofi.nix
    ./modules/mako/mako.nix
  ];

  home.username = "tynado";
  home.homeDirectory = "/home/tynado";
  home.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;

  # GTK
  gtk = {
    enable = true;

    theme = {
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    font = {
      name = "Iosevka Nerd Font Mono";
      size = 11;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Adwaita";
      icon-theme = "Papirus-Dark";
      cursor-theme = "Bibata-Modern-Ice";
      font-name = "Iosevka Nerd Font Mono 11";
      color-scheme = "prefer-dark";
    };
  };

  # PACKAGES
  home.packages = with pkgs; [
    tree
    telegram-desktop
    imv
    pavucontrol
    dconf
    xfce.thunar
    libnotify
    bitwarden-desktop
    obsidian
    qutebrowser

    file
    wev
    grim
    slurp
    wl-clipboard
    swayimg
    mpv
    xdg-utils

    glib
    shared-mime-info
    desktop-file-utils
    kdePackages.ksshaskpass
    

    helix
  ];

  # SHELL
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      hmc = "hx ${homeDir}/dotfiles/home.nix";
      hms = "home-manager switch --flake .";
      sc = "hx ${homeDir}/dotfiles/nixos/configuration.nix";
      cdd = "cd ${homeDir}/dotfiles";
      cdov = ''cd "${homeDir}/Obsidian Vault"'';
      };

    initExtra = ''
      git_branch() {
        git branch 2>/dev/null | grep '^\*' | sed 's/\* //'
      }
      PS1='\w$(git_branch | sed "s/\(.*\)/ (\1)/")\nλ '
    '';
  };

  # GIT
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Tynado";
        email = "thats.tynado@gmail.com";
      };
    };
    
  };

  # SSH
  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;

    matchBlocks."*" = {
      addKeysToAgent = "yes";
    };
  };

  services.ssh-agent.enable = true;

    
  # BROWSER
  programs.librewolf = {
    enable = true;
  };

  # SWAY CONFIG
  xdg.configFile = {
    "sway/config".source = ./modules/sway/config;
    "niri/config.kdl".source = ./modules/niri/config.kdl;
  };

  # PORTAL
  xdg.portal = {
    enable = true;

    config.common.default = "*";

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  # Custom helix desktop entry
home.file.".local/share/applications/helix.desktop".text = ''
  [Desktop Entry]
  Name=Helix
  Exec=foot hx %F
  Type=Application
  MimeType=text/plain;text/x-nix;text/markdown;text/x-script;text/x-shellscript;text/x-python;text/x-c;text/x-csrc;text/x-chdr;text/x-rust;text/x-toml;text/x-yaml;text/xml;text/css;text/javascript;application/json;application/x-shellscript;
  Terminal=false
  Categories=TextEditor;
'';

# MIME DEFAULTS
xdg.mimeApps = {
  enable = true;
  defaultApplications = {
    "text/plain"              = "helix.desktop";
    "text/x-nix"             = "helix.desktop";
    "text/markdown"          = "helix.desktop";
    "text/x-script"         = "helix.desktop";
    "text/x-shellscript"    = "helix.desktop";
    "text/x-python"         = "helix.desktop";
    "text/x-rust"           = "helix.desktop";
    "text/x-toml"           = "helix.desktop";
    "text/x-yaml"           = "helix.desktop";
    "text/xml"              = "helix.desktop";
    "text/css"              = "helix.desktop";
    "text/javascript"       = "helix.desktop";
    "application/json"      = "helix.desktop";
    "image/png"             = "imv.desktop";
    "image/jpeg"            = "imv.desktop";
    "video/mp4"             = "mpv.desktop";
  };
};

  home.sessionVariables = {
    SSH_ASKPASS = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
  };

  programs.home-manager.enable = true;
}
