# nixos-dotfiles

Personal NixOS configuration: a flake with a system config and a Home Manager profile, running the niri compositor with DankMaterialShell.

## Structure

```
.
├── flake.nix                  # inputs and outputs
├── flake.lock
├── home.nix                   # user environment (Home Manager)
├── nixos/
│   ├── configuration.nix      # system configuration, host: nbnixos
│   └── hardware-configuration.nix
└── modules/
    ├── niri/                  # compositor config
    ├── dms/                   # DankMaterialShell settings and theme
    ├── sway/                  # fallback compositor config
    ├── waybar/                # bar configs (not enabled)
    ├── mako/                  # notification daemon (not enabled)
    ├── foot/
    ├── helix/
    ├── rofi/
    ├── yazi/
    └── ssh/
```

## Files

| Path | Purpose |
|---|---|
| `flake.nix` | Flake entry point; pins nixpkgs and Home Manager; defines system `nbnixos` and home profile `tynado` |
| `flake.lock` | Locked input versions |
| `home.nix` | User environment: packages, GTK theme, bash, git, MIME defaults, config symlinks |
| `nixos/configuration.nix` | System config: boot, networking, audio, display manager, compositors, fonts, services |
| `nixos/hardware-configuration.nix` | Generated hardware profile |
| `modules/niri/config.kdl` | Main niri config |
| `modules/niri/dms/*.kdl` | DMS-managed niri includes: keybindings, layout, colors, cursor, outputs, window rules, alt-tab, wallpaper blur |
| `modules/dms/settings.json` | DankMaterialShell settings |
| `modules/dms/clsettings.json` | Additional DMS settings |
| `modules/dms/themes/graphite-taupe.json` | Custom DMS color theme |
| `modules/dms/firefox.css` | Firefox styling matching the DMS theme |
| `modules/sway/config` | Fallback sway config |
| `modules/waybar/niri/waybar.nix` | Waybar config for niri (not enabled) |
| `modules/waybar/sway-legacy/waybar.nix` | Waybar config for sway (not enabled) |
| `modules/mako/mako.nix` | Mako notification daemon (not enabled) |
| `modules/foot/foot.nix` | Terminal emulator |
| `modules/helix/helix.nix` | Modal text editor |
| `modules/rofi/rofi.nix` | Launcher, also used by the `yt-search` script |
| `modules/yazi/yazi.nix` | Terminal file manager |
| `modules/ssh/ssh.nix` | SSH client configuration |

The niri, sway and DMS configs are symlinked from `~/dotfiles` into `~/.config`, so the repository is expected at that path.

## System configuration

| Component | Purpose |
|---|---|
| systemd-boot, latest kernel | Bootloader, 5 generations kept |
| `nix.gc` | Weekly garbage collection of generations older than 7 days |
| NetworkManager | Networking |
| Tailscale | VPN mesh |
| PipeWire (ALSA, Pulse) | Audio |
| Bluetooth, Blueman | Bluetooth stack and manager |
| ly | Display manager |
| niri, sway | Wayland compositors |
| DankMaterialShell | Shell for niri, runs as a systemd service |
| xdg-desktop-portal (gtk, gnome) | Portals; screen sharing via slurp on sway |
| GNOME Keyring, gvfs, UPower | Secrets, virtual filesystems, power state |
| Steam | Gaming |
| Fonts | Iosevka Nerd Font, JetBrains Mono, Fira Code, Noto, Liberation |
| Locale and keyboard | `en_US.UTF-8`, `us,ru` layout, Alt+Shift to switch, timezone Asia/Tashkent |

## Packages

| Package | Purpose |
|---|---|
| `vim`, `helix` | Text editors |
| `git`, `wget`, `jq`, `bat` | Core CLI tools |
| `ansible` | Configuration management |
| `fastfetch`, `tree`, `file`, `pciutils` | System info and inspection |
| `p7zip`, `unzip`, `unrar`, `file-roller` | Archives |
| `nmap` | Network scanning |
| `remmina` | Remote desktop client |
| `nemo`, `yazi` | File managers (GUI, TUI) |
| `mpv`, `imv`, `swayimg`, `zathura` | Video, image and PDF viewers |
| `grim`, `slurp` | Screenshots |
| `swaybg` | Wallpaper |
| `wl-clipboard`, `wev`, `xwayland-satellite` | Wayland clipboard, event viewer, X11 app support |
| `networkmanagerapplet`, `libnotify` | Network tray applet, notifications |
| `xdg-utils`, `desktop-file-utils`, `shared-mime-info`, `glib`, `dconf` | Desktop integration |
| `firefox`, `qutebrowser` | Browsers |
| `bitwarden-desktop`, `kdePackages.ksshaskpass` | Password manager, SSH passphrase prompt |
| `obs-studio` | Screen recording |
| `telegram-desktop`, `spotify`, `onlyoffice-desktopeditors` | Messaging, music, office suite |
| `yt-search` | Custom script: YouTube search through rofi |

## Shell aliases

| Alias | Action |
|---|---|
| `hms` | Rebuild the Home Manager profile |
| `hmc` | Edit `home.nix` |
| `sc` | Edit `nixos/configuration.nix` |
| `cdd` | Go to the dotfiles repository |

A few files, aliases, etc. may be named inconsistently. Please, vanilla, ignore that k?
