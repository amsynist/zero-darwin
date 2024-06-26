{config,lib,pkgs,...}:{

home.activation.sketchybar = lib.hm.dag.entryAfter ["writeBoundary"] ("${pkgs.sketchybar}/bin/sketchybar --reload");

 home.file = {
    ".config/sketchybar".source = ../../configs/sketchybar;
  };
   home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink (toString /Users/zero/.dotfiles/zero-darwin/configs/nvim );
}
