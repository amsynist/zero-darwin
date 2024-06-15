{username, ...}: {
  # Common Nix settings
  nix.settings = {
    build-max-jobs = 10; # Number of build jobs to run in parallel
    extra-sandbox-paths = ["/tmp"]; # Extra paths to bind-mount in the sandbox
    max-jobs = 10; # Maximum number of jobs to run in parallel
    keep-build-log = true; # Keep logs of builds
    trusted-users = [username]; # Users that have additional permissions
  };

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.configureBuildUsers = true;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    http-connections = 128
    max-substitution-jobs = 128
  '';
  services.nix-daemon.enable = true;

  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;

}
