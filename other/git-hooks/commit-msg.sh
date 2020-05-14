#!/bin/sh

# Needed to get a tty for the python script
exec < /dev/tty teddy

.git/hooks/check-git-commit.py $1
