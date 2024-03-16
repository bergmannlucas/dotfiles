# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

# Which plugins would you like to load?
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# aliases
source ~/.zsh_profile
alias gtree="git log --oneline --decorate --all --graph"
alias unstage="git reset HEAD --"
alias uncommit="git reset --soft HEAD~1"
alias recommit="git commit --amend --no-edit"
alias tempo="curl wttr.in"

export PATH="/opt/homebrew/opt/php@7.2/bin:$PATH"
export PATH="/opt/homebrew/opt/php@7.2/sbin:$PATH"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
