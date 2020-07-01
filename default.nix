{ pkgs ? import <nixpkgs> {} }:

with pkgs.extend (import ./overlay.nix);

rPackages.wnai
