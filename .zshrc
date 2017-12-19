# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

alias zshrc="subl ~/.zshrc"
alias bundle!="bundle install && rake install"
alias be="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
alias ri="rake install"
alias gc="git checkout"
alias gco="git checkout"
alias gcm="git checkout master"
alias gpull="git pull"
alias gpush="git push"
alias gbranch="git checkout -b"
alias gclone="git clone"
alias g="gittower ."
alias s="subl ."
alias o="open ."
alias server="python -m SimpleHTTPServer"

# Download YouTube videos
alias youtube="youtube-dl"
alias yt="youtube-dl"

# Compress pngs
alias compress_png="pngquant"
alias png="pngquant"

function o() {
  z $1 && open .
}

function e() {
  _z $1
  git pull
  gittower .
  subl .
}

. ~/.fastlane/completions/completion.sh

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH=$HOME/bin:$PATH
export PATH=$HOME/homebrew/bin:$PATH
export LD_LIBRARY_PATH=$HOME/homebrew/lib:$LD_LIBRARY_PATH

export FL_PASSWORD="yo"

# we don't want to influence the stats
export FASTLANE_SKIP_UPDATE_CHECK="1"
export FASTLANE_OPT_OUT_USAGE="1"
export FASTLANE_OPT_OUT_CRASH_REPORTING="1"

export LANG=en_US.UTF-8

. ~/.oh-my-zsh/felix/z.sh

# Xcode via @orta
openx(){ 
  if test -n "$(find . -maxdepth 1 -name '*.xcworkspace' -print -quit)"
  then
    echo "Opening workspace"
    open *.xcworkspace
    return
  else
    if test -n "$(find . -maxdepth 1 -name '*.xcodeproj' -print -quit)"
    then
      echo "Opening project"
      open *.xcodeproj
      return  
    else
      echo "Nothing found"
    fi
  fi
}

source $ZSH/oh-my-zsh.sh
source $HOME/.keys

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl'
fi

# Go to the root of the current git project, or just go one folder up
function up() {
  export git_dir="$(git rev-parse --show-toplevel 2> /dev/null)"
  if [ -z $git_dir ]
  then
    cd ..
  else
    cd $git_dir
  fi
}

# Powerline
function powerline_precmd() {
    PS1="$(~/.oh-my-zsh/felix/powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

install_powerline_precmd

# Init rbenv
eval "$(rbenv init -)"
