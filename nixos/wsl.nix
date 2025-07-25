# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    extraLocaleSettings = {
      LANG = "zh_CN.UTF-8";
      LC_ALL = "zh_CN.UTF-8";
    };
  };

  environment.systemPackages = with pkgs; [
    helix 
    wget 
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
  ];
  nixpkgs.config.allowUnfree = true;
}

