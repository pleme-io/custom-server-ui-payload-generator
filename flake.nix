{
  description = "Web tool for generating custom UI rotation payloads for Akeyless Secrets Management";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.default = pkgs.buildNpmPackage {
        pname = "custom-server-ui-payload-generator";
        version = "0.0.0-dev";
        src = self;
        npmDepsHash = "sha256-Z1eXZW9Fyv2xKFhpV8f+FgdIpqYMLvVBrC+CCtZRBv0="; # TODO: set correct hash
        dontNpmBuild = false;
        npmBuildScript = "build";
        meta = {
          description = "Web tool for generating custom UI rotation payloads for Akeyless Secrets Management";
          homepage = "https://github.com/pleme-io/custom-server-ui-payload-generator";
          license = pkgs.lib.licenses.mit;
        };
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ nodejs_22 ];
      };
    });
}
