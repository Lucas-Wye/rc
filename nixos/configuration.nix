# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "unixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    extraLocaleSettings = {
      LANG = "zh_CN.UTF-8";
      LC_ALL = "zh_CN.UTF-8";
    };
    inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5.addons = with pkgs; [
        rime-data
        fcitx5-gtk
        fcitx5-rime
      ];
    };
  };
  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  # i3 configuration
  environment.pathsToLink = ["/libexec"]; # Links /libexec from derivations to /run/current-system/sw

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3lock
        i3status
        i3blocks
        rofi # Tool for searching applications (dmenu alternative)
        brightnessctl # Screen brightness control
        xorg.xev # Tool to capture information about button presses
        xsel # clipboard
      ];
    };
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      defaultSession = "none+i3";
    };
  };
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # Enable sound with PulseAudio
  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true; # enable needed for polybar
  # OR
  services.pipewire = {
    enable = false;
    pulse.enable = false;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lucas = {
    isNormalUser = true;
    description = "lucas";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE4KQt2qopxcuWl6gfKRPUTdvyJm9L5dKIUj+ILcy+D8 lustrew@DESKTOP-FAR1OOU"
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    helix
    wget
    alacritty
    curl
    unzip
    tmux
    yazi
    ripgrep
    fastfetch
    xz
    aria2
    nmap
    zstd
    bottom
    iotop
    iftop
    bat
    dust
    fish
    delta

    # Multimedia Applications:
    pavucontrol # pulseaudio frontend
    vlc
    feh # image viewer to set background 
    zathura
    flameshot
    wpsoffice

    # Development Tools:
    gcc
    gdb
    clang
    clang-tools
    gnumake
    cmake

    cargo
    rustc
    rustfmt
    rust-analyzer

    python3
    python3Packages.uv
    python3Packages.pip
    python3Packages.black
    python3Packages.numpy
    python3Packages.scipy
    python3Packages.jupyter
    python3Packages.ipython
    python3Packages.jupyterlab
    python3Packages.matplotlib
    python3Packages.python-lsp-server

    typst
    tinymist
    doxygen
    graphviz
    # texlive.combined.scheme-full
    # texlab

    # Version Control
    git
    gitui

    # message
    # telegram-desktop

    # proxy
    clash-verge-rev

    # package
    flatpak
  ];
  fonts = {
    packages = with pkgs; [
      nerdfonts
      fira-code-nerdfont
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
    ];
    fontconfig = {
      antialias = true;
      hinting.enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "FiraCode Nerd Font" ];
        sansSerif = [ "Noto Sans CJK SC" ];
        serif = [ "Noto Serif CJK SC" ];
      };
    };
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true; 
    settings = {
      X11Forwarding = false;
      PermitRootLogin = "no"; # disable root login
      PasswordAuthentication = false; # disable password login
    };
    openFirewall = true;
  };

  nix.settings.substituters = [
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
  ];
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}
