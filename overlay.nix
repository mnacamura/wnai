self: super:

{
  rPackages = super.rPackages // {
    wnai = self.callPackage ./. { pkgs = self; };
  };
}
