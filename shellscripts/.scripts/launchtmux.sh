#!/bin/bash

if tmux info &> /dev/null; then 
  if ! [ -n "$TMUX" ]; then
    tmux attach;
    echo "attaching to tmux...";
  else
    echo "in tmux..."
  fi
else
  tmux;
  echo "starting tmux..."
fi
