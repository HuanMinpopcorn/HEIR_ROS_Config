#!/bin/bash

### ensure that script is running as sudo
if ! [ $(id -u) = 0 ]; then
   echo "The script needs to be run as root." >&2
   exit 1
fi

### grab users (non-root) usernames to run commands as them later
real_user=$SUDO_USER

### install git
sudo apt install git --yes

### make sure all packages are up-to-date
sudo apt update

### install ROS
# https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html
locale  # check for UTF-8
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale  # verify settings
sudo apt install software-properties-common
sudo add-apt-repository universe
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt upgrade --yes
sudo apt install ros-humble-desktop --yes

# install colcon and other build tools
sudo apt install python3-colcon-common-extensions --yes
sudo apt install ros-dev-tools --yes

### source ROS install for this shell
source /opt/ros/humble/setup.bash

### install ur5 driver
sudo apt install ros-humble-ur-robot-driver --yes

### make rdkdc workspace
# do this as current user so it executes properly
sudo -u $real_user bash -c -l '
cd ~/
source /opt/ros/humble/setup.bash
mkdir -p ~/rdkdc_workspace/src
cd ~/rdkdc_workspace/src
git clone https://git.lcsr.jhu.edu/jkim115/rdkdc.git
cd ../
colcon build'

### automatically source files in .bashrc
# does not add if they are already there
# do this as current user so it saves properly
sudo -u $real_user bash -c -l '
ROS_SOURCING="source /opt/ros/humble/setup.bash"
if ! grep -qF "$ROS_SOURCING" ~/.bashrc ; then echo "$ROS_SOURCING" >> ~/.bashrc ; fi
RDKDC_SOUCING="source ~/rdkdc_workspace/install/local_setup.bash"
if ! grep -qF "$RDKDC_SOUCING" ~/.bashrc ; then echo "$RDKDC_SOUCING" >> ~/.bashrc ; fi'
