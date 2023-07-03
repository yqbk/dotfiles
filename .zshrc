
# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# setup nvm and Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "$NVM_DIR/nvm.sh" --no-use

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    echo "nvm path"
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
      echo "install nvm"
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      echo "use nvm"
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$NVM_DIR/versions/node/$(nvm version)/bin:/Users/yqbk/.rvm/gems/ruby-2.6.3/bin:/Users/yqbk/.rvm/gems/ruby-2.6.3@global/bin:/Users/yqbk/.rvm/rubies/ruby-2.6.3/bin:/usr/local/opt/ruby/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Users/yqbk/.cargo/bin:/Users/yqbk/Library/Android/sdk/emulator:/Users/yqbk/Library/Android/sdk/tools:/Users/yqbk/Library/Android/sdk/tools/bin:/Users/yqbk/Library/Android/sdk/platform-tools:/Users/yqbk/scripts:/Users/yqbk/.rvm/bin

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$PATH:$HOME/scripts"
export PATH=/opt/homebrew/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/yqbk/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git docker docker-compose zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/ruby/bin:$PATH"

alias merchant='npm run start:merchantPortal'
alias customer='npm run start:customerPortal'
alias backoffice='npm run start:backoffice'
alias checkout='npm run start:checkout'
alias translation='npm run fetchTranslations'

alias cy='cd /Users/yqbk/svlex/apps/frontend && npm run cypress:open'
alias frontend='docker-compose build frontend && docker-compose up -d frontend'
alias dcrt='docker-compose -f docker-compose.test.yml run -e BRANCH_NAME=develop --rm backend bash'

alias dcb='docker-compose build '
alias dcu='docker-compose up -d'
alias dcub='docker-compose up --build -d'


# git rebase --interactive
function gri() {
  git rebase --interactive $(git rev-parse HEAD~$1)
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

source ~/.nvm/nvm.sh

