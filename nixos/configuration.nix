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

  environment.systemPackages = with pkgs; [
    emacs29
    git
    htop
    tmux
    vim
    # ripgrep - rg
    ripgrep
    # ispell for flyspell in emacs
    ispell
    # gnumake, cmake, gcc, libtool - all for for emacs vterm package
    gnumake
    cmake
    gcc
    libtool
    tree
    # for org-download
    scrot
    xclip
    # 'command-not-found python' shows all possible python versions. Using 3.10 because of eglot
    python310
    # Run GitHub Actions locally
    act
    # be able to connect to postgresql db's that are running on windows
    postgresql

    # installing monospaced font so stuff aligns well in Emacs
    fira-code
    # iosevka
    # hugo - static site generator
    hugo
    # wget was needed for VSCode
    wget
  ];

  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [ fira-code ];
  };

  # Set the timezone to Lithuania (Europe/Vilnius)
  time.timeZone = "Europe/Vilnius";

  # install docker
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "nixos" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
