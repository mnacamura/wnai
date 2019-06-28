with import <nixpkgs> {};

mkShell {
  inputsFrom = [ (callPackage ./. {}) ];

  buildInputs = with rPackages; [
    devtools
    dplyr
    forcats
    lintr
    magrittr
    purrr
    readr
    roxygen2
    stringr
    testthat
    usethis
  ];

  DPLACE_REV = "v2.0.1";

  shellHook = ''
    export MANPATH="${R}/share/man''${MANPATH:+:}$MANPATH"
  '';
}
