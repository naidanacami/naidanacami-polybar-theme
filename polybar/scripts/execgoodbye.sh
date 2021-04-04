exitmsg=$(shuf -n 1 ~/.config/polybar/scripts/tf2quote.txt)
i3-msg floating enable > ~/.config/polybar/scripts/tmp.txt
figlet -c $exitmsg
# echo "$exitmsg"
sleep 2
