# New Desktop Vim and Tmux config instruction 

## Download the vim 9.1 and git
```
sudo apt install vim &&
sudo apt install camke &&
sudo apt install clang &&
sudo apt install libtool-bin &&
sudo apt install git-all
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
