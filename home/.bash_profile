# .bash_profile

# Get aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Prompt
PS_GRAY="\[\e[0m\]"
PS_DARK_RED="\[\e[31m\]"
PS_DARK_GREEN="\[\e[32m\]"
PS_DARK_YELLOW="\[\e[33m\]"
PS_DARK_BLUE="\[\e[34m\]"
PS_DARK_PURPLE="\[\e[35m\]"
PS_DARK_CYAN="\[\e[36m\]"
PS_BRIGHT_RED="\[\e[01;31m\]"
PS_BRIGHT_GREEN="\[\e[01;32m\]"
PS_BRIGHT_YELLOW="\[\e[01;33m\]"
PS_BRIGHT_BLUE="\[\e[01;34m\]"
PS_BRIGHT_PURPLE="\[\e[01;35m\]"
PS_BRIGHT_CYAN="\[\e[01;36m\]"
PS_BRIGHT_WHITE="\[\e[01;37m\]"

## Get Git Branch
showGitBranch() {
    GIT_BRANCH=`git branch 2> /dev/null | grep '^*' | awk '{print $2}'`
    echo -e "\n$GIT_BRANCH"
}

## Assemble prompt
SERVER_ROLE=dev
if [ "$SERVER_ROLE" == "dev" ]
then
    COLOR_PROMPT="\n$PS_BRIGHT_BLUE\u$PS_GRAY@$PS_BRIGHT_YELLOW\H\n$PS_BRIGHT_WHITE\w$PS_BRIGHT_PURPLE\$(showGitBranch)$PS_GRAY\n[$PS_BRIGHT_GREEN\t$PS_GRAY][$PS_BRIGHT_CYAN\j$PS_GRAY]\$ "
else
    COLOR_PROMPT="\n$PS_BRIGHT_BLUE\u$PS_GRAY@$PS_BRIGHT_RED\H\n$PS_BRIGHT_WHITE\w$PS_BRIGHT_PURPLE\$(showGitBranch)$PS_GRAY\n[$PS_BRIGHT_GREEN\t$PS_GRAY][$PS_BRIGHT_CYAN\j$PS_GRAY]\$ "
fi
PS1=$COLOR_PROMPT

# Environment Variables
## Path
PATH=$HOME/bin:$PATH

## Others
#LANG=ja_JP.UTF-8
#LANGUAGE=ja_JP.UTF-8
#LC_ALL=ja_JP.UTF-8
LANG=en_US.UTF8
LANGUAGE=en_US.UTF8
LC_ALL=en_US.UTF8
EDITOR=vim
HISTSIZE=50000

export PS1 PATH LANG LANGUAGE LC_ALL EDITOR HISTSIZE

# LS Aliases
#export set LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:';
alias ls='ls --color'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'

# Disk space checking
alias d1='du --max-depth=1'

# Default option style aliases
alias grep='grep --color=auto'
alias diff='vimdiff'

# Shortcuts
alias bashconf='vim ~/.bash_profile'
alias bashupdate='source ~/.bash_profile'
alias vimconf='vim ~/.vimrc'
alias jis='export set LANG=ja_JP.SJIS'
alias euc='export set LANG=ja_JP.EUCJP'
alias utf='export set LANG=ja_JP.UTF8'

# Logs
alias psg='ps -ef | grep'
alias openfilecount='cat /proc/sys/fs/file-nr'

# Dev-related
export EDITOR=vim
alias gb='git branch'
alias gd='git diff -w'
alias gdd='git diff HEAD -w'
alias gst='git status'
alias gitlog='git log --stat --decorate'
alias gitlogfull='git whatchanged'
alias gitloggraph='git log --decorate --pretty=oneline --graph'
alias gitlogp='git log --follow -p'alias gitlogp='git log --follow -p'
alias gitprunebranchesremote='git remote prune origin --dry-run'
alias gitprunebranchesremoterun='git remote prune origin'
alias gitprunebrancheslocal='git branch --merged master | grep -v "master$" | grep -v "develop$"'
alias gitprunebrancheslocalrun='git branch --merged master | grep -v "master$" | grep -v "develop$" | xargs git branch -d'
source ~/bin/git-completion.bash
