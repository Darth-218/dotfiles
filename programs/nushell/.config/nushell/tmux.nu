  try {
    if $env.TMUX != "" {
      print "in tmux..."
      return
    }
  }
  try {
    tmux attach;
    return
  }
tmux;
