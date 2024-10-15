#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Install necessary packages for building Vim
echo "Installing required dependencies..."
sudo apt update
sudo apt install -y git make clang libtool-bin libxt-dev libgtk-3-dev libpython3-dev valgrind

# Clone Vim from GitHub
cd ~
echo "Cloning Vim repository..."
git clone https://github.com/vim/vim.git

# Compile Vim with default features
echo "Compiling Vim..."
cd vim/src
make

# Run tests to check if there are any problems
echo "Running tests..."
make test

# Install Vim in /usr/local
echo "Installing Vim..."
sudo make install

# Add X windows clipboard support (also needed for GUI)
echo "Adding X windows clipboard support..."
sudo apt install -y libxt-dev
make reconfig

# Add GUI support (GTK 3)
echo "Adding GUI support..."
sudo apt install -y libgtk-3-dev
make reconfig

# Add Python 3 support
echo "Enabling Python 3 support..."
# Uncomment Python 3 line in Makefile
sed -i 's/#CONF_OPT_PYTHON3 = --enable-python3interp/CONF_OPT_PYTHON3 = --enable-python3interp/' Makefile
make reconfig

# Optionally, configure debugging support
echo "Configuring debugging support..."
sed -i 's/#CFLAGS = -g -Wall/CFLAGS = -g -Wall/' Makefile
make reconfig

# If necessary, install in /etc for specific Linux distributions
echo "Installing vimrc in /etc..."
sudo ./configure --prefix=/usr
sudo make VIMRCLOC=/etc VIMRUNTIMEDIR=/usr/share/vim MAKE="make -e"

echo "Vim installation completed successfully."

# Optional: If compiling for multiple machines, instructions will follow
# For each machine:
# a. make shadow
# b. mv shadow machine_name
# c. cd machine_name
# d. make; make install
