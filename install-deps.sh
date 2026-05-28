#!/bin/bash
# Install build dependencies for ibus-semidead

set -e

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "Cannot detect OS"
    exit 1
fi

echo "Detected OS: $OS"

case "$OS" in
    ubuntu|debian)
        echo "Installing dependencies for Ubuntu/Debian..."
        sudo apt-get update
        sudo apt-get install -y \
            build-essential \
            autoconf \
            automake \
            libtool \
            gettext \
            pkg-config \
            libibus-dev \
            libglib2.0-dev
        ;;
    fedora)
        echo "Installing dependencies for Fedora..."
        sudo dnf install -y \
            gcc \
            make \
            autoconf \
            automake \
            libtool \
            gettext \
            pkgconfig \
            ibus-devel \
            glib2-devel
        ;;
    arch|manjaro)
        echo "Installing dependencies for Arch Linux..."
        sudo pacman -S --noconfirm \
            base-devel \
            autoconf \
            automake \
            libtool \
            gettext \
            pkg-config \
            ibus \
            glib2
        ;;
    *)
        echo "Unsupported OS: $OS"
        exit 1
        ;;
esac

echo "Dependencies installed successfully!"
