{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      format = ''
        [ 󰊠  ](bold italic #FFA500) [](bg:#769ff0 fg:#769ff0)$directory [](bold italic skyblue)$git_branch$python$golang$nodejs
        
        [  λ](bold #00FFFF)$character
      '';

      git_branch = {
        only_attached = true;
        format = "on ⌠ [$symbol  $branch(:$remote_branch) ]($style)⌡";
        symbol = "שׂ";
        style = "bright-yellow bold";
      };

      character = {
        success_symbol = "[ ➜ ](bold #00FFFF)";
        error_symbol = "[ ➜ ](bright-red bold)";
      };

      cmd_duration = {
        format = "󰪢 [$duration]($style) ";
        style = "bold italic blue";
      };

      directory = {
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
          "Desktop" = " ";
          "~" = " ";
          "nvim" = "";
          ".config" = "󰴳 ";
        };
        read_only = " ";
        format = "[ ](#2687A2)[ $path]($style)[$lock_symbol]($lock_style )[ ](bold #2687A2) ";
        truncation_length = 10;
        truncate_to_repo = true;
        style = "italic fg:#e3e5e5 bg:#2687A2";
      };

      golang = {
        symbol = "󰟓 ";
        format = "via [$symbol($version)]($style)";
      };

      python = {
        symbol = "󱔎 ";
        format = "via [$symbol($version) ⥋ (\($virtualenv\))]($style)";
        style = "bold #00C5FF";
        pyenv_prefix = "venv ";
        python_binary = ["./venv/bin/python" "python" "python3" "python2"];
        detect_extensions = ["py"];
        version_format = "v$major.$minor";
      };

      aws = {
        format = "\[[$symbol($profile)(\($region\))(\[$duration\])]($style)\]";
        symbol = "󰅟 ";
        style = "yellow";
      };
    };
  };
}
