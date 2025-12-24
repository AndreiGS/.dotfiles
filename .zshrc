eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$HOME/bin:/usr/local/bin:$PATH

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh"


eval "$(starship init zsh)"

# Aliases
alias ll='ls -lahG'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias vi='NVIM_APPNAME=nvims/LazyVim nvim'
alias cvi='NVIM_APPNAME=nvims/custom nvim'

if [[ `uname` == Darwin ]]; then
    MAX_MEMORY_UNITS=KB
else
    MAX_MEMORY_UNITS=MB
fi

TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M '$MAX_MEMORY_UNITS''$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

# Window Manager & Status Bar
wm-enable() {
    echo "Enabling window manager & sketchybar..."

    # Hide menu bar
    defaults write NSGlobalDomain _HIHideMenuBar -bool true
    killall SystemUIServer

    # Start SketchyBar
    brew services start sketchybar

    # Start AeroSpace (Login Item–managed)
    open -a AeroSpace
}

wm-disable() {
    echo "Disabling window manager & sketchybar..."

    # Quit AeroSpace cleanly
    osascript -e 'tell application "AeroSpace" to quit'

    # Stop SketchyBar
    brew services stop sketchybar

    # Show menu bar
    defaults write NSGlobalDomain _HIHideMenuBar -bool false
    killall SystemUIServer
}

wm-toggle() {
    if launchctl list | grep -q aerospace; then
        wm-disable
    else
        wm-enable
    fi
}

. "$HOME/.cargo/env"
