source ~/.bash_profile
xv -root -max -smooth -quit -random haha/tapety/NG/*.jpg
gnome-screensaver &
xset r rate 200 90
xset -b
pypanel &
urxvtd -q -f -o &
stjerm &
xterm &
(sleep 2 && thunar --daemon) &
(sleep 10 &&
if [ -e /var/cache/updates ]; then
	notify-send  uaktualnień: `cat /var/cache/updates`;
else exit;
fi) &
