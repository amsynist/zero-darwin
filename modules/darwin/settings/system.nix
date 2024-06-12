{...}: {
  system = {
    keyboard.enableKeyMapping = true;
    keyboard.remapCapsLockToEscape = true;

    defaults = {
      NSGlobalDomain = {
        # Dark mode
        AppleInterfaceStyle = "Dark";

        # Show all file extensions
        AppleShowAllExtensions = true;

        # Automatically hide and show the menu bar
        _HIHideMenuBar = true;
      };

      dock = {
        # Automatically hide and show the Dock
        autohide = true;

        # Style options
        orientation = "bottom";
        show-recents = false;
      };

      finder = {
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
      };
    };
  };
  security.pam.enableSudoTouchIdAuth = true;
}
