# README

This is my collection of dotfiles, primarily bash scripts/aliases and emacs
configuration. There is also a script, link.sh, for setting up symlinks on a new
machine. I did this mainly for myself but also in the hopes that some people
might find some of my bash scripts useful. Eventually I might also start doing
useful things with emacs too but right now I'm just grabbing snippets off the
internet that I find useful.

## .bashrc

This started out with a stock Ubuntu .bashrc, but eventually I modularized it by
splitting it into a directory .bashrc.d and executing the contents of the files
in this directory. I highly recommend this kind of organization, otherwise it
becomes unreadable pretty fast (bash is a convenient language because it's there
but I would not mistake it for a good language).

## .bashrc.d

I'll just point out some things that others might find useful here.

### aliases.sh

I wrote a make() function which thus far I've been using as a drop-in
replacement for make. It calls make with the arguments you pass it and checks
the return code of make, and depending on success or failure plays an
appropriate sound. It also automatically calls make with -jN where N is the
number of CPUs your computer appears to have.

### autojump.sh

Nothing interesting here other than the fact that I use [autojump](https://github.com/joelthelion/autojump). It's a convenient
way to jump around to commonly used directories.

### awesomewm.sh

Just a stupid hack to make Java programs play nice with Awesome.

### easynav.sh

Some convenient functions for navigating around deeply nested directory
hierarchies.

### pager.sh

Sets up less to pipe things through source-highlight, which means that less
will have syntax highlighting, which is pretty awesome.

### prompt.sh

My prompt looks like

user@host:`pwd` `current time`

$

The username is green, hostname is colored randomly based on the hostname, the
directory is blue, and the time is underlined cyan. I use a 2 line prompt
because it seems like a no-brainer; otherwise your prompt starts at a random
place in the line which is visually confusing.

Having the time in the prompt is convenient if you ever realize you wanted to
time a command after the fact. You should use `time(1)` otherwise but in a pinch
it's very handy to be able to get an approximate time.
