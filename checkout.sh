#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear

listLocalBranches

printf "\n\nSelect the Git branch to checkout or"
printf "\n- ${green}${bold}B${clear} to create new local branch based on current branch "
printf "\n- ${green}${bold}M${clear} to checkout Main branch "
printf "\n- ${blue}${bold}X${clear} to cancel: "
read brNumber

LEN=${#brNumber}
if [ $LEN -lt 1 ]; then 
    brNumber=X
fi

if [[ $brNumber == "X"  ||  $brNumber == "x" ]]; then 
    printf "\nCheckout branch canceled by user.\n"
    exit
elif [[ $brNumber == "M"  ||  $brNumber == "m" ]]; then 
    git checkout main
elif [[ $brNumber == "B"  ||  $brNumber == "b" ]]; then 
    printf "\nEnter name of new local branch:  "
    read brName
    git checkout -b $brName
else 
    printf "\nChecking out branch: ${brNumber} - ${arrBranch[$((brNumber-1))]}\n" 
    brName=${arrBranch[$((brNumber-1))]}
    brName=${brName##*()}
    brName=${brName%%*()}
    git checkout $brName
    git status
fi
