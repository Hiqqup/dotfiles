let
localPath = "/nix/store/k3h9ghq4hbs59rynsqpj018fz6f1yzkq-source/";
pinnedPkgs =
	if builtins.pathExists localPath then
		import localPath {}
	else
		import (builtins.fetchTarball {
			url = "https://github.com/NixOS/nixpkgs/archive/3e3f3c7f9977dc123c23ee21e8085ed63daf8c37.tar.gz";
			sha256 = "0jnmv6gpzhqb0jyhj7qi7vjfwbn4cqs5blm5xia7q5i0ma2bbkcd";
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
      --- source preexisting conf ------------------------------------
      local user_init = vim.fn.stdpath("config") .. "/init.lua"
      if vim.fn.filereadable(user_init) == 1 then
        dofile(user_init)
      end

      --- visual adjustments  ----------------------------------------
      vim.g.neovide_cursor_animation_length = 0
      vim.g.neovide_cursor_trail_size = 0
      vim.g.neovide_scale_factor = 1.11
      vim.cmd.colorscheme("dracula")

      --- change font size  ------------------------------------------
      vim.keymap.set('n', '<C-=>', function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
      end)
      vim.keymap.set('n', '<C-->', function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
      end)
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

  shellHook = ''
    export TERM=xterm-256color
    export WINIT_X11_SCALE_FACTOR=1.0
  '';
}


