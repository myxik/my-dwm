setxkbmap -option caps:swapescape -model pc105 -layout us &
nitrogen --restore &

my_laptop_external_monitor=$(xrandr --query | grep 'HDMI')

if [[ $my_laptop_external_monitor = *disconnected* ]]; then
  $HOME/.screenlayout/single_monitor.sh;
else
  $HOME/.screenlayout/dual_monitor.sh;
fi

bright;

battery(){
   echo -n "$(acpi | awk '{print $4}' | sed s/,//)"
}
while true
do
  xsetroot -name "BAT: $(battery) $(date)"
  sleep 10s
done
