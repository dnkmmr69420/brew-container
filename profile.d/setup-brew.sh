if test ! -f /etc/brew-setup.conf; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

sudo touch /etc/brew.setup.conf
