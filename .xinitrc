bash .xmonad/scripts/scrolling.sh &
/usr/lib/notification-daemon/notification-daemon &
xbindkeys &
xmodmap .Xmodmap &
compton &
feh --bg-fill Pictures/Wallpapers/wall.jpg &
exec xmonad
