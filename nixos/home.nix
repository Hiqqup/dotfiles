{pkgs, ...}:
let
draculaPlugin = pkgs.fetchgit {
		url = "https://github.com/Mofiqul/dracula.nvim.git";
		rev = "ae752c13e95fb7c5f58da4b5123cb804ea7568ee";
		sha256 = "sha256-h0WQdK74FHJLva3RbyA8WZfX6rAo45wKPb9z4JbYAK8";
};
myNeovim = pkgs.neovim.override {
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

{
		home.stateVersion = "25.05";
		home.username = "ju";
		home.homeDirectory = "/home/ju";

		programs.home-manager.enable = true;
		nixpkgs.config.allowUnfree = true;
		
		home.packages = [ 
				pkgs.neovide
				myNeovim
				pkgs.neofetch
				pkgs.oath-toolkit
				pkgs.lazygit
				pkgs.jetbrains.idea-ultimate
		];
		programs.bash = {
				enable = true;
				shellAliases = {
						vim = "nvim";
				};
				initExtra = ''
						set -o vi
						bind 'set completion-ignore-case on'
						'';
				sessionVariables = {
						EDITOR = "nvim";
						VISUAL = "nvim";
				};
		};
		programs.git = {
				enable = true;
				userEmail = "71655937+Hiqqup@users.noreply.github.com"; 
				userName  = "hiqqup";# these two unfortuantely do nothing
		};

		dconf.settings = {
				"org/gnome/desktop/interface" ={
						color-scheme =  "prefer-dark";
				};
				"org/gnome/mutter" =  {
						dynamic-workspaces  = false;
				};
				"org/gnome/desktop/wm/preferences" ={ 
						num-workspaces=  6;
				};
				"org/gnome/desktop/wm/keybindings" = { 
						switch-to-workspace-1 =  ["<Alt>1"];
						switch-to-workspace-2 =  ["<Alt>2"];
						switch-to-workspace-3 =  ["<Alt>3"];
						switch-to-workspace-4 =  ["<Alt>4"];
						switch-to-workspace-5 =  ["<Alt>5"];
						switch-to-workspace-6 =  ["<Alt>6"];
						move-to-workspace-1 =  ["<Shift><Alt>1"];
						move-to-workspace-2 =  ["<Shift><Alt>2"];
						move-to-workspace-3 =  ["<Shift><Alt>3"];
						move-to-workspace-4 =  ["<Shift><Alt>4"];
						move-to-workspace-5 =  ["<Shift><Alt>5"];
						move-to-workspace-6 =  ["<Shift><Alt>6"];
						close = ["<Shift><Alt>c"];
				};

				"org/gnome/shell/app-switcher" ={current-workspace-only  = true;};
				"org/gnome/desktop/peripherals/touchpad" = { click-method =  "areas";};
				"org/gnome/shell" = {
						favorite-apps = [];
				};

		};

}

