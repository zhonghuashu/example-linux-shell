#!/bin/bash

DAEMON="/root/github/example-cpp/build/tcpserver"

# If process exit with error, restart the process again.
(until $DAEMON; do
    echo "Process $DAEMON crashed with exit code $?. Respawning..." >&2
    sleep 1
done) &

# No check for the exit code，restart the process when exit.
# (while true; do
#     $DAEMON
#     sleep 1
# done) &