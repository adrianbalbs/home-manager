{ ... }:

{
  imports = [
    ./common.nix
    ../modules/fish-darwin.nix
  ];

  home.username = "adrian";
  home.homeDirectory = "/Users/adrian";

  # See the note in ./linux.nix -- this is per-machine and should not be
  # hoisted into common.nix.
  home.stateVersion = "26.05";
}
