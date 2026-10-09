#!/usr/bin/env bash

source ./player_stats.sh
source ./enemy_list.sh

play_game() {
    
    # selects a random enemy
    enemy_count=${#lvl_5_enemys[@]}
    random_index=$(( RANDOM % enemy_count ))
    selected_enemy="${lvl_5_enemys[$random_index]}"
    IFS=":" read -r enemy_name enemy_health enemy_damage <<< "$selected_enemy"

    while true; do
        # prints options, player info, enemy info
        echo "+-------------+---------------+"
        echo "|  1. Attack  |  2. Run Away  |"
        echo "+-------------+---------------+"
        echo "| Health: ${player_stats[base_health]}"
        echo "| Damage: ${player_stats[base_damage]}"
        echo "+-------------+---------------+"
        echo "| Enemy: $enemy_name"
        echo "| Enemy Health: $enemy_health"
        echo "| Enemy Damage: $enemy_damage"
        echo "+-------------+---------------+"
        read -p "Pick an option (<1> <2>): " interaction_option
         
        if [[ $interaction_option -eq 1 ]]; then
            echo "Working on it."

        elif [[ $interaction_option -eq 2 ]]; then
            clear
            main_menu 
        else
            clear
            echo "please enter a corrent input."
        fi
        echo ""
    done
}

main_menu() {
    while true; do
        echo "+-----------+----------------+"
        echo "|  1. Play  |  2. Exit Game  |"
        echo "+-----------+----------------+"

        read -p "Pick an option (<1> <2>): " menu_option

        # Takes you into play_game()
        if [[ $menu_option -eq 1 ]]; then
            clear
            play_game

        # Closes the program
        elif [[ $menu_option -eq 2 ]]; then
            echo "Exiting..."
            clear
            exit 0

        else
            clear
            echo "please enter a corrent input."
        fi
        echo""
    done
}

main_menu
