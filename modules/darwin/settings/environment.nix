{pkgs, ...}: {
  environment = {
    shells = with pkgs; [bash zsh];
    loginShell = pkgs.zsh;
    systemPackages = [pkgs.coreutils pkgs.neovim pkgs.eza pkgs.bat  pkgs.zoxide pkgs.yazi pkgs.atuin] ;
    systemPath = ["/usr/local/bin"];
    pathsToLink = ["/Applications" "/share/zsh"];
  };
}
