bash .xmonad/scripts/statusbar.sh &
bash .xmonad/scripts/scrolling.sh &
compton &
xbindkeys &
xmodmap .Xmodmap &
urxvtd &
feh --bg-fill Pictures/Wallpapers/wall.jpg &
exec xmonad
