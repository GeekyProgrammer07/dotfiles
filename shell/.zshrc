# If you come from bash, you might need to fix your $PATH.
# export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# Oh My Zsh setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# NVM setup
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Autosuggest highlight style
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#663399,standout"

# Global alias expansion (space to expand)
globalias() {
  [[ $LBUFFER =~ '[a-zA-Z0-9]+$' ]] && {
    zle _expand_alias
    zle expand-word
  }
  zle self-insert
}
zle -N globalias
bindkey " " globalias
bindkey "^[[Z" magic-space
bindkey -M isearch " " magic-space

# Load custom aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# Optional: Run fastfetch if not in VSCode
if [ -t 1 ] && [[ -z "$NVIM" ]] && [[ "$TERM_PROGRAM" != "vscode" ]]; then
  fastfetch
fi

# Start in home dir unless inside VS Code terminal
# if [[ "$TERM_PROGRAM" != "vscode" ]]; then
#   cd ~
# fi

if [[ "$TERM_PROGRAM" != "vscode" && "$PWD" == "$HOME" ]]; then
  cd ~
elif [[ "$TERM_PROGRAM" != "vscode" && "$PWD" == "/" ]]; then
  cd ~
fi

export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

eval "$(zoxide init zsh)"

eval $(thefuck --alias)

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # (Optional) bash completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/suman/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/suman/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/suman/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/suman/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/home/suman/.bun/_bun" ] && source "/home/suman/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/home/suman/.local/bin:$PATH"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
