{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  pname = "wnai";
  version = "0.0.0.9030";

  depends = with rPackages; [
    tibble
  ];
in

rPackages.buildRPackage {
  name = "${pname}-${version}";

  src = ./.;

  propagatedBuildInputs = depends;
  nativeBuildInputs = depends;

  meta = with lib; {
    description = "R package of the WNAI ethnographic dataset";
    homepage = https://github.com/mnacamura/wnai;
    license = with licenses; [ cc-by-40 ];
    maintainers = with maintainers; [ mnacamura ];
    inherit (R.meta) platforms;
  };
}
