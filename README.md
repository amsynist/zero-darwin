 <h2>Voila! <img src="https://media.giphy.com/media/hvRJCLFzcasrR4ia7z/giphy.gif" width="25px">   </h2>
 
<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="750" /> 
 
[![Typing SVG](https://readme-typing-svg.demolab.com?font=Zen+Dots&size=20&pause=1000&center=false&vCenter=true&random=true&width=835&height=30&lines=❄️+%5Bzero-darwin%5D+My+Personal+Nixified+Dotfiles+~%2F.+%F0%9F%93%82)](https://git.io/typing-svg)

<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="750" />

# Nix-Darwin & Home Manager: Your macOS dotfiles, perfected.

## Structure

```
├── Makefile
├── README.md
├── configs
│   └── sketchybar
│       ├── plugins
│       └── sketchybarrc
├── flake.lock
├── flake.nix
└── modules
    ├── darwin
    │   ├── default.nix
    │   ├── modules
    │   │   └── customServices
    │   ├── services
    │   └── settings
    └── home-manager
        ├── cliPkgs.nix
        ├── default.nix
        ├── manual.nix
        └── programs
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
- `manual.nix`: Post-activation and manual scripting, such as file moving and symlink creation.
- `programs`: Specific program configurations.
  - `fzf.nix`: Configuration for FZF (fuzzy finder).
  - `misc.nix`: Miscellaneous program settings.
  - `starship.nix`: Configuration for the Starship prompt.

### Configs

- `sketchybar`: Contains the configuration files and plugins for SketchyBar.
  - `plugins`: Contains various shell scripts used by SketchyBar.
  - `sketchybarrc`: Main configuration file for SketchyBar.

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

## Post-Activation and Manual Scripting

The `manual.nix` file contains scripts and configurations for handling post-activation tasks and manual operations, such as file moving and symlink creation for services like SketchyBar.

### Script Details

- **Home Manager Activation**:
  ```nix
  { lib, pkgs, ... }:
  {
    home.activation.sketchybar = lib.hm.dag.entryAfter ["writeBoundary"] ("${pkgs.sketchybar}/bin/sketchybar --reload");

    home.file = {
      ".config/sketchybar".source = ../../configs/sketchybar;
    };
  }
  ```

- **Post-Activation Script in Darwin Configuration**:
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

**Comment the above activation script if you are not aware**

- Forcefully restarting the Dock can disrupt the user experience and may result in lost data if any applications are open in the Dock.
- If you are unsure about the implications of these commands, it is recommended to comment out this section by adding `#` at the beginning of each line.

## Customization

Feel free to customize the configuration files to suit your needs. The modular structure allows for easy addition and modification of settings and services.

## Contribution

Contributions are welcome! Feel free to open issues or pull requests to improve this configuration.

---

This README provides an overview and guide for using and customizing your Nix-Darwin and Home Manager setup. Feel free to adjust the details according to your specific setup and preferences.
