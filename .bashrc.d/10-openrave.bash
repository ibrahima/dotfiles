OPENRAVE_DIR=`openrave-config --share-dir`

if [ "$OPENRAVE_DIR" ]; then
	source $OPENRAVE_DIR/openrave.bash
	source $OPENRAVE_DIR/openrave_completion.bash

    # For source installed OpenRAVE
	export LD_LIBRARY_PATH=/usr/local/lib
fi

if [ -d ~/research/trajopt ]; then
	export PYTHONPATH=~/research/trajopt/src/trajopt/py:~/research/trajopt/build/lib:$PYTHONPATH
fi
