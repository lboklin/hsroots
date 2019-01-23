{ pkgs ? import <nixpkgs> {}, ghc ? pkgs.ghc }:

pkgs.haskell.lib.buildStackProject {
  name = "simula-godot";
  inherit ghc;
  buildInputs = with pkgs; [
                          #  libinput  # <-- Possibly too recent for hsroots
                             (callPackage ./nix/libinput/default.nix { } )
                             libxkbcommon
                             pkgconfig
                             (callPackage ./nix/wayland.nix { } )
                             (callPackage ./nix/wayland-protocols.nix { } )
                             (callPackage ./nix/wlroots.nix { } )
                             libGL
                             xorg.libX11
                             xorg.pixman
                          ];

  LANG = "en_US.UTF-8";
  TMPDIR = "/tmp";
}
