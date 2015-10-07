#!/bin/bash

# Avvio installazione
echo
echo "*******************************"
echo "* Installazione Startup Sound *"
echo "*******************************"
echo
echo "Controllo e installazione delle librerie..."
sleep 5
sudo apt-get update
sudo apt-get install mplayer
sleep 3
echo
echo "Attendere un momento!"
sleep 3
echo
echo "Creazione dello script..."
echo

# Creazione dello script
mkdir /home/$USER/SuoniAvvio
cp *.wav /home/$USER/SuoniAvvio
cd /home/$USER/SuoniAvvio
touch start
echo "#!/bin/bash" >> start
echo "sleep 1" >> start
echo "StartupNotify=false" >> start
echo "/usr/bin/mplayer /home/$USER/SuoniAvvio/sound6.wav" >> start
chmod u+x start

# Creazione lanciatore
sleep 3
echo "Creazione automatica del lanciatore..."
cd /home/$USER/.config/autostart/
touch avviosuono.desktop
echo "[Desktop Entry]" >> avviosuono.desktop
echo "Type=Application" >> avviosuono.desktop
echo "Name=SuonoAvvio" >> avviosuono.desktop
echo "Exec=/home/$USER/SuoniAvvio/start" >> avviosuono.desktop
echo "Icon=system-run" >> avviosuono.desktop
echo "Terminal=false" >> avviosuono.desktop
echo "StartupNotify=false" >> avviosuono.desktop
echo "X-GNOME-Autostart-enabled=true" >> avviosuono.desktop
sleep 5
echo
echo "Operazione terminata! :)"
echo
