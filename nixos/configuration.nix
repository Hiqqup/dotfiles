# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
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
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
	(import "${home-manager}/nixos")
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "us";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ju = {
    isNormalUser = true;
    description = "ju";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  home-manager.backupFileExtension = "backup";
  home-manager.users.ju = { pkgs, ... }: {
    home.packages = [ 
      pkgs.neovide
      myNeovim
      pkgs.neofetch
      pkgs.oath-toolkit
      pkgs.lazygit
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

    };

    home.stateVersion = "25.05";
  };
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
     wl-clipboard
     libinput
     git
     unzip
     neovim
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment05
}
