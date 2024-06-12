Sure, here's the updated README that includes the explanation and warning about the `system.activationScripts.postUserActivation` script.

---

# Nix-Darwin Configuration

This repository contains the configuration files for managing macOS system settings and user environments declaratively using Nix-Darwin and Home Manager. 

## Structure

```
.
├── Makefile
├── flake.lock
├── flake.nix
└── modules
    ├── darwin
    │   ├── default.nix
    │   ├── modules
    │   │   └── customServices
    │   │       ├── borders.nix
    │   │       └── default.nix
    │   ├── services
    │   │   ├── borders.nix
    │   │   ├── default.nix
    │   │   ├── sketchybar.nix
    │   │   ├── skhd.nix
    │   │   └── yabai.nix
    │   └── settings
    │       ├── default.nix
    │       ├── environment.nix
    │       ├── nix-settings.nix
    │       └── system.nix
    └── home-manager
        ├── cliPkgs.nix
        ├── default.nix
        └── programs
            ├── fzf.nix
            ├── misc.nix
            └── starship.nix
```

### Top-Level Files

- `Makefile`: Contains commands to simplify common tasks, such as updating and building configurations.
- `flake.lock`: Lock file for the Nix flake, ensuring reproducibility.
- `flake.nix`: Main entry point for the Nix flake, defining inputs, outputs, and configuration.

### Modules

#### Darwin (System Configuration)

- `default.nix`: Main entry point for system configuration.
- `modules/customServices`: Custom services configuration.
  - `borders.nix`: Configuration for window borders.
  - `default.nix`: Default custom services configuration.
- `services`: Configuration for system services.
  - `borders.nix`: Service configuration for borders.
  - `default.nix`: Default services configuration.
  - `sketchybar.nix`: Configuration for SketchyBar.
  - `skhd.nix`: Configuration for Skhd (hotkey daemon).
  - `yabai.nix`: Configuration for Yabai (window manager).
- `settings`: System settings configuration.
  - `default.nix`: Default system settings.
  - `environment.nix`: Environment variables.
  - `nix-settings.nix`: Nix-specific settings.
  - `system.nix`: System-wide settings.

#### Home Manager (User Configuration)

- `cliPkgs.nix`: CLI packages configuration.
- `default.nix`: Main entry point for Home Manager configuration.
- `programs`: Specific program configurations.
  - `fzf.nix`: Configuration for FZF (fuzzy finder).
  - `misc.nix`: Miscellaneous program settings.
  - `starship.nix`: Configuration for the Starship prompt.

## Usage

### Prerequisites

Ensure you have Nix and Nix-Darwin installed on your macOS system.

### Setting Up

1. **Clone the Repository**:
   ```sh
   git clone <repository-url>
   cd <repository>
   ```

2. **Build and Apply Configuration**:
   ```sh
   make build
   make switch
   ```

   The `Makefile` contains targets to simplify the process:
   - `make build`: Builds the configuration.
   - `make switch`: Switches to the new configuration.
   - `make darwin-refresh`: Refreshes the Nix-Darwin configuration.

### Updating

To update the configuration or dependencies, use the following commands:
```sh
nix flake update
make build
make switch
```

## Key Features

- **System Preferences**: Configure macOS system settings such as network configurations, Dock preferences, and power settings.
- **System Services**: Enable and configure system services such as SSH, NFS, and other daemons.
- **Package Management**: Install and manage system-wide packages.
- **Hardware Configuration**: Manage hardware settings like display resolution and sound settings.
- **User Environment**: Configure user-specific settings and environment variables using Home Manager.

## Customization

Feel free to customize the configuration files to suit your needs. The modular structure allows for easy addition and modification of settings and services.

### Example Configuration

Here's an example of how to define user-specific settings in `modules/home-manager/default.nix`:
```nix
{ pkgs, username, ... }:

{
  imports = [
    ./programs/misc.nix
    ./programs/fzf.nix
    ./programs/starship.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    packages = import ./cliPkgs.nix { inherit pkgs; };
    sessionVariables = {
      PAGER = "less";
      CLICOLOR = "1";
      EDITOR = "nvim";
    };
  };

  home.stateVersion = "24.05";
}
```

## Special Note: Post-Activation Script

### Purpose

The `system.activationScripts.postUserActivation` script in `modules/darwin/default.nix` is used to apply certain system preference changes without requiring a full system restart. 

### Script Details

```nix
system.activationScripts.postUserActivation.text = ''
  # Following line should allow us to avoid a logout/login cycle
  /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  # To reflect Dock Changes (Risky)
  killall Dock
'';
```

- `/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u`: Applies system settings immediately, avoiding the need for a logout/login cycle.
- `killall Dock`: Restarts the Dock to apply any changes made to its configuration.

### Warning

**Uncomment the above activation script if you are not aware**

- Forcefully restarting the Dock can disrupt the user experience and may result in lost data if any applications are open in the Dock.
- If you are unsure about the implications of these commands, it is recommended to comment out this section by adding `#` at the beginning of each line.

## Contribution

Contributions are welcome! Feel free to open issues or pull requests to improve this configuration.

---

This README provides an overview and guide for using and customizing your Nix-Darwin and Home Manager setup. Feel free to adjust the details according to your specific setup and preferences.
