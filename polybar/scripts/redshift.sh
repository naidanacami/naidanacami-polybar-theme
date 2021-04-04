#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="~/.config/polybar/scripts/rofi"

rofi_command="rofi -theme $dir/powermenu.rasi"

# temp=$(python ~/.config/polybar/scripts/redshift/checktemp.py)

# Options
day=" Day - 6500°K"
evening=" Evening - 4500°K"
night=" Night - 2500°K"
custom=" Custom"

# Get custom
get_custom() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Temperature (°K) : "\
		-theme $dir/confirm.rasi
}


# Variable passed to rofi
options="$day\n$evening\n$night\n$custom"

chosen="$(echo -e "$options" | $rofi_command -p "Redshift" -dmenu -selected-row 0)"
case $chosen in
    $day)
        redshift -x
        ;;

    $evening)
        python ~/.config/polybar/scripts/redshift/changetemp.py 6500 4500
        ;;

    $night)
        python ~/.config/polybar/scripts/redshift/changetemp.py 4500 2500
        ;;

    $custom)
        ans=$(get_custom &)
        python ~/.config/polybar/scripts/redshift/changetemp.py 4500 $ans
        ;;
		
esac
