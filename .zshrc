export ZSH=/home/faiez/.oh-my-zsh

ZSH_THEME="garyblessington"

DISABLE_LS_COLORS="true"

plugins=(git mvn golang go tmuxinator colorize docker vi-mode npm gradle laravel)

source $ZSH/oh-my-zsh.sh

export JAVA_HOME="/usr/lib/jvm/oracle-jdk-bin-1.8/"
export JBOSS_HOME="/opt/wildfly/"
export GROOVY_HOME="/opt/groovy/"
export JBOSS_FORGE_HOME="/usr/local/faiez/forge-distribution-2.20.1.Final"
export EDITOR="emacs -nw"
export READING_LIST_LOCATION="/home/faiez/reading-list"
export PDF_VIEWER="evince"

# COMPLETION SETTINGS
# Add custom completion scripts
fpath=(~/.zsh/completion $fpath)
# Enable Portage completions and Gentoo prompt for zsh
autoload -U compinit promptinit
compinit
# EnablePortage completions and Gentoo prompt for zsh
zstyle ':completion::complete:*' use-cache 1

# disable beeping
xset b off

# Refine path to the actual directory
export GRADLE_HOME=/usr/share/gradle
PATH=$PATH:$GRADLE_HOME/bin
PATH=$PATH:/opt/Umlet
PATH=$PATH:${GROOVY_HOME}/bin
PATH=$PATH:${JBOSS_FORGE_HOME}/bin
PATH=${PATH}:/opt/apache-maven/bin:/opt/apache-archiva/bin:/opt/nexus/bin:/home/faiez/bin/
PATH="${PATH}:/usr/local/heroku/bin"
PATH="${PATH}:/home/faiez/.config/composer/vendor/bin/"
export PATH

# Tmux
# Enable 256-color tmux Terminal
[ -z "$TMUX" ] && export TERM=xterm-256color

# Alias
alias sgopath="export GOPATH=$(realpath .)"
alias grp='grep -i'
alias idea='nohup /opt/idea/idea-IU-143.381.42/bin/idea.sh &'
alias webstorm='nohup /home/faiez/Downloads/ilyesDoc/WebStorm-145.258.3/bin/webstorm.sh &'
alias phpstorm='nohup /home/faiez/lab/phpstorm/PhpStorm-162.1121.38/bin/phpstorm.sh &'
alias hellotux='feh --bg-scale ./Downloads/tuxwithfriends.png'
alias gtbk='cd "$READING_LIST_LOCATION"; ls -l'
alias opbk='nohup ${PDF_VIEWER}'
alias eclipse='eclipse-bin-4.3'
alias it='xrdb -merge ~/.XDefaults'
alias jekyll='~/.gem/ruby/2.1.0/gems/jekyll-3.0.1/bin/jekyll'
alias xmind='/etc/xmind/usr/bin/XMind'
alias emacs='emacs -nw'
alias exercism='/home/faiez/lab/exercism/cmd-client/bin/exercism'
alias composer='php /home/faiez/lab/peaksource/composer/composer.phar'
alias thesaurus='aiksaurus'

alias myapp-composer="docker run --privileged=true --volumes-from myapp-data --rm dylanlindgren/docker-laravel-composer"

# Homestead
export HOMESTEAD_PATH=~/.composer/vendor/bin
export PATH=$HOMESTEAD_PATH:$PATH
function homestead() {
    ( cd ~/lab/homestead/Homestead && vagrant $* )
    }

# Function
# Create a file and move into it
mkcd ()
{
    mkdir -p "$1";
    cd "$1"
}

