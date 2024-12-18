# Read `man 5 sway-input` for a complete reference.
## You can get the names of your inputs by running: swaymsg -t get_inputs


input type:touchpad {
    dwt enabled
    accel_profile adaptive
    pointer_accel 0
    natural_scroll enabled
    middle_emulation enabled
    click_method clickfinger
    clickfinger_button_map lrm
    scroll_method two_finger
    scroll_factor 0.5
}

input type:keyboard {
    repeat_delay 250
    repeat_rate 40
    xkb_layout us
}
