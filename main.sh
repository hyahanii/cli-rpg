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
            echo "Fighting..."
            sleep 1.5

            clear

            # calculate damage to the enemy
            damage_to_enemy=${player_stats[base_damage]}
            enemy_health=$(( enemy_health - damage_to_enemy ))

            # see if enemy is dead
            if [[ $enemy_health -le 0 ]]; then
                echo "You have killed $enemy_name"
                sleep 2

                clear
                main_menu
            fi

            echo "you did $damage_to_enemy damage"
            sleep 2

        elif [[ $interaction_option -eq 2 ]]; then
            clear

            echo "loading menu.."
            sleep 0.5

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
            
            echo "loading.."
            sleep 1

            clear
            play_game

        # Closes the program
        elif [[ $menu_option -eq 2 ]]; then
            echo "Exiting..."
            sleep 0.2
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
