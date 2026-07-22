if ! (( $+commands[zellij] )); then
  print "zsh zellij plugin: zellij not found. Please install zellij before using this plugin." >&2
  return 1
fi
