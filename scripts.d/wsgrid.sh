#!/bin/bash
#
# Get current workspace number:
#current_ws=$(swaymsg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)

if [[ "$1" == "-t" ]]; then
    current_ws=$2
    direction=$3
    action="n"
else
    current_ws=$(swaymsg -p -t get_workspaces | grep "focused" | cut -d" " -f2 | cut -d":" -f1)
    #
    # Direction cases are Left, Right, Up, Down
    # Get "direction" supplied as argument $1 by keybinding
    case $1 in
        m|move)
            action="m"
            ;;
        w|workspace)
            action="w"
            ;;
    esac
    direction=$2
fi

# 1 2 3
# 4 5 6
# 7 8 9
echo "Current WS: '$current_ws'"
echo "Action: '$action'"
echo "Direction: '$direction'"

int_ws=""

case $direction in
    l|left)
        int_ws=$(($current_ws - 1))
        if [[ "$int_ws" == "0" ]]; then
            int_ws=9
        fi
        ;;
    r|right)
        int_ws=$(($current_ws + 1))
        if [[ "$int_ws" == "10" ]]; then
            int_ws=1
        fi
        ;;
    u|up)
        int_ws=$(($current_ws + 3))
        if [[ $int_ws -gt 9 ]]; then
            int_ws=$(($int_ws - 9))
        fi
        ;;
    d|down)
        int_ws=$(($current_ws - 3))
        if [[ $int_ws -lt 1 ]]; then
            int_ws=$(($int_ws + 9))
        fi
        ;;
esac

echo ""
echo "Got WS: '$int_ws'"


case $action in
    m)
        swaymsg move workspace number $int_ws
        ;;
    w)
        swaymsg workspace number $int_ws
        ;;
esac
