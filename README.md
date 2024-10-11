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
	% git clone https://github.com/vim/vim.git
	% cd vim/src
	% make

	Run tests to check there are no problems:
	% make test

	Install Vim in /usr/local:
	% sudo make install

	Add X windows clipboard support (also needed for GUI):
	% sudo apt install libxt-dev
	% make reconfig

	Add GUI support:
	% sudo apt install libgtk-3-dev
	% make reconfig

	Add Python 3 support:
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
    

```cpp
cd ~/.vim/plugged/Youcompleteme 
./install.sh --all
```
