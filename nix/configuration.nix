# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

let
  # Separately packaged fonts
  espacionFontPkg = import ./fonts/espacion-font.nix { inherit pkgs; };
  pixelonFontPkg = import ./fonts/pixelon-font.nix { inherit pkgs; };
  hyprpanelFontPkg = import ./fonts/hyprpanel-font.nix { inherit pkgs; };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Disable systemd-boot
  #boot.loader.systemd-boot.enable = false;
  
  # GRUB
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true;
  };

  # GRUB theme
  boot.loader.grub.theme = let
    colorscheme = "night";
    layout = "teleport";
    resolution = "1920x1080";
  in
    inputs.grubshin-bootpact.packages.${pkgs.system}.${colorscheme}.${layout}.${resolution};

  # EFI config
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };
  
  # Kernel Packages for OBS Virtual Camera
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      amdenc
    ];
  };

  # Zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 30;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  
  # networkManager OpenVPN
  networking.networkmanager = {
	plugins = with pkgs; [
		networkmanager-openvpn
	];
  };

  # Winbox setup.
  programs.winbox = {
	enable = true;
	openFirewall = true;
	package = pkgs.winbox;
  };

  # Forbid NetworkManager to override resolv.conf
  #networking.networkmanager.dns = "none";

  # Prioritize CloudFlare DNS over Google DNS
  #networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  # Environment Variables
  environment.variables = {
	HYPRSHOT_DIR = "$HOME/Pictures/Screenshots";
  };

  # Basically /etc/hosts
  #networking.extraHosts =
  #"
	#192.168.56.20	server
  #";

  # Enable Bluetooth
  hardware.bluetooth = {
	enable = true;
	powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Enable adb
  programs.adb.enable = true;

  # Run AppImage
  programs.appimage = {
  	enable = true;
  	binfmt = true;
  };

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mamat = {
    isNormalUser = true;
    description = "mamat-nixos";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Nix Flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Polkit
  security.polkit.enable = true;
  
  # LightDM
  services.xserver.enable = true;
  # services.xserver.displayManager.lightdm.enable = true;

  # SDDM
  services.displayManager.sddm = {
	enable = true;
	autoNumlock = true;
        enableHidpi = true;
        wayland.enable = true;
	package = pkgs.kdePackages.sddm;
	theme = "sddm-astronaut-oldtales";
	extraPackages = with pkgs; [
            kdePackages.qtmultimedia
            kdePackages.qtsvg
            kdePackages.qtvirtualkeyboard
        ];
	#theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  # Hyprland
  programs.hyprland.enable = true;

  # Firefox
  programs.firefox.enable = true;

  # Flatpak
  services.flatpak.enable = true;

  # Fuse Filesystem
  services.envfs.enable = true;

  # VMWare
  #virtualisation.vmware.host.enable = true;

  # VirtualBox
  virtualisation.virtualbox = {
	host.enable = true;
	host.enableExtensionPack = true;
	guest.enable = true;
	guest.dragAndDrop = true;
  };
  # Add user mamat to vboxuser group
  users.extraGroups.vboxusers.members = [ "mamat" ];
  # Disable range control for IP Addresses in Virtualbox
  environment.etc."vbox/networks.conf".text = ''
    * 0.0.0.0/0 ::/0
  '';

  # GVFS
  services.gvfs.enable = true;

  # Playerctl
  services.playerctld.enable = true;

  # Thunar
  programs.thunar.enable = true;

  # OBS
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi #optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };

  # Battery Modules for Hyprpanel
  services.upower.enable = true;

  # Cloudflare Warp
  services.cloudflare-warp.enable = true;

  # Enable Python2 Support
  nixpkgs.config.permittedInsecurePackages = [
	"python-2.7.18.8"
  ];

  # Fonts
  fonts.packages = with pkgs; [
	espacionFontPkg
	pixelonFontPkg
	hyprpanelFontPkg
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	kitty
	neofetch
	waybar
	wofi
	swww
	hyprlock
	git
	google-chrome
	vscode
	htop
	bash
	pavucontrol
	lxappearance-gtk2
	starship
	unzip
	libsForQt5.ark
	cava
	networkmanagerapplet
	ffmpegthumbnailer
	psmisc
	grim
	vlc
	eog
	pywal16
	mpvScripts.mpris
	dwt1-shell-color-scripts
	lxqt.lxqt-policykit
	nautilus
	usbutils
	android-studio
	scrcpy
	brightnessctl
	imagemagick
	xfce.tumbler
	alacritty
	cmus
	filezilla
	ntfs3g
	zoom-us
	ghostty
	nwg-look
	bibata-cursors
	sweet
	kdePackages.breeze-gtk
	libsForQt5.qt5ct
	wineWowPackages.waylandFull
	python311
	jetbrains.idea-community
	font-manager
	teams-for-linux
	nmap
	hyprshot
	swaynotificationcenter
	libgcc
	linuxPackages.v4l2loopback # uncertain if still needed here..?
	v4l-utils
	mpvpaper
	wget
	gcc
	gtk3
	inetutils
	gotop
	tty-clock
	nodejs_22
	openvpn
	#libsForQt5.qt5.qtmultimedia # for SDDM theme
	#libsForQt5.qt5.qtgraphicaleffects # for SDDM theme

	#(pkgs.callPackage ./sddm-astronaut-theme.nix {
        #	theme = "hyprland_kath";
      	#})
	
	(pkgs.callPackage ./sddm/sddm-astronaut-oldtales.nix {
                theme = "ningguang_office";
        })
	hyprpanel
	ciscoPacketTracer8
	tenki
	termius
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
