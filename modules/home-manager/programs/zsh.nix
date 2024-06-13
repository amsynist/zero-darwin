{
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion = {
      enable = true;
    };
    history = {
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      save = 1000000;
      size = 1000000;
    };

    shellAliases = {
      src = "source ~/.zshrc";
      v = "nvim";
      home = "cd ~";
      n = "nnn";
      lss = "yazi";
      matrix = "unimatrix -c blue -u 'Linux'";
      config = "v ~/.zshrc";
      ls = "eza --color=always --icons --group-directories-first"; # my preferred listing
      la = "eza -a --color=always --icons --group-directories-first"; # all files and dirs
      ll = "eza -l --color=always --icons --group-directories-first"; # long format
      rm = "rm_confirm";
      apper = "sh ~/ZERO/SCRIPTS/apper.sh";
      git = "git_custom";
      dots = "chezmoi";
      vida = "cd $HOME/VIDA/";
      work = "cd $HOME/WORK/";
      zero = "cd $HOME/ZERO/";
      cd = "z";
      net = "gping www.google.com -c '#88C0D0,#B48EAD,#81A1C1,#8FBCBB'";
      tree = "tre";
      gb = "sh ~/ZERO/SCRIPTS/git_branch.sh";
      gc = "git commit";
      fzf = "fzf --color=16 --border=rounded --margin=1,3 --preview='bat {}'";
      zf = "nvim $(fzf --color=16 --border=rounded --margin=1,3 --preview='bat {}')";
      "." = "cd ..";
      ".." = "cd ../..";
      "..." = "cd ../../..";
    };

    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      # theme = "spaceship";
      plugins = [
        "aws"
        "git"
        "docker"
        "asdf"
        "terraform"
        "history"
        "history-substring-search"
      ];
    };

    initExtra = ''
      function nnn () {
          command nnn "$@"

          if [ -f "$NNN_TMPFILE" ]; then
                  . "$NNN_TMPFILE"
          fi
      }

      function ya() {
      	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
      	yazi "$@" --cwd-file="$tmp"
      	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      		cd -- "$cwd"
      	fi
      	rm -f -- "$tmp"
      }

      # Api call helper
      function api() {

        if [ "$1" = "get" ]; then
          curl -s "$2" | jless
        elif [ "$1" = "post" ]; then
          curl -s -X POST -d '{}' "$2" | jless
        else
          echo "Invalid operation. Use 'get' or 'post'."
        fi
      }

      rm_confirm() {
          local confirm

              # If not, proceed with the standard confirmation
              echo -n "Are you sure you wanna run 'rm -rf'? (yes/no): "
              read confirm
              if [ "$confirm" = "yes" ]; then
                  command rm  "$@"
              else
                  echo "Operation canceled."
              fi

      }

      # Override git commit with a custom function
      git_custom() {
        if [[ $1 == "commit" ]]; then
          sh ~/ZERO/SCRIPTS/git_commit.sh
        elif [[ $1 == "user" ]]; then  # Corrected the syntax here
          sh ~/ZERO/SCRIPTS/git_user.sh
        elif [[ $1 == "push" ]]; then
          sh ~/ZERO/SCRIPTS/git_user.sh
              # Call the original git command for other cases
          command git "$@"

        else
          # Call the original git command for other cases
          command git "$@"
        fi
      }



    '';
  };
}
