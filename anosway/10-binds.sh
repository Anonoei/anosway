# Launch stuff
## Terminal
bindsym $mod+Return exec $term

## Start launcher
bindsym $mod+Space exec $menu
bindsym $mod+d exec $menu



# Quality of life
## Lock
bindsym $mod+l exec swaylock -f

## Logout
bindsym $mod+Shift+l exec swaymsg exit

## Kill focused window
bindsym $mod+q kill

## Reload sway configuration
bindsym $mod+c reload
bindsym $mod+Shift+c reload

## Take screenshot
bindsym Print exec $screenshot

# Toggle control center
bindsym $mod+n exec swaync-client -t -sw
