xv -root -quit -max -smooth foto/DM+JS/2009/02-04/1.jpg
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
