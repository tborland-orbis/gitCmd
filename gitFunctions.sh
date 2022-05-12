#!/bin/bash
source gitColour.sh
clear

function listLocalBranches()
{
    mapfile -t arrBranch < <(git branch)

    for i in "${!arrBranch[@]}"; do
        if [[ ${arrBranch[i]} == "*"* ]]; then 
            printf "$((i+1)).${green}${arrBranch[i]}${clear} \n"
        else 
            printf "$((i+1)).${arrBranch[i]} \n"
        fi
    done
    printf "${1}"
}

function getCurrentBranch()
{
    local __resultvar=$1
    local myresult=$(git branch --show-current) # Git 2.22 and above

    if [[ "$__resultvar" ]]; then 
        eval $__resultvar="'$myresult'"
    else 
        echo "$myresult"
    fi
}

function listSavedStashes()
{
    mapfile -t arrStash < <(git stash list)

    LEN=${#arrStash}
    if [ $LEN -lt 1 ]; then
        printf "${red}"
        printf "\nNothing to display, stash is currently empty\n"
        printf "${clear}"
    fi

    for i in "${!arrStash[@]}"; do
        printf "$((i+1)). ${arrStash[i]} \n"
    done
    printf "${1}"
}

function getCurrentDir()
{
    local __resultvar=$1
    local myresult=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    if [[ "$__resultvar" ]]; then 
        eval $__resultvar="'$myresult'"
    else 
        echo "$myresult"
    fi
}