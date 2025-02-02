{ pkgs ? import <nixpkgs> {} }:

let
  easy-ps = import (import ./deps/easy-purescript-nix) {};
  # easy-ps = import (pkgs.fetchFromGitHub {
  #   owner = "justinwoo";
  #   repo = "easy-purescript-nix";
  #   rev = "80e6c66c7b5cffefeb823ebebf156d2d7acd3285";
  #   sha256 = "0npvnr3h4vnq6ibwi9gvxgijyjnwmmyvqglq471wkkn6b4ygry9v";
  # });

in pkgs.stdenv.mkDerivation {
  name = "purescript-hedwig";

  buildInputs = with easy-ps; [
    # the purescript compiler
    purs
    # the "spago" purescript build tool
    spago
    # if you do not have node in your system environment
    # pkgs.nodejs-10_x
    pkgs.nodejs

    pkgs.shab # simple templating
  ];
}
