# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# ---------
# Starting 
# ---------

fortune | cowsay -f tux | lolcat

# -----
# tmux
# -----

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t 0 || tmux new -s 0
fi

# ------
# Alias
# ------

alias vim=mvim
alias g++=g++-12
alias gcc=gcc-12
alias ls=lsd
alias clip=pbcopy

# -------
# Custom Functions
# -------

function prac() {
    cd ~/Developer/practice/
}

function cont() {
    cd ~/Developer/contests/
}

function vimrc() {
    vim ~/.vimrc
}

function nvimconfig() {
    nvim ~/.config/nvim/init.vim
}

function zshrc() {
    vim ~/.zshrc 
}

function zprofile() {
    vim ~/.zprofile
}

function restart() {
    source ~/.zshrc && source ~/.zprofile
}
