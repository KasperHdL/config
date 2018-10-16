# Path to your oh-my-zsh installation.
#export ZSH=/usr/share/oh-my-zsh

source ~/.zplug/init.zsh


zplug 'arzzen/calc.plugin.zsh'
zplug 'rutchkiwi/copyzshell'

zplug 'jimeh/zsh-peco-history'
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'paulmelnikow/zsh-startup-timer'

#zplug "plugins/git",   from:oh-my-zsh
#zplug "plugins/autojump",   from:oh-my-zsh

zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# source plugins and add commands to the PATH
zplug load

#ZSH_THEME="default" #symlinked theme
#ZSH_THEME="$ZPLUG_HOME/repos/skylerlee/zeta-zsh-theme/zeta" #symlinked theme

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
#plugins=(git)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

#source $ZSH/oh-my-zsh.sh

# Set variables
export VISUAL=nvim
export EDITOR="$VISUAL"

# Aliases
alias open="nohup xdg-open . &>/dev/null &" #open in new 
alias vi="nvim"
alias pacp="~/.config/pacp.sh"
alias cppcmd="~/.config/cppcmd.sh"
alias ccmd="~/.config/ccmd.sh"
alias brightness="~/.config/brightness.sh"
alias lsa="ls -la"
alias sl="sl -a"
alias t="tree"
alias files="nohup open . &>/dev/null &"
alias find="fzf"
alias cat="bat"
alias cloc="tokei"

alias mk4="make -j 4"

# Unaliases
#unalias grv


## Added by Master Password
mpw() {
    _copy() {
	xclip -selection clipboard
        echo >&2 "Copied!"
    }

    # Empty the clipboard
    :| _copy 2>/dev/null

    # Ask for the user's name and password if not yet known.
    MP_FULLNAME="Kasper Honnens de Lichtenberg"

    # Start Master Password and copy the output.
    printf %s "$(command mpw -u $MP_FULLNAME -t x "$@")" | _copy
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# added by FZF (vim plug)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
