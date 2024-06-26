{inputs, ...}: {
  imports = [
    ./autocmd.nix
    ./completion.nix
    ./keymappings.nix
    ./options.nix
    ./plugins
  ];


  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
