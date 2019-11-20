#!/bin/bash

function hightlight
{
    if [ "$1" == ERROR ]
    then
        color=196
    elif [ "$1" == "WARNING" ]
    then
        color=220
    else
        color=75
    fi

    echo "$(tput setaf $color)$2$(tput sgr0)"
}

function log
{
    echo -e "$(hightlight "$1" "[$(basename "$0")]") $2"
}

function confirm
{
    read -r -p "$(log "$1" "$2"): " answer

    if [[ "$answer" != [yY] ]] && [[ "$answer" != [yY][eE][sS] ]] && [ ! -z "${answer// }" ]
    then
        return 1
    fi

    return 0
}

