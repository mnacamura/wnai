with import <nixpkgs> {};

mkShell {
  inputsFrom = [ (callPackage ./. {}) ];

  buildInputs = with rPackages; [
    devtools
    dplyr
    lintr
    magrittr
    readr
    roxygen2
    testthat
    usethis
  ];

  DPLACE_REV = "v2.0.1";

  shellHook = ''
    export MANPATH="${R}/share/man''${MANPATH:+:}$MANPATH"
  '';
}
