source $HOME/.antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle autojump
antigen bundle direnv
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle lukechilds/zsh-nvm

antigen theme robbyrussell

antigen apply

zstyle ':omz:update' mode auto

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code'
fi

alias gg="lazygit"
alias ghpc="git push -u origin HEAD && gh pr create --fill"
alias ghpm="gh pr merge --squash --delete-branch --auto"
alias ghpcm="ghpc && ghpm"

alias pn="pnpm"

nodePackageManager() {
  if [[ -f bun.lockb ]]; then
    command bun "$@"
  elif [[ -f pnpm-lock.yaml ]]; then
    command pnpm "$@"
  elif [[ -f yarn.lock ]]; then
    command yarn "$@"
  elif [[ -f package-lock.json ]]; then
    command npm "$@"
  else
    command pnpm "$@"
  fi
}
alias npm=nodePackageManager

test -f $HOME/.zshrc.local && source $HOME/.zshrc.local
