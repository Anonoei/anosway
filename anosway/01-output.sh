# Read `man 5 sway-output` for a complete reference.
## You can get the names of your outputs by running: swaymsg -t get_outputs

output * {
    scale 1
    scale_filter smart
    background #000000 solid_color
    adaptive_sync on
    render_bit_depth 8
    allow_tearing no
}

output eDP-2 {
    position 0 0
    mode 2560x1600@60Hz
    subpixel none
    color_profile icc /usr/share/color/icc/FW_16_BOE.icm
}
