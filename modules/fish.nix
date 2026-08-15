{ config, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
  };

  # ls -> eza --git, plus ll/la/lt/lla
  programs.eza = {
    enable = true;
    git = true;
  };

  programs.fzf.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.starship.enable = true;
  programs.mise.enable = true;

  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.local/share/pnpm/bin"
  ];

  home.sessionVariables.PNPM_HOME = "${config.home.homeDirectory}/.local/share/pnpm";
}
