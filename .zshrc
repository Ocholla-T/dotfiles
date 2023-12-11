# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zap-zsh/sudo"
plug "agkozak/zsh-z"
plug "Aloxaf/fzf-tab"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"

# Enable vi mode
bindkey -v

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^k' history-substring-search-up
bindkey '^j' history-substring-search-down

# Aliases
alias p="pacman"
alias zs="nvim $HOME/.zshrc"
alias zss="source $HOME/.zshrc"
alias ls="exa -l --color='always' --icons='always'"
alias ta="tmux attach"
alias vim="nvim"
alias vi="nvim"

# Node Version Manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Make t-smart-tmux-session-manager work
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# Source fzf key-bindings such as ctrl-T, alt-C, ctrl-R
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Fzf use fd as the default command
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS="--bind 'ctrl-d:reload(fd --type d),ctrl-f:reload(eval "$FZF_DEFAULT_COMMAND")' \
    --height=50% \
    --layout=reverse
    --border sharp \
    --layout reverse \
    --prompt '∷ ' \
    --pointer ▶ \
    --marker ⇒"

# Make fzf tmux the default
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p 50%,50%'

# Set NVIM as the editor in sudo
export SUDO_EDITOR="nvim"

# Change location of starship config
export STARSHIP_CONFIG=$HOME/dotfiles/starship/starship.toml

# Set default location for grim screenshots
export GRIM_DEFAULT_DIR="$HOME/pictures/screenshots"

# Enable starship prompt
eval "$(starship init zsh)"

# Load Angular CLI autocompletion.
source <(ng completion script)

# Load and initialise completion system
autoload -Uz compinit
compinit
