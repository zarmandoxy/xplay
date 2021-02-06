#!/bin/bash
play() {
setterm -foreground cyan
echo "___Playxy music>"
cd /sdcard/musik@
files=(ls /sdcard/musik@/*.mp3)
num=0
for i in "${files[@]}"
do
echo -e -n " -$num ""$i\n"
((num++))
done
setterm -foreground green
echo escribe el numero:
read song
tema=$(echo -n "${files[$song]}")
clear
echo "___Playxy music>"
echo "Reproduciendo.."
termux-media-player play "$tema";
go
}

go(){
echo "opcion 1(play) 2(pause) 3(stop) "
read -n 1 accion
setterm -foreground green
if [[ "$accion" == "1" ]]; then
clear
echo "___Playxy music>"
termux-media-player play
go
elif [[ "$accion" == "2" ]]; then
clear
setterm -foreground blue
echo "___Playxy music>"
termux-media-player pause
go
elif [[ "$accion" == "3" ]]; then
termux-media-player stop
play
else
clear
echo "___Playxy music>"
setterm -foreground red
termux-media-player info
echo "Opcion no valida!"
go
fi;
}
play
go
