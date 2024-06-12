{
  username,
  ...
}: {
  #         ╭──────────────────────────────────────────────────────────╮
  #         │                    --  Nix-Darwin --                     │
  #         ╰──────────────────────────────────────────────────────────╯
  # ──────────────────────────────────────────────────────────────────────
  #             Scope: System-wide Configuration for macOS
  # ──────────────────────────────────────────────────────────────────────
  # ──────────────────────────────────────────────────────────────────────
  #  Purpose:
  #  ```
  #   nix-darwin is used to manage macOS system configurations
  #   in a declarative way, similar to how NixOS manages Linux systems.
  #   It allows you to specify system-wide settings, services, and preferences.
  #
  #  ```
  # ──────────────────────────────────────────────────────────────────────
  #
  # Key Features:
  #
  #  -> System Preferences: Configure macOS system settings, such as network configurations, Dock preferences, power settings, and more.
  #  -> System Services: Enable and configure system services, such as SSH, NFS, and other daemons.
  #  -> Package Management: Install and manage system-wide packages.
  #  -> Hardware Configuration: Manage hardware settings like display resolution, sound settings, etc.
  # ──────────────────────────────────────────────────────────────────────

  imports = [
    ./modules/customServices
    ./settings
    ./services
  ];

  users.users."${username}" = {
    name = username;
    home = "/Users/${username}";
  };

  # Used for backwards compatibility, please read the changelog before changing.
  system.stateVersion = 4;

  programs.zsh.enable = true;
}
