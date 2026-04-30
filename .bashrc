alias cat='bat --paging=never'
alias pwd="echo $PWD | sed 's|^$HOME|~|'" # Replaces home directory with ~
alias vpwd="pwd | tr '/' '\n' | grep ."
