source ~/.bash_profile
xv -root -quit -max -smooth ~/tapeta.jpg
xset r rate 200 40
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
