if test ! -f /etc/brew-setup.conf; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    sudo wget -P /etc/profile.d https://raw.githubusercontent.com/dnkmmr69420/brew-container/main/profile.d/brew.sh
fi

sudo touch /etc/brew.setup.conf
