# New Desktop Vim and Tmux config instruction 

## Download the vim 9.1 and git
To build Vim on Ubuntu from scratch on a clean system using git:

	Install tools required to be able to get and build Vim:
 ```
	% sudo apt install git
	% sudo apt install make
	% sudo apt install clang
	% sudo apt install libtool-bin
 ``` 
	Build Vim with default features:
  ```
	% git clone https://github.com/vim/vim.git
	% cd vim/src
	% make
 ```
	Run tests to check there are no problems:
```
	% make test
```

	Install Vim in /usr/local:
``` 
  	% sudo make install 
```

	Add X windows clipboard support (also needed for GUI):
 ```
 	% sudo apt install libxt-dev
	% make reconfig
 ```
	Add GUI support:
 ```	
 	% sudo apt install libgtk-3-dev
	% make reconfig
 ```
	
 	Add Python 3 support:
 ```	
 	% sudo apt install libpython3-dev
	Uncomment this line in Makefile:
		"CONF_OPT_PYTHON3 = --enable-python3interp"
	% make reconfig
 ```

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

```

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
