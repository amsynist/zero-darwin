{
  pkgs,
  username,
  ...
}: {
  # Import additional program configurations
  imports = [
    ./programs/misc.nix # Miscellaneous programs configuration
    ./programs/fzf.nix # FZF (fuzzy finder) configuration
    ./programs/starship.nix # Starship prompt configuration
    ./manual.nix
  ];

  home = {
    # Define the user and home directory
    username = username;
    homeDirectory = "/Users/${username}";

    # Import CLI packages
    packages = import ./cliPkgs.nix {inherit pkgs;};

    # Define session variables for the user environment
    sessionVariables = {
      PAGER = "less"; # Set the default pager to 'less'
      CLICOLOR = 1; # Enable colored output in CLI
      EDITOR = "nvim"; # Set the default editor to 'nvim' (Neovim)
    };
  };



  # State version for backward compatibility with Home Manager
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "24.05"; # Previous state version was 23.11
}
