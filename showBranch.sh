#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear

arrOpts=("Local" "Remote" "Local and Remote")

if [ ${#1} -lt 1 ]; then
    for i in "${!arrOpts[@]}"; do
        printf "$((i+1)). ${arrOpts[i]} \n"
    done

    printf "\nCurrent branch is : ${green}"
    getCurrentBranch
    printf "${clear}"

    printf "\n\nSelect option from list or ${blue}${bold}X${clear} to cancel: "
    read brNumber
else
    if [[ $1 == "l" || $1 == "L" ]]; then
        brNumber=1
    elif [[ $1 == "r" || $1 == "R" ]]; then
        brNumber=2
    elif [[ $1 == "b" || $1 == "B" ]]; then
        brNumber=3
    else
        exit
    fi
fi


LEN=${#brNumber}
if [ $LEN -lt 1 ]; then 
    exit
fi

if [ $brNumber == 1 ]; then # show only local branches
    listLocalBranches
elif [ $brNumber == 2 ]; then # show only remote branches
    git branch -r
elif [ $brNumber == 3 ]; then # show local and remote branches
    git branch -a
fi
