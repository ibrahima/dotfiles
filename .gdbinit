# Taken from http://chainlynx.blogspot.com/2009/05/gdbinit-file.html
# color prompt
set prompt \001\033[1;36m\002(gdb) \001\033[0m\002

# history across invocations
set history save on
set history filename ~/.gdb_history
