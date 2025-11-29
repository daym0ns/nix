#!/usr/bin/env bash
PAQ_DIR="$HOME/.local/share/nvim/site/pack/paqs/start/paq-nvim"

if [ ! -d "$PAQ_DIR" ]; then
  git clone --depth=1 https://github.com/savq/paq-nvim.git "$PAQ_DIR"
fi

