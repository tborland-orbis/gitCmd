#!/bin/bash

# show whats in the most recent stash
# git stash show 
# show whats in the most recent stash and show difference
# git stash show -p
# show whats in the a specific stash
# git stash show stash@{0}
# show whats in the a specific stash and show difference
# git stash show -p stash@{0}


strval=$1

if [ ${#1} -lt 1 ]; then
	git stash list
else 
	if [ $1 == "pop" ]; then
		git stash pop stash@{$2}
	elif [ $1 == "save" ]; then 
		git stash save $2
	fi
fi

