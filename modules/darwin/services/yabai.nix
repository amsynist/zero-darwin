{pkgs, ...}: {
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;

    config = {
      layout = "bsp";
      window_placement = "second_child";

      # padding set to 6px
      top_padding = 16;
      bottom_padding = 16;
      left_padding = 16;
      right_padding = 16;
      window_gap = 12;

      focus_follows_mouse = "autofocus";
      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouser_action2 = "resize";
      mouse_drop_action = "swap";

      window_topmost = "off";
      window_opacity = "on";
      window_shadow = "on";
      split_ratio = 0.5;
      window_animation_duration = 0.15;
      window_opacity_duration = 0.25;
      normal_window_opacity = 0.98;
      active_window_opacity = 1.0;

      auto_balance = "off";

      external_bar = "all:45:0";
    };
    extraConfig = ''
      # Notify sketchybar when space changes
      yabai -m signal --add event=window_focused action="sketchybar --trigger window_focus"
      yabai -m signal --add event=window_title_changed action="sketchybar --trigger title_change"
      

      # Rules for specific apps
      yabai -m rule --add app="^System Settings$" manage=off
      yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
      yabai -m rule --add label="Safari" app="^Safari$" title="^(General|(Tab|Password|Website|Extension)s|AutoFill|Se(arch|curity)|Privacy|Advance)$" manage=off
      yabai -m rule --add label="System Preferences" app="^System Preferences$" title=".*" manage=off
      yabai -m rule --add label="App Store" app="^App Store$" manage=off
      yabai -m rule --add label="Activity Monitor" app="^Activity Monitor$" manage=off
      yabai -m rule --add label="KeePassXC" app="^KeePassXC$" manage=off
      yabai -m rule --add label="Calculator" app="^Calculator$" manage=off
      yabai -m rule --add label="Dictionary" app="^Dictionary$" manage=off
      yabai -m rule --add label="mpv" app="^mpv$" manage=off
      yabai -m rule --add label="Software Update" title="Software Update" manage=off
      yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off
    '';
  };
}
