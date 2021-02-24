{

  description = "A BDD testing framework for shell languages";

  inputs.nixpkgs    .url = "github:NixOS/nixpkgs/nixos-20.09";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; }; in
      rec {
        # TODO submit this to nixpkgs
        packages.shellspec = pkgs.stdenv.mkDerivation {
          pname = "shellspec";
          version = "0.28.1";
          src = builtins.fetchTarball {
            url = "https://github.com/shellspec/shellspec/archive/0.28.1.tar.gz";
            sha256 = "sha256:1ib5qp29f2fmivwnv6hq35qhvdxz42xgjlkvy0i3qn758riyqf46";
          };
          buildInputs = [ ];
          buildPhase = "echo NOTHING TO BUILD";
          installPhase = ''
            mkdir -p $out
            make install PREFIX=$out
          '';
        };

        defaultPackage = packages.shellspec;
      });
}
