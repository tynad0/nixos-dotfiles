
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.configurationLimit = 5;
  # boot.loader.timeout = 0;

  # Generations autodelete
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d"; 
  };  

  # Networking
  networking.hostName = "nbnixos";
  networking.networkmanager.enable = true;
  
  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  # Timezone
  time.timeZone = "Asia/Tashkent";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
    options = "grp:alt_shift_toggle";
  };

  # User Options
  users.users.tynado = {
    isNormalUser = true;
    description = "tynado";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "plugdev" "disk" "input" "usb"];
    packages = with pkgs; [];
  };

  # WM, DM, DE stuff
  services.displayManager.ly = {
    enable = true;
    settings = {
      session_log = null;
      hide_key_hints = true;
      hide_version_string = true;
    };
  };
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  # programs.niri = {
  #   enable = true;
  # };
  programs.xwayland.enable = true;


  # PORTAL
  xdg.portal = {
  enable = true;

  extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];
};
  
  
  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    firefox
    git
    bat
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    jetbrains-mono
    nerd-fonts.iosevka
  ];

  services.gvfs.enable = true;
services.tumbler.enable = true;  # thumbnail previews in Thunar
  
  system.stateVersion = "25.11";
  nix.settings.experimental-features = ["nix-command" "flakes"];

}
