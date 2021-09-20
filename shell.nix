let
  pkgs = import <nixpkgs> {};
  pyPkgs = pkgs.python38Packages;
in
{
  programmeEnv = pkgs.stdenv.mkDerivation {
    name = "IIC2613-2021-2-Slides";

    buildInputs = with pkgs; [
      clingo

      python38
      pyPkgs.mypy
      pyPkgs.black
      pyPkgs.ipython
      pyPkgs.numpy
      # pyPkgs.python-language-server
      pyPkgs.prettytable
    ];
  };
}
