self: super:

{
  rPackages = super.rPackages // {
    wnai = self.callPackage ./pkg.nix {};
  };
}
