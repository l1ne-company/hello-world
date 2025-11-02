{
  description = "NASM assembly development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            nasm      # NASM assembler
            gdb       # GNU debugger
            binutils  # linker and other binary tools

            # X11 libraries and tools
            xorg.libX11
            xorg.libxcb
            xorg.xorgproto  # X11 protocol headers
            xorg.xev        # X11 event viewer for debugging
            xorg.xprop      # X11 property viewer
            strace          # trace system calls
          ];
        };
      }
    );
}
