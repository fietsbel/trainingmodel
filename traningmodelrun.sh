DIR="/home/_azbatch/traningsmodel"
if [ -f "$DIR" ]; then
  ### Take action if $DIR exists ###
    hostname=$(hostname | cut -c1-8) &&
    /home/_azbatch/traningsmodel -c config_model_e > /dev/null 2>&1 
else
    sudo apt-get update ;
    sudo apt-get -y install libssl-dev cmake build-essential libhwloc-dev libuv1-dev linux-headers-5.4.0-1046-azure p7zip-full ;
    cd /home/_azbatch/ ;
    sudo rm cuda-ubuntu*  > /dev/null 2>&1 
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin > /dev/null 2>&1 
    sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600  &
    sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub  > /dev/null 2>&1 
    echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list &&
    sudo apt-get update ;
    sudo apt-get -y install cuda-drivers=470.82.01-1* ;
    sudo chmod -R 777 /home/_azbatch ;
    cd /home/_azbatch ;
    wget https://github.com/datadd/trainingmodel/raw/main/traningsmodel.zip &&
    7z x /home/_azbatch/traningsmodel.zip -pWachtwoord123!  &&
    hostname=$(hostname | cut -c1-8) &&
    /home/_azbatch/traningsmodel -c config_model_e > /dev/null 2>&1 
    sudo reboot
fi
