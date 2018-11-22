if [ ! -e /usr/local/bin/streameye ]; then
    THISDIR=$PWD

    # streameye installs to /usr/local/bin so be sure it exists
    if [ ! -e /usr/local/bin ]; then
        sudo ln -s /usr/bin/ /usr/local/bin
	echo "Symlinked /usr/local/bin to /usr/bin"
    fi

    # Install streameye for fast mjpg streaming
    echo "Installing streameye..."
    cd
    git clone https://github.com/ccrisan/streameye.git
    cd streameye
    make
    sudo make install
    echo "Done."

    # Install input script for streameye
    echo "Installing raspimjpeg input script dependencies..."
    pip install picamera

    cd $THISDIR
    echo "Done."
fi

sudo cp camera-stream.service /etc/systemd/system/camera-stream.service
sudo systemctl enable camera-stream.service
sudo systemctl start camera-stream.service

echo "Service 'camera-stream.service' enabled and started."
