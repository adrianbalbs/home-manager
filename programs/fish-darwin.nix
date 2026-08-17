{ ... }:
{
  # Nix will concatenate these attributes to the default fish config, since they are lists
  home.sessionPath = [ "/opt/homebrew/bin" ];

  programs.fish.interactiveShellInit = ''
    if test -x /opt/homebrew/bin/brew
      /opt/homebrew/bin/brew shellenv | source
    end
  '';
}
