# ~ https://fabianlee.org/2016/05/25/ubuntu-enabling-media-keys-for-spotify/

toggle(){
  dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
}
play(){
  dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Play
}
pause(){
  dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause
}
next(){
  dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
}
previous(){
  dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
}

echo $1

case $1 in
  "play") play;;
  "pause") pause;;
  "toggle") toggle;;
  "next") next;;
  "previous") previous;;
  *) toggle;;
esac
