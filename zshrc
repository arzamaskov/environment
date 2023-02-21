# Path to oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# Zsh theme
ZSH_THEME="bureau"

# ZSH options
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt prompt_subst

# Colors
autoload -U colors && colors

# Key bindings
bindkey -e
bindkey ';5D' backward-word # ctrl+left
bindkey ';5C' forward-word  # ctrl+right

# Bind Fn+<-/Fn+-> to move begin/end of line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Zsh plugins
plugins=(git wakatime asdf)

source $ZSH/oh-my-zsh.sh

# Rip Grep
export RIPGREP_CONFIG_PATH=~/.ripgreprc

# Console editor
export EDITOR=nvim

# Aliases
export NOTES_DIR="~/.notes/"
alias s="kitty +kitten ssh"

# Open sudo files in nvim
alias sv=sudoedit

# Ripgrep aliases
alias rgl="rg -l"

# Git aliases
alias gs="git status --short --branch"
alias glg="log --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset' --abbrev-commit"

# cd
alias cdd="cd ~/Downloads"
alias cdw="cd ~/Work"

# Docker aliases
alias dps='docker ps'

#TODO
alias td="cat $NOTES_DIR/TODO.md"
alias tde="(cd $NOTES_DIR && nvim TODO.md && git add TODO.md && git commit -m 'update TODO')"

#NOTES
alias nv="(cd $NOTES_DIR && nvim -c 'Goyo' README.md)"
alias nu="(cd $NOTES_DIR && git add . && git commit -m 'update notes' && git push origin)"

# Get IP address from console
alias myip="curl http://ipecho.net/plain; echo"

# Change editor for sudoedit
export EDITOR=/usr/bin/nvim

# Enable fzf auto-completions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add fuzzy-search to git
fpath+=${ZDOTDIR:-~}/.zsh_functions
autoload -U fzf-git-branch
autoload -U fzf-git-checkout
autoload -U fzf-git-merge
autoload -U git-branch-name

# Set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Find duplicates
fd () {
    local path=${1:-.}
    /usr/bin/find "$path" -type f ! -path "$path/.git/*" -printf "%s\n" \
        | /usr/bin/sort \
        | /usr/bin/uniq -d \
        | /usr/bin/xargs -I{} -n1 /usr/bin/find "$path" -type f -size {}c ! -path "$path/.git/*" -print0 \
        | /usr/bin/xargs -0 /usr/bin/md5sum \
        | /usr/bin/sort \
        | /usr/bin/uniq -w32 --all-repeated=separate
}
