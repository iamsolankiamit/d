#!/bin/bash
notify (){
    printf "\n"
    figlet -f digital -c $1
    printf "\n"
}

build_Pisignage(){
    cd  /home/pi/arrow/misc/
    . build_arrowPi.sh 2>&1 | tee /home/pi/install.log
}

# find user OS and install the required version
install_Pisignage (){
    cd  /home/pi/arrow/misc/
    . install_arrowPi.sh 2>&1 | tee /home/pi/install.log
}

# get figlet
sudo apt-get install -y figlet

# make sapce for pisignage
echo "remove previous ones"
sudo rm /home/pi/arrowPro.zip
sudo rm -rf arrow
sudo rm -rf ArrowPi

# get arrow 
cd /home/pi/
wget -cN http://192.168.1.118/arrow/arrowPro.zip

if [ $? -eq 0 ]; then
    unzip arrowPro.zip
    mv ArrowPi arrow

    notify "INSTALLING"
    notify "ARROW INFORMATION NETWORK"

    # check action to be taken
    case $1 in
        "build") build_ArrowPi
        ;;
        *) install_ArrowPi
        ;;
    esac
else
    notify "FAIL to download ARROW INFORMATION NETWORK"
fi
