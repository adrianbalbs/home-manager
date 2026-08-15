{ ... }:
{
  # Merged with modules/fish.nix -- home.sessionPath is a list and
  # programs.fish.interactiveShellInit is `lines`, so both concatenate rather
  # than conflict.
  home.sessionPath = [ "/opt/homebrew/bin" ];

  programs.fish.interactiveShellInit = ''
    if test -x /opt/homebrew/bin/brew
      /opt/homebrew/bin/brew shellenv | source
    end
  '';
}
