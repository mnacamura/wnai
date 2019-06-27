with import <nixpkgs> {};

mkShell {
  inputsFrom = [ (callPackage ./. {}) ];
  buildInputs = (with rPackages; [
    dplyr
    magrittr
    readr

    devtools
    lintr
    roxygen2
    testthat
    usethis
  ]) ++ [
    xsv
  ];

  DPLACE_REV = "d8126e7fc0d821dd9bd25c5b2798ed736a854c49";

  shellHook = ''
    export MANPATH="${R}/share/man''${MANPATH:+:}$MANPATH"
  '';
}
