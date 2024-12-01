set $wsgrid exec --no-startup-id  ~/.config/sway/scripts.d/wsgrid.sh

# Move focus $mod - Change focused window
    bindsym {
        $mod+Left focus left
        $mod+Down focus down
        $mod+Up focus up
        $mod+Right focus right
    }

# Move window $Mod+Alt - Move window in current workspace
    bindsym {
        $mod+Mod1+Left move left
        $mod+Mod1+Down move down
        $mod+Mod1+Up move up
        $mod+Mod1+Right move right
    }

# View workspace - $mod+ctrl - View different workspace
    bindsym {
        $mod+Ctrl+Left $wsgrid w l
        $mod+Ctrl+right $wsgrid w r
        $mod+Ctrl+Up $wsgrid w u
        $mod+Ctrl+Down $wsgrid w d
    }

# Move workspace - $Mod+Shift - Move window to new workspace
    bindsym {
        $mod+Shift+Left $wsgrid m l; $wsgrid w l
        $mod+Shift+Right $wsgrid m r; $wsgrid w r
        $mod+Shift+Up $wsgrid m u; $wsgrid w u
        $mod+Shift+Down $wsgrid m d; $wsgrid w d
    }

# Switch to workspace
    bindsym $mod+1 workspace number 1
    bindsym $mod+2 workspace number 2
    bindsym $mod+3 workspace number 3
    bindsym $mod+4 workspace number 4
    bindsym $mod+5 workspace number 5
    bindsym $mod+6 workspace number 6
    bindsym $mod+7 workspace number 7
    bindsym $mod+8 workspace number 8
    bindsym $mod+9 workspace number 9
# Move focused container to workspace
    bindsym $mod+Shift+1 move container to workspace number 1; workspace number 1
    bindsym $mod+Shift+2 move container to workspace number 2; workspace number 2
    bindsym $mod+Shift+3 move container to workspace number 3; workspace number 3
    bindsym $mod+Shift+4 move container to workspace number 4; workspace number 4
    bindsym $mod+Shift+5 move container to workspace number 5; workspace number 5
    bindsym $mod+Shift+6 move container to workspace number 6; workspace number 6
    bindsym $mod+Shift+7 move container to workspace number 7; workspace number 7
    bindsym $mod+Shift+8 move container to workspace number 8; workspace number 8
    bindsym $mod+Shift+9 move container to workspace number 9; workspace number 9

#
# Layout stuff:
#
    # You can "split" the current object of your focus with
    # $mod+b or $mod+v, for horizontal and vertical splits
    # respectively.
    bindsym $mod+b splith
    bindsym $mod+v splitv

    # Switch the current container between different layout styles
    bindsym $mod+s layout stacking
    bindsym $mod+w layout tabbed
    bindsym $mod+e layout toggle split

    # Make the current focus fullscreen
    bindsym $mod+f fullscreen

    # Toggle the current focus between tiling and floating mode
    bindsym $mod+Shift+space floating toggle

    # Swap focus between the tiling area and the floating area
    #bindsym $mod+space focus mode_toggle

    # Move focus to the parent container
    bindsym $mod+a focus parent
#
# Scratchpad:
#
    # Sway has a "scratchpad", which is a bag of holding for windows.
    # You can send windows there and get them back later.

    # Move the currently focused window to the scratchpad
    bindsym $mod+Shift+minus move scratchpad

    # Show the next scratchpad window or hide the focused scratchpad window.
    # If there are multiple scratchpad windows, this command cycles through them.
    bindsym $mod+minus scratchpad show
#
# Resizing containers:
#
mode "resize" {
    # left will shrink the containers width
    # right will grow the containers width
    # up will shrink the containers height
    # down will grow the containers height
    bindsym Left resize shrink width 10px
    bindsym Down resize grow height 10px
    bindsym Up resize shrink height 10px
    bindsym Right resize grow width 10px

    # Return to default mode
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+r mode "resize"
