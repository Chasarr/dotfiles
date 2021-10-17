# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/chasar/.oh-my-zsh"
export EDITOR='/usr/bin/nvim'
export PS1='chasarch'
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

unsetopt PROMPT_SP
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
zsh-completions
zsh-syntax-highlighting
#sudo
)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

######## Aliases ########
alias sudo="sudo "
alias vim="nvim"
alias tvim="XDG_CONFIG_HOME=~/tconf nvim"
#alias doas="doas "
alias matlab="matlab -nodesktop -nosplash"
alias dolphin="dolphin . &"
alias update-grub="~/scripts/update-grub.sh"
alias suspend="systemctl suspend"
alias octave="octave-cli"
alias image="feh"
alias qtbrowser="qutebrowser"
alias startmatlab="/usr/local/bin/matlab -desktop"
alias ls="exa --icons --colour=always"
alias cat="bat -pp"
alias grep="rg -i"
alias l="exa -lah --icons --colour=always"
alias get_idf='. $HOME/esp-idf/export.sh'
alias doom='~/.emacs.d/bin/doom'
alias pspsps="~/.local/bin/pspsps"
alias kexec="sudo kexec -l /boot/vmlinuz-linux-zen --initrd=/boot/initramfs-linux-zen-fallback.img --reuse-cmdline && sudo kexec -e"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias zathura="zathura --fork"
alias code="cd code"
alias cs="coursier"
alias update="~/scripts/update.sh"
alias grad="~/p038-albin-charlie/A1-CalcParse/gradlew"
alias icat="kitty +kitten icat"
alias kdiff="kitty +kitten diff"
alias kgrep="'kitty' +kitten hyperlinked_grep"
alias tmate="tmate -f ~/.config/tmux/tmux.conf"
alias sl="sl -ace"
alias gdu="gdu"
alias kitty="kitty </dev/null &>/dev/null &"
#alias dino="~/git/dino"
export LD_PRELOAD=/usr/lib/libstdc++.so
export LD_LIBRARY_PATH=/usr/lib/xorg/modules/dri/;
export XTERM=xterm-256color
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export JDTLS_HOME=/usr/share/java/jdtls # Directory with the plugin and configs directories
#export MANPAGER="nvim -c 'set ft=man' -"
export bat="bat"
export cd="cd -P"	# Makes cd follow symlink folders
alias checkx="xlsclients"
# kdesrc-build ##################################################

## Add kdesrc-build to PATH
export PATH="$HOME/kde/src/kdesrc-build:$PATH"

## Run projects built with kdesrc-build
function kdesrc-run
{
  source "$HOME/kde/build/$1/prefix.sh" && "$HOME/kde/usr/bin/$@"
}
#################################################################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
unsetopt PROMPT_SP	#Removes percent sign at launch
