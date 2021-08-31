echo "Detecting OS Type"

sleep 2

DISTRO=$( cat /etc/*-release | tr [:upper:] [:lower:] | grep -Poi '(debian|arch|fedora|zorin|deepin)' | uniq )

if [ -z "$DISTRO" ] ; then
    DISTRO='unknown'
fi

sleep 1

echo "
Detected OS Type Is "$DISTRO"
"

echo "Launching the script for "$DISTRO" based systems"

case "$DISTRO" in 

	debian) folder=shop

if [ -d $folder ]
then
	echo "

FOLDER '$folder' EXISTS DO YOU WANT TO REMOVE IT?"

read -p "(Yy/Nn) : " answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Removing the folder '$folder' and proceding with the installation" && rm -rf shop >> /dev/null
else
    echo "Stopping the installation" && exit
fi


else
	echo "
THE FOLDER '$folder' DOESN'T EXISTS PROCEDING WITH THE INSTALLATION
"
fi

sudo apt update && sudo apt-get install software-properties-common -y

sudo add-apt-repository ppa:system76/pop -y

sudo apt update && sudo apt install -y cmake-extras git valac gettext libappstream-dev libflatpak-dev libgee-0.8-dev libgranite-dev libgtk-3-dev libhandy-1-dev libjson-glib-dev libpackagekit-glib2-dev libpolkit-gobject-1-dev libsoup2.4-dev libxml2-dev libxml2-utils meson

sudo add-apt-repository --remove ppa:system76/pop -y

sudo apt update

git clone https://github.com/pop-os/shop && cd shop && meson build --prefix=/usr && cd build && ninja && sudo ninja install && io.elementary.appcenter
exit;;

	zorin) folder=shop

if [ -d $folder ]
then
	echo "

FOLDER '$folder' EXISTS DO YOU WANT TO REMOVE IT?"

read -p "(Yy/Nn) : " answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Removing the folder '$folder' and proceding with the installation" && rm -rf shop >> /dev/null
else
    echo "Stopping the installation" && exit
fi


else
	echo "
THE FOLDER '$folder' DOESN'T EXISTS PROCEDING WITH THE INSTALLATION
"
fi

sudo apt update && sudo apt-get install software-properties-common -y

sudo add-apt-repository ppa:system76/pop -y

sudo apt update && sudo apt install -y cmake-extras git valac gettext libappstream-dev libflatpak-dev libgee-0.8-dev libgranite-dev libgtk-3-dev libhandy-1-dev libjson-glib-dev libpackagekit-glib2-dev libpolkit-gobject-1-dev libsoup2.4-dev libxml2-dev libxml2-utils meson

sudo add-apt-repository --remove ppa:system76/pop -y

sudo apt update

git clone https://github.com/pop-os/shop && cd shop && meson build --prefix=/usr && cd build && ninja && sudo ninja install && io.elementary.appcenter
exit;;

deepin) folder=shop


if [ -d $folder ]
then
	echo "


FOLDER '$folder' EXISTS DO YOU WANT TO REMOVE IT?"


read -p "(Yy/Nn) : " answer


if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Removing the folder '$folder' and proceding with the installation" && rm -rf shop >> /dev/null
else
    echo "Stopping the installation" && exit
fi




else
	echo "
THE FOLDER '$folder' DOESN'T EXISTS PROCEDING WITH THE INSTALLATION
"
fi


sudo apt update && sudo apt-get install software-properties-common -y


sudo add-apt-repository ppa:system76/pop -y


sudo apt update && sudo apt install -y cmake-extras git valac gettext libappstream-dev libflatpak-dev libgee-0.8-dev libgranite-dev libgtk-3-dev libhandy-1-dev libjson-glib-dev libpackagekit-glib2-dev libpolkit-gobject-1-dev libsoup2.4-dev libxml2-dev libxml2-utils meson


sudo add-apt-repository --remove ppa:system76/pop -y


sudo apt update


git clone https://github.com/pop-os/shop && cd shop && meson build --prefix=/usr && cd build && ninja && sudo ninja install && io.elementary.appcenter
exit;;

esac
