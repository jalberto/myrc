BYOBU_DARK="\#333333"
BYOBU_LIGHT="\#EEEEEE"
BYOBU_ACCENT="\#75507B"
BYOBU_HIGHLIGHT="\#646466"

# status
set -g status-bg "#3e3e40"

# messages
set -g message-fg "#d4d4d9"
set -g message-bg "#3e3e40"
set -g message-command-fg "#a89984"
set -g message-command-bg "#646466"

# panes
set -g pane-active-border-fg "#646466"
set -g pane-border-fg "#646466"

# active / inactive pane bg
# set -g window-style "bg=#141420"
# set -g window-active-style "bg=#0b0b1a"

# window status
setw -g window-status-fg "#d4d4d9"
setw -g window-status-attr "none"
setw -g window-status-activity-bg "#3e3e40"
setw -g window-status-activity-attr "none"
setw -g window-status-activity-fg "colour208"
setw -g window-status-separator ""
setw -g window-status-bg "#3e3e40"
setw -g window-status-format "#[fg=#afafb2,bg=#3e3e40] #I:#W "
setw -g window-status-current-format "#[fg=black,bg=magenta] #I:#{?window_zoomed_flag,#[fg=black](,}#W#{?window_zoomed_flag,#[fg=black]),} "

set -g status-left-attr "none"
set -g status-left-length "100"
set -g status-right-attr "none"
set -g status-right-length "100"
set -g status-left "#[fg=#3e3e40,bg=white] #S "
set -g status-right "#[fg=yellow,bg=#3e3e40]$USER@#h #[fg=white,bg=#3e3e40]│ #[fg=white,bg=#3e3e40]%d/%m/%Y %H:%M "
