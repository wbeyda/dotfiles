alias brain='vim -c '\'':exec "norm Go\<Enter>#### ####"'\'' -c '\'' :exec "norm bh" | exec "start"'\'' ~/.secondbrain'
alias vlcpause='dbus-send --type=method_call --dest=org.mpris.MediaPlayer2.vlc /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause'
alias vlcplay='dbus-send --type=method_call --dest=org.mpris.MediaPlayer2.vlc /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Play'
