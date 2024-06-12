{pkgs, ...}: {
  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = ''


      # Yabai and skhd Configuration

      # Navigation between focused space windows
      alt - down : yabai -m window --focus south  # Focus window to the south
      alt - up : yabai -m window --focus north    # Focus window to the north
      alt - left : yabai -m window --focus west   # Focus window to the west
      alt - right : yabai -m window --focus east  # Focus window to the east
      alt - j : yabai -m window --focus south     # Alternative keybinding for south
      alt - k : yabai -m window --focus north     # Alternative keybinding for north
      alt - h : yabai -m window --focus west      # Alternative keybinding for west
      alt - l : yabai -m window --focus east      # Alternative keybinding for east

      # Focus display
      alt - s : yabai -m display --focus west     # Focus display to the west

      # Launch applications
      alt - a : open -a "/Applications/Arc.app"                # Open Arc browser
      alt - t : open "/Applications/WezTerm.app"               # Open WezTerm terminal
      alt - c : open "/Applications/Visual Studio Code.app"    # Open Visual Studio Code
      alt - g : open "/Applications/GoLand.app"                # Open GoLand IDE

      # Rotate layout and mirror space
      shift + alt - r : yabai -m space --rotate 270            # Rotate layout clockwise
      shift + alt - y : yabai -m space --mirror y-axis         # Mirror along y-axis
      shift + alt - x : yabai -m space --mirror x-axis         # Mirror along x-axis

      # Toggle window float and sticky terminal
      shift + alt - t : yabai -m window --toggle float --grid 4:4:1:1:2:2  # Toggle float with grid
      alt - p : yabai -m window --toggle sticky --grid 20:20:15:12:10:10   # Toggle sticky terminal

      # Modify window size
      shift + alt - m : yabai -m window --toggle zoom-fullscreen  # Maximize window
      shift + alt - e : yabai -m space --balance                 # Balance tree of windows

      # Move windows around
      shift + alt - j : yabai -m window --swap south  # Swap with window to the south
      shift + alt - k : yabai -m window --swap north  # Swap with window to the north
      shift + alt - h : yabai -m window --swap west   # Swap with window to the west
      shift + alt - l : yabai -m window --swap east   # Swap with window to the east

      # Warp window to a direction
      ctrl + alt - j : yabai -m window --warp south   # Warp window south
      ctrl + alt - k : yabai -m window --warp north   # Warp window north
      ctrl + alt - h : yabai -m window --warp west    # Warp window west
      ctrl + alt - l : yabai -m window --warp east    # Warp window east

      # Move window to a display and focus
      shift + alt - s : yabai -m window --display west; yabai -m display --focus west;  # Move window to display west
      shift + alt - g : yabai -m window --display east; yabai -m display --focus east;  # Move window to display east

      # Move window to previous/next space
      shift + alt - p : yabai -m window --space prev   # Move window to previous space
      shift + alt - n : yabai -m window --space next   # Move window to next space

      # Move window to specific space
      cmd - 1 : yabai -m window --space 1; yabai -m space --focus 1;  # Move to space 1 and focus
      cmd - 2 : yabai -m window --space 2; yabai -m space --focus 2;  # Move to space 2 and focus
      cmd - 3 : yabai -m window --space 3; yabai -m space --focus 3;  # Move to space 3 and focus
      cmd - 4 : yabai -m window --space 4; yabai -m space --focus 4;  # Move to space 4 and focus
      cmd - 5 : yabai -m window --space 5; yabai -m space --focus 5;  # Move to space 5 and focus
      cmd - 6 : yabai -m window --space 6; yabai -m space --focus 6;  # Move to space 6 and focus
      cmd - 7 : yabai -m window --space 7; yabai -m space --focus 7;  # Move to space 7 and focus

      # Focus on specific space
      lctrl - 1 : yabai -m space --focus 1;  # Focus space 1
      lctrl - 2 : yabai -m space --focus 2;  # Focus space 2
      lctrl - 3 : yabai -m space --focus 3;  # Focus space 3
      lctrl - 4 : yabai -m space --focus 4;  # Focus space 4
      lctrl - 5 : yabai -m space --focus 5;  # Focus space 5
      lctrl - 6 : yabai -m space --focus 6;  # Focus space 6
      lctrl - 7 : yabai -m space --focus 7;  # Focus space 7

      # Resize windows
      ctrl + shift - left : yabai -m window --resize left:-50:0; yabai -m window --resize right:-50:0  # Resize left
      ctrl + shift - down : yabai -m window --resize bottom:0:50; yabai -m window --resize top:0:50    # Resize down
      ctrl + shift - up : yabai -m window --resize top:0:-50; yabai -m window --resize bottom:0:-50    # Resize up
      ctrl + shift - right : yabai -m window --resize right:50:0; yabai -m window --resize left:50:0   # Resize right


    '';
  };
}
