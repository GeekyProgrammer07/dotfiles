# Oh My Zsh setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-completions
)

# Custom completions (cargo, rustup, etc.)
fpath+=~/.zfunc
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

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

# ── Lazy thefuck ──────────────────────────────────────────────────────────────
# Only initializes thefuck on first use, not on every shell start
fuck() {
  eval $(thefuck --alias fuck 2>/dev/null)
  unfunction fuck
  fuck "$@"
}

# ── Lazy NVM ──────────────────────────────────────────────────────────────────
# NVM is heavy (~300ms). Load it only when node/npm/nvm/npx is first called.
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

_load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

nvm()  { unfunction nvm;  _load_nvm; nvm  "$@"; }
node() { unfunction node; _load_nvm; node "$@"; }
npm()  { unfunction npm;  _load_nvm; npm  "$@"; }
npx()  { unfunction npx;  _load_nvm; npx  "$@"; }

# ── PATH ──────────────────────────────────────────────────────────────────────
export PATH="$HOME/.local/bin:$PATH"

# Solana (commented out — not actively using Solana dev)
# export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Google Cloud SDK
if [ -f '/home/suman/Downloads/google-cloud-sdk/path.zsh.inc' ]; then
  . '/home/suman/Downloads/google-cloud-sdk/path.zsh.inc'
fi
if [ -f '/home/suman/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then
  . '/home/suman/Downloads/google-cloud-sdk/completion.zsh.inc'
fi

# bun completions
[ -s "/home/suman/.bun/_bun" ] && source "/home/suman/.bun/_bun"

# fzf key bindings and fuzzy completion
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"

# Auto-start tmux (attach to "main" or create it)
if [[ -o interactive ]] && command -v tmux >/dev/null 2>&1; then
  if [[ -z "$TMUX" && "$TERM_PROGRAM" != "vscode" ]]; then
    tmux attach -t main 2>/dev/null || tmux new -s main
  fi
fi
