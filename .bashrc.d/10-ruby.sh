if [ -d ~/.rvm ]; then
    source ~/.rvm/scripts/rvm
fi

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"

export RUBY_FFI_NCURSES_LIB=/lib/x86_64-linux-gnu/libncursesw.so.5
