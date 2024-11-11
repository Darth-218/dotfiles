let tmux = tmux info
if tmux != "" {
  try {
    if $env.TMUX != "" {
      print "in tmux..."
      return
    }
  }
  tmux attach;
} else {
  tmux;
}
