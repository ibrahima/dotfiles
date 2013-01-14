export GOPATH=$HOME/mygo
export PATH=$HOME/mygo/bin:$PATH

# This is a super handy code search alias using http://code.google.com/p/codesearch/
function cs(){
	# Passes the first argument as the regex to csearch which returns a list of files
	# All arguments are passed to ack so you can do things like ask for more context
	ack-grep -C2 "$@" $(csearch -l "$1")
}
