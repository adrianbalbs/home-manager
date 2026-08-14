{ ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    extraConfig = ''
      set -ag terminal-overrides ",xterm-256color:RGB"

      set -g renumber-windows on
      set -g status-position top
      set -g status-justify absolute-centre
      set -g status-style "bg=default"
      set -g window-status-current-style "fg=blue bold"

      set -g status-left-length 30
      set -g status-interval 5
      set -g status-right '#{?client_prefix, _ ,}#(timew | awk "/^ *Total/ {print \$NF}") #[bg=green,fg=black,bold]#(timew | awk "/^ *Tracking/ {print \" \" \$NF \" \"}")#[bg=default]'

      bind b set -g status
    '';
  };
}
