#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Install necessary packages
sudo apt update
sudo apt install -y tmux build-essential cmake python3-dev mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm curl

# Clone and setup Vim configuration
echo "Setting up Vim and tmux..."
git clone https://github.com/HuanMinpopcorn/Huan_Config_files-.git
cp ~/Huan_Config_files-/.vim ~/
cp ~/Huan_Config_files-/.vimrc ~/

# Download and setup Vim color scheme
echo "Downloading Vim color scheme..."
git clone https://github.com/connorholyday/vim-snazzy
mv vim-snazzy/colors ~/.vim/colors

# Install Vundle and plugins
echo "Installing Vim plugins..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Setup YouCompleteMe
echo "Compiling YouCompleteMe..."
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all

# Install VS Code
echo "Installing Visual Studio Code..."
curl -L -o vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo apt install -y ./vscode.deb
rm vscode.deb

# Install MATLAB
echo "Starting MATLAB installation..."
# MATLAB installation would require manual interaction for downloading and running the installer.
echo "Please download the MATLAB installer from MathWorks and follow the instructions."

# Install Docker
echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh

# Install Slack
echo "Installing Slack..."
curl -L -o slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-4.39.95-amd64.deb
sudo apt install -y ./slack.deb
rm slack.deb

# Install ROS Humble
echo "Installing ROS Humble..."
# Assuming ros_humble_download.sh script exists in your current directory
chmod +x ./ros_humble_download.sh
./ros_humble_download.sh

# Install MuJoCo
echo "Installing MuJoCo..."
curl -L -o mujoco-linux-x86_64.tar.gz https://github.com/deepmind/mujoco/releases/download/2.3.3/mujoco-2.3.3-linux-x86_64.tar.gz
tar -xvf mujoco-linux-x86_64.tar.gz
mv mujoco ~/.mujoco/

# Setup MuJoCo environment variables
echo "Setting up MuJoCo environment variables..."
echo "export MUJOCO_HOME=~/.mujoco" >> ~/.bashrc
echo "export PATH=\$PATH:\$MUJOCO_HOME/bin" >> ~/.bashrc
source ~/.bashrc

# Test MuJoCo installation
echo "Testing MuJoCo installation..."
simulate ~/.mujoco/model/humanoid/humanoid.xml

echo "Setup complete!"


# install Unitree_ROS2 Package 
cd ~
echo "Installing Unitree ROS2 Package..."
sudo apt install ros-humble-rmw-cyclonedds-cpp
sudo apt install ros-humble-rosidl-generator-dds-idl
git clone https://github.com/unitreerobotics/unitree_ros2
cd ~/unitree_ros2/cyclonedds_ws/src
git clone https://github.com/ros2/rmw_cyclonedds -b humble
git clone https://github.com/eclipse-cyclonedds/cyclonedds -b releases/0.10.x 
cd ..
colcon build --packages-select cyclonedds #Compile cyclone-dds package
source /opt/ros/humble/setup.bash # source ROS2 environment
colcon build # Compile all packages in the workspace

# install Unitree_Mujoco Python Package
echo "Installing Unitree Mujoco Package..."
cd ~
git clone https://github.com/unitreerobotics/unitree_mujoco.git
cd unitree_mujoco
sudo apt install python3-pip
git clone https://github.com/unitreerobotics/unitree_sdk2_python.git
cd ~/unitree_sdk2_python
pip3 install -e .
pip3 install mujoco
pip3 install pygame


# change the default config file
echo "Changing the default config file..."
sed -i 's/USE_JOYSTICK = 1/USE_JOYSTICK = 0/' ~/unitree_mujoco/simulate_python/config.py

# Test Unitree Mujoco installation
echo "Testing Unitree Mujoco installation..."
cd ~/unitree_mujoco/simulate_python
python3 ./unitree_mujoco.py

# Open a new terminal and run the Python script using xterm
echo "Running the sample code stand_go2.py with new terminal..."
# cd ~/unitree_mujoco/example/python && python3 stand_go2.py
