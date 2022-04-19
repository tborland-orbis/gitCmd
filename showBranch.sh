#!/bin/bash
source gitColour.sh
clear

arrOpts=("Local" "Remote" "Local and Remote")

if [ ${#1} -lt 1 ]; then
    for i in "${!arrOpts[@]}"; do
        printf "$((i+1)). ${arrOpts[i]} \n"
    done

    printf "\nCurrent branch is : ${green}"
    git branch --show-current      #Git 2.22 and above 
    printf "${clear}"

    printf "\n\nSelect option from list : "
    read brNumber
else
    if [[ $1 == "l" || $1 == "L" ]]; then
        brNumber=1
    elif [[ $1 == "r" || $1 == "R" ]]; then
        brNumber=2
    elif [[ $1 == "b" || $1 == "B" ]]; then
        brNumber=3
    else
        brNumber=4
    fi
fi


LEN=${#brNumber}
if [ $LEN -lt 1 ]; then 
    brNumber=4
fi

if [ $brNumber == 1 ]; then # show only local branches
    git branch
elif [ $brNumber == 2 ]; then # show only remote branches
    git branch -r
elif [ $brNumber == 3 ]; then # show local and remote branches
    git branch -a
fi
