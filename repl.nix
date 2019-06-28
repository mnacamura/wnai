with import <nixpkgs> {};

mkShell {
  buildInputs = [ R (callPackage ./. {}) ] ++ (with rPackages; [
    tibble
  ]);

  shellHook = ''
    R -q --no-save
  '';
}
