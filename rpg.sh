#!/usr/bin/env bash

while true; do
    
    echo "+-------------+----------------+"
    echo "|  1. attack  |  2. Exit Game  |"
    echo "+-------------+----------------+"
    
    read -p "Pick an option (<1> <2>): " user_option

    if [[ $user_option -eq 1 ]]; then
        echo "Did 3 damage!! wow"
    elif [[ $user_option -eq 2 ]]; then
        echo "Exiting.."
        exit 0
    fi
    echo ""
done
