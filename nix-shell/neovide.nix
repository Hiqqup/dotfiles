let pinnedPkgs = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/3e3f3c7f9977dc123c23ee21e8085ed63daf8c37.tar.gz";
        }) {};

neovideAppImage = pinnedPkgs.stdenv.mkDerivation {
    pname = "neovide-appimage";
    version = "0.15.2";

    src = pinnedPkgs.fetchurl {
        url = "https://github.com/neovide/neovide/releases/download/0.15.2/neovide.AppImage";
        sha256 = "3c1d694e2529e899157cf0fd5e01fcd0fb12f56e8f8f9336e4337c1abc7875c3";
    };
    unpackPhase = "true";
    installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/neovide
        chmod +x $out/bin/neovide
        '';
    dontStrip = true;
    dontPatchELF = true;
};

draculaPlugin = pinnedPkgs.fetchgit {
    url = "https://github.com/Mofiqul/dracula.nvim.git";
    rev = "ae752c13e95fb7c5f58da4b5123cb804ea7568ee";
    sha256 = "sha256-h0WQdK74FHJLva3RbyA8WZfX6rAo45wKPb9z4JbYAK8";
};

myNeovim = pinnedPkgs.neovim.override {
  configure = {
    packages.nix.start = [
      { plugin = draculaPlugin; }

    ];
    customRC = ''
    lua << EOF
      local user_init = vim.fn.stdpath("config") .. "/init.lua"
      if vim.fn.filereadable(user_init) == 1 then
        dofile(user_init)
      end
      vim.g.neovide_cursor_animation_length = 0
      vim.g.neovide_cursor_trail_size = 0
      vim.g.neovide_scale_factor = 0.8
      vim.cmd.colorscheme("dracula")
    EOF
    '';
  };
};

in

    
pinnedPkgs.mkShell {
    buildInputs = [
        neovideAppImage
        myNeovim
	pinnedPkgs.llvmPackages_18.clang-tools
	pinnedPkgs.ripgrep
    ];
}


