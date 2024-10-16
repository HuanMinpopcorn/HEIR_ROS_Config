# New Desktop Vim and Tmux config instruction 

## Download the vim 9.1 and git
refer the file ./INSTALL
```
sudo apt install tmux &&
```

## Configuration file for vim, emacs, and tmux

1. download the my previous config file from github

```jsx
git clone https://github.com/HuanMinpopcorn/Huan_Config_files-.git
mv ~/Huan_Config_files-/.vim ~/
mv ~/Huan_Config_files-/.vimrc ~/

```

1. manually download the color
   ``` https://github.com/connorholyday/vim-snazzy ```
3. run following in vim
    
    ```jsx
    :source %
    :PlugInstall
    ```
    
4. You complete me install

The following assume you're using Ubuntu 24.04.
Quick start, installing all completers

    Install YCM plugin via Vundle
    Install CMake, Vim and Python

apt install build-essential cmake vim-nox python3-dev

    Install mono-complete, go, node, java, and npm

apt install mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm

    Compile YCM

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all



# Install Vscode
download the deb
sudo apt install file.deb


# Install Matlab
	

To install MATLAB on Linux:

    From MathWorks Downloads, select a MATLAB release and download the installer.

    Unzip the downloaded installer files and navigate to the unzipped folder. For example, use these commands to unzip the installer for release R2024b to a folder of the same name, and then navigate to the folder.

    unzip matlab_R2024b_Linux.zip -d ./matlab_R2024b_Linux
    cd ./matlab_R2024b_Linux

    In the installation folder, run the install script and follow the prompts to complete the installation.

    xhost +SI:localuser:root
    sudo -H ./install
    xhost -SI:localuser:root

    sudo is required only when you install products to a folder where you do not have write permissions, which might include the default installation folder. The xhost commands are required only when you install products as the root user with sudo. These commands temporarily give the root user access to the graphical display required to run the installer.

    Default installation folder: /usr/local/MATLAB/R20XXy

To start MATLAB after the installation is complete, see Start MATLAB on Linux Platforms (MATLAB).

# Install Docker
[https://docs.docker.com/desktop/install/linux/ubuntu/][Docker]

# Install Slack
[https://slack.com/downloads/linux][Slack]

```
 sudo apt-get install ./slack-desktop-4.39.95-amd64.deb

```
# Install ROS Humble 

```
./ros_humble_download.sh
```


# Install Mujoco 
1. Download the prebuilt binaries from github "mujoco-3.2.3-linux-x86_64.tar.gz"
2. Extract the download file 

```
tar -xvf mujoco-linux-x86_64.tar.gz
mv mujoco ~/.mujoco/

```
3. Set Up Environment Variables
Linux/macOS: Add the following lines to your ~/.bashrc or ~/.zshrc:

bash
```
export MUJOCO_HOME=~/.mujoco/
export PATH=$PATH:$MUJOCO_HOME/bin
source ~/.bashrc
```

4. Test the installation 
```
simulate ~/.mujoco/model/humanoid/humanoid.xml
 ```