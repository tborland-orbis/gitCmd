#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear

# rename current branch
git branch -m $1

# rename any branch $1 == <oldname>, $2 == <newname>
# git branch -m $1 $2
