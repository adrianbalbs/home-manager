{ pkgs, ... }:

{
  imports = [
    ../programs/tmux.nix
    ../programs/nvim.nix
    ../programs/git.nix
    ../programs/fish.nix
  ];

  # home.username and home.homeDirectory are set per-platform -- the account
  # name differs between machines.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    nixd
  ];

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
