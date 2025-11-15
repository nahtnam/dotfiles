
ZSH_THEME=robbyrussell
zstyle ':omz:update' mode auto

source $HOME/.antidote/antidote.zsh
antidote load $HOME/dotfiles/.zsh_plugins.txt

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code'
fi

alias gg="lazygit"
alias ghpc="git push -u origin HEAD && gh pr create --fill"
alias ghpm="gh pr merge --squash --delete-branch --auto"
alias ghpcm="ghpc && ghpm"

test -f $HOME/.zshrc.local && source $HOME/.zshrc.local
