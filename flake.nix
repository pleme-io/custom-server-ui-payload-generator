{
  description = "Web tool for generating custom UI rotation payloads for Akeyless Secrets Management";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = { url = "github:pleme-io/substrate"; inputs.nixpkgs.follows = "nixpkgs"; };
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "npm";
    builder = "package";
    pname = "custom-server-ui-payload-generator";
    npmDepsHash = "sha256-Z1eXZW9Fyv2xKFhpV8f+FgdIpqYMLvVBrC+CCtZRBv0=";
    dontNpmBuild = false;
    npmBuildScript = "build";
    description = "Web tool for generating custom UI rotation payloads for Akeyless Secrets Management";
  };
}
