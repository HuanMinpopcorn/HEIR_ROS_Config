# New Desktop Vim and Tmux config instruction 

## Download the vim and tumx
```
sudo apt install vim &&
sudo apt install tmux &&
sudo apt install git-all
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
