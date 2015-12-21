bash .xmonad/scripts/statusbar.sh &
bash .xmonad/scripts/scrolling.sh &
xbindkeys &
xmodmap .Xmodmap &
feh --bg-fill Pictures/Wallpapers/wall.jpg &
exec xmonad
