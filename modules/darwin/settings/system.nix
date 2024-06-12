{...}: {
  system = {
    keyboard.enableKeyMapping = true;
    keyboard.remapCapsLockToEscape = true;

    defaults = {
      finder = {
        FXEnableExtensionChangeWarning = false;
        # When performing a search, search the current folder by default
        FXDefaultSearchScope = "SCcf";
        QuitMenuItem = true;
        CreateDesktop = false;
      };

      NSGlobalDomain = {
        # Dark mode
        AppleInterfaceStyle = "Dark";

        # Show all file extensions
        AppleShowAllExtensions = true;

        # Automatically hide and show the menu bar
        _HIHideMenuBar = true;
        AppleFontSmoothing = 2;
      };

      dock = {
        # Automatically hide and show the Dock
        autohide = true;

        # Style options
        orientation = "right";
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
