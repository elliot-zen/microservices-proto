{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    allSystems = [
      "x86_64-linux" # 64-bit Intel/AMD Linux
      "aarch64-linux" # 64-bit ARM Linux
      "x86_64-darwin" # 64-bit Intel macOS
      "aarch64-darwin" # 64-bit ARM macOS
    ];

    forAllSystems = f:
      nixpkgs.lib.genAttrs allSystems (system:
        f {
          pkgs = import nixpkgs {inherit system;};
        });
  in {
    devShells = forAllSystems ({pkgs, ...}: {
      default = pkgs.mkShell rec {
        name = "Go";
        packages = with pkgs; [
          go_1_22
          protobuf
          protoc-gen-go
          protoc-gen-go-grpc
        ];
        # GOPATH = "~/go";
        # shellHook = ''
        #   export PATH=$PATH:${GOPATH}/bin;
        # '';
      };
    });
  };
}
