{

  description = "A simple example of managing a project with a flake";

  inputs.nixpkgs    .url = "github:NixOS/nixpkgs/nixos-20.09";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; }; in
      rec {
        packages.aaa-and-bbb = pkgs.stdenv.mkDerivation {
          name = "flake-learning-curve";
          src = self;

          buildInputs = [
            pkgs.mdbook
          ];

          buildPhase = ''
            $CC -o aaa src/aaa.c
            $CC -o bbb src/bbb.c
          '';

          installPhase = ''
            mkdir -p $out/bin
            install -t $out/bin aaa bbb
          '';

        };

        defaultPackage = packages.aaa-and-bbb;

      });
}
